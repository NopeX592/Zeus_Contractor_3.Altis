	
	_dropPos = param [0];
	_callerGroup = param [1];
	_spawnPos = [markerPos "wholeMapMarker", [2000, 2100], random 360, 1, [0], 10] call SHK_pos;
	_debug = FALSE;


	// Set Reinforcement Mission Flag
	
		BEW_V_reinforcementRequestActive = TRUE;
			publicVariable "BEW_V_reinforcementRequestActive";
			
	
	// Cooldown Timer
		
			BEW_v_reinforcementCooldownTimer = [600, false] call BIS_fnc_countdown;
	
	
	// Confirm Drop Zone Set
	
		hint "DROP ZONE SELECTED";


	// Create Vehicle
		
		_vehArray = [_spawnPos, random 360, WEST] call  BEW_FNC_callReinforcementsVehicle;

		_veh = _vehArray select 0;
			_displayName = [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName;
		_vehGroup = _vehArray select 1;
		_infGroup = _vehArray select 2;
		
		
	// Vehicle Chat Message	

		[_veh, "Reinforcement request recieved. En route to drop zone now."] remoteExec ["sideChat", 0];
				

	// Create Drop Zone Marker
		
		_markerName = format ["%1_Dropzone", _veh];
		_marker = createMarker ["DropZone", _dropPos]; 
		_marker setMarkerShape "ICON";
		_marker setMarkerType "hd_objective";						
		_marker setMarkerColor "ColorGREEN";
		_marker setMarkeralpha 1;
		
		_markerText = format ["%1 Drop Zone", _displayName];
		
		_marker setMarkerText _markerText;
		
		
	// Create Waypoint
							
		_dropZoneWP = _vehGroup addWaypoint [_dropPos, -1];
		_dropZoneWP setWaypointType "MOVE";
		_dropZoneWP setWaypointCompletionRadius 300;
	
	
	// Wait Until Vehicle Within 3000m of Drop Zone		
		
		
		waitUntil {(!alive _veh) or (!alive driver _veh) or (_veh distance _dropPos < 3000)};
		
			if (_debug) then {systemchat "near drop waypoint completed"};

			// Check Vehicle and Driver Is Alive And Can Move
							
				if ((alive _veh)  and (canMove _veh) and (alive driver (_veh))) then {
							
			
					// Set Speed Mode
					
						_veh setSpeedMode "LIMITED";
		
						
					// Open Ramp			
								
						_veh animatedoor ["door_1_source", 1];
						_veh animatesource ["ramp", 1];
						_veh animatesource ["ramp_top", 1];
						_veh animatesource ["ramp_bottom", 1];
							
											
					// Vehicle Chat Message	

						[_veh, "Be advised, we're 2 clicks out from the drop zone."] remoteExec ["sideChat", 0];
		
				};	
		
		
		// Wait Until Vehicle Within 500m of Drop Zone	
		
			waitUntil {(!alive _veh) or (!alive driver _veh) or (_veh distance _dropPos < 300)};
		
			if (_debug) then {systemchat "drop waypoint completed"};
			
			
			// Clean Up Marker
			
				deleteMarker _marker;
			
		if ((alive _veh)  and (canMove _veh) and (alive driver (_veh))) then {
			
			
			// Make Passengers Join Group
			
				{
				
					[_x] joinSilent _callerGroup;
				
				} forEach units _infGroup;
			
			// Eject Passengers
				
				{
				
					[[_x, _veh], {

						_passenger = _this select 0;
						_veh = _this select 1;
					
						if (vehicle _passenger == _veh) then {
					
							unassignVehicle _passenger;
							_passenger action ["Eject", _veh];
							moveOut _passenger;
							_passenger leaveVehicle _veh;
							
							[_passenger] execVM "BEWParadrop\BEW_FNC_ParadropLoadout.sqf";
							
						};		

					}] remoteExec ["bis_fnc_call", _x]; 
				
				} forEach assignedcargo _veh;
		
			// Wait Until All units Eject
		
			waitUntil {
			
				!(alive _veh) or !(alive driver _veh) or (count ((crew _veh) select {(alive _x) and !(_x in units _vehgroup)}) == 0);
			
			};
			
			// Prevent Landing
			
				_veh land "NONE";
		
			// Delete Waypoints
		
				{deleteWaypoint _x} forEach waypoints _veh;
				
				
			// Add RTB Waypoint
			
				_rtbWP = _vehGroup addWaypoint [_spawnPos, -1];
				_rtbWP setWaypointType "MOVE";				
				_rtbWP setWaypointCompletionRadius 300;
				_vehgroup setCurrentWaypoint _rtbWP;
				
				
			// Set Speed Mode
			
				_veh setSpeedMode "FULL";

				
			// Close Ramp			
						
				_veh animatedoor ["door_1_source", 0];
				_veh animatesource ["ramp", 0];
				_veh animatesource ["ramp_top", 0];
				_veh animatesource ["ramp_bottom", 0];
				
				
			// Vehicle Chat Message	

				[_veh, "Drop completed. Returning to base."] remoteExec ["sideChat", 0];
				
		};
		
		
		waitUntil {!(alive _veh) or !(alive driver _veh) or (_veh distance2D _spawnPos < 300)};
		
			if (_debug) then {systemchat "RTB waypoint completed"};
		
		
		if (!(alive _veh) or !(alive driver _veh)) then {
		
			[HQ , "Fuck. We've lost contact with the paradrop aircraft. You're on your own DELTA."] remoteExec ['sideChat', 0];
		
		};
		
			sleep 3;
		
			// Clean Up Vehicle
			
				deleteVehicle _veh;
				
				
			// Clean Up Crew
			
				{deleteVehicle _x} forEach units _vehGroup;
	

			// Wait For Cooldown Timer
		
				waitUntil {([0] call BIS_fnc_countdown) == 0};
				
					[HQ , "Reinforcements are now available."] remoteExec ['sideChat', 0];
							
			// Reset Reinforcement Mission Flag
	
				BEW_V_reinforcementRequestActive = FALSE;
					publicVariable "BEW_V_reinforcementRequestActive";
				
			