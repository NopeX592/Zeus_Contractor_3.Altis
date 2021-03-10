private ["_selectedObjective", "_playAreaIcon", "_objectivePos", "_objectiveSize", "_objectiveText", "_objectiveType", "_iconType", "_spawnPos", "_enemyGroup", "_side", "_faction"];

_selectedObjective = param [0];
_playAreaIcon = param [1];

	// Objective Attributes

		_objectivePos = markerPos _selectedObjective;
		_objectiveSize = markerSize _selectedObjective;
		_objectiveText = markerText _selectedObjective;
		_objectiveType = markerColor _selectedObjective;
		

	// Change Marker Icon
	
		deleteMarker _playAreaIcon;
	
		_markerName = format ["%1_activeObjectiveIcon", _selectedObjective];
		_playAreaIcon = createMarker [_markerName, _objectivePos];
		_playAreaIcon setMarkerType "hd_unknown";
		_playAreaIcon setMarkerText "Find Damaged Vehicle";
		_playAreaIcon setMarkerSize [0.75, 0.75];
		_playAreaIcon setMarkerColor "colorYELLOW";
		
		
	// Mission Flag
	
		objectiveMissionActive = TRUE;
		publicVariable "objectiveMissionActive";
		
		
	// Define Target Vehicle Type
	
		_vehicleTypes = []; 
			_vehicleTypes = _vehicleTypes + (["TRUCK"] call BLU_VehList); 
	

	// Select Random Target Vehicle Type
	
		_type = _vehicleTypes call BIS_FNC_SelectRandom;

	
	// Find Safe Pos

		_safePos = [_objectivePos, [1, _objectiveSize select 0], 3, 0] call BEW_FNC_findRandomEmptyPosition;
		
			
	// Create Vehicle
	
		_targetVeh = createVehicle [_type, _safePos, [], 0, "NONE"];
		
		
	// Setup Target Vehicle
	
		_targetVeh setDamage 0.8;	
		_targetVeh setHit ["motor", 1];
		_targetVeh setHit ["wheel_1_1_steering", floor random 2];
		_targetVeh setHit ["wheel_1_2_steering", floor random 2];
		_targetVeh setHit ["wheel_1_3_steering", floor random 2];
		_targetVeh setHit ["wheel_1_4_steering", floor random 2];
		_targetVeh setHit ["wheel_2_1_steering", floor random 2];
		_targetVeh setHit ["wheel_2_2_steering", floor random 2];
		_targetVeh setHit ["wheel_2_3_steering", floor random 2];
		_targetVeh setHit ["wheel_2_4_steering", floor random 2];
		_targetVeh allowDamage false;
		
	
	// Create Play Area
	
		_markerName = format ["%1_playArea", _selectedObjective];
	
		_playAreaMarker = createMarker [_markerName, _objectivePos];
		_playAreaMarker setMarkerShape "ELLIPSE";
		_playAreaMarker setMarkerSize [_objectiveSize select 0, _objectiveSize select 0];
		_playAreaMarker setMarkerColor "colorOPFOR";
		_playAreaMarker setMarkerAlpha 0.3;
		_playAreaSize = markerSize _playAreaMarker;
	
	
	// In Area Trigger
	
		_inArea = createTrigger ["EmptyDetector", _objectivePos];
		_inArea setTriggerArea [500, 500, 0, false];
		_inArea setTriggerActivation ["WEST", "PRESENT", true];
		_inArea setTriggerStatements ["(this) && (({alive _x && _x inArea thisTrigger} count allPlayers) > 0)", "", ""];
		
		
	// Empty Camp Cars
	
	//	_campCars = [_selectedObjective, civilian] call BEW_FNC_spawnEmptyCampCars;
		
		
	// Spawn Force
	
		_force = [_objectivePos, _playAreaSize, OPF_InfantryArray, OPF_VehicleArray, true, true, true, true] call BEW_FNC_SpawnForce;
		_allUnits = _force select 0;
		_allvehs  = _force select 1;
	
	
	// Intel Objects
		
		_intelObjects = [_objectivePos, (_objectiveSize select 0) / 2] call BEW_FNC_spawnIntelObjects;	
		_allvehs append _intelObjects;
	
		
	// Send Message
	
		[HQ , "We have reports a friendly vehicle has been disabled near your position. Find, repair and return it to base."] remoteExec ["sideChat", 0];
		
		
waitUntil {(west knowsAbout _targetVeh > 0) or !(objectiveMissionActive)};
		
		
	// Change Marker
	
		_playAreaIcon setMarkerType "b_maint";
		_playAreaIcon setMarkerText "Repair Damaged Vehicle";
		
	
	// Moving Marker
	
		[_targetVeh, "Target Vehicle", "ColorYellow", "mil_objective"] execVM "scripts\movingMarker.sqf";
		
		
	// Send Message
	
		[HQ , "Good work! You have located the damaged vehicle. Now repair it."] remoteExec ["sideChat", 0];
		
		
waitUntil {!(objectiveMissionActive) or (canMove _targetVeh) or !(alive _targetVeh)};


	// Enable Vehicle Damage 
	
		_targetVeh allowDamage true;
		
			
	// Create Return Marker

		_markerName = format ["%1_returnIcon", _selectedObjective];
		_returnIcon = createMarker [_markerName, getMarkerPos "returnMarker"];
		_returnIcon setMarkerType "mil_pickup";
		_returnIcon setMarkerText "Return Vehicle To Base";
		_returnIcon setMarkerSize [0.75, 0.75];
		_returnIcon setMarkerColor "colorYELLOW";
		
		
	// Send Message
	
		[HQ , "Looks like you've got the vehicle moving again. Now get it back here to base."] remoteExec ["sideChat", 0];


waitUntil {!(triggerActivated _inArea) or !(objectiveMissionActive)};


	// Delete Triggers
	
		deleteVehicle _inArea;
		
	
	// Change Icon Color
	
		_playAreaIcon setMarkerColor "ColorBLUFOR";
		
		
	// Delete Area Marker 
	
		deleteMarker _playAreaMarker;


waitUntil {!(objectiveMissionActive) or (_targetVeh distance getMarkerPos "returnMarker" < 50) or !(alive _targetVeh)};


	if (alive _targetVeh) then {
	
		// Eject Crew 
		
			_targetVeh setFuel 0;	
			_targetVeh setVehicleLock "LOCKED";
			
			sleep 3;
		
			{_x action ["EJECT", _targetVeh];} forEach crew _targetVeh;		
						
	
		// Send Message
	
			[HQ , "Outstanding work! The vehicle is in rough shape but we'll have it back in service in no time at all."] remoteExec ["sideChat", 0];
					
		
		// Mission Level
		
			missionLevel = missionLevel + 1;
			publicVariable "missionLevel";
				
			[format ["Mission Level %1 - Enemy Forces Have Been Reinforced", missionlevel]] remoteExec ["systemChat", 0];
		
		
		sleep 3;
		
	}else{
	
	
		// Send Message
	
			[HQ , "Mission failed. The vehicle has been destroyed."] remoteExec ["sideChat", 0];
	
	};


	// Clean Up Vehicle
	
		deleteVehicle _targetVeh;


	// Clean Up Force
	
		{deleteVehicle _x} forEach _allUnits;
		
		{
		
			if (count crew _x < 1) then {
			
				deleteVehicle _x;
				
			};
	
		} forEach _allvehs;


	// Clean Up Markers

		deleteMarker _returnIcon;		

	
	objectiveMissionActive = FALSE;
	publicVariable "objectiveMissionActive";