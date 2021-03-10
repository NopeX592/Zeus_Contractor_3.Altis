	
	
	_veh = _this select 0;

		_array = [['Wheeled_APC_F', 'B_crew_F'], ['Tank', 'B_crew_F'], ['Air', 'B_heliPilot_F']];
						
		{
				
			[[_veh, _x], {
			
				_veh = _this select 0;
				_array = _this select 1;
				_vehicleType = _array select 0;
				_crewType = _array select 1;
				_displayName = [configFile >> "CfgVehicles" >> _crewType] call BIS_fnc_displayName;
			
				call compile format ["
							
					_veh addaction [""<t color='#FF0000'>You Must Be A %1 To Operate This Vehicle"", 	
					
					{
					}
					
					, [], 98, true, true, """", ""(_this distance _target < 10) and ({alive _x} count (crew _target) < 1) and (_target isKindOf '%2') and !(typeOf _this == '%3')"" ]
				
				", _displayName, _vehicleType, _crewType];
				
			}] remoteExec ["bis_fnc_call", 0, true];
				
		
		} foreach _array;