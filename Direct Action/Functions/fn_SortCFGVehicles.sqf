

	private ["_side", "_kind", "_blacklist", "_condition", "_sorted", "_sortedBySide", "_sortedByFaction", "_sortedByKind"];
		
		_side = param [0, sideUnknown];
		_faction = param [1, nil];
		_kind = param [2, nil];
		_blacklistUAV = param [3, true];


	// All Vehicles

		_allVehicles = "true" configClasses (configFile >> "CfgVehicles") apply {configname _x};
		_sorted = _allVehicles;


	// Sort By Side

		switch (_side) do {
			case west: {_condition = "(getNumber (_x >> 'side') == _side call BIS_fnc_sideID)"};
			case east: {_condition = "(getNumber (_x >> 'side') == _side call BIS_fnc_sideID)"};
			case resistance: {_condition = "(getNumber (_x >> 'side') == _side call BIS_fnc_sideID)"};
			case civilian: {_condition = "(getNumber (_x >> 'side') == _side call BIS_fnc_sideID)"};
			case sideUnknown: {_condition = TRUE};
		};

		_sortedBySide = (_condition configClasses (configFile >> "CfgVehicles") apply {configname _x}); 

		
	// Sort By Faction

		_condition = "(getText (_x >> 'faction') == _faction)";
		_sortedByFaction = (_condition configClasses (configFile >> "CfgVehicles") apply {configname _x}); 
		
		if !(isNil "_faction") then {_sorted = _sorted arrayIntersect _sortedByFaction};


	// Sort By Kind

		_sortedByKind = _allVehicles select {_x isKindOf _kind};
		
		
	// Remove Parachutes
	
		_parachutes = _allVehicles select {_x isKindOf "ParachuteBase"};
		_sortedByKind = _sortedByKind - _parachutes;
		
		
	// Blacklist UAV
	
		_condition = "(getText (_x >> 'vehicleClass') == 'Autonomous')";
		_sortByBlacklist = (_condition configClasses (configFile >> "CfgVehicles") apply {configname _x}); 

		if (_blacklistUAV) then {_sortedByKind = _sortedByKind - _sortByBlacklist};
		
		
	if !(isNil "_kind") then {_sorted = _sorted arrayIntersect _sortedByKind};
		
		
	_sorted;

