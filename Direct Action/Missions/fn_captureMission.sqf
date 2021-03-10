private ["_selectedObjective", "_playAreaIcon", "_objectivePos", "_objectiveSize", "_playAreaSize", "_missionLevelMultiplier", "_objectiveText", "_objectiveType", "_iconType", "_spawnPos", "_enemyGroup", "_side", "_faction", "_towerTypes", "_nearestTowers", "_nearestTower", "_allmines", "_allPlayAreaIcons", "_allTriggers", "_targetArty", "_campOfficer", "_allvehs", "_allUnits"];

_selectedObjective = param [0];
_playAreaIcon = param [1];

	_allmines = [];
	_allPlayAreaIcons = [];
	_allTriggers = [];
	

	// Objective Attributes

		_objectivePos = markerPos _selectedObjective;
		_objectiveSize = markerSize _selectedObjective;
		_playAreaSize = _objectiveSize select 0;
		
		_missionLevelMultiplier = missionLevel;
		if (_missionLevelMultiplier > 6) then {_missionLevelMultiplier = 6};
		
		_playAreaSize = _playAreaSize + (_missionLevelMultiplier * 50 - 50);
		
		_objectiveText = markerText _selectedObjective;
		_objectiveType = markerColor _selectedObjective;
		_iconType = [OPF_MarkerIcon] call BEW_FNC_TranslateClassNames;


	// Create Play Area
	
		_markerName = format ["%1_playArea", _selectedObjective];
	
		_playAreaMarker = createMarker [_markerName, _objectivePos];
		_playAreaMarker setMarkerShape "ELLIPSE";
		_playAreaMarker setMarkerSize [_playAreaSize, _playAreaSize];
		_playAreaMarker setMarkerColor "colorOPFOR";
		_playAreaMarker setMarkerAlpha 0.3;


	// Change Marker Icon
	
		deleteMarker _playAreaIcon;
		
		_newObjectiveText = format ["Capture %1", _objectiveText];
	
		_markerName = format ["%1_activeObjectiveIcon", _selectedObjective];
		_playAreaIcon = createMarker [_markerName, _objectivePos];
		_playAreaIcon setMarkerType _iconType;
		_playAreaIcon setMarkerText _newObjectiveText;
		_playAreaIcon setMarkerSize [0.5, 0.5];
		
	
	// Mission Flag
	
		objectiveMissionActive = TRUE;
		publicVariable "objectiveMissionActive";

		
	// In Area Trigger
	
		_inArea = createTrigger ["EmptyDetector", _objectivePos];
		_inArea setTriggerArea [_playAreaSize, _playAreaSize, 0, false];
		_inArea setTriggerActivation ["WEST", "PRESENT", true];
		_inArea setTriggerStatements ["(this) && (({alive _x && _x inArea thisTrigger} count allPlayers) > 0)", "", ""];


	// Loot Spawn
	
		[_objectivePos, _playAreaSize] execVM "scripts\lootspawn.sqf";


	// Empty Camp Cars
	
