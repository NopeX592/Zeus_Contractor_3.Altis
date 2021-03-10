
	_obj = _this select 0;
	_radius = _this select 1;


	private ["_obj", "_radius", "_nearPlayer", "_return"];


	_nearPlayers = [];

	{

		if ((_x distance _obj < _radius) && (alive _x) && (_x != _obj)) then {

			_nearPlayers = _nearPlayers + [_x];

		};

	} forEach allPlayers;

	_return = (count _nearPlayers > 0);
	
	_return;
