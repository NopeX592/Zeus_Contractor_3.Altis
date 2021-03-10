
if (!isServer) exitWith {};

waitUntil {time > 0};

	if (isNil "allParaDropVehs") then {
	
		allParadropvehs = [];
		publicVariable "allParadropvehs";
		
	};

	// Define Functions
	
		if (isNil "BEW_FNC_ParadropLoadout") then {BEW_FNC_ParadropLoadout = compile preprocessFile "BEWparadrop\BEW_FNC_ParadropLoadout.sqf"};
		if (isNil "BEW_FNC_ParadropVehWaypoint") then {BEW_FNC_ParadropVehWaypoint = compile preprocessFile "BEWparadrop\BEW_FNC_ParadropVehWaypoint.sqf"};


	// Variable Setup
	
		private [
		
			"_veh",
			"_spawnPos",
			"_spawnDir",
			"_type",
			"_pilotType",
			"_group",
			"_displayName",		
			"_side",
			"_callsign",
			"_notification",
			"_respawnDelay",
			"_varNameStr"
		
		];
		

		_spawnPos = _this select 0;
	
			switch (true) do {
				
				case (TypeName _spawnPos == "OBJECT"): {
				
					_veh = _this select 0;
				
					_spawnPos = getPos _veh;
					deleteVehicle _veh;
					
				};
				
				case (TypeName _spawnPos == "ARRAY"): {
				
					_spawnPos =  _this select 0;
				
				};

			};
			
		_spawnDir = _this select 1;
		
		_type = _this select 2;
		
			_type = [_type] call BEW_FNC_TranslateClassNames;
				_displayName = [configFile >> "CfgVehicles" >> _type] call BIS_fnc_displayName;
			
			_pilotType = "B_Pilot_F";	
				_pilotType = [_pilotType] call BEW_FNC_TranslateClassNames;
			
		_side = _this param [3, WEST];
			_group = createGroup _side;
		
		_callsign = _this param [4, _displayName];
		_notification = _this param [5, FALSE];
		
		_respawnDelay = 5;
		
		

	// Create _veh
		
		_veh = createVehicle [_type, _spawnPos, [], 0, "CAN_COLLIDE"];
		_veh setDir _spawnDir;
		publicVariable "_veh";
	
	
	// Add Veh To Array
		
		allParaDropVehs = allParaDropVehs + [_veh];
		publicVariable "allParadropvehs";


	// Vehicle Setup

		[_veh, {
		
			_veh = _this;
		
			[_veh] call BEW_FNC_ApplyCustomTexture;
		
		}] remoteExec ["call", 0, true];
		_veh allowDamage FALSE;
		clearItemCargo _veh;
		clearWeaponCargo _veh;
		clearMagazineCargo _veh;
	
	
	// VarName

		_varName = [_veh, "ParaDropVeh_"] call bis_fnc_objectvar;
		_veh setvehiclevarname _varName;
		
	
	// Create Crew

		_vehGroup = [_spawnPos, WEST, [_pilotType, _pilotType],[],[],[],[],[],180] call BIS_fnc_spawnGroup;		
		[_vehGroup, [_callsign]] remoteExec ["setGroupId", 0, true];
	
		
	// Crew Setup

		_crew = units _vehGroup;
		(_crew select 0) moveInDriver _veh;
		(_crew select 1) moveInTurret [_veh, [0]];
		
		{_x setBehaviour "CARELESS"} forEach _crew;
		{_x enableSimulation FALSE} forEach _crew;
		{_x disableAI "AUTOTARGET"} forEach _crew;
		{_x allowFleeing 0} forEach _crew;
		{_x setCaptive TRUE} forEach _crew;
		{_x allowDamage FALSE} forEach _crew;
	

	// Lock Positions
	
		//Lock all turrets that have someone in them
			
			{
			
				if !( isNull (_veh turretUnit _x) ) then {
					_veh lockTurret [_x,true]
				};
				
			} forEach allTurrets _veh;
			
		//Lock drivers position
		
			_veh lockDriver true;
				
		
	// Open Ramp
						
		_veh animatedoor ["door_1_source", 1];
		_veh animatesource ["ramp", 1];
		_veh animatesource ["ramp_top", 1];
		_veh animatesource ["ramp_bottom", 1];
	
	
	// Action
		
		[_veh, {
		
			_veh = _this;
			
			_varName = [_veh, "ParaDropVeh_"] call bis_fnc_objectvar;
			_veh setvehiclevarname _varName;
		
			[[_veh]] spawn BEW_FNC_ParadropPlayerActions;
		
		}] remoteExec ["BIS_FNC_Call", 0, true];


	// Commandchat Message	
	
			[[WEST, "HQ"], format ["All units be advised; a %1 is now available for paradrop insertion at %2.", _displayName, mapGridPosition _spawnPos]] remoteExec ["commandChat", 0];
			
	
	// Mission Active Flag
	
		call compile format ["

			%1_paradropMissionActive = false;
			publicVariable '%1_paradropMissionActive';
			
		", _veh];
	
	
	// Wait Until Vehicle Dead
										
		waitUntil {(!alive _veh) or (!canMove _veh) or (!alive driver (_veh))};
		
	
	// Remove Veh From Array
		
		allParaDropVehs = allParaDropVehs - [_veh];
		publicVariable "allParadropvehs";
	
	
	// Wait For Respawn Delay 
		
		sleep _respawnDelay;


	// Delete Vehicle Crew
		
		{deleteVehicle _x;} forEach _crew;
		

	// Run Script Again

		[_spawnPos, _spawnDir, _type, _side, _callsign, _notification] execVM "BEWparadrop\BEWparadrop.sqf";
		
