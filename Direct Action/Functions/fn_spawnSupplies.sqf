
_pos = _this select 0;
_dir = _this select 1;
_type = _this select 2;
_missionLevel = param [3];
_arsenal = param [4, false];
_outpost = param [5, false];
_respawnDelay = param [6, 10];
_abandonedRadius = param [7, 1000];



private ["_pos", "_dir", "_type", "_veh", "_missionLevel", "_respawnDelay", "_abandonedRadius", "_arsenal", "_outpost", "_allTriggers", "_destroyed", "_disabled", "_abandoned", "_varName"];


// Create Vehicle

	_veh = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];


// Setup Vehicle

	_veh setDir _dir;
	_veh allowDamage false;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;

	
// Global VarName

	_varName = [_veh, "Vehicle_"] call bis_fnc_objectvar;
	_veh setvehiclevarname _varName;

	
// Disable Damage

	_veh allowDamage false;

	waitUntil {missionlevel >= _missionLevel};


// Allow Pickup

	_veh setVariable ["BEW_V_CanCarry", TRUE, TRUE];
	
	
// Outpost Activated Flag
		
	_veh setVariable ["BEW_V_OutpostActivated", FALSE, TRUE];


// Wait Until Object Moved

	waitUntil {((getPos _veh distance2D _pos) > 1)};

	_veh allowDamage true;
	

if (_outpost) then {
	
	
// Moving Marker
			
		[_veh, "OUTPOST", "ColorGREEN", "mil_flag"] execVM "scripts\movingmarker.sqf";
			
		
// Activate OutPost Actions

	[
		_veh,																
		"<t color='#ffffff'>ACTIVATE OUTPOST",														
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",		
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",		
		"(_this distance _target < 5) and (isNull (isVehicleCargo _target)) and (isNull (ropeAttachedTo _target)) and ((count attachedObjects _this) < 1) and !(_target getVariable 'BEW_V_OutpostActivated')",									
		"(_this distance _target < 5) and (isNull (isVehicleCargo _target)) and (isNull (ropeAttachedTo _target)) and ((count attachedObjects _this) < 1) and !(_target getVariable 'BEW_V_OutpostActivated')",									
		{},																	
		{},																	
		{		

			_veh = _this select 0;	
			_caller = _this select 1;
			_actionID = _this select 2;
			
				player playActionNow 'PutDown';
				playSound 'click';

			[_veh,{
			
				// Setup Outpost
			
					_veh = _this;
					_veh allowDamage false;
					_veh enableSimulationGlobal false;
					_veh setVariable ["BEW_V_CanCarry", FALSE];
				
				
				// Create Outpost Marker
				
					_markerName = format ["%1_outpostArea", _veh];
					_outpostAreaMarker = createMarker [_markerName, getPos _veh];
					_outpostAreaMarker setMarkerShape "ELLIPSE";
					_outpostAreaMarker setMarkerSize [20, 20];
					_outpostAreaMarker setMarkerColor "colorGreen";
					_outpostAreaMarker setMarkerAlpha 0.3;
					_outpostAreaMarker setMarkerText "the Outpost";	
				
					respawnMarkerList = respawnMarkerList + [_markerName];
					publicVariable "respawnMarkerList";
				
				
				// Spawn Tent
				
					_tent = createVehicle ["Land_ConnectorTent_01_NATO_tropic_cross_F", getPos _veh, [], 0, "CAN_COLLIDE"];
					_tent setDir getDir _veh;
					_tent allowDamage false;
				
				
				// Spawn Flag
				
					_offsetPos = _veh modelToWorld [-3,-3,-1];
					_flag = createVehicle ["Flag_NATO_F", _offsetPos, [], 0, "CAN_COLLIDE"];
					_flag allowDamage false;
				
				
				// Change Flag Textures
				
					_newFaction = BLU_NewFactionTag;
					_flagTexture = getText (configfile >> "CfgFactionClasses" >> _newFaction >> "flag");
					if (_newFaction == "UK3CB_BAF_Faction_Army_Desert") then {_flagTexture = "\A3\Data_F\Flags\flag_uk_CO.paa"};
					_flag setFlagTexture _flagTexture;
				
				
				// Create Respawn Position
				
					_respawnPosition = [west, getPos _veh, "Outpost"] call BIS_fnc_addRespawnPosition;
				
				waitUntil {!(alive _veh)};
				
				
				// Clean Up
				
					deleteVehicle _tent;
					deleteVehicle _flag;
					
					_respawnPosition call BIS_fnc_removeRespawnPosition;
			
			}] remoteexec ["bis_fnc_call", 2];
			
			
			[[_veh, _caller],{
			
				_veh = _this select 0;	
				_caller = _this select 1;

				arsenalList = arsenalList + [_veh];

				[[_veh], BLU_WeaponList] spawn BEW_FNC_addWeaponsByLevel;
				[[_veh], BLU_ItemList] spawn BEW_FNC_addItems;
										
				
				_veh setVariable ["BEW_V_OutpostActivated", TRUE, TRUE];
				_veh setVariable ["BEW_V_CanCarry", FALSE, TRUE];
			
			}] remoteexec ["bis_fnc_call", 0, true];
			
			
			_message = format ["%1 Has Activated An Outpost At %2", name _caller, mapGridPosition getPos _veh];
			[_message] remoteExec ["systemchat", 0];
			
		
		},																	
		{},																	
		[],																	
		3,																
		98,																	
		false,																
		false																
	] remoteExec ["BIS_fnc_holdActionAdd", 0, true];	
		
};


