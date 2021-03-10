private ["_createHeliTransportAction"];

_vehArrays = _this select 0;

_createHeliTransportAction = {

	_array = _this select 0;
		_veh = _array select 0;
		_startPad = _array select 1;
		_callsign =	_array select 2;		
	
	
	// Heli Transport Action	

		_actionText = format ["<t color='#ff9900'>- Call %1 Heli Transport", [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName];

		_array = _array + [_actionText];


		call compile format ["
			
			if ((alive _veh) and (isNil '%1_heliTransportAction')) then {
				
						%1_heliTransportAction = player addaction

							[_actionText, 	

							{
								
								(_this select 0) removeAction (_this select 2);
								
								_veh = _this select 0;
								_startPad = _this select 1;
								_array = (_this select 3);
				
								[_veh, ""Transport request recieved. Mark an LZ on the map for transport.""] remoteExec [""vehicleChat"", 0];

								openmap [true,true];

								hint ""MARK LZ ON MAP FOR TRANSPORT"";

								_array onMapSingleClick {
																	
									if ((_this select 0) distance2D _pos < 200) then {
									
										hint ""LZ TOO CLOSE""
									
									}else{
									
										if ((_pos isFlatEmpty [8, -1, 0.3, 1, 0, false] isEqualTo [])) then {
																			
											hint ""LZ NOT SAFE""

										}else{
										
											onMapSingleClick {}; 							
											
											[[_pos, _this], ""scripts\heliTransport\heliTransportWaypoint.sqf""] remoteExec [""ExecVM"", _this select 0];

											openmap [false,false];   

											hint ""LZ SET"";
											
										};
									
									};

								};
																									
								call compile format [""
								
									%1_heliTransportMissionActive = true;
									publicVariable '%1_heliTransportMissionActive';
									
								"", _veh];
															
							}

						, _array, -94, false, true, """", ""((player getVariable 'SquadLeaderMenu') or (vehicle player == %1)) and !(%1_heliTransportMissionActive) and ((vehicle player == player) or (vehicle player == %1)) and ((vehicle player == %1) or ((player == leader group player) and (%1 getVariable 'remoteCall')))""];

					
						waitUntil {(!alive _veh) or (!alive player)};
				
							player removeAction %1_heliTransportAction;
							%1_heliTransportAction = nil;
				
				};	
			
			", _veh];

};


{[_x] spawn _createHeliTransportAction} forEach _vehArrays;

