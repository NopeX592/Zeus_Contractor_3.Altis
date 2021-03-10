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
		_playAreaIcon setMarkerType "hd_pickup";
		_playAreaIcon setMarkerText "Recover Supply Drops";
		_playAreaIcon setMarkerSize [0.75, 0.75];
		_playAreaIcon setMarkerColor "colorYELLOW";
		
		
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
		
		
	// Create Supply Drops
	
		_supplyDrops = [];
	
		for "_i" from 1 to 3 do {
	
			_type = [

				"C_IDAP_CargoNet_01_supplies_F"

			] call BIS_fnc_selectRandom;

			_spawnPos = [_objectivePos, [100,_objectiveSize select 0], random 360, 0, [0]] call SHK_pos;

			_supplyObj = createVehicle [_type, _spawnPos, [], 0, "NONE"];
			_supplyObj allowDamage false;
			_supplyObj setVariable ["BEW_V_CanCarry", TRUE, TRUE];
			clearMagazineCargoGlobal _supplyObj;
			clearWeaponCargoGlobal _supplyObj;
			clearBackpackCargoGlobal _supplyObj;
			clearItemCargoGlobal _supplyObj;
			
			[_supplyObj, "", "colorYELLOW", "mil_objective", 1] execVM "scripts\movingMarker.sqf";
		
			_supplyDrops = _supplyDrops + [_supplyObj];
		
		};
		
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
		
		
	// Create Return Marker

		_markerName = format ["%1_returnIcon", _selectedObjective];
		_returnIcon = createMarker [_markerName, getMarkerPos "returnMarker"];
		_returnIcon setMarkerType "mil_pickup";
		_returnIcon setMarkerText "Return Supply Drops To Base";
		_returnIcon setMarkerSize [0.75, 0.75];
		_returnIcon setMarkerColor "colorYELLOW";
		
	
	// Send Message
		[HQ , "Enemy units are closing in on the location of a number of friendly supply drops. Proceed to the AO and recover the supplies before the enemy does."] remoteExec ["sideChat", 0];
				
		
	while {(count _supplyDrops > 0) && (objectiveMissionActive)} do {
	
		{
		
			if (_x distance getMarkerPos "returnMarker" < 50) then {
			
				_supplyDrops = _supplyDrops - [_x];
				deleteVehicle _x;
				
				[HQ , format ["Well done! Only %1 more drops to go.", count _supplyDrops]] remoteExec ["sideChat", 0];
			
			};
		
		} forEach _supplyDrops;
	
	};
	
	
	// Intel Objects
		
		_intelObjects = [_objectivePos, (_objectiveSize select 0) / 2] call BEW_FNC_spawnIntelObjects;	
		_allvehs append _intelObjects;
	
	
	// Send Message
	
		if (triggerActivated _inArea) then {
		
			[HQ , "Great job DELTA, all the supply drops have been recovered. Exit the AO to complete the objective."] remoteExec ["sideChat", 0];
			
		} else {
		
		
			[HQ , "Great job DELTA, all the supply drops have been recovered."] remoteExec ["sideChat", 0];
			
		};

waitUntil {!(triggerActivated _inArea) or !(objectiveMissionActive)};


	// Delete Triggers
	
		deleteVehicle _inArea;
		
		
	// Change Icon Color
	
		_playAreaIcon setMarkerColor "ColorBLUFOR";
		
		
	// Delete Area Marker 
	
		deleteMarker _playAreaMarker;


	// Clean Up Supply Drops

		{
			
			deleteVehicle _x;
			
		} forEach _supplyDrops;


	// Clean Up Force
	
		{deleteVehicle _x} forEach _allUnits;
		
		{
		
			if (count crew _x < 1) then {
			
				deleteVehicle _x;
				
			};
	
		} forEach _allvehs;


	// Clean Up Markers

		deleteMarker _returnIcon;
	
	
	// Mission Level
		
		missionLevel = missionLevel + 1;
		publicVariable "missionLevel";
			
		[format ["Mission Level %1 - Enemy Forces Have Been Reinforced", missionlevel]] remoteExec ["systemChat", 0];
		
	

	
	objectiveMissionActive = FALSE;
	publicVariable "objectiveMissionActive";
