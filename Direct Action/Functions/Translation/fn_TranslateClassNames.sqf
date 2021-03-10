		private [
		
			"_vehOldType",
			"_debug",
			"_originalTranslationList",
			"_newTranslationList",
			"_vehNewType"
		
		];

		_vehOldType = _this select 0;
		_translationLists = param [1, all_TransLists];
		_debug = false;
		
		
		// Translate Veh Class
		
			{
			
				_originalTranslationList = _x select 0;
				_newTranslationList	= _x select 1;

				if ((_vehOldType in _originalTranslationList) and (isNil "_vehNewType")) then {
				
					for "_i" from 0 to ((count _originalTranslationList) - 1) do {
						
						if (_vehOldType == _originalTranslationList select _i) then {
						
							if !(_newTranslationList select _i == "") then {
							
								_vehNewType = _newTranslationList select _i;
								
							};
					
						};

					};
					
				};

			} forEach _translationLists;
		
		
		// Set New Type To Old Type If Not Found
		
			if (isNil "_vehNewType") then {_vehNewType = _vehOldType};
		
		
		// Debug
		
			if (_debug) then {
		
				systemChat format ["Old Type %1 - New Type %2", _vehOldType, _vehNewType];
		
			};
	
		_vehNewType 
	
	
	
	
	
	