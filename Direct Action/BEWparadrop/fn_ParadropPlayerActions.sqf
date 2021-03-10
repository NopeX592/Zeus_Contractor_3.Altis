private ["_createParaDropAction"];

_vehs = _this select 0;

_createParaDropAction = {

	_veh = _this select 0;
	
		// Paradrop Action		

			_actionText = format ["<t color='#ff9900'>- Call %1 Paradrop", [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName];
			

			call compile format ["

				if ((alive _veh) and (isNil '%1_paradropAction')) then {
									
					%1_paradropAction = player addaction

						[_actionText, 	

						{
							
							(_this select 0) removeAction (_this select 2);

							_veh = (_this select 3);
							
							openmap [true,true];

							hint ""MARK DZ ON MAP FOR PARADROP"";

							(_veh) onMapSingleClick {
							onMapSingleClick {}; 							

							[[_this, _pos], {

								_veh = _this select 0;
								_pos = _this select 1;

								[_veh, _pos] execVM ""BEWparadrop\BEW_FNC_ParadropVehWaypoint.sqf"";

								call compile format [""
								
									%1_paradropMissionActive = true;
									publicVariable '%1_paradropMissionActive';
									
								"", _veh];
	
							}] remoteexec [""bis_fnc_call"", 2];

							openmap [false,false];   

							hint ""DZ SET"";

							};
							
						}

					, _veh, -94, false, true, """", ""((player getVariable 'SquadLeaderMenu') or (vehicle player == %1)) and !(triggerActivated runwayTrigger) and !(%1_paradropMissionActive) and ((vehicle player == player) or (vehicle player == %1)) and ((vehicle player == %1) or (player == leader group player))""];
					
					waitUntil {(!alive _veh) or (!alive player)};
			
						player removeAction %1_paradropAction;
						%1_paradropAction = nil;
					
				};		
				
		", _veh];

	
};


{[_x] spawn _createParaDropAction} forEach _vehs;

