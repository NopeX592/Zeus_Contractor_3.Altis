
	
	private [
	
		"_numCar",
		"_numTank",
		"_numAPCs",
		"_numHeli",
		"_enemyVehs",
		"_spawnPos",
		"_vehGroup",
		"_centerPos",
		"_radius",
		"_side",
		"_faction"
		
	];
	
	_centerPos = _this select 0;
	_radius = _this select 1;
	_side = _this select 2;
	_faction = _this select 3;
	
	
	switch (missionLevel) do {
	
		case 1: {
		
			_numCar = 1;
			_numTank = 0;
			_numAPCs = 0;
			_numHeli = 0;
		
		};
		
		case 2: {
		
			_numCar = 2;
			_numTank = 0;
			_numAPCs = 0;
			_numHeli = 0;
		
		};
		
		case 3: {
		
			_numCar = 2;
			_numTank = 0;
			_numAPCs = 1;
			_numHeli = 0;
			
		};
		
		case 4: {
		
			_numCar = 2;
			_numTank = 0;
			_numAPCs = 1;
			_numHeli = 0;
		
		};
		
		case 5: {
		
			_numCar = 3;
			_numTank = 1;
			_numAPCs = 1;
			_numHeli = 0;
		
		};
			
		default { 
		
			_numCar = 3;
			_numTank = 1;
			_numAPCs = 1;
			_numHeli = 0;
		
		};
			
	};
	
	
	// Define Enemy Force
	
		_enemyVehs = [];
		_vehGroups = [];
		
		
	// Spawn Cars
	
		if (_numCar > 0) then {
		
			for "_i" from 1 to _numCar do {
			
				_spawnPos = [];
				
				while {count _spawnPos < 1} do {
			
					_spawnPos = [_centerPos, [1, _radius select 0], random 360, 0, [0], 10] call SHK_pos;
					if ((count _spawnPos > 1) and (surfaceIsWater _spawnPos)) then {_spawnPos = []};
					
				};
				
				_vehArray = [_spawnPos, _side, _faction, "A_CAR", random 360, [TRUE, _centerPos, _radius select 0]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
				
				_enemyVehs = _enemyVehs + [_veh];
				_vehGroups = _vehGroups + [_vehGroup];
				
			};
		
		};
		
		
	// Spawn APCs
	
		if (_numApcs > 0) then {
		
			for "_i" from 1 to _numApcs do {
						
				_spawnPos = [];
				
				while {count _spawnPos < 1} do {
			
					_spawnPos = [_centerPos, [1, _radius select 0], random 360, 0, [0], 10] call SHK_pos;
					if ((count _spawnPos > 1) and (surfaceIsWater _spawnPos)) then {_spawnPos = []};
					
				};
				
				_vehArray = [_spawnPos, _side, _faction, "APC", random 360, [TRUE, _centerPos, _radius select 0]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
				
				_enemyVehs = _enemyVehs + [_veh];
				_vehGroups = _vehGroups + [_vehGroup];
				
			};
		
		};
	
	
	// Spawn Tanks
	
		if (_numTank > 0) then {
	
			for "_i" from 1 to _numTank do {
			
				
				_spawnPos = [];
				
				while {count _spawnPos < 1} do {
			
					_spawnPos = [_centerPos, [1, _radius select 0], random 360, 0, [0], 10] call SHK_pos;
					if ((count _spawnPos > 1) and (surfaceIsWater _spawnPos)) then {_spawnPos = []};
					
				};
				
				_vehArray = [_spawnPos, _side, _faction, "TANK", random 360, [TRUE, _centerPos, _radius select 0]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
				
				_enemyVehs = _enemyVehs + [_veh];
				_vehGroups = _vehGroups + [_vehGroup];
				
			};
		
		};


	// Spawn Helicopters
	
		if (_numHeli > 0) then {
		
			for "_i" from 1 to _numHeli do {
			
				_vehArray = [_centerPos, _side, _faction, "A_HELI", random 360, [TRUE, _centerPos, _radius select 0]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
				
				_enemyVehs = _enemyVehs + [_veh];
				_vehGroups = _vehGroups + [_vehGroup];
				
			};
		
		};	
	
	_array = [_enemyVehs, _vehGroups]; 
	
	_array;
