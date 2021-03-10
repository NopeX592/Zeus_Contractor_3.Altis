	
//	[_veh, _vehGroup, _infGroup, _marker, _endPos, _radius] call BEW_FNC_ParadropReinforcementsWaypoint; 


private ["_veh", "_vehGroup", "_infGroup", "_marker", "_endPos", "_radius"];

	_veh = _this select 0;
	_vehGroup = _this select 1;
	_infGroup = _this select 2;
	_centerPos = _this select 3;
	_marker = _this select 4;
	_endPos = _this select 5;
	_radius = _this select 6;


	//Wait Until Vehicle Off The Ground
			
		waitUntil {!(isTouchingGround _veh)};

			{_x allowDamage TRUE} forEach units _vehGroup;		
			_veh allowDamage TRUE;			

			
			

							
	// Wait Until Vehicle Within 3000m of Drop Zone		
			
			waitUntil {((_veh distance (getMarkerPos _marker)) < 3000) or (!alive _veh) or (!alive driver (_veh))};
			
			
			// Set Speed Mode
			
				if !(typeOf _veh == "RHS_AN2") then {
				
					_veh setSpeedMode "LIMITED";	

				};
			

			// Check Vehicle and Driver Is Alive And Can Move
							
				if ((alive _veh)  and (canMove _veh) and (alive driver (_veh))) then {
									
						
					// Open Ramp			
								
						_veh animatedoor ["door_1_source", 1];
						
		
				};	
			
			

	// Wait Until Vehicle Within 500m of Drop Zone			
						
		waitUntil {((_veh distance (getMarkerPos _marker)) < 500) or (!alive _veh) or (!alive driver (_veh)) or (!canMove _veh)};
							
						
					// Check Vehicle and Driver Is Alive And Can Move	
						
						if ((alive _veh)  and (canMove _veh) and (alive driver (_veh))) then {
						
						};
			
			
	// Wait Until Everyone Ejected	
							
		waitUntil {(({_x in _veh} count (assignedcargo _veh)) < 1) or (!alive _veh) or (!alive driver (_veh)) or (!canMove _veh)};
				

			if (alive leader _infGroup) then {
				
				// Group Patrol
					
					[leader _infGroup, _centerPos, [_radius], 10] execVM "scripts\taskPatrol.sqf";
			
			};
						
			// Check Vehicle and Driver Is Alive And Can Move	
				
				if ((alive _veh) and (alive driver (_veh)) and (canMove _veh)) then {

						
					// Delete Marker
					
						deleteMarker _marker; 	
				
				
					// Prevent Landing
			
						_veh land "NONE";
		
		
					// Delete Waypoints
				
						{deleteWaypoint _x} forEach waypoints _veh;
						
						
					// Add RTB Waypoint
					
						_rtbWP = _vehGroup addWaypoint [_endPos, -1];
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
					
					
				waitUntil {!(alive _veh) or !(alive driver _veh) or (_veh distance2D _endPos < 300)};
				
					
					// Delete Vehicle And Crew
					
						{deleteVehicle _x} forEach units _vehGroup;
						deleteVehicle _veh;
							
					
				} else {
				
					// Delete Marker If Vehicle Dead or Disabled
				
						deleteMarker _marker;
						
						sleep 30;
					
					// Delete Vehicle And Crew
					
						{deleteVehicle _x} forEach units _vehGroup;
						deleteVehicle _veh;
					
				};
