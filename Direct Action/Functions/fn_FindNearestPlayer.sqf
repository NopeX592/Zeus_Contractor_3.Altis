

	private ["_target","_nearestPlayer","_players","_sorted"];
	_target = _this select 0;
	_players = [];

	// Get array of actual players
		
		{
			if (isplayer _x) then
			
			{
			
				_players set [count _players,_x];
			
			};
			
		} foreach playableunits;

	// Sort
	
		_sorted = [_players,[],{_x distance _target},"ASCEND"] call BIS_fnc_sortBy;
		
		_nearestPlayer = _sorted select 0;
		
		_nearestPlayer;
