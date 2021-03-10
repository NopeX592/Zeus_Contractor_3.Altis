

	private [

		"_marker",
		"_centerPos",
		"_minPos",
		"_maxPos",
		"_respawn",
		"_respawnDelay",
		"_spawnPos",
		"_vehArray",
		"_veh",
		"_crew",
		"_group",
		"_displayName"

	];


	_centerPos = _this select 0;
	_minPos  = _this select 1;
	_maxPos  = _this select 2;
	_types = param [3, ["CAP","CAS","A_HELI"]];
	

	// Find Pos
	
		_spawnPos = [_centerPos, [_minPos, _maxPos], random 360, 1, [0], 10] call SHK_pos;
		
	
	// Select Vehicle Type
	
		_type = _types call BIS_fnc_selectRandom;
	
	
	// Create Air Vehicle
		
		_side = OPF_VehicleArray select 0;
		_faction = OPF_VehicleArray select 1;
		_vehArray = [_spawnPos, _side, _faction, _type] call BEW_FNC_SpawnCrewedVehicle;	

		_veh = _vehArray select 0;
		_crew = _vehArray select 1;
		_group = _vehArray select 2;
		_displayName = [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName;
		
		_group setVariable ["Vcm_Disable",true];
		
		enemyAir = enemyAir + [_veh];
		publicVariable "enemyAir";
	
	
	// Vehicle Setup
	
		[_veh] spawn BEW_FNC_customPylonLoadouts;
		[_veh] call BEW_FNC_ApplyCustomTexture;
		
		if (_veh isKindOf "Helicopter") then {
		
			_veh flyInHeight 200;
		
		}else{
		
			_veh flyInHeight 400;
		
		};
			
			
	// Moving Marker

	//	[_veh, _displayName] execVM "scripts\movingMarker.sqf";
		
	_vehArray
				
