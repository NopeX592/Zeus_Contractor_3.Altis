private ["_selectedObjective", "_playAreaIcon", "_objectivePos", "_objectiveSize", "_objectiveText", "_objectiveType", "_iconType", "_spawnPos", "_enemyGroup", "_side", "_faction"];

_selectedObjective = param [0];
_playAreaIcon = param [1];



	// Objective Attributes

		_objectivePos = markerPos _selectedObjective;
		_objectiveSize = markerSize _selectedObjective;
		_objectiveText = markerText _selectedObjective;
		_objectiveType = markerColor _selectedObjective;

			switch (_objectiveType) do {
			
				case "ColorRed": {_iconType = "o_hq";};
				case "ColorYellow": {_iconType = "loc_Stack";};
				case "ColorOrange": {_iconType = "c_plane";};
				case "ColorBlue": {_iconType = "c_ship";};
				case "ColorGreen": {_iconType = "loc_Tourism";};
				case "ColorPink": {_iconType = "loc_Power";};
				case "ColorBrown": {_iconType = "loc_Transmitter";};
			};
		

	// Change Marker Icon
	
		deleteMarker _playAreaIcon;
	
		_markerName = format ["%1_activeObjectiveIcon", _selectedObjective];
		_playAreaIcon = createMarker [_markerName, _objectivePos];
		_playAreaIcon setMarkerType _iconType;
		_playAreaIcon setMarkerText _objectiveText;
		_playAreaIcon setMarkerSize [0.75, 0.75];
		_playAreaIcon setMarkerColor "colorBLUFOR";
		
		
	objectiveMissionActive = TRUE;
	publicVariable "objectiveMissionActive";


	// Create Play Area
	
		_markerName = format ["%1_playArea", _selectedObjective];
	
		_playAreaMarker = createMarker [_markerName, _objectivePos];
		_playAreaMarker setMarkerShape "ELLIPSE";
		_playAreaMarker setMarkerSize [500, 500];
		_playAreaMarker setMarkerColor "colorBLUFOR";
		_playAreaMarker setMarkerAlpha 0.3;
		_playAreaSize = markerSize _playAreaMarker;
		
		
	// In Area Trigger
	
		_inArea = createTrigger ["EmptyDetector", _objectivePos];
		_inArea setTriggerArea [500, 500, 0, false];
		_inArea setTriggerActivation ["WEST", "PRESENT", true];
		_inArea setTriggerStatements ["(this) && (({alive _x && _x inArea thisTrigger} count allPlayers) > 0)", "", ""];


	// Loot Spawn
	
		[_objectivePos, _objectiveSize select 0] execVM "scripts\lootspawn.sqf";
		

	// Empty Camp Cars
	
	//	_campCars = [_selectedObjective, west] call BEW_FNC_spawnEmptyCampCars;
		
		
	// Empty Camp Helis
	
		_campHelis = [_selectedObjective, OPF_VehicleArray] call BEW_FNC_spawnEmptyCampHelis;

 	
	// Spawn Force
	
		_force = [_objectivePos, _playAreaSize, OPF_InfantryArray, OPF_VehicleArray, true, true, true, true] call BEW_FNC_SpawnForce;
		_allUnits = _force select 0;
		_allvehs  = _force select 1;
		
		
		
// Send Message
	
		[HQ , format ["An enemy force is approaching %1. Assist local forces in defending the camp.", _objectiveText]] remoteExec ["sideChat", 0];
		
		
while {(count _aliveEnemyForce >= count _enemyUnits * 0.2) && (objectiveMissionActive)} do {

	_aliveEnemyForce = _enemyUnits select {alive _x};
	
};
		
		
	// Send Message
	
		[HQ , "Well done! You have eliminated the enemy force. Exit the AO to complete the objective."] remoteExec ["sideChat", 0];


waitUntil {!(triggerActivated _inArea) or !(objectiveMissionActive)};

	// Create Spawn Point
	
		_spawnMarkers = getMissionLayerEntities "SpawnMarkers" select 1;

		_referencePos = getPosWorld player;
		_sortedByRange = [_spawnMarkers,[],{_referencePos distanceSqr getMarkerPos _x},"ASCEND"] call BIS_fnc_sortBy;
		_sortedByRange params ["_nearestMarker"];
	
		[west, _nearestMarker, _objectiveText] call BIS_fnc_addRespawnPosition;


	// Clean Up Force
	
		{deleteVehicle _x} forEach _allUnits;
		
		{
		
			if (count crew _x < 1) then {
			
				deleteVehicle _x;
				
			};
	
		} forEach _allvehs;

	// Delete Triggers
	
		deleteVehicle _inArea;


	// Clean Up Markers

		deleteMarker _playAreaMarker;
	
	
	// Change Icon To Captures
	
		_playAreaIcon setMarkerColor "colorBLUFOR";
		
	
	// Mission Level
		
		missionLevel = missionLevel + 1;
		publicVariable "missionLevel";
			
		[format ["Mission Level %1 - Enemy Forces Have Been Reinforced", missionlevel]] remoteExec ["systemChat", 0];
		
		
	
objectiveMissionActive = FALSE;
publicVariable "objectiveMissionActive";
