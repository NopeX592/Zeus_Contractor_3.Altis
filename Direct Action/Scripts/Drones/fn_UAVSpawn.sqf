    _obj = _this select 0;
	_types = _this select 1;

	{
	
		_displayName = [configFile >> "CfgVehicles" >> _x] call BIS_fnc_displayName;
		
		_actionText = format ["<t color='#FFC0CB'>Spawn %1", _displayName];

				[_obj, 

					[_actionText,   
					 
						{ 
						
							_caller = _this select 1;
							_type = _this select 3;
						
							[[_caller, _type], {
							
								private ["_type","_pos", "_dir", "_veh", "_marker", "_caller"];
						
						
								// Create Drone
								
									_caller = _this select 0;
									_type = _this select 1;
									
									
									if (_type isKindOf 'AIR') then {
									
										_marker = 'airDroneSpawn';
										_pos = markerPos _marker;
										_dir = markerDir _marker;
									
										_veh = createVehicle [_type, _pos, [], 0, 'NONE']; 
										createVehicleCrew _veh;
										_veh setDir _dir;
										//_veh setVelocityModelSpace [0, 100, 0];
										activeUAVs = activeUAVs + [_veh];
										publicVariable 'activeUAVs'; 
										_displayName = [configFile >> "CfgVehicles" >> _type] call BIS_fnc_displayName;
										[_veh, _displayName] execVM 'scripts\movingMarker.sqf';
										_veh flyInHeight 500;
										[_veh] spawn BEW_FNC_customPylonLoadouts;
									
									} else {
									
										_marker = 'landDroneSpawn';
										_pos = markerPos _marker;
										_dir = markerDir _marker;
									
										_veh = createVehicle [_type, _pos, [], 0, 'NONE']; 
										createVehicleCrew _veh;
										_veh setDir _dir;
										activeUAVs = activeUAVs + [_veh];
										publicVariable 'activeUAVs';
										_displayName = [configFile >> "CfgVehicles" >> _type] call BIS_fnc_displayName;
										[_veh, _displayName] execVM 'scripts\movingMarker.sqf';
									
									};
									
									_displayName = [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName;											
									_message = format ["%1 has spawned a %2 at the %3", name _caller, _displayName, markerText _marker];
									[_message] remoteExec ["systemChat", 0];
									_veh setVariable ["canRespawn", true, true];
									
							// Sync UAV and Operator 
									
									[ _veh, {
									
										{
										
											_veh = _this;
											_veh synchronizeObjectsAdd [_x];
										
										} forEach (allplayers select {typeOf _x == "B_Soldier_UAV_F"});
									
									}] remoteExec ["bis_fnc_call", 0]; 
																		

							}] remoteExec ["bis_fnc_call", 2]; 
						 
						} 
					 
					, _x, 98, true, true, "", "(_this distance _target < 3) and (typeOf _this == 'B_Soldier_UAV_F') and (count (activeUAVs select {alive _x}) < 1) and (alive _target) and ((typeOf _target == 'Land_PCSet_01_screen_F') or (count (_target nearEntities [['Man'], 5] select {typeOf _x == 'B_recon_JTAC_F'}) > 0))" ] 
				 
				] remoteexec ["addaction", 0, true];
			
			
		
		
	} forEach _types;