
		
		[
		
                player,																	// Object the action is attached to
                "Command Recruit",														// Title of the action
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",		// Idle icon shown on screen
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",		// Progress icon shown on screen
                "true",																	// Condition for the action to be shown
                "true",																	// Condition for the action to progress
                {},																		// Code executed when action starts
                {},																		// Code executed on every progress tick
                {
				
					systemchat 'working';
				   
                },																		// Code executed on completion
                {},																		// Code executed on interrupted
                [],																		// Arguments passed to the scripts as _this select 3
                3,																		// Action duration [s]
                99,																		// Priority
                true,																	// Remove on completion
                false																	// Show in unconscious state
				
        ] remoteExec ["BIS_fnc_holdActionAdd", player];
		
		
		[
		
                player,																	// Object the action is attached to
                "Dismiss Soldier",														// Title of the action
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",		// Idle icon shown on screen
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",		// Progress icon shown on screen
                "true",																	// Condition for the action to be shown
                "true",																	// Condition for the action to progress
                {},																		// Code executed when action starts
                {},																		// Code executed on every progress tick
                {
				
					systemchat 'working';
				   
                },																		// Code executed on completion
                {},																		// Code executed on interrupted
                [],																		// Arguments passed to the scripts as _this select 3
                3,																		// Action duration [s]
                99,																		// Priority
                true,																	// Remove on completion
                false																	// Show in unconscious state
				
        ] remoteExec ["BIS_fnc_holdActionAdd", player];