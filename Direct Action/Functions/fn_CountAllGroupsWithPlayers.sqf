
	_unitCount = 0;
	
	private _allGroupsWithPlayers = []; 
	{_allGroupsWithPlayers pushBackUnique group _x} forEach allPlayers;

	{
	
		_unitCount = _unitCount + (count units _x);
	
	} forEach _allGroupsWithPlayers;
	
	_unitCount
