if (!isServer) exitWith {};

waitUntil {time > 0};
	
	if (isNil "allTransportHeliVehs") then {
	
		allTransportHeliVehs = [];
		publicVariable "allTransportHeliVehs";
		
	};
	
	
	private [
	
		"_veh",
		"_origVeh",
		"_startPos",
		"_startDir",
		"_type",
		"_pilotType",
		"_side",
		"_varName",
		"_radio",
		"_respawn",
		"_respawnDelay",
		"_textures",
		"_startPad"
	
	];
		
	_origVeh = param [0];
		_startPos = getPosATL _origVeh;
		_startDir = getDir _origVeh;	
		_type = typeOf _origVeh;
		_pilotType = "B_Helipilot_F";

		_side = switch ((configfile >> "CfgVehicles" >> _pilotType >> "side") call BIS_fnc_getCfgData) do {
			case 0: {east};
			case 1: {west};
			case 2: {resistance};
			case 3: {civilian};
		};
	
	_translationLists = _this select 1;
	
	_respawn = _this select 2 param [0, true];
	_respawnDelay = _this select 2 param [1, 10];
	
	_remoteCall = param [3, false];
	
	_missionLevel = param [4, 1];
	
	_textures = _this select 5;


	// Delete Original Vehicle

		deleteVehicle _origVeh;
	
	sleep 1;
	

while {_respawn} do {
	
	// Create Transport Vehicle
	
		_newType = [_type, [_translationLists]] call BEW_FNC_TranslateClassNames;
		
		if !(_newType == _type) then {_textures = []};
		
		_veh = createVehicle [_newType, _startPos, [], 0, "CAN_COLLIDE"];
		_veh setDir _startDir;
	
	
	// Define Call Sign
	
		_callsign = [configFile >> "CfgVehicles" >> _newType] call BIS_fnc_displayName;
			
	// Set Textures

		if (count _textures > 0) then {

			[[_veh, _textures], {
			
				_veh = _this select 0;
				_textures = _this select 1;
			
				[_veh, _textures] call BIS_fnc_setObjectTexture;
			
			}] remoteExec ["call", 0, true];
			
		};
		
		
		if (count _textures < 1) then {
		
			[_veh] remoteExec ["BEW_FNC_ApplyCustomTexture", 0, true];
		
		};
	

	// Setup Vehicle	
	
		_veh setVehicleLock "LOCKED";
		_veh allowDamage FALSE;
		_veh enableSimulationGlobal false;
		_veh enableVehicleCargo false;
		_veh setVariable ["remoteCall", _remoteCall, true];
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearItemCargoGlobal _veh;

	waitUntil {missionlevel >= _missionLevel};
	
		
	// Create Start Helipad
	
		_startPad = createVehicle ["Land_HelipadEmpty_F", _startPos, [], 0, "CAN_COLLIDE"];
		_startPad setDir _startDir;
		
		
	// Attach Heli To Helipad
		
	//	[_veh, _startPad] call BIS_fnc_attachToRelative;
	
	
	// Add Veh Array To All Vehicles Array
		
		_array = [_veh, _startPad, _callsign];
		
		allTransportHeliVehs = allTransportHeliVehs + [_array];
		publicVariable "allTransportHeliVehs";
	
	
	// Veh Setup When Unlocked
	
		_veh setVehicleLock "UNLOCKED";
		_veh allowDamage TRUE;
		_veh enableSimulationGlobal true;
		_veh enableVehicleCargo true;
		_veh flyInHeight 50;
	
	
	// VarName

		_varName = [_veh, "TransportHeli_"] call bis_fnc_objectvar;
		_veh setvehiclevarname _varName;
	
	
	// Create Group

		_group = createGroup _side;
	
	
	// Create Crew
	
		_newPilotType = [_pilotType] call BEW_FNC_TranslateClassNames;
		
		_group = [_startPos, _side, [_newPilotType, _newPilotType],[],[],[],[],[], _startDir] call BIS_fnc_spawnGroup;
		
				
	// Check Alive Group
	
		waitUntil {count units _group > 0};

		
	// Set Group Callsign
	
		[_group, [_callsign]] remoteExec ["setGroupIdGlobal", 0, true];
		
		
	// Check Callsign
	
		waitUntil {groupId _group == _callsign};

		
	// Crew Setup

		_crew = units _group;
		_driver = _crew select 0;
		_driver moveInDriver _veh;
		
		_copilot = _crew select 1;
		_copilot moveInTurret [_veh,[0]];

		{_x setVariable ["NOAI",1,false]} forEach units _group;
		{_x enableSimulationGlobal FALSE} forEach _crew;
		{_x setBehaviour "CARELESS"} forEach _crew;
		{_x disableAI "AUTOTARGET"} forEach _crew;
		{_x allowFleeing 0} forEach _crew;
		{_x setCaptive TRUE} forEach _crew;
		{_x allowDamage FALSE} forEach _crew;
		
	
	// Open Ramp
	
		_veh animatedoor ["door_rear_source", 1]; 
		_veh animatesource ["ramp_anim", 1];
		_veh animatesource ["ramp", 1];
		_veh animateDoor ["CargoRamp_Open", 1];
		
		
	// Action
		
		[_array, {
		
			_array = _this;
			_veh = _array select 0;
			
			_varName = [_veh, "TransportHeli_"] call bis_fnc_objectvar;
			_veh setvehiclevarname _varName;
		
			[[_array]] spawn BEW_FNC_HeliTransportPlayerActions;
		
		}] remoteExec ["BIS_FNC_Call", 0, true];


	// Mission Active Flag
	
		call compile format ["

			%1_heliTransportMissionActive = false;
			publicVariable '%1_heliTransportMissionActive';
			
		", _veh];
	
	
	waitUntil {(!canMove _veh) or (!alive _veh) or (!alive _driver)};
	
	
	// Delete Crew
	
		{deleteVehicle _x} forEach _crew;
		
	
	// Delete Start Pad
	
		deleteVehicle _startPad;
	
	
	// Remove Veh Array From All Vehs Array
		
		allParaDropVehs = allParaDropVehs - [_array];
		publicVariable "allParadropvehs";
	

	sleep _respawnDelay;

};