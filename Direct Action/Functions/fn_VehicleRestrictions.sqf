

	private [
	
		"_veh",
		"_allKindsAndClasses",
		"_kindAndClasses",
		"_kind",
		"_classes"
	
	
	];

	_veh = _this select 0;
	_veh enableCopilot false;
	_allKindsAndClasses = _this select 1;
	
	[_veh] call BEW_FNC_VehicleRestrictionWarning;
			
	while {true} do {
	
		waitUntil {!(isNull driver _veh)};
		
		{
			
			_driver = driver _veh;
			_kindAndClasses	=	_x;			
			_kind 	=	_kindAndClasses select 0;
			_classes	= 	_kindAndClasses select 1;
		
					
			if ((typeOf _veh isKindOf _kind) and !(typeOf _driver in _classes) and !(side _driver == EAST) and !(serverCommandAvailable '#kick')) then {
							
						[[_driver, _veh], {
						
							params ["_driver", "_veh"];
							
							_driver action ["GetOut",_veh];
							
							hint "YOU ARE NOT QUALIFIED TO OPERATE THIS VEHICLE";

						}] remoteExec ["bis_fnc_call", _driver]; 
										
					waitUntil {(isNull driver _veh)};
										
						if (isEngineOn _veh) then {_veh engineOn false};

			};	

		} forEach _allKindsAndClasses;
	
		sleep 1; 
		
	};

