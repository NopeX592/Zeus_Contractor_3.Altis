
_vehSpawnPos = _this select 0;
_vehSpawnDir = _this select 1;
_type = _this select 2;
_displayName = [configFile >> "CfgVehicles" >> _type] call BIS_fnc_displayName;
_textures = param [3];
_missionLevel = param [4];
_respawnDelay = param [5, 10];
_abandonedRadius = param [6, 1000];


private ["_vehSpawnPos", "_vehSpawnDir", "_textures", "_type", "_veh", "_missionLevel", "_respawnDelay", "_abandonedRadius", "_allTriggers", "_destroyed", "_disabled", "_abandoned", "_varName", "_displayName"];


// Create Vehicle
	
	_veh = createVehicle [_type, _vehSpawnPos, [], 0, "CAN_COLLIDE"];
	_veh setDir _vehSpawnDir;
	
	if (count _textures < 1) then {
		[_veh] call BEW_FNC_ApplyCustomTexture;
		_textures = getObjectTextures _veh;
	};


// Create Simple Object

	_veh = [_veh] call QS_fnc_simpleObjectReplaceWith;
	_veh allowDamage false;
	_veh enableCopilot false;
	_veh setVariable ["CanBeActivated", true, true];
	_veh setVariable ["CanBeRequisitioned", true, true];
	_veh setVariable ["isRequisitioned", false, true];
	_veh setVariable ["missionLevel", _missionLevel, true];
	

// Hide Selections

	_selections = [

		"mala vrtule blur",
		"velka vrtule blur",
		"vrtule blur",
		"clan",
		"insignia",
		"muzzleflash",
		"zasleh",
		"zasleh1",
		"zasleh2",
		"zasleh3",
		"zasleh4",
		"zasleh5",
		"zasleh_1",
		"zasleh_2",	
		"zasleh_3",		
		"zaslehcoax",
		"l111a1_zasleh",
		"l7a2_1_zasleh",
		"decal_wing",
		"decal_tail",
		"decal_nose",
		"num_1",
		"num_2",
		"num_3",
		"light",
		"lights",
		"light_bo",
		"light_brake_visible",
		"light_brake_bo",
		"light_brake",
		"light_l",
		"light_r",
		"light_g",
		"lights_drive",
		"light_hd_1",
		"light_hd_2",
		'light_l_1',
		'light_r_1',
		'light_r_2',
		'light_l_2',
		'light_back',
		"l svetlo",
		"p svetlo",
		"brzdove svetlo",
		"zadni svetlo",
		"t svetlo",
		"lights_front_left",
		"lights_reverse",
		"lights_hide",
		"lights_front_right",
		"lights_front_cone",
		"lights_brake",
		"engine_blur",
		"main rotor blur",
		"tail rotor blur",
		"mainrotorblurred",
		"tailrotorblurred",
		"l7a2_1_zasleh",
		"l7a2_2_zasleh",
		"l7a2_3_zasleh",
		"l7a2_zasleh",
		'cannon_muzzleflash'

	];


	{

		_veh hideSelection [_x, true];
		
	} forEach _selections;


// Set Textures

	if (count _textures > 0) then {

		[[_veh, _textures], {
		
			_veh = _this select 0;
			_textures = _this select 1;
		
			[_veh, _textures] call BIS_fnc_setObjectTexture;
		
		}] remoteExec ["call", 0, true];
	
	};
		


waitUntil {sleep 1; missionlevel >= _missionLevel};


waitUntil {(!alive _veh)};

sleep 0.25;


// Create Vehicle

	_veh = createVehicle [_type, _vehSpawnPos, [], 0, "CAN_COLLIDE"];
	_veh setDir _vehSpawnDir;


// Setup Vehicle
	
	_veh allowDamage false;
	_veh enableCopilot false;
	_veh setVariable ["canRespawn", true, true];


	
// Clear Vehicle

	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	


// Setup Turret Weapons

	[_veh] call BEW_FNC_customVehicleWeapons;
	
	
// Turret Weapon Restrictions
	
	_restrictionList = ["UK3CB_BAF_Safe"];
	
	[_veh, _restrictionList] spawn BEW_FNC_restrictedTurretWeapons;