//		_campCars = [_selectedObjective, east] call BEW_FNC_spawnEmptyCampCars;
		
		
	// Empty Camp Helis
	
		_campHelis = [_selectedObjective, OPF_VehicleArray] call BEW_FNC_spawnEmptyCampHelis;

 	
	// Spawn Force
	
		_force = [_objectivePos, [_playAreaSize], OPF_InfantryArray, OPF_VehicleArray, true, true, true, true] call BEW_FNC_SpawnForce;
		_allUnits = _force select 0;
		_allvehs  = _force select 1;
		
		
	// Spawn Officer
	
		_nearestSpawnMarker = [BEW_v_militarySpawnMarkers, _objectivePos] call BIS_fnc_nearestPosition;
			
			_officerType = "O_officer_F";
			_newOfficerType = [_officerType] call BEW_FNC_TranslateClassNames;
			
			_newOfficerType createUnit [
				markerPos _nearestSpawnMarker,
				createGroup [east, true],
				"_campOfficer = this;",
				1,
				"MAJOR"
			];
		
		
	// Setup Officer
	
		[_campOfficer, _objectivePos, [50], 10] execVM "scripts\taskPatrol.sqf";
		_campOfficer allowDamage false;
		removeFromRemainsCollector [_campOfficer];
		_campOfficer setVariable ["IntelRecovered", false, true];
			
			
	// Create Officer Moving Marker
		
		[_campOfficer, WEST, "Kill HVT", "ColorYellow", "mil_objective", "Okay you've located the camp commander. He may be carrying intel. Take him out.", "Alright that's the camp commander's body. Check him for intel before you move out.", TRUE] spawn BEW_FNC_KnowsAboutMovingMarker; 
		
		
	// Check Officer Killed

			BEW_v_CheckOfficerKilled = {
			
				_campOfficer = _this select 0;
				_objectivePos = _this select 1;
			
				waitUntil {(!alive _campOfficer) or !(objectiveMissionActive)};
			
					[_campOfficer] spawn BEW_FNC_gatherIntelAction;

					[HQ , 'Okay the enemy commander is dead. You may be able to find intel on his body.'] remoteExec ['sideChat', 0];
					
					_campOfficerDeadIcon = createMarker ["deadCampOfficer", getPos _campOfficer];					
					_campOfficerDeadIcon setMarkerColor 'colorYellow';
					_campOfficerDeadIcon setMarkerType 'mil_objective';
					_campOfficerDeadIcon setMarkerSize [0.5, 0.5];
					_campOfficerDeadIcon setMarkerText 'Recover Intel';
					_campOfficerDeadIcon setMarkerDir 0;
					
				waitUntil {!(objectiveMissionActive) or (_campOfficer getVariable "IntelRecovered")};
					
					_campOfficerDeadIcon setMarkerColor 'colorOPFOR';
					_campOfficerDeadIcon setMarkerType 'KIA';
					_campOfficerDeadIcon setMarkerText '';
									
				waitUntil {!(objectiveMissionActive)};
					
					deleteMarker _campOfficerDeadIcon;
					deleteVehicle _campOfficer;
					
			};

			[_campOfficer, _objectivePos] spawn BEW_v_CheckOfficerKilled;	
	

	// Find Nearest Artillery Position
	
		_artilleryMarkersInArea = BEW_v_artillerySpawnMarkers select {markerPos _x distance2D _objectivePos < _playAreaSize};


	if (count _artilleryMarkersInArea > 0) then {

		_selectedArtyIcon = (_artilleryMarkersInArea select 0);
		_artySpawnPos = markerPos _selectedArtyIcon;
		_artySpawnDir = markerDir _selectedArtyIcon;

		// Define Artillery

			_artyTypes = [ 
			 
				"O_static_AT_F",
				"O_static_AA_F",
				"O_Mortar_01_F"
			 
			]; 
		
			_artyType = _artyTypes call BIS_FNC_SelectRandom;
		
		
		// Translate Arty Type
		
			_artyType = [_artyType] call BEW_FNC_TranslateClassNames;
		
		// Create Target Artillery
		
			_targetArty = createVehicle [_artyType, _artySpawnPos, [], 0, "NONE"];
			_targetArty setDir _artySpawnDir;
			_allvehs = _allvehs + [_targetArty];
		
		
		// Spawn Crew
		
			_targetArtyGroup = createVehicleCrew _targetArty;
			{_allUnits = _allUnits + [_x]} forEach units _targetArtyGroup;
		
		
		// Setup Target Artillery

			_targetArty allowDamage false;
			_targetArty setVariable ["canPlaceExplosives", TRUE, TRUE];
			_targetArty enableWeaponDisassembly false;
			
			
		// Create Moving Marker
		
			[_targetArty, WEST, "Destroy Emplacement", "ColorYellow", "mil_objective", "We've located an enemy emplacement. We will need to destroy it to secure the camp."] spawn BEW_FNC_KnowsAboutMovingMarker; 
			
			
		// Check Arty Destroyed

			BEW_v_CheckArtyDestroyed = {
			
				_targetArty = _this select 0;
				_selectedArtyIcon = _this select 1;
			
				waitUntil {(!alive _targetArty) or !(objectiveMissionActive)};
			
					[HQ , 'Great job. The emplacement is out of action.'] remoteExec ['sideChat', 0];
					
					_selectedArtyIcon setMarkerSize [0.5, 0.5];
					_selectedArtyIcon setMarkerColor 'colorOPFOR';
					_selectedArtyIcon setMarkerType 'KIA';
					_selectedArtyIcon setMarkerText '';
					_selectedArtyIcon setMarkerDir 0;
					
				waitUntil {!(objectiveMissionActive)};
					
					deleteVehicle _targetArty;
					deleteMarker _selectedArtyIcon;
					
			};

			[_targetArty, _selectedArtyIcon] spawn BEW_v_CheckArtyDestroyed;
	
	}else{
	
		_targetArty = objNull;
	
	};
	
		
	// Define Tower
	
		_towerTypes = [ 
		 
			"Land_TTowerBig_1_F", 
			"Land_TTowerBig_2_F",
			"Land_Communication_F"
		 
		]; 
		
	// Find Nearest Towers
 
		_nearestTowers = nearestObjects [_objectivePos, _towerTypes, _playAreaSize];


		for "_i" from 1 to (count _nearestTowers) do { 

			// Select Tower
			
				_nearestTower = _nearestTowers select (_i -1);


			// Give Tower Varname
			
				_varName = format ["nearestCampTower_%1", _i];
				_nearestTower setVehicleVarName _varName;
				missionNamespace setVariable [ _varName, _nearestTower, true ];
			
			
			// Setup Tower
			
				_nearestTower allowDamage false;
				_nearestTower setVariable ["canPlaceExplosives", TRUE, TRUE];
			
			
			// Create Tower Icon
			
				_markerName = format ["%1_activeObjectiveIcon", getPos _nearestTower];
				_towerIcon = createMarker [_markerName, getPos _nearestTower];
				_towerIcon setMarkerType "loc_Transmitter";			
				_campTowerIconText = "Destroy Tower";			
				_towerIcon setMarkerText _campTowerIconText;
				_towerIcon setMarkerSize [0.5, 0.5];
				_towerIcon setMarkerColor "colorYELLOW";
				_allPlayAreaIcons = _allPlayAreaIcons + [_towerIcon];
			
			
			// Create Minefield
		
				_towerMines = [_nearestTower, 15, 35, [["APERSMine", "ATMine"], [0.75, 0.25]], 150, EAST] call BEW_FNC_CreateMinefield;
				_allmines append _towerMines;
		
			
			// Check Tower Destroyed
			
				BEW_v_CheckTowerDestroyed = {
				
					_nearestTower = _this select 0;
					_towerIcon = _this select 1;
				
					waitUntil {!alive _nearestTower};
				
						[HQ , 'Great job. The tower is out of action.'] remoteExec ['sideChat', 0];
							
						_towerIcon setMarkerSize [0.5, 0.5];
						_towerIcon setMarkerColor 'colorOPFOR';
						_towerIcon setMarkerType 'KIA';
						_towerIcon setMarkerText '';
						_towerIcon setMarkerDir 0;
						
				};

				[_nearestTower, _towerIcon] spawn BEW_v_CheckTowerDestroyed;
	
		};
		
		
	// Intel Objects
		
		_intelObjects = [_objectivePos, _playAreaSize / 2] call BEW_FNC_spawnIntelObjects;	
		_allvehs append _intelObjects;
	
	
	// Hostages
		
		[_objectivePos, _playAreaSize / 2] execVM "functions\fn_spawnHostage.sqf";
		
	
	// Send Message
	
		if (({alive _x} count _nearestTowers) > 0) then {

			[HQ , format ["An enemy force and transmitters have been detected at %1. Eliminate the enemy force and destroy the transmitters to gain control of the area.", _objectiveText]] remoteExec ["sideChat", 0];

		} else {	
		
			[HQ , format ["An enemy force has been detected at %1. Eliminate the enemy force to gain control of the area.", _objectiveText]] remoteExec ["sideChat", 0];
			
		};
		

	// Count Enemy Force
	
		_nearEntites = _objectivePos nearEntities ["Man", _playAreaSize];
		_nearEnemies = _nearEntites select {side _x == EAST};
		_nearEnemiesGoal = count _nearEnemies * 0.2;


	while {(count _nearEnemies >= _nearEnemiesGoal) && (objectiveMissionActive)} do {

		_nearEntites = _objectivePos nearEntities ["Man", _playAreaSize];
		_nearEnemies = _nearEntites select {side _x == EAST};
		
	};


