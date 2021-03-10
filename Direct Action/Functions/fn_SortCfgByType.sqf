
			_cfg = _this select 0;
			_type = _this select 1; 

			_all = ("true" configClasses (configFile >> _cfg) apply {configname _x}); 
			 
			_sortedByType = _all select {_type in ([configFile >> _cfg >> _x, true] call BIS_fnc_returnParents)}; 
			
			_sortedByType;
	