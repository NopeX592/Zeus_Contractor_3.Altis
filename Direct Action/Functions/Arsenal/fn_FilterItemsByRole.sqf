
	private ["_arsenalList", "_playerType", "_classnames", "_restrictedLists"];

	_arsenalList = _this select 0;
	_playerType = typeOf player;
	_classnames = BLU_ItemRestrictionList select 0;
	_restrictedLists = BLU_ItemRestrictionList select 1;

	for "_i" from 0 to (count _classnames - 1) do {
	
		_classname = _classnames select _i;
		_listToDelete = _restrictedLists select _i;
		
		if !(_playerType == _classname) then {_arsenalList = _arsenalList - _listToDelete};

	};

	_arsenalList
