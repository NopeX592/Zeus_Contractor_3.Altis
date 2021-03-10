	if (!isServer) exitWith {};
	
		private [
		
			"_veh",
			"_vehGroup",
			"_displayName",
			"_dropPos",
			"_endPos"
		
		];
	
		_veh = _this select 0;
		_vehGroup = group driver (_veh);
		_displayName = [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName;
		_dropPos = _this select 1;
		_endPos = getMarkerPos "mapCorner";


		// Paradrop Started Flag

			call compile format ["
			
				%1_paraDropMissionActive = true;
				publicVariable ""%1_paraDropMissionActive"";
				
			", _veh];
			

		// Create Waypoint
								
			_dropZoneWP = _vehGroup addWaypoint [_dropPos, 0];

			_dropZoneWP setWaypointType "SCRIPTED";
			_dropZoneWP setWaypointScript "BEWparadrop\OnParadropWaypointCompleted.sqf";
			_dropZoneWP setWaypointCompletionRadius 400;

		
		// Set Altitude 
		
			_veh flyInHeight 200;

		
		// Create marker
			
			_markerName = format ["%1_Dropzone", _veh];
			_marker = createMarker [_markerName, _dropPos]; 
			_marker setMarkerShape "ICON";
			_marker setMarkerType "hd_objective";						
			_marker setMarkerColor "ColorGREEN";
			
			_markerText = format ["%1 Drop Zone", _displayName];
			
			_marker setMarkerText _markerText;
			
			
		// Setup Vehicle
		
			{_x enableSimulation TRUE} forEach units _vehGroup;
			{_x setCaptive FALSE} forEach units _vehGroup;
			
		
		// Create Moving Marker

			[_veh , _displayName, "colorGreen", "b_plane"] execVM "scripts\MovingMarker.sqf";
			
		
		// Close Ramp
			
			_veh animatedoor ["door_1_source", 0];
			_veh animatesource ["ramp", 0];
			_veh animatesource ["ramp_top", 0];
			_veh animatesource ["ramp_bottom", 0];
			
			
		// Teleport Vehicle To Runway
	
			_veh setPos markerPos "runwayTakeOff";
			_veh setDir markerDir "runwayTakeOff";
			
		
		// VehicleChat Message	
				
					if ((alive _veh) and (alive driver (_veh)) and (canMove _veh)) then {
						
						// vehicle Chat Message	
							
							[_veh , "Paradrop insertion mission orders recieved. Be advised we are cleared for takeoff and heading for the DZ now."] remoteExec ["sideChat", 0];
				
					};			
		
	//Wait Until Vehicle Off The Ground
		
		waitUntil {!(isTouchingGround _veh)};

		{_x allowDamage TRUE} forEach units _vehGroup;		
		_veh allowDamage TRUE;						

						
		// Wait Until Vehicle Within 2000m of Drop Zone		
		
			waitUntil {((_veh distance (getMarkerPos _marker)) < 2000) or (!alive _veh) or (!alive driver (_veh))};
				

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

					[_veh, "Okay, we're 2 clicks out from the drop zone. Get ready to jump."] remoteExec ["vehicleChat", 0];
	
			};	
		
		

		// Wait Until Vehicle Within 500m of Drop Zone			
					
			waitUntil {((_veh distance (getMarkerPos _marker)) < 500) or (!alive _veh) or (!alive driver (_veh)) or (!canMove _veh)};
						
					
				// Check Vehicle and Driver Is Alive And Can Move	
					
					if ((alive _veh)  and (canMove _veh) and (alive driver (_veh))) then {
						
							
						// Vehicle Chat Message	
					
							[_veh, "We're here! GO, GO, GO!"] remoteExec ["vehicleChat", 0];	
						
					};
		
		
		// Wait Until Everyone Ejected	
						
			waitUntil {(({_x in _veh} count (call BEW_FNC_AllUnitsInGroupsWithPlayers)) < 1) or (!alive _veh) or (!alive driver (_veh)) or (!canMove _veh)};
					
					
		// Check Vehicle and Driver Is Alive And Can Move	
			
			if ((alive _veh) and (alive driver (_veh)) and (canMove _veh)) then {
			
				// Set Speed Mode
			
					_veh setSpeedMode "FULL";
				
					
				// Delete Marker
				
					deleteMarker _marker; 
			
			
				// Side Chat Message	
			
					[_veh , "Paradrop mission completed. We're returning to base."] remoteExec ["sideChat", 0];
						
						
				// Close Ramp
			
					_veh animatedoor ["door_1_source", 0];
					_veh animatesource ["ramp", 0];
					_veh animatesource ["ramp_top", 0];
					_veh animatesource ["ramp_bottom", 0];
						

				// Set Waypoint To Corner Of Map
					_endWP = _vehGroup addWaypoint [_endPos, 0];
					_endWP setWaypointType "MOVE";
					_endWP setWaypointSpeed "LIMITED";
				
				sleep 120;
				
				// Delete Vehicle And Crew
				
					{deleteVehicle _x} forEach units _vehGroup;
					deleteVehicle _veh;
						
				
			} else {
			
				// Delete Marker If Vehicle Dead or Disabled
			
					deleteMarker _marker;
				
			};
			
