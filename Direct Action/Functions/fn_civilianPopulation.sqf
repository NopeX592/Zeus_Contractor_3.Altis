	
	_centerPos = getPos player;
	_radius = 50;
	_civPopCap = 30;


	_allCivilians = [];
	
	for "_i" from 1 to _civPopCap do {
	
		_civ = createAgent ["C_Man_1", _centerPos, [], _radius, "NONE"];
		_allCivilians = _allCivilians + [_civ];
		
		[_civ, _centerPos, [_radius], 10] execVM "scripts\taskPatrol.sqf";
	
	};
	
	sleep 5;
	
	{deleteVehicle _x} forEach _allCivilians;