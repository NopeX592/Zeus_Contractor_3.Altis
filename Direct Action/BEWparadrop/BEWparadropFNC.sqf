	if (!isServer) exitWith {};
		
		_ParadropVeh = _this select 0;
		_ParadropVehGroup = group driver (_ParadropVeh);
		_runway = _this select 2;
		_dropPos = _this select 3;
		_endPos = getMarkerPos "mapCorner";


								
							_wp1 = _ParadropVehGroup addWaypoint [_dropPos, 0];
							_wp1 setWaypointType "SCRIPTED";
							_wp1 setWaypointScript "BEWparadrop\WP_ParaInf.sqf";
							_wp1 setWaypointCompletionRadius 400;
							if (speedLimit) then {_wp1 setWaypointSpeed "LIMITED";};

											  
							_marker = createMarker ["dropZone", _dropPos]; 
							_marker setMarkerShape "ICON";
							_marker setMarkerType "hd_objective";						
							_marker setMarkerColor "ColorGREEN";
							_marker setMarkerText " PARADROP LZ";

							_ParadropVeh setPos getMarkerPos _runway;
							_ParadropVeh setDir markerDir _runway;
							_ParadropVeh flyInHeight 200;
							
							

							// vehicleChat Message	

							[ParadropVeh, format ["Destination received. Proceeding to drop zone at %1 now.", mapGridPosition _dropPos]] remoteExec ["vehicleChat", 0];				
							
							
							_ParadropVeh allowDamage TRUE;
							{_x enableSimulation TRUE} forEach units _ParadropVehGroup;
							{_x setCaptive FALSE} forEach units _ParadropVehGroup;
							{_x allowDamage TRUE} forEach units _ParadropVehGroup;	
							
							if (RHS) then {
					
								_ParadropVeh animatesource ["ramp", 0];

							} else {
												
								_ParadropVeh animatedoor ["door_1_source", 0];
													
							};

						
				waitUntil {((_ParadropVeh distance (getMarkerPos "dropZone")) < 2000) or (!alive _ParadropVeh) or (!alive driver (_ParadropVeh))};
						
						
					if ((alive _ParadropVeh) and (alive driver (_ParadropVeh))) then {
						
						
						_paradropVeh setSpeedMode "LIMITED";
						
					if (RHS) then {
					
						_ParadropVeh animatesource ["ramp", 1];

					} else {
					
						_ParadropVeh animatedoor ["door_1_source", 1];
						
					};
						
						// vehicleChat Message	
							
							[ParadropVeh, "Okay guys, we're 2 clicks out from the LZ. Get ready to jump."] remoteExec ["vehicleChat", 0];
				
					};	
					
					
				waitUntil {((_ParadropVeh distance (getMarkerPos "dropZone")) < 500) or (!alive _ParadropVeh) or (!alive driver (_ParadropVeh))};
						
						
					if ((alive _ParadropVeh) and (alive driver (_ParadropVeh))) then {
						
						// vehicleChat Message	
							
							[ParadropVeh, "We're here! GO, GO, GO!"] remoteExec ["vehicleChat", 0];
				
					};
					
						
				waitUntil {(({_x in _ParadropVeh} count units players) < 1) or (!alive _ParadropVeh) or (!alive driver (_ParadropVeh))};
					
					
					if ((alive _ParadropVeh) and (alive driver (_ParadropVeh))) then {
					
						_paradropVeh setSpeedMode "FULL";
						
						deleteMarker "dropZone"; 
					
						// Sidechat Message	
							
							[ParadropVeh, "Paradrop mission complete. Returning To Base."] remoteExec ["sidechat", 0];
							
							
					if (RHS) then {
					
						_ParadropVeh animatesource ["ramp", 0];

					} else {
					
						_ParadropVeh animatedoor ["door_1_source", 0];
						
					};	
					
							_wp2 = _ParadropVehGroup addWaypoint [_endPos, 0];
							_wp2 setWaypointType "MOVE";
							if (speedLimit) then {_wp2 setWaypointSpeed "LIMITED";};
						
							
							sleep 60;
							
						{deleteVehicle _x;} forEach units ParadropVehGroup;
						deleteVehicle ParadropVeh;
								
						
						} else {
					
						deleteMarker "dropZone";
						
					};

						paradropMissionComplete = TRUE;