waitUntil {((({alive _x} count _nearestTowers) < 1) and !(alive _targetArty) and !(alive _campOfficer)) or !(objectiveMissionActive)};

	sleep 3;

	// Send Message
	
		[HQ , "Well done! You have eliminated the enemy force. Exit the AO to complete the objective."] remoteExec ["sideChat", 0];


waitUntil {!(triggerActivated _inArea) or !(objectiveMissionActive)};

	// Create Spawn Point
	
		_nearestSpawnMarker = [BEW_v_militarySpawnMarkers, _objectivePos] call BIS_fnc_nearestPosition;
		_markerText = markerText _nearestSpawnMarker;
		[WEST, _nearestSpawnMarker, _markerText] call BIS_fnc_addRespawnPosition;
		
		respawnMarkerList = respawnMarkerList + [_nearestSpawnMarker];
		publicVariable "respawnMarkerList";
		
		// Change Original Objective To Correct ColorYellow
		
			_selectedObjective setMarkerColor "colorBLUFOR";


	// Delete Triggers
	
		deleteVehicle _inArea;


	// Clean Up Markers

		deleteMarker _playAreaMarker;
		
		
	// Delete Sub Icons
	
		{
			
			deleteMarker _x;
		
		} forEach _allPlayAreaIcons;
		
	
	// Change Play Area Icon Text
		
		_newObjectiveText = format ["%1", _objectiveText];
		_playAreaIcon setMarkerText _newObjectiveText;
		
		_markerType = [BLU_MarkerIcon] call BEW_FNC_TranslateClassNames;
		_playAreaIcon setMarkerType _markerType;
		
		
	// Clean Up Force
	
		{deleteVehicle _x} forEach _allUnits;
		
		{
		
			if (count crew _x < 1) then {
			
				deleteVehicle _x;
				
			};
	
		} forEach _allvehs;

	// Clean Up Minefield
	
		{deleteVehicle _x} forEach _allmines;
		
		
	// Clean Up Triggers
	
		{deleteVehicle _x} forEach _allTriggers;
		
	
	
	// Clean Up Camp Cars
		
	//	{
		
	//		if (count crew _x < 1) then {
			
	//			deleteVehicle _x;
				
	//		};
	
	//	} forEach _campCars;
		
		
	// Clean Up Camp Helis
		
		{
		
			if (count crew _x < 1) then {
			
				deleteVehicle _x;
				
			};
	
		} forEach _campHelis;	
	
		
	// Change Camp Cars
	
	//	_campCars = [_selectedObjective, west] call BEW_FNC_spawnEmptyCampCars;
		
	// Change Camp Helis
	
	//	_campCars = [_selectedObjective, west, "BLU_F"] call BEW_FNC_spawnEmptyCampHelis;
	
	
	// Mission Level
		
		missionLevel = missionLevel + 1;
		publicVariable "missionLevel";
			
		[format ["Mission Level %1 - Enemy Forces Have Been Reinforced", missionlevel]] remoteExec ["systemChat", 0];
		
	
objectiveMissionActive = FALSE;
publicVariable "objectiveMissionActive";
