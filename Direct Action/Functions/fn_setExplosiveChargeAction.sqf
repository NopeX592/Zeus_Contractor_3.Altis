
	_chargeType	= param [0, "SatchelCharge_F"];
	_delay		= param [1, 30];

		[
               player,																// Object the action is attached to
                "<t color='#FF0000'>SET SATCHEL CHARGE",							// Title of the action
                "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",			// Idle icon shown on screen
               "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa",			// Progress icon shown on screen
                "(alive cursorObject) and (player distance2D getPos cursorObject < 5) and (cursorObject getVariable 'canPlaceExplosives') and ('SatchelCharge_Remote_Mag' in (magazines player))",							// Condition for the action to be shown
                "(alive cursorObject) and (player distance2D getPos cursorObject < 5) and (cursorObject getVariable 'canPlaceExplosives') and ('SatchelCharge_Remote_Mag' in (magazines player))",							// Condition for the action to progress
                {},																	// Code executed when action starts
                {},																	// Code executed on every progress tick
                {
                    
					_targetObject = cursorObject;
					_chargeType = (_this select 3) select 0;
					_delay = (_this select 3) select 1;
			
					params ["_target", "_caller", "_actionId", "_arguments"];
					
					player playActionNow 'PutDown';
					playSound 'click';
					
					[[_targetObject, _chargeType, _delay], {
					
						_targetObject = _this select 0;
						_chargeType = _this select 1;
						_delay = _this select 2;
						
						_targetObject allowDamage true;
						_targetObject setVariable ["canPlaceExplosives", FALSE, TRUE];
						player removeMagazine 'SatchelCharge_Remote_Mag';
					
						_charge = createMine [_chargeType, getPos _targetObject, [], 0];

						_message = format ["Explosive charge set. %1 seconds until detonation.", _delay];
						[HQ , _message] remoteExec ["sideChat", 0];
						
						sleep _delay;

						_charge setDamage 1;
										
					}] remoteexec ["bis_fnc_call", 2];
		
                },																	// Code executed on completion
                {},																	// Code executed on interrupted
                [_chargeType, _delay],								// Arguments passed to the scripts as _this select 3
                3,																	// Action duration [s]
                99,																	// Priority
                false,																// Remove on completion
                false																// Show in unconscious state
				
        ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
		
		
		[
               player,																// Object the action is attached to
                "<t color='#FF0000'>CAN'T PLACE SATCHEL CHARGE: NONE IN INVENTORY",	// Title of the action
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",	// Idle icon shown on screen
                "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",	// Progress icon shown on screen
                "(player distance2D getPos cursorObject < 5) and (cursorObject getVariable 'canPlaceExplosives') and !('SatchelCharge_Remote_Mag' in (magazines player))",							// Condition for the action to be shown
                "(player distance2D getPos cursorObject < 5) and (cursorObject getVariable 'canPlaceExplosives') and !('SatchelCharge_Remote_Mag' in (magazines player))",							// Condition for the action to progress
                {},																	// Code executed when action starts
                {},																	// Code executed on every progress tick
                {
                    
					hintc "You need a Satchel Charge to use this action.";
		
                },																	// Code executed on completion
                {},																	// Code executed on interrupted
                [_chargeType, _delay],								// Arguments passed to the scripts as _this select 3
                3,																	// Action duration [s]
                99,																	// Priority
                false,																// Remove on completion
                false																// Show in unconscious state
				
        ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];