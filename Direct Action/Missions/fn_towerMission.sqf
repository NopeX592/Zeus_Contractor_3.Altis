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
		_iconType = "loc_Transmitter";


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
		_playAreaIcon setMarkerAlpha 0;
		
	
	// Mission Flag
	
		objectiveMissionActive = TRUE;
		publicVariable "objectiveMissionActive";

		
	// In Area Trigger
	
		_inArea = createTrigger ["EmptyDetector", _objectivePos];
		_inArea setTriggerArea [_playAreaSize, _playAreaSize, 0, false];
		_inArea setTriggerActivation ["WEST", "PRESENT", true];
		_inArea setTriggerStatements ["(this) && (({alive _x && _x inArea thisTrigger} count allPlayers) > 0)", "", ""];

 	
	// Spawn Force
	
		_force = [_objectivePos, [_playAreaSize], OPF_InfantryArray, OPF_VehicleArray, true, true, true, true] call BEW_FNC_SpawnForce;
		_allUnits = _force select 0;
		_allvehs  = _force select 1;
		
		
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


	// Send Message
	
		if (({alive _x} count _nearestTowers) > 1) then {

			[HQ , format ["Enemy transmitters have been detected at %1. We need them taken out.", _objectiveText]] remoteExec ["sideChat", 0];

		} else {	
		
			[HQ , format ["An enemy transmitter has been detected at %1. We need it taken out.", _objectiveText]] remoteExec ["sideChat", 0];
			
		};
		


waitUntil {(({alive _x} count _nearestTowers) < 1) or !(objectiveMissionActive)};

	sleep 3;

	// Send Message
	
		[HQ , "Well done! The enemy transmitters are out of action. Exit the AO to complete the objective."] remoteExec ["sideChat", 0];


waitUntil {!(triggerActivated _inArea) or !(objectiveMissionActive)};


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
		_playAreaIcon setMarkerColor "colorBLUFOR"; 
		_playAreaIcon setMarkerAlpha 1;
		
		
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
	
	
	// Mission Level
		
		missionLevel = missionLevel + 1;
		publicVariable "missionLevel";
			
		[format ["Mission Level %1 - Enemy Forces Have Been Reinforced", missionlevel]] remoteExec ["systemChat", 0];
		
	
objectiveMissionActive = FALSE;
publicVariable "objectiveMissionActive";
