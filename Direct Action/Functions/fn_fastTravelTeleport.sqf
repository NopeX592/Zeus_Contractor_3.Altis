	
				
					_array = [];
		
					openmap [true, true];
					
					_pos = [];
					BEW_V_IconMarkers = [];
					BEW_V_TextMarkers = [];
					
							{
							
								_flagObj = _x;
								
								
								_markerName = format ["fastTravelMarkerText_%1", _flagObj];
								
								_textMarker = createMarkerLocal [_markerName, getPos _flagObj];	
								_textMarker setMarkerTypeLocal "mil_objective";	
								_textMarker setMarkerTextLocal (_flagObj getVariable "flagName");
								_textMarker setMarkerSizeLocal [0.5, 0.5];
								_textMarker setMarkerColorLocal "colorWhite";
								
								BEW_V_TextMarkers = BEW_V_TextMarkers + [_textMarker];
								
								
								_markerName = format ["fastTravelMarkerIcon_%1", _flagObj];
								
								_iconMarker = createMarkerLocal [_markerName, getPos _flagObj];	
								_iconMarker setMarkerTypeLocal "mil_objective";	
								_iconMarker setMarkerSizeLocal [0.5, 0.5];
								_iconMarker setMarkerColorLocal "colorPink";
								
								BEW_V_IconMarkers = BEW_V_IconMarkers + [_iconMarker];	


							} forEach BEW_V_ActivatedFastTravelFlags;
					
					hint "SELECT LOCATION FOR FAST TRAVEL";
					
					_array onMapSingleClick {
							
						if (count (BEW_V_IconMarkers select {markerPos _x distance2D _pos < 20}) > 0) then {
												
								onMapSingleClick {};
								_nearestMarker = [BEW_V_textMarkers, _pos] call BIS_fnc_nearestPosition;
								openmap [false,false]; 

								player setVehiclePosition [markerPos _nearestMarker, [], 0, "NONE"]; 
								
								
								_messageText = format ["%1 Has Teleported To %2", name player, markerText _nearestMarker];
								
								[_messageText] remoteExec ["systemchat", 0];

								{deleteMarkerlocal _x} forEach BEW_V_IconMarkers;
								{deleteMarkerlocal _x} forEach BEW_V_TextMarkers;
		
						}else{
						
							systemchat "NOT A VALID FAST TRAVEL POSITION";
						
						};
							
					};