// Create Triggers

	_allTriggers = [];


	call compile format ["

	_destroyed = createTrigger [""EmptyDetector"", getPos %1];
	_destroyed setTriggerArea [1, 1, 1, false];
	_destroyed setTriggerActivation [""ANY"", ""PRESENT"", true];
	_destroyed setTriggerStatements [""(!alive %1) or (underwater %1)"", """", """"];
	_destroyed setTriggerTimeout [10, 10, 10, true];
	_allTriggers = _allTriggers + [_destroyed];

	", _varname, _abandonedRadius];


// Manual Respawn

	_actionText = format ["<t color='#ffffff'>RESPAWN %1", [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName];
		
	[
		_veh,																
		_actionText,														
		"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa",		
		"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa",		
		"(_this distance _target < 10) && !(_target == vehicle player) && ({alive _x} count (crew _target) < 1) && ((count getVehicleCargo _target) < 1) and ((count attachedObjects _this) < 1)",									
		"(_this distance _target < 10) && !(_target == vehicle player) && ({alive _x} count (crew _target) < 1) && ((count getVehicleCargo _target) < 1) and ((count attachedObjects _this) < 1)",									
		{},																	
		{},																	
		{		

			_veh = _this select 0;
			_displayName = [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName;
			_message = format ["%1 has respawned a %2", profileName, _displayName];

			player playActionNow 'PutDown';
			playSound 'click';
			
			[_message] remoteExec ["systemChat", 0];

			
			[_veh,{
			
				_veh = _this;
			
				deleteVehicle _veh;
			
				_markerName = format ["%1_outpostArea", _veh];
				deleteMarker _markerName;
				
				respawnMarkerList = respawnMarkerList - [_markerName];
				publicVariable "respawnMarkerList";
				
			
			}] remoteExec ["bis_fnc_call", 2];
		
		},																	
		{},																	
		[],																	
		3,																
		-96,																	
		false,																
		false																
	] remoteExec ["BIS_fnc_holdActionAdd", 0, true];	

waitUntil {(triggerActivated _destroyed)};

deleteVehicle _veh;
{deleteVehicle _x} forEach _allTriggers;

sleep _respawnDelay;

nul = [_pos, _dir, _type, _missionLevel, _arsenal, _outpost, _respawnDelay] execVM "functions\fn_spawnSupplies.sqf";

