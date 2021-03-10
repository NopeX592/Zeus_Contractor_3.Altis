
		
	private ["_numPatrol", "_numCars", "_numTanks", "_numApcs"];
		
	_centerPos = _this select 0;
	_sides = _this select 1;
	_factions = _this select 2;
	_archetypes = _this select 3;
		
		
	switch (missionLevel) do {
	
		case 1: {
		
			_numPatrol = 4;
			_numCars = 1;
			_numApcs = 0;
			_numTanks = 0;
		
		};
		
		case 2: {
		
			_numPatrol = 4;
			_numCars = 1;
			_numApcs = 0;
			_numTanks = 0;
		
		};
		
		case 3: {
		
			_numPatrol = 5;
			_numCars = 2;
			_numApcs = 1;
			_numTanks = 0;
		
		};
		
		case 4: {
		
			_numPatrol = 5;
			_numCars = 2;
			_numApcs = 1;
			_numTanks = 0;
		
		};
		
		case 5: {
		
			_numPatrol = 6;
			_numCars = 2;
			_numApcs = 1;
			_numTanks = 1;
		
		};
			
		default { 
		
			_numPatrol = 6;
			_numCars = 2;
			_numApcs = 1;
			_numTanks = 1;
		
		};
			
	};
		
		_radius = 100;
		_enemyUnits = [];
		_enemyVehs = [];
		
	// Spawn Enemy Infantry Groups
	
		for "_i" from 1 to _numPatrol do {
	
			_pos = [_centerPos, [750,1000], random 360, 0, [0]] call SHK_pos;
			
			_enemyGroup = [_pos, _sides, _factions, _archetypes] call BEW_FNC_SpawnGroup;
			
			{
			
				_enemyUnits = _enemyUnits + [_x];
				
			} forEach units _enemyGroup;

			[leader _enemyGroup, _centerPos, _radius, 10] execVM "scripts\taskPatrol.sqf";
			
			_radius = _radius + 25;

		};
		
		
	// Spawn Cars
	
		if (_numCars > 0) then {
		
			for "_i" from 1 to _numCars do {
						
				_pos = [_centerPos, [750,1000], random 360, 0, [0]] call SHK_pos;
				_vehArray = [_pos, east, _factions, "A_CAR", random 360, [TRUE, _centerPos, _radius]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
				
				{
				
					_enemyUnits = _enemyUnits + [_x];
					
				} forEach _vehCrew;
				
				_enemyVehs = _enemyVehs + [_veh];
				
			};
		
		};
		
		
	// Spawn APCs
	
		if (_numApcs > 0) then {
		
			for "_i" from 1 to _numApcs do {
						
				_pos = [_centerPos, [750,1000], random 360, 0, [0]] call SHK_pos;
				_vehArray = [_pos, east, _factions, "APC", random 360, [TRUE, _centerPos, _radius]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
				
				{
				
					_enemyUnits = _enemyUnits + [_x];
					
				} forEach _vehCrew;
				
				_enemyVehs = _enemyVehs + [_veh];
				
			};
		
		};
		
		
	// Spawn Tanks
	
		if (_numTanks > 0) then {
		
			for "_i" from 1 to _numTanks do {
						
				_pos = [_centerPos, [750,1000], random 360, 0, [0]] call SHK_pos;
				_vehArray = [_pos, east, _factions, "TANK", random 360, [TRUE, _centerPos, _radius]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
				
				{
				
					_enemyUnits = _enemyUnits + [_x];
					
				} forEach _vehCrew;
				
				_enemyVehs = _enemyVehs + [_veh];
				
			};
		
		};
		
		
		_enemyForce = [_enemyUnits, _enemyVehs];
		
		_enemyForce;
