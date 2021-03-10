
	
		private ["_centerPos", "_radius", "_sides", "_infantrySide", "_vehSide", "_factions", "_vehFactions", "_infantry", "_ships", "_artillery", "_emptyVehicles", "_allUnits", "_allVehs", "_numShips", "_numHelis"];
		
		_centerPos = param [0];
		_radius = param [1];
		_sides = param [2];
			_infantrySide = _sides select 0;
			_vehSide = _sides select 1;
		
		_factions = param [3];
			_infantryFactions = _factions select 0;
			_vehFactions = _factions select 1;
		
		_infantry = param [4, true];
		_ships = param [5, true];
		_heli = param [6, false];
		_air = param [7, true];
		
		_allUnits = [];
		_allVehs = [];
		
	
	// Define Amount Of Boats

		switch (missionLevel) do {
		
			case 1: {
			
				_numShips = 3;
				_numHelis = 0;
			
			};
			
			case 2: {
			
				_numShips = 3;
				_numHelis = 0;
			
			};
			
			case 3: {
			
				_numShips = 4;
				_numHelis = 0;
			
			};
			
			case 4: {
			
				_numShips = 4;
				_numHelis = 0;
			
			};
			
			case 5: {
			
				_numShips = 5;
				_numHelis = 0;
			
			};
				
			default { 
			
				_numShips = 5;
				_numHelis = 0;
			
			};
				
		};



	// Spawn Infantry Groups
		
		if (_infantry) then {
			
			_infGroups = [_centerPos, _radius, _infantrySide, _infantryFactions, false, 2, ["OI_diverTeam"], ["SpecOps"]] call BEW_FNC_SpawnInfGroups;
			
			{_allUnits = _allUnits + units _x} forEach _infGroups;
		
		};



	// Spawn Boat Groups
		
		if (_ships) then {
		
			for "_i" from 1 to _numShips do {
			
				_spawnPos = [];
				
				while {count _spawnPos < 1} do {
			
					_spawnPos = [_centerPos, [1, _radius select 0], random 360, 2, [0], 10] call SHK_pos;
					
				};
				
				_vehArray = [_spawnPos, _vehSide, _vehFactions, "SHIP", random 360, [TRUE, _centerPos, _radius select 0]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
				
				_allVehs = _allVehs + [_veh];
				_allUnits = _allUnits + units _vehGroup;
				
				[driver _veh, _centerPos, _radius, 10] execVM "scripts\taskPatrol.sqf";
				
			};

		};
		
		
	// Spawn Helicopters
		
		if (_heli) then {
			
			for "_i" from 1 to _numHelis do {
			
				_spawnPos = [];
				
				while {count _spawnPos < 1} do {
			
					_spawnPos = [_centerPos, [1, _radius select 0], random 360, 2, [0], 10] call SHK_pos;
					
				};
			
				_vehArray = [_spawnPos, _vehSide, _vehFactions, "A_HELI", random 360, [TRUE, _centerPos, _radius select 0]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
				
				_allVehs = _allVehs + [_veh];
				_allUnits = _allUnits + units _vehGroup;
				
				[driver _veh, _centerPos, _radius, 10] execVM "scripts\taskPatrol.sqf";
				
			};
		
		};
		
	// Spawn Air
		
		if (_air) then {
			
			_airVehsToSpawn = (round (missionLevel / 2) - 1);			
				if (_airVehsToSpawn > 3) then {_airVehsToSpawn = 3};
			
			if (_airVehsToSpawn > 0) then {
			
				for "_i" from 1 to _airVehsToSpawn do {
					
					// Spawn Air
					
						enemyAir = [];
						publicVariable "enemyAir";
						
						_vehArray = [markerPos "wholeMapMarker", 10000, markerSize "wholeMapMarker" select 1] call BEW_FNC_SpawnEnemyAir;
									
						_veh = _vehArray select 0;
						_crew = _vehArray select 1;
						_group = _vehArray select 2;
						_displayName = [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName;
					
					// Patrol
			
						[driver _veh, _centerPos, [(_radius select 0) * 2], 10] execVM "scripts\taskPatrol.sqf";
						
					
					// Add To Total Units
					
						_allVehs = _allVehs + [_veh];	
						{_allUnits = _allUnits + [_x]} forEach _crew;
						
						
				};
			};
		
		};
		
		
		_array = [_allUnits, _allVehs];
		
		_array 
	
