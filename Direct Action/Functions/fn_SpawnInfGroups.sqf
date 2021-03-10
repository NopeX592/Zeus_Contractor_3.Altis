
	
	private [
	
		"_numGarrison",
		"_numPatrol",
		"_numParadrop",
		"_infGroups",
		"_spawnPos",
		"_infGroup",
		"_centerPos",
		"_radius",
		"_sides",
		"_factions",
		"_waterSpawn",
		"_infArcheypes",
		"_terrainHeight"
		
	];
	
	_centerPos = _this select 0;
	_radius = _this select 1;
	_infantryArray = param [2];
		_infantrySide  = _infantryArray select 0;
		_infantryFaction = _infantryArray select 1;
		_infantryArchetype = _infantryArray select 2;
		
	_garrison = param [4, TRUE];
	_waterSpawn = param [5, 0];
	_infTypes = param [6, []];	
	
	switch (missionLevel) do {
	
		case 1: {
		
			_numGarrison = 1;
			_numPatrol = 2;
			_numParadrop = 1;
		
		};
		
		case 2: {
		
			_numGarrison = 1;
			_numPatrol = 2;
			_numParadrop = 1;
		
		};
		
		case 3: {
		
			_numGarrison = 2;
			_numPatrol = 3;
			_numParadrop = 2;
		
		};
		
		case 4: {
		
			_numGarrison = 2;
			_numPatrol = 3;
			_numParadrop = 2;
		
		};
		
		case 5: {
		
			_numGarrison = 2;
			_numPatrol = 4;
			_numParadrop = 3;
		
		};
			
		default { 
		
			_numGarrison = 2;
			_numPatrol = 4;
			_numParadrop = 3;
		
		};
			
	};
	
	// Multiply Groups If Sea Objective
	
		if (_waterSpawn == 2) then {_numPatrol = round (_numPatrol * 1.5)};
	
	// Define Enemy Force
	
		_infGroups = [];

	if (_garrison) then {
	
		// Spawn Garrison Groups
	
		for "_i" from 1 to _numGarrison do {
			
			_spawnPos = [];
			
			while {count _spawnPos < 1} do {
			
				_spawnPos = [_centerPos, 1, _radius select 0 / 2, 1, _waterSpawn, 0, 0] call BIS_fnc_findSafePos;
				
				if (_waterSpawn == 0) then {
				
					if ((count _spawnPos > 1) and (surfaceIsWater _spawnPos)) then {_spawnPos = []};
				
				}else{
				
					if ((count _spawnPos > 1)) then {_spawnPos = []};
				
				};
				
			};
			
			_infGroup = [_spawnPos, _infantryArray, _infTypes] call BEW_FNC_SpawnGroup;
					{_x setSkill 1} forEach units _infGroup;
			_infGroup setVariable ["VCM_DisableForm",true]; 
				
			_infGroups = _infGroups + [_infGroup];
			
			[_centerPos, units _infGroup, _radius select 0, true, false, false, false] execVM "scripts\Zen_OccupyHouse.sqf";
			
		};
	
	};
	
	// Spawn Patrol Groups
	
		for "_i" from 1 to _numPatrol do {
		
		 _patrolRadius = [100 * _i];
		 if (_patrolRadius select 0 > _radius select 0) then {_patrolRadius = _radius};
		
			_spawnPos = [];
			
			while {count _spawnPos < 1} do {
		
	
				if (_waterSpawn == 0) then {
				
					while {(count _spawnPos < 1)} do {
			
						_spawnPos = [_centerPos, 1, _patrolRadius select 0, 1, _waterSpawn, 0, 0] call BIS_fnc_findSafePos;
						if (surfaceIsWater _spawnPos) then {_spawnPos = []};
					
					};
					
				}else{
				
					while {count _spawnPos < 1} do {
			
						_spawnPos = [_centerPos, [1, _patrolRadius select 0], random 360, _waterSpawn, [0], 10] call SHK_pos;
					
					};
				
				};
				
			};
			
			_infGroup = [_spawnPos, _infantryArray, _infTypes] call BEW_FNC_SpawnGroup;	
				{_x setSkill 1} forEach units _infGroup;
			
			_infGroups = _infGroups + [_infGroup];
			
			
				if (_waterSpawn == 0) then {

					[leader _infGroup, _centerPos, _patrolRadius, 10] execVM "scripts\taskPatrol.sqf";
					
				}else{
				
					{
						_unitPos = getPos _x;
						_terrainHeight = getTerrainHeightASL _unitPos;
						_unitPos = [_unitPos select 0, _unitPos select 1, _terrainHeight];
						
						_x setPos _unitPos;
						_x swimInDepth _terrainHeight;
						
					} forEach units _infGroup;
					
					[leader _infGroup, _centerPos, _patrolRadius, 10] execVM "scripts\taskPatrol.sqf";
				
				};
	
			
		};
		
		
	// Spawn Paradrop Groups
	
		_minPos = 10000;
		_maxPos = 11000;
	
		for "_i" from 1 to _numParadrop do {
		
			_dropPos = [];
			
			while {(count _dropPos < 1)} do {
			
				_dropPos = [_centerPos, 1, _radius select 0, 1, _waterSpawn, 0, 0] call BIS_fnc_findSafePos;
				if (surfaceIsWater _dropPos) then {_dropPos = []};
					
			};

			_spawnPos = [_centerPos, [_minPos, _maxPos], random 360, 1, [0], 10] call SHK_pos;
			
			
			_paradropArray = [_centerPos, _spawnPos, _dropPos, EAST] call BEW_FNC_paradropReinforcements;
			
			_veh = _paradropArray select 0;
			_vehGroup = _paradropArray select 1;
			_InfGroup = _paradropArray select 2;
				{_x setSkill 1} forEach units _infGroup;
			_marker = _paradropArray select 3;
			_endPos = _spawnPos;
			
			_infGroups = _infGroups + [_vehGroup] + [_infGroup];
			
			
			// Waypoint 
			
				[_veh, _vehGroup, _infGroup, _centerPos, _marker, _endPos, _radius select 0] spawn BEW_FNC_ParadropReinforcementsWaypoint; 
			
			_minPos = _minPos + 5000;
			_maxPos = _maxPos + 5000;
			
			
		};
	
	_infGroups;
