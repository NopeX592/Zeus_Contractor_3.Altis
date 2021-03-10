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
		_playAreaIcon setMarkerText "Find Wounded Pilot";
		_playAreaIcon setMarkerSize [0.75, 0.75];
		_playAreaIcon setMarkerColor "colorYELLOW";
	
	
	// Mission Flag
		
		objectiveMissionActive = TRUE;
		pilotfound = FALSE;
		publicVariable "objectiveMissionActive";
		
		
	// Create Wounded Pilot
	
		
		_wreckPos = [];
		_maxDistance = 300;
		_type = "Land_Wreck_Heli_Attack_01_F";
		
		while {count _wreckPos < 1} do {
		
			_wreckPos = [_objectivePos, [5, _maxDistance], random 360, 0, [0], _type] call SHK_pos;
			_maxDistance = _maxDistance + 25;
			
		};

		_wreck = createVehicle [_type, _wreckPos, [], 0, "NONE"];
		_wreck allowDamage false;
		
		_smokePillar = createVehicle ["test_EmptyObjectForSmoke", getPos _wreck, [], 0, "CAN_COLLIDE"]; 
		_wreck attachTo [_smokePillar, [0,0,0]];

		_pilotType = "B_Helipilot_F";
		_pilotType = [_pilotType] call BEW_FNC_TranslateClassNames;
		
			_pilotPos = [getPos _wreck, [5, 50], random 360, 0, [0], _pilotType] call SHK_pos;
	
				_injuredUnit = (createGroup civilian) createUnit [_pilotType, _pilotPos, [], 0, "NONE"];
			
			// Wounded Pilot Setup	

				_injuredUnit setposATL getPos _injuredUnit;
				_injuredUnit setDamage 0.8;
				removeAllItems _injuredUnit;
				_injuredUnit setCaptive TRUE;
				_injuredUnit allowDamage FALSE;
				_injuredUnit disableAI "MOVE";
				_injuredUnit disableAI "TARGET";
				_injuredUnit disableAI "AUTOTARGET";
				_injuredUnit setUnitPos "MIDDLE";
				
		
	
	if (_maxDistance < 300) then {
	
		_maxDistance = 300;
	
	}else{
		
		_maxDistance = _maxDistance + random 150;
		
	};
	
	// Create Play Area
	
		_markerName = format ["%1_playArea", _selectedObjective];
	
		_playAreaMarker = createMarker [_markerName, _objectivePos];
		_playAreaMarker setMarkerShape "ELLIPSE";
		_playAreaMarker setMarkerSize [_maxDistance, _maxDistance];
		_playAreaMarker setMarkerColor "colorOPFOR";
		_playAreaMarker setMarkerAlpha 0.3;
		_playAreaSize = markerSize _playAreaMarker;
		
	
	// Create Near Pilot Trigger
	
		_nearPilotTrigger = createTrigger ["EmptyDetector", getPos _injuredUnit];
		_nearPilotTrigger setTriggerArea [50, 50, 0, false];
		_nearPilotTrigger setTriggerActivation ["WEST", "PRESENT", false];
		_nearPilotTrigger setTriggerStatements ["((this) && (({alive _x && _x inArea thisTrigger} count allPlayers) > 0)) or !(objectiveMissionActive)", "pilotfound = true; deleteVehicle thisTrigger;", ""];
		
	
	// In Area Trigger
	
		_inArea = createTrigger ["EmptyDetector", _objectivePos];
		_inArea setTriggerArea [500, 500, 0, false];
		_inArea setTriggerActivation ["WEST", "PRESENT", true];
		_inArea setTriggerStatements ["(this) && (({alive _x && _x inArea thisTrigger} count allPlayers) > 0)", "", ""];
	
	
	// Loot Spawn
	
		[_objectivePos, _objectiveSize select 0] execVM "scripts\lootspawn.sqf";
	
		
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
	
		[HQ , "One of our pilots has been shot down and is wounded somewhere in this sector. Find and escort him back to base."] remoteExec ["sideChat", 0];
		
		
