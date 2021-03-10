	private ["_alivePlayers", "_deadPlayers"];

	_alivePlayers = [];
	_deadPlayers = [];

	{ 

		if (alive _x) then {
		
			_alivePlayers = _alivePlayers + [_x];

		}else{ 
		
			_deadPlayers = _deadPlayers + [_x];

		};

	} forEach allPlayers;

	hint format ["%1", _aliveplayers];
	
	[_alivePlayers, _deadPlayers];