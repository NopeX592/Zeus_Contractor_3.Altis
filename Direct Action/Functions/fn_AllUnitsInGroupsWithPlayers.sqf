

	_allUnits = [];
	
	private _allGroupsWithPlayers = []; 
	{_allGroupsWithPlayers pushBackUnique group _x} forEach allPlayers;

	{
	
		_allUnits = _allUnits + (units _x);
	
	} forEach _allGroupsWithPlayers;
	
	_allUnits
	