// 3CB Weapon Ammo Fix

	_authorFromConfig = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "author");
					
		if (_authorFromConfig == "www.3commandobrigade.com") then {

			[_veh] spawn BEW_FNC_3CBturretAmmoFix;

		};	

	
// Setup Pylon Loadouts

	if (_veh isKindOf 'air') then {
		
		[_veh] spawn BEW_FNC_customPylonLoadouts;

	};
		
	
// Global VarName

	_varName = [_veh, "Vehicle_"] call bis_fnc_objectvar;
	_veh setvehiclevarname _varName;
	
	
// Set Textures

	if (count _textures > 0) then {

		[[_veh, _textures], {
		
			_veh = _this select 0;
			_textures = _this select 1;
		
			[_veh, _textures] call BIS_fnc_setObjectTexture;
		
		}] remoteExec ["call", 0, true];
		
	};


// Lock Warning Action

if !(missionlevel >= _missionLevel) then {

		call compile format ["

			[%1,
			
			[""<t color='#FF0000'>VEHICLE LOCKED - MISSON LEVEL %2 REQUIRED"", 	
			
			{
			}
			
			, [], 97, true, true, """", ""(_this distance _target < 10) && !(locked _target == 0)"" ]
			
			] remoteexec [""addaction"", 0, true];
				
		",_veh, _missionLevel];
	
	};

	
_veh allowDamage TRUE;
	
	
// Vehicle Restrictions

	[_veh, [["air", BEW_v_allowedPilots], ["tank", BEW_v_allowedCrew], ["Wheeled_APC_F", BEW_v_allowedCrew]]] spawn BEW_FNC_VehicleRestrictions;

	
// Moving Marker

	[_veh, _displayName, "ColorCIV"] execVM "scripts\movingMarker.sqf";
	
	
// Diving Gear Action if Boat

	if (_veh isKindOf "SHIP") then {

		[_veh,

			["<t color='#add8e6'>EQUIP DIVING GEAR", 
			
			{
				
				[player] execVM "loadouts\natodivingloadout.sqf"

			}
			
			, [], -95, false, true, "", "(_this distance _target < 10)" ]

		] remoteexec ["addaction", 0, true];
		
	};


// Create Triggers

	_allTriggers = [];


	call compile format ["

	_destroyed = createTrigger [""EmptyDetector"", getPos %1];
	_destroyed setTriggerArea [1, 1, 1, false];
	_destroyed setTriggerActivation [""ANY"", ""PRESENT"", true];
	_destroyed setTriggerStatements [""!alive %1"", """", """"];
	_destroyed setTriggerTimeout [10, 10, 10, true];
	_allTriggers = _allTriggers + [_destroyed];



	_disabled = createTrigger [""EmptyDetector"", getPos %1];
	_disabled setTriggerArea [1, 1, 1, false];
	_disabled setTriggerActivation [""ANY"", ""PRESENT"", true];
	_disabled setTriggerStatements [""!canMove %1"", """", """"];
	_disabled setTriggerTimeout [300, 300, 300, true];
	_allTriggers = _allTriggers + [_disabled];


	_abandoned = createTrigger [""EmptyDetector"", getPos %1];
	_abandoned setTriggerArea [1, 1, 1, false];
	_abandoned setTriggerActivation [""ANY"", ""PRESENT"", true];
	_abandoned setTriggerStatements [""(count crew %1 < 1) && !([%1, %2] call BEW_FNC_PlayerInRadius) && ((count getVehicleCargo %1) < 1)"", """", """"];
	_abandoned setTriggerTimeout [60, 60, 60, true];
	_allTriggers = _allTriggers + [_abandoned];


	", _varname, _abandonedRadius];
				

waitUntil {sleep 1; (triggerActivated _destroyed) or (triggerActivated _disabled)};

deleteVehicle _veh;
{deleteVehicle _x} forEach _allTriggers;
removeAllActions _veh;

sleep _respawnDelay;

nul = [_vehSpawnPos, _vehSpawnDir, _type, _textures, _missionLevel, _respawnDelay] execVM "functions\fn_spawnVehicle.sqf";

