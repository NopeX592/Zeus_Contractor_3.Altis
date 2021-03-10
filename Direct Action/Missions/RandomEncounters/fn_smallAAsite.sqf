
	
	_spawnPos = param [0];
	_centerDir = param [1, random 360];
	_activationRadius = 2000;

	_composition = ["small_AA_target_2", _spawnPos ,[0,0,0], _centerDir] call LARs_fnc_spawnComp;

	_nearestVehicles = _spawnPos nearEntities ["O_APC_Tracked_02_AA_F", 30];
	_originalVehicle = _nearestVehicles select 0;

	_vehiclePos = getPos _originalVehicle;
	_vehicleDir = getDir _originalVehicle;
	_vehicleType = typeOf _originalVehicle;
	_vehicleType = [_vehicleType] call BEW_FNC_TranslateClassNames;

	deleteVehicle _originalVehicle;

waitUntil {{(alive _x) and (((_x distance2D _spawnPos < _activationRadius) and (vehicle _x isKindOf 'air')) or ((_x distance2D _spawnPos < _activationRadius / 2) and !(vehicle _x isKindOf 'air')))} count allPlayers > 0};

	sleep 1;

	// Create Vehicle
		
		_veh = createVehicle [_vehicleType, _vehiclePos, [], 0, "CAN_COLLIDE"];
		_veh setDir _vehicleDir;


	// Vehicle Setup
	
		_veh setVariable ["canPlaceExplosives", TRUE, TRUE];
		_veh setFuel 0;
		
	
	// Top Up Ammo Function
		
		_topUpAmmo = {
					
			_veh = _this select 0;
		
			while {alive _veh} do {
						
				_veh setVehicleAmmo 1;
				
				sleep 30;
				
			};
		
		};
		
		[_veh] spawn _topUpAmmo;
		
		
	// Moving Marker On KnowsAbout Function
		
		[_veh, WEST, "Destroy AA", "ColorYellow", "mil_objective", "Shit! That's an enemy AA emplacement. Take it out!"] spawn BEW_FNC_KnowsAboutMovingMarker; 
		
	
	// Define Vehicle Group
	
		_vehGroup = createVehicleCrew _veh;
	
	
	// Wait Until Mission Level Changed
	
		_currentMissionLevel = missionLevel;
	
		waitUntil {!(_currentMissionLevel == missionLevel)};
	
	
	// Clean Up Vehicle And Crew
	
		{deleteVehicle _x} forEach units _vehGroup;
	
		deleteVehicle _veh;
	
	
	// Clean Up Composition
	
		[_composition] call LARs_fnc_deleteComp;