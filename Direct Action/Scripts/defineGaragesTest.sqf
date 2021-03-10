

	_building = _this select 0;

	[] execVM "functions\BEW_FNC_DefineGarages.sqf";
	
	
	_positions = [_building] call BEW_FNC_DefineGarages;
	
	_position = _positions select 0 select 0;
	_dir = _positions select 0 select 1;
	
	player setPos _position;
	player setDir _dir;