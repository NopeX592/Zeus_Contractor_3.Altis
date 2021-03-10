	// _intelObjects = [_centerPos, _radius] call BEW_FNC_spawnIntelObjects; 
	
	
	_centerPos = _this select 0;
	_radius = _this select 1;

	_intelObjects = [];

	// Intel Object

		// Find Positions In Buildings
		
			_buildingPositions = [_centerPos, _radius, 1] call BEW_fnc_findPositionsInNearBuildings;


		// Create Intel Objects
		
			_intelSpawnPos = (_buildingPositions select 0);
			_intelObj = createVehicle ["Land_tablet_02_black_F", _intelSpawnPos, [], 0, "CAN_COLLIDE"]; 
			_intelObj allowDamage false;
			_table = createVehicle ["Land_CampingTable_small_white_F", _intelSpawnPos, [], 0, "CAN_COLLIDE"]; 
			_table allowDamage false;
			_intelObj attachTo [_table, [0, 0, 0.45]]; 
			_intelObj setVariable ["IntelRecovered", false, true];
			[_intelObj] call BEW_FNC_gatherIntelAction;
			
		
		// Add Objects To Return Array
		
			_intelObjects = _intelObjects + [_intelObj];
			_intelObjects = _intelObjects + [_table];
			
		
		_intelObjects