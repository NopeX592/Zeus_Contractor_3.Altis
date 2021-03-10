private [
"_selectedObjective",
"_playAreaIcon",
"_objectivePos",
"_objectiveSize",
"_playAreaSize",
"_missionLevelMultiplier",
"_objectiveText",
"_objectiveType",
"_iconType",
"_spawnPos",
"_enemyGroup",
"_side",
"_faction",
"_towerTypes",
"_nearestTowers",
"_nearestTower",
"_allmines",
"_allPlayAreaIcons",
"_allTriggers"
];

_selectedObjective = param [0];
_playAreaIcon = param [1];

	_allmines = [];
	_allPlayAreaIcons = [];
	_allTriggers = [];
	_allMissionMarkers = [];
	

	// Objective Attributes

		_objectivePos = markerPos _selectedObjective;
		_objectiveSize = markerSize _selectedObjective;
		_playAreaSize = _objectiveSize select 0;

		_objectiveText = markerText _selectedObjective;
		_objectiveType = markerColor _selectedObjective;

        // Catch All Switch case If Objective is not Defined.
			switch (_objectiveType) do {
			
				case "ColorRed": {_iconType = "o_hq";};
				case "ColorYellow": {_iconType = "loc_Stack";};
				case "ColorOrange": {_iconType = "c_plane";};
				case "ColorBlue": {_iconType = "c_ship";};
				case "ColorGreen": {_iconType = "loc_Tourism";};
				case "ColorPink": {_iconType = "loc_Power";};
				case "ColorBrown": {_iconType = "loc_Transmitter";};
			};
		
		
	// Define Objective Monitor
	
	_allMonitors = getMissionLayerEntities "PowerPlantMonitors" select 0; 
	_objectiveMonitor = (_allMonitors select {_x distance2D _objectivePos < _playAreaSize}) select 0;


	// Change Marker Icon
	
		deleteMarker _playAreaIcon;
	
		_markerName = format ["%1_activeObjectiveIcon", _selectedObjective];
		_playAreaIcon = createMarker [_markerName, _objectivePos];
		_playAreaIcon setMarkerType "hd_unknown";
		_playAreaIcon setMarkerText "Find The Broken Substation";
		_playAreaIcon setMarkerSize [0.75, 0.75];
		_playAreaIcon setMarkerColor "colorYELLOW";
		_allPlayAreaIcons = _allPlayAreaIcons + [_playAreaIcon];
		
		
	objectiveMissionActive = TRUE;
	publicVariable "objectiveMissionActive";


	// Create Play Area
	
		_markerName = format ["%1_playArea", _selectedObjective];
	
		_playAreaMarker = createMarker [_markerName, _objectivePos];
		_playAreaMarker setMarkerShape "ELLIPSE";
		_playAreaMarker setMarkerSize [_playAreaSize, _playAreaSize];
		_playAreaMarker setMarkerColor "colorOPFOR";
		_playAreaMarker setMarkerAlpha 0.3;
		
		
	// In Area Trigger
	
		_inArea = createTrigger ["EmptyDetector", _objectivePos];
		_inArea setTriggerArea [_playAreaSize, _playAreaSize, 0, false];
		_inArea setTriggerActivation ["WEST", "PRESENT", true];
		_inArea setTriggerStatements ["(this) && (({alive _x && _x inArea thisTrigger} count allPlayers) > 0)", "", ""];


	// Empty Camp Cars
	
//		_campCars = [_selectedObjective, east] call BEW_FNC_spawnEmptyCampCars;


 	
	// Spawn Force: Default patroling/regular troops that are in the Objective area.
	
		_force = [_objectivePos, [_playAreaSize], OPF_InfantryArray, OPF_VehicleArray, true, true, true, true] call BEW_FNC_SpawnForce;
		_allUnits = _force select 0;
		_allvehs  = _force select 1;

        //Selected Repairable Capacitor Station
        _repairableTypes = [

            "Land_spp_Transformer_F"

        ];
        _nearestRepairables = nearestObjects [_objectivePos, _repairableTypes, 150];
		_selectedRepairable = _nearestRepairables call BIS_fnc_selectRandom;
		_selectedRepairable allowDamage false;



        //Capacitor Box is created and set to a random location
        _safePos = [];
        _maxDistance = 150;

        _objectiveType = "Land_TransferSwitch_01_F";
		while {count _safePos < 1} do {

			_safePos = [_objectivePos, [1, _maxDistance], random 360, 0] call SHK_pos;

		};

       	_capacitorBox = createVehicle [_objectiveType, _safePos, [], 0, "NONE"];
       	_capacitorBox allowDamage false;
       	_capacitorBox setVariable ["BEW_V_CanCarry", TRUE, TRUE];


		// Intel Objects
		
			_intelObjects = [_objectivePos, (_objectiveSize select 0) / 2] call BEW_FNC_spawnIntelObjects;	
			_allvehs append _intelObjects;


		// Send Message

			[HQ , "One of the substations of the power station is out of action. We need to find and repair it."] remoteExec ['sideChat', 0];

		// Find The Broken Substation
        waitUntil{ !(objectiveMissionActive) or (count (allPlayers select {(_x distance _selectedRepairable) < 10}) > 0)  };

			_playAreaIcon setMarkerAlpha 0;

            _selectedRepairableIcon = createMarker ["Broken SubStation", getPos _selectedRepairable ];
            _selectedRepairableIcon setMarkerText "Repair Broken Substation";
            _selectedRepairableIcon setMarkerType "b_maint";
            _selectedRepairableIcon setMarkerSize [0.75, 0.75];
            _selectedRepairableIcon setMarkerColor "colorYellow";
            _allMissionMarkers = _allMissionMarkers + [_selectedRepairableIcon];


            [HQ , "We have found the broken substation, Now we need to find a spare component to replace the broken one."] remoteExec ['sideChat', 0];

        // Find The Capacitor Box
        waitUntil{ !(objectiveMissionActive) or (count (allPlayers select {(_x distance _capacitorBox) < 3}) > 0) };

             repairStatus = false;
            [HQ , "Good job You've found the component. Get to repairing."] remoteExec ['sideChat', 0];

			[_capacitorBox, "Capacitor Component", "ColorYellow", "mil_objective"] execVM "scripts\movingMarker.sqf";

/*
            [
                player,																// Object the action is attached to
                "Repair Substation",												// Title of the action
                "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",	// Idle icon shown on screen
                "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",	// Progress icon shown on screen
                "true",																// Condition for the action to be shown
                "true",																// Condition for the action to progress
                {},																	// Code executed when action starts
                {},																	// Code executed on every progress tick
                {
                    [{
                         repairStatus = true;
                        publicVariable "repairStatus";
                    }] remoteexec ["bis_fnc_call", 2];
                },																	// Code executed on completion
                {},																	// Code executed on interrupted
                [],																	// Arguments passed to the scripts as _this select 3
                3,																	// Action duration [s]
                99,																	// Priority
                true,																// Remove on completion
                false																// Show in unconscious state
        ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
		
*/

         // Repair The Substation
         waitUntil {!(objectiveMissionActive) or (_capacitorBox distance2D _selectedRepairable < 10) or (repairStatus)};
		 
		 
			// Delete Capacity Component
			
				deleteVehicle _capacitorBox;
				
				
			// Delete Substation Marker
			
				deleteMarker _selectedRepairableIcon;
				

             LaptopActivate = false;
            [HQ , "Good job on the repairs, time to restart the power plant."] remoteExec ['sideChat', 0];

                        _laptopIcon = createMarker ["LaptopIcon", getPos _objectiveMonitor ];
                        _laptopIcon setMarkerText "Restart the Power Plant";
                        _laptopIcon setMarkerType "mil_objective";
                        _laptopIcon setMarkerSize [0.75, 0.75];
                        _laptopIcon setMarkerColor "colorYellow";
                         _allMissionMarkers = _allMissionMarkers + [_laptopIcon];
            [
                _objectiveMonitor,																// Object the action is attached to
                "Reactivate Power Station",													// Title of the action
                "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",		// Idle icon shown on screen
                "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",		// Progress icon shown on screen
                "_target distance _this < 3",								// Condition for the action to be shown
                "_target distance _this < 3",								// Condition for the action to progress
                {},																	// Code executed when action starts
                {},																	// Code executed on every progress tick
                {
                    [{
                        LaptopActivate = true;
                        publicVariable "LaptopActivate";
                    }] remoteexec ["bis_fnc_call", 2];
                },																	// Code executed on completion
                {},																	// Code executed on interrupted
                [],																	// Arguments passed to the scripts as _this select 3
                3,																	// Action duration [s]
                99,																	// Priority
                true,																// Remove on completion
                false																// Show in unconscious state
        ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];


    // Restart The Power Station
        waitUntil {!(objectiveMissionActive) or (LaptopActivate)} ;

	// Delete Laptop Marker
	
		deleteMarker _laptopIcon;

	    sleep 3;
			

	// Send Message
	
		[HQ , "Well done! You have repaired and restarted the power plant. Exit the AO to complete the objective."] remoteExec ["sideChat", 0];


waitUntil {!(triggerActivated _inArea) or !(objectiveMissionActive)};


	// Reveal New Objective
	
		[_objectivePos, 2500] spawn BEW_FNC_RevealObjective;


	// Change Icon

		_playAreaIcon setMarkerType "loc_Power";
		_playAreaIcon setMarkerText "Repair Power Station";
		_playAreaIcon setMarkerColor "colorBLUFOR";
		_playAreaIcon setMarkerAlpha 1;


	// Delete Triggers
	
		deleteVehicle _inArea;


	// Clean Up Markers

		deleteMarker _playAreaMarker;
		{deleteMarker  _x} forEach _allMissionMarkers;


		
	// Clean Up Force
	
		{deleteVehicle _x} forEach _allUnits;
		
		{
		
			if (count crew _x < 1) then {
			
				deleteVehicle _x;
				
			};
	
		} forEach _allvehs;

		
	// Clean Up Triggers
	
		{deleteVehicle _x} forEach _allTriggers;
		

	// Clean Up Camp Cars
		
	//	{
		
	//		if (count crew _x < 1) then {
			
	//			deleteVehicle _x;
				
	//		};
	
	//	} forEach _campCars;

	// Mission Level
		
		missionLevel = missionLevel + 1;
		publicVariable "missionLevel";
			
		[format ["Mission Level %1 - Enemy Forces Have Been Reinforced", missionlevel]] remoteExec ["systemChat", 0];
		
	
objectiveMissionActive = FALSE;
publicVariable "objectiveMissionActive";