waitUntil {(pilotfound) or !(objectiveMissionActive)};
			
	
	// Move Marker
	
		_playAreaIcon setMarkerPos getPos _injuredUnit;
		_playAreaIcon setMarkerType "b_med";
		_playAreaIcon setMarkerText "Heal Wounded Pilot";
		
		
	// Send Message
	
		[HQ , "Okay, you've located the wounded pilot. Once he's fit to move, escort him back to base."] remoteExec ["sideChat", 0];
		
waitUntil {!(objectiveMissionActive) or (getDammage _injuredUnit < 0.8) or !(alive _injuredUnit)};


	// Temporarity Hide Icon Marker

		_playAreaIcon setMarkerAlpha 0;
	
	
	// Moving Marker
	
		[_injuredUnit, "Escort Pilot", "ColorYellow", "mil_objective"] execVM "scripts\movingMarker.sqf";
			
			
	// Create Return Marker

		_markerName = format ["%1_returnIcon", _selectedObjective];
		_returnIcon = createMarker [_markerName, getPos returnHelipad];
		_returnIcon setMarkerType "mil_pickup";
		_returnIcon setMarkerText "Return Pilot To Base";
		_returnIcon setMarkerSize [0.75, 0.75];
		_returnIcon setMarkerColor "colorYELLOW";
		
	// Return Marker Area
	
		_markerName = format ["%1_returnArea", _selectedObjective];
		_returnArea = createMarker [_markerName, getPos returnHelipad];
		_returnArea setMarkerShape "ELLIPSE";
		_returnArea setMarkerSize [20, 20];
		_returnArea setMarkerColor "colorYELLOW";
		_returnArea setMarkerAlpha 0.3;
		
	
	// Injured Unit Change State
	
		_injuredUnit setCaptive false;
		_injuredUnit allowDamage TRUE;
		_injuredUnit enableAI "MOVE";
		_injuredUnit enableAI "TARGET";
		_injuredUnit enableAI "AUTOTARGET";
		_injuredUnit setUnitPos "UP";
		_nearestPlayer = [_injuredUnit] call BEW_FNC_FindNearestPlayer;
		[_injuredUnit] joinSilent group _nearestPlayer;
		
		
		
	// Send Message
	
		[HQ , "Alright, looks like you've got him moving. Now escort him back to base safely."] remoteExec ["sideChat", 0];


waitUntil {!(triggerActivated _inArea) or !(objectiveMissionActive) or !(alive _injuredUnit)};
		
		



waitUntil {!(objectiveMissionActive) or (_injuredUnit distance getPos returnHelipad < 20) or !(alive _injuredUnit)};


	// Reveal New Objective
	
		[_objectivePos, 2500] spawn BEW_FNC_RevealObjective;


	if (alive _injuredUnit) then {

			
		// Send Message
	
			[HQ , "Well done DELTA! We've got the pilot back here safe."] remoteExec ["sideChat", 0];

		
		// Mission Level
		
			missionLevel = missionLevel + 1;
			publicVariable "missionLevel";
				
			[format ["Mission Level %1 - Enemy Forces Have Been Reinforced", missionlevel]] remoteExec ["systemChat", 0];
		
		sleep 3;
		
	}else{
	
	
		// Send Message
	
			[HQ , "Fuck DELTA! The pilot has been killed. Abort mission and leave the AO."] remoteExec ["sideChat", 0];
			
			waitUntil {!(triggerActivated _inArea) or !(objectiveMissionActive)};
	
	};


	// Delete Area Marker 
	
		deleteMarker _playAreaMarker;
		
	// Change Icon Color
	
		_playAreaIcon setMarkerAlpha 1;
		_playAreaIcon setMarkerColor "ColorBLUFOR";


	// Delete Triggers
	
		deleteVehicle _inArea;


	// Clean Up Vehicle
	
		deleteVehicle _injuredUnit;
		deleteVehicle _wreck;
		deleteVehicle _smokePillar;


	// Clean Up Force
	
		{deleteVehicle _x} forEach _allUnits;
		
		{
		
			if (count crew _x < 1) then {
			
				deleteVehicle _x;
				
			};
	
		} forEach _allvehs;


	// Clean Up Markers

		deleteMarker _returnIcon;
		deleteMarker _returnArea;
		

	
	objectiveMissionActive = FALSE;
	publicVariable "objectiveMissionActive";
