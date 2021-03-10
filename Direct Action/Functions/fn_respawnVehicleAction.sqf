
		[
               player,																// Object the action is attached to
                "<t color='#add8e6'>RESPAWN VEHICLE",								// Title of the action
				"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa",			// Idle icon shown on screen
				"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa",			// Progress icon shown on screen
                "(alive cursorObject) and (vehicle player == player) and (player distance2D getPos cursorObject < 10) and (cursorObject getVariable 'canRespawn') && ((count getVehicleCargo cursorObject) < 1) and (count ropes cursorObject < 1) and ((({alive _x} count (crew cursorObject) < 1) and (count attachedObjects cursorObject < 1)) or (unitIsUAV cursorObject))",							// Condition for the action to be shown
                "(alive cursorObject) and (vehicle player == player) and (player distance2D getPos cursorObject < 10) and (cursorObject getVariable 'canRespawn') && ((count getVehicleCargo cursorObject) < 1) and (count ropes cursorObject < 1) and ((({alive _x} count (crew cursorObject) < 1) and (count attachedObjects cursorObject < 1)) or (unitIsUAV cursorObject))",							// Condition for the action to progress
                {},																	// Code executed when action starts
                {},																	// Code executed on every progress tick
                {
                    
					player playActionNow 'PutDown';
					playSound 'click';
					_veh = cursorObject;
					_displayName = [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName;
					_message = format ["%1 has respawned a %2", profileName, _displayName];

					_veh setVehicleCargo objNull;
					[_veh] remoteexec ["deleteVehicle", _veh];
					[_message] remoteExec ["systemChat", 0];
		
                },																	// Code executed on completion
                {},																	// Code executed on interrupted
                [],																	// Arguments passed to the scripts as _this select 3
                3,																	// Action duration [s]
                99,																	// Priority
				false,																// Remove on completion
                false																// Show in unconscious state
				
        ] remoteExec ["BIS_fnc_holdActionAdd", player];
		