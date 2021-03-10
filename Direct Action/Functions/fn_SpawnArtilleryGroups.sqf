
	private [
	
		"_numStaticGun",
		"_numStaticAA",
		"_numStaticAT",
		"_numMortar",
		"_enemyVehs",
		"_spawnPos",
		"_vehGroup",
		"_centerPos",
		"_radius",
		"_side",
		"_factions"
		
	];
	
	_centerPos = _this select 0;
	_radius = _this select 1;
	_side = _this select 2;
	_factions = _this select 3;
	_debug = param [4, false];
	
	
	if (_debug) then {
				
		_marker = createMarker ["centerPos", _centerPos];
		_marker setMarkerType "hd_dot";
		_marker setMarkerColor "ColorGreen";
					
	};
	
	
	switch (missionLevel) do {
	
		case 1: {
		
			_numStaticGun = 1;
			_numStaticAA = 1;
			_numStaticAT = 0;
			_numMortar = 0;
		
		};
		
		case 2: {
		
			_numStaticGun = 1;
			_numStaticAA = 1;
			_numStaticAT = 0;
			_numMortar = 0;
		
		};
		
		case 3: {
		
			_numStaticGun = 1;
			_numStaticAA = 1;
			_numStaticAT = 1;
			_numMortar = 0;
			
		};
		
		case 4: {
		
			_numStaticGun = 1;
			_numStaticAA = 1;
			_numStaticAT = 1;
			_numMortar = 0;
		
		};
		
		case 5: {
		
			_numStaticGun = 2;
			_numStaticAA = 2;
			_numStaticAT = 2;
			_numMortar = 1;
		
		};
			
		default { 
		
			_numStaticGun = 2;
			_numStaticAA = 2;
			_numStaticAT = 2;
			_numMortar = 1;
		
		};
			
	};
	
	
	// Define Enemy Force
	
		_enemyVehs = [];
		_vehGroups = [];
		
		
	// Group Static Weapons Together
	
		_staticGroup = createGroup [_side, true];
		_vehGroups = _vehGroups + [_staticGroup];
		
		
	// Spawn Static Guns
	
		if (_numStaticGun > 0) then {
		
			for "_i" from 1 to _numStaticGun do {
			
				_spawnPos = [];
				
				while {count _spawnPos < 1} do {
			
					_spawnPos = [_centerPos, [50, 150], random 360, 0, [0], 10] call SHK_pos;
					if ((count _spawnPos > 1) and (surfaceIsWater _spawnPos)) then {_spawnPos = []};
					
				};
				
					if (_debug) then {
				
						_markerName = format ["staticGun_%1", _i];
						_marker = createMarker [_markername, _spawnPos];
						_marker setMarkerType "hd_dot";
						_marker setMarkerColor "ColorRed";
					
					};
				
					_relDir = [_spawnPos, _centerPos] call BIS_fnc_dirTo;
				
				_vehArray = [_spawnPos, _side, _factions, "STATIC_GUN", _relDir - 180, [false]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
				
				{
				
					[_x] join _staticGroup;
					
				} forEach units _vehGroup;
				
				_enemyVehs = _enemyVehs + [_veh];
				_vehGroups = _vehGroups + [_vehGroup];
				
			};
		
		};


	// Spawn Static AA
	
		if (_numStaticAA > 0) then {
		
			for "_i" from 1 to _numStaticAA do {
			
				_spawnPos = [];
				
				while {count _spawnPos < 1} do {
			
					_spawnPos = [_centerPos, [50, 150], random 360, 0, [0], 10] call SHK_pos;
					if ((count _spawnPos > 1) and (surfaceIsWater _spawnPos)) then {_spawnPos = []};
					
				};
				
					if (_debug) then {
				
						_markerName = format ["staticAA_%1", _i];
						_marker = createMarker [_markername, _spawnPos];
						_marker setMarkerType "hd_dot";
						_marker setMarkerColor "ColorRed";
					
					};
				
					_relDir = [_spawnPos, _centerPos] call BIS_fnc_dirTo;
				
				_vehArray = [_spawnPos, _side, _factions, "STATIC_AA", _relDir - 180, [false]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
				
				{
				
					[_x] join _staticGroup;
					
				} forEach units _vehGroup;
				
				_enemyVehs = _enemyVehs + [_veh];
				_vehGroups = _vehGroups + [_vehGroup];
				
			};
		
		};


	// Spawn Static AT
	
		if (_numStaticAT > 0) then {
		
			for "_i" from 1 to _numStaticAT  do {
			
				_spawnPos = [];
				
				while {count _spawnPos < 1} do {
			
					_spawnPos = [_centerPos, [50, 150], random 360, 0, [0], 10] call SHK_pos;
					if ((count _spawnPos > 1) and (surfaceIsWater _spawnPos)) then {_spawnPos = []};
					
				};
				
					if (_debug) then {
				
						_markerName = format ["staticAT_%1", _i];
						_marker = createMarker [_markername, _spawnPos];
						_marker setMarkerType "hd_dot";
						_marker setMarkerColor "ColorRed";
					
					};
				
					_relDir = [_spawnPos, _centerPos] call BIS_fnc_dirTo;
				
				_vehArray = [_spawnPos, _side, _factions, "STATIC_AT", _relDir - 180, [false]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
				
				{
				
					[_x] join _staticGroup;
					
				} forEach units _vehGroup;
				
				_enemyVehs = _enemyVehs + [_veh];
				_vehGroups = _vehGroups + [_vehGroup];
				
			};
		
		};		


	// Spawn Mortar
	
		if (_numMortar > 0) then {
		
			for "_i" from 1 to _numMortar  do {
			
				_spawnPos = [];
				
				while {count _spawnPos < 1} do {
			
					_spawnPos = [_centerPos, [50, 150], random 360, 0, [0], 10] call SHK_pos;					
					if ((count _spawnPos > 1) and (surfaceIsWater _spawnPos)) then {_spawnPos = []};
					
				};
				
					if (_debug) then {
				
						_markerName = format ["staticMortar_%1", _i];
						_marker = createMarker [_markername, _spawnPos];
						_marker setMarkerType "hd_dot";
						_marker setMarkerColor "ColorRed";
					
					};
				
					_relDir = [_spawnPos, _centerPos] call BIS_fnc_dirTo;
				
				_vehArray = [_spawnPos, _side, _factions, "STATIC_MORTAR", _relDir - 180, [false]] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;

				{
				
					[_x] join _staticGroup;
					
				} forEach units _vehGroup;

				_enemyVehs = _enemyVehs + [_veh];
				_vehGroups = _vehGroups + [_vehGroup];
				
			};
		
		};	
		
	
	_array = [_enemyVehs, _vehGroups]; 
	
	_array;
