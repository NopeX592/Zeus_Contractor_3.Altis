
private ["_obj"];

_obj = param [0];
		
		
		[
                _obj,																	// Object the action is attached to
                "Gather Intel",															// Title of the action
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",			// Idle icon shown on screen
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",			// Progress icon shown on screen
                "(_target distance _this < 3)",											// Condition for the action to be shown
                "(_target distance _this < 3)",											// Condition for the action to progress
                {},																		// Code executed when action starts
                {},																		// Code executed on every progress tick
                {
					player playActionNow 'PutDown';
					playSound 'click';
					[getPos _target, 2500] remoteExec ["BEW_FNC_RevealObjective", 2];			   
					_target setVariable ["IntelRecovered", true, true];
				   
                },																		// Code executed on completion
                {},																		// Code executed on interrupted
                [],																		// Arguments passed to the scripts as _this select 3
                3,																		// Action duration [s]
                99,																		// Priority
                true,																	// Remove on completion
                false																	// Show in unconscious state
        ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];