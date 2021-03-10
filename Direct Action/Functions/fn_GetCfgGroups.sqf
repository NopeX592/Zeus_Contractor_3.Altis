	private ["_output"];
	
	_x = _this select 0;
	

	_output = []; 
	//_allSides = ("true" configClasses (configFile >> "CfgGroups") apply {configname _x}); 

	//{ 

		_side = _x; 
		_allFactions = ("true" configClasses (configFile >> "CfgGroups" >> _side) apply {configname _x}); 

		{ 

			_faction = _x; 
			_archetypes = ("true" configClasses (configFile >> "CfgGroups" >> _side >> _faction) apply {configname _x}); 
			_allGroupTypes = []; 

			{ 

				_cfgGrpType = _x; 
				_archetypes = ("true" configClasses (configFile >> "CfgGroups" >> _side >> _faction >> _cfgGrpType) apply {configname _x}); 
				_allGroupTypes append _archetypes; 

			} forEach _archetypes; 

			_output pushBack _allGroupTypes; 

		} forEach _allFactions; 

	//} forEach _allSides;
	
	_allFactions
