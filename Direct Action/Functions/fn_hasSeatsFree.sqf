

	_veh = _this select 0;
	
	_positionTypes = ["Commander", "Driver", "Gunner", "Cargo"];

	_freePositions = 0;

	{

		_emptyPositions = _veh emptyPositions _x;
		_freePositions = _freePositions + _emptyPositions; 

	} forEach _positionTypes;

	_return = (_freePositions > 0);
	
	_return