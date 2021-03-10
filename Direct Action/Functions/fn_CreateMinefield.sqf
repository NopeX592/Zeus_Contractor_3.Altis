

	_centerPos = param [0];
	_minDistance = param [1, 5];
	_maxDistance = param [2, 50];
	_mineTypesAndWeights = param [3, [["APERSMINE"],[1]]];
		_mineTypes = _mineTypesAndWeights select 0;
		_mineWeights = _mineTypesAndWeights select 1;
	
	_mineAmount = param [4, 50];
	_side = param [5, EAST];
	_debug = param [6, false];

	_allMines = [];


	for "_i" from 1 to _mineAmount do { 
	
		_mineType = [_mineTypes, _mineWeights] call BIS_fnc_selectRandomWeighted;

		_pos = [_centerPos, [_minDistance, _maxDistance], random 360, 0, [0], _mineType] call SHK_pos;

		_mine = createMine [_mineType, _pos, [], 0];
		_side revealMine _mine;
		_allMines = _allMines + [_mine];
	
		if (_debug) then {
		
			_markerName = format ["Mine_%1", _mine];
			_marker = createMarker [_markerName, getPos _mine];
			_marker setMarkerType "hd_dot";
			_marker setMarkerColor "ColorRed";
		
		};
	
	};
	
	_allmines

