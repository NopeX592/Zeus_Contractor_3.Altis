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
		_playAreaIcon setMarkerText "Find Armored Vehicle";
		_playAreaIcon setMarkerSize [0.75, 0.75];
		_playAreaIcon setMarkerColor "ColorYellow";
		
		
	objectiveMissionActive = TRUE;
	publicVariable "objectiveMissionActive";


	// Create Play Area
	
		_markerName = format ["%1_playArea", _selectedObjective];
	
		_playAreaMarker = createMarker [_markerName, _objectivePos];
		_playAreaMarker setMarkerShape "ELLIPSE";
		_playAreaMarker setMarkerSize [500, 500];
		_playAreaMarker setMarkerColor "colorOPFOR";
		_playAreaMarker setMarkerAlpha 0.3;
		_playAreaSize = markerSize _playAreaMarker;
		
		
	// Create Vehicle
	
		_tankTypes = []; 
			_tankTypes = _tankTypes + (["TANK"] call OPF_VehList); 
			
		_type = _tankTypes call BIS_FNC_SelectRandom;

		_safePos = [];
		_maxDistance = 300;
		
		while {count _safePos < 1} do {
		
			_safePos = _objectivePos findEmptyPosition [50, _maxDistance, _type];
			_maxDistance = _maxDistance + 50;
			
		};

		_targetVehArray = [_safePos, random 360, _type, EAST] call bis_fnc_spawnvehicle;
		
		_targetVeh = _targetVehArray select 0;
		_targetVehCrew = _targetVehArray select 1;
		_targetVehGroup = _targetVehArray select 2;
		
		
		[leader _targetVehGroup, _objectivePos, [_maxDistance], 10] execVM "scripts\taskPatrol.sqf";
		
		
		_targetVeh setVariable ["canPlaceExplosives", TRUE, TRUE];
				
	
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
	
		[HQ , "We have reports of an enemy armoured vehicle operating in the area. Find and destroy it."] remoteExec ["sideChat", 0];
		
		
waitUntil {!(alive _targetVeh) or (west knowsAbout _targetVeh > 0) or !(objectiveMissionActive)};
	
	
	// Change Play Area Icon
	
		_playAreaIcon setMarkerText "Destroy Armored Vehicle";
		_playAreaIcon setMarkerType "mil_destroy";
	
			
	// Moving Marker
	
		[_targetVeh, "Armored Vehicle", "ColorYellow", "mil_objective"] execVM "scripts\movingMarker.sqf";
		
		
	// Send Message
	
		[HQ , "Alright you've found the target vehicle. Now take it out."] remoteExec ["sideChat", 0];


waitUntil {!(alive _targetVeh) or !(objectiveMissionActive)};


	// Send Message
	
		[HQ , "Well done! Thats one less threat for our forces to deal with. Exit the AO to complete the mission."] remoteExec ["sideChat", 0];


waitUntil {!(triggerActivated _inArea) or !(objectiveMissionActive)};

	// Delete Triggers
	
		deleteVehicle _inArea;
		
	
	// Change Icon Color
	
		_playAreaIcon setMarkerColor "ColorBLUFOR";
		
		
	// Delete Area Marker 
	
		deleteMarker _playAreaMarker;


	// Clean Up Vehicle Crew
	
		{deleteVehicle _x} forEach _targetVehCrew;
		deleteVehicle _targetVeh;
		
	// Clean Up Force
	
		{deleteVehicle _x} forEach _allUnits;
		
		{
		
			if (count crew _x < 1) then {
			
				deleteVehicle _x;
				
			};
	
		} forEach _allvehs;


	// Mission Level
		
		missionLevel = missionLevel + 1;
		publicVariable "missionLevel";
			
		[format ["Mission Level %1 - Enemy Forces Have Been Reinforced", missionlevel]] remoteExec ["systemChat", 0];
		
	
	objectiveMissionActive = FALSE;
	publicVariable "objectiveMissionActive";
