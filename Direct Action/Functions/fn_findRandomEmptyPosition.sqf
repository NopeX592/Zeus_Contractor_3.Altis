	
	private [

		"_centerPos",
		"_range",
		"_clearingSize",
		"_waterPosition",
		"_roadPosition",
		"_safepos", 
		"_isFlatEmpty"

	];

	_centerPos 		= param [0, getPos player];
	_range 			= param [1, [1, 100]];
	_clearingSize 	= param [2, 5];
	_waterPosition	= param [3, 0];
	_roadPosition	= param [4, 0];

	_safePos = [];

	while {count _safePos < 1} do { 

		_safePos = [_centerPos, _range, random 360, _waterPosition, [_roadPosition]] call SHK_pos; 

		_isFlatEmpty = !(_safePos isFlatEmpty [_clearingSize, -1, -1, -1, -1, false] isEqualTo []);

		if ((count _safePos > 0) and !(_isFlatEmpty)) then {_safePos = []};

	};

	_safePos