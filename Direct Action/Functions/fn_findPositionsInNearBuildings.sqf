
	_centerPos		= 	param [0];
	_radius			=	param [1, 100];
	_amount			=	param [2, 1];
	_buildingTypes 	= param [3, ["House"]];
	
	_allTargetPositions = [];
	scopeName "Main";

	// Find All Buildings
		
		_allBuildings = nearestObjects [_centerPos, _buildingTypes, _radius];
		
		
	// Find Buildings With Positions	

		_buildingsWithPositions = _allBuildings select {count ([_x] call BIS_fnc_buildingPositions) > 0};

	for "_i" from 1 to _amount do {
	
		if (count _buildingsWithPositions < 1) then {breakTo "main"};
	
		// Select Target Building

			_targetBuilding = _buildingsWithPositions call BIS_fnc_selectRandom;
			
			
		// Find Positions In Target Building
			
			_targetPositions = [_targetBuilding] call BIS_fnc_buildingPositions;


		// Select Random Pos

			_targetPos = _targetPositions call BIS_fnc_selectRandom;
			_buildingsWithPositions = _buildingsWithPositions - [_targetBuilding];
			_allTargetPositions	= _allTargetPositions + [(_targetPos)];
			
	};

	_allTargetPositions
	
	