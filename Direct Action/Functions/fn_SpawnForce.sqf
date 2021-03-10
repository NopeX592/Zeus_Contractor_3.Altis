
	
		private ["_centerPos", "_radius", "_sides", "_infantrySide", "_vehSide", "_factions", "_vehFaction", "_spawnInfantry", "_spawnVehicles", "_spawnArty", "_spawnAir", "_allUnits", "_allVehs"];
		
		_centerPos = param [0];
		_radius = param [1];
		
		_infantryArray = param [2];

		_vehicleArray = param [3];
			_vehSide = _vehicleArray select 0;
			_vehFaction = _vehicleArray select 1;
		
		_spawnInfantry = param [4];
		_spawnVehicles = param [5];
		_spawnArty = param [6];
		_spawnAir = param [7];
		
		_allUnits = [];
		_allVehs = [];
		
		
	// Spawn Infantry Groups
		
		if (_spawnInfantry) then {
		
			_infGroups = [_centerPos, _radius, _infantryArray] call BEW_FNC_SpawnInfGroups;
			
			{_allUnits = _allUnits + units _x} forEach _infGroups;
		
		};


	// Spawn Vehicle Groups
		
		if (_spawnVehicles) then {
		
			_vehArrays = [_centerPos, _radius, _vehSide, _vehFaction] call BEW_FNC_SpawnVehGroups;
			
			_vehs = _vehArrays select 0;
			_vehGroups = _vehArrays select 1;
			
			{_allVehs = _allVehs + [_x]} forEach _vehs;		
			{_allUnits = _allUnits + units _x} forEach _vehGroups;


			{[driver _x, _centerPos, _radius, 10] execVM "scripts\taskPatrol.sqf"} foreach _vehs;


		};
		

	// Spawn Artillery Groups

		if (_spawnArty) then {
		
			_vehArrays = [_centerPos, _radius, _vehSide, _vehFaction] call BEW_FNC_SpawnArtilleryGroups;

			_vehs = _vehArrays select 0;
			_vehGroups = _vehArrays select 1;
			
			{_allVehs = _allVehs + [_x]} forEach _vehs;		
			{_allUnits = _allUnits + units _x} forEach _vehGroups;
			
		
		};


	// Spawn Air
		
		if (_spawnAir) then {
			
			_capVehsToSpawn = (round (missionLevel / 3));
				if (_capVehsToSpawn > 2) then {_capVehsToSpawn = 2};
			
			if (_capVehsToSpawn > 0) then {
			
				for "_i" from 1 to _capVehsToSpawn do {
					
					// Spawn CAP
					
						enemyAir = [];
						publicVariable "enemyAir";
						
						_vehArray = [markerPos "wholeMapMarker", 10000, markerSize "wholeMapMarker" select 1, ["CAP"]] call BEW_FNC_SpawnEnemyAir;
									
						_veh = _vehArray select 0;
						_crew = _vehArray select 1;
						_group = _vehArray select 2;
						_displayName = [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName;
					
					// Patrol
			
						[driver _veh, _centerPos, [(_radius select 0) * 3], 10] execVM "scripts\taskPatrol.sqf";
									
					// Add To Total Units
					
						_allVehs = _allVehs + [_veh];	
						{_allUnits = _allUnits + [_x]} forEach _crew;
						
				};
			};
			
			
			_casVehsToSpawn = (round (missionLevel / 3));
				if (_casVehsToSpawn > 2) then {_casVehsToSpawn = 2};
			
			if (_casVehsToSpawn > 0) then {
			
				for "_i" from 1 to _casVehsToSpawn do {
					
					// Spawn CAP
					
						enemyAir = [];
						publicVariable "enemyAir";
						
						_vehArray = [markerPos "wholeMapMarker", 10000, markerSize "wholeMapMarker" select 1, ["CAS", "A_HELI"]] call BEW_FNC_SpawnEnemyAir;
									
						_veh = _vehArray select 0;
						_crew = _vehArray select 1;
						_group = _vehArray select 2;
						_displayName = [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName;
					
					// Patrol
			
						[driver _veh, _centerPos, [(_radius select 0) * 3], 10] execVM "scripts\taskPatrol.sqf";
						
					// Add To Total Units
					
						_allVehs = _allVehs + [_veh];	
						{_allUnits = _allUnits + [_x]} forEach _crew;
						
				};
			};
		
		};
		
		// Vehicle Restrictions
			
			{
			
				[_x, [["air", "B_Helipilot_F"], ["tank", "B_crew_F"], ["Wheeled_APC_F", "B_crew_F"]]] spawn BEW_FNC_VehicleRestrictions;
				
			} forEach _allVehs;
		
		_array = [_allUnits, _allVehs];
		
		_array 

	