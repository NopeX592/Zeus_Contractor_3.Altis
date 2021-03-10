private ["_selectedObjective", "_playAreaIcon", "_objectivePos", "_objectiveSize", "_objectiveText", "_objectiveType", "_iconType", "_spawnPos", "_enemyGroup", "_side", "_faction", "_targetParking", "_returnPad", "_targetVehicleType"];

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
		_playAreaIcon setMarkerText "Find Enemy Vehicle";
		_playAreaIcon setMarkerSize [0.75, 0.75];
		_playAreaIcon setMarkerColor "colorYELLOW";
		
		
	// Mission Started Flag
	
		objectiveMissionActive = TRUE;
		publicVariable "objectiveMissionActive";


	// Define Hangars
	
		_allObjects = [_objectivePos, _objectiveSize select 0, TRUE, TRUE, TRUE] call BEW_FNC_FindParking;
		_helipads = _allObjects select 0;
		_hangars = _allObjects select 1;
		_sheds = _allObjects select 2;
		
	
	// Define Vehicle Types
		
		_allTypes = [];
			
		_heliTypes = []; 
			_heliTypes = _heliTypes + (["T_HELI"] call OPF_VehList); 
			_heliTypes = _heliTypes + (["A_HELI"] call OPF_VehList);
			
		_planeTypes = []; 
			_planeTypes = _planeTypes + (["CAP"] call OPF_VehList); 
			_planeTypes = _planeTypes + (["CAS"] call OPF_VehList);
		
		_tankTypes = []; 
			_tankTypes = _tankTypes + (["TANK"] call OPF_VehList); 
			_tankTypes = _tankTypes + (["APC"] call OPF_VehList);
		
		
	// Check Parking Position Exists In AO
	
		if (count _helipads > 0) then {
		
			_allTypes = _allTypes + _heliTypes;
			
		};	
		
		
		if (count _hangars > 0) then {
		
			_allTypes = _allTypes + _planeTypes;
			
		};	
		
		
		if (count _sheds > 0) then {
		
			_allTypes = _allTypes + _tankTypes;
			
		};	
	
	
	// Pick Target Vehicle Type
	
		_targetVehicleType = _allTypes call BIS_fnc_selectRandom;
		_targetDisplayName = [configFile >> "CfgVehicles" >> _targetVehicleType] call BIS_fnc_targetDisplayName;


	// Determine Type Of Parking Position

		if (_targetVehicleType isKindOf "helicopter") then {
		
			_targetParking = _helipads call BIS_fnc_selectRandom;
			
		};
		
		if (_targetVehicleType isKindOf "plane") then {
		
			_targetParking = _hangars call BIS_fnc_selectRandom;
			
		};
		
		if (_targetVehicleType isKindOf "LandVehicle") then {
		
			_targetParking = _sheds call BIS_fnc_selectRandom;
			
		};
		

	// Create Vehicle

		_spawnPos = getPos _targetParking;
		_maxDistance = 300;

		_targetVeh = createVehicle [_targetVehicleType, _spawnPos, [], 0, "CAN_COLLIDE"];		
		
		// Vehicle Setup
		
			_targetVeh allowDamage false;
			_targetVeh setFuel 0.03;
			
		// Vehicle Restrictions
		
			[_targetVeh, [["air", "B_Helipilot_F"], ["tank", "B_crew_F"], ["Wheeled_APC_F", "B_crew_F"]]] spawn BEW_FNC_VehicleRestrictions;
		
		
		// Adjust Offset And Direction
		
			if (_targetVehicleType isKindOf "plane") then {
			
				_targetVeh setDir getDir _targetParking - 180;
				
			}else{
			
				_targetVeh setDir getDir _targetParking;
			
			};
			
			
			if (_targetVehicleType isKindOf "LandVehicle") then {
			
				_offsetPos = _targetVeh modeltoworld [0,12.5,0];
				_targetVeh setPos _offsetPos;
				
			};
			
	
	
		// Create Fuel Truck
	
		_fuelVehicleType = [

			"C_Van_01_fuel_F"

		] call BIS_fnc_selectRandom;

		_safePosFuel = [];
		_fuelTruckMaxDistance = 50;
		
		while {count _safePosFuel < 1} do {
		
			_safePosFuel = _objectivePos findEmptyPosition [10, _fuelTruckMaxDistance, _fuelVehicleType];
			_fuelTruckMaxDistance = _fuelTruckMaxDistance + 10;
			
		};

		_fuelTruck = createVehicle [_fuelVehicleType, _safePosFuel, [], 0, "NONE"];
	

			
	// Define Max Distance
		
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
	
	
	// Add Fuel Truck To All Vehs
	
		_allvehs = _allvehs + [_fuelTruck];
	
	
	// Intel Objects
		
		_intelObjects = [_objectivePos, (_objectiveSize select 0) / 2] call BEW_FNC_spawnIntelObjects;	
		_allvehs append _intelObjects;
	
		
	// Send Message
	
		_message = format ["We have reports there is an enemy %1 in the area. We need you to enter the AO and steal it.", _targetDisplayName];
	
		[HQ , _message] remoteExec ["sideChat", 0];
		
		
waitUntil {(west knowsAbout _targetVeh > 0) or !(objectiveMissionActive)};
		
		
	// Move Marker
	
		_playAreaIcon setMarkerType "hd_pickup";
		_markerText = format ["Steal Enemy %1", _targetDisplayName];
		_playAreaIcon setMarkerText _markerText;
		
		
	// Send Message
	
		_message = format ["Good work! You have located the enemy %1. Now take control of it.", _targetDisplayName];
		[HQ , _message] remoteExec ["sideChat", 0];
		
waitUntil {!(objectiveMissionActive) or (({alive _x && _x in _targetVeh} count allPlayers) > 0) or !(alive _targetVeh)};

	// Moving Marker
	
		[_targetVeh, "Target Vehicle", "ColorYellow", "mil_objective"] execVM "scripts\movingMarker.sqf";


	// Enable Vehicle Damage 
	
		_targetVeh allowDamage true;
	
	
	// Return Pad
		
		if (_targetVehicleType isKindOf "LandVehicle") then {
		
			_returnPad = returnHelipad;
			
		};
		
		if (_targetVehicleType isKindOf "helicopter") then {
		
			_returnPad = returnHelipad;
			
		};
		
		if (_targetVehicleType isKindOf "plane") then {
		
			_returnPad = returnHelipad;
			
		};

			
	// Create Return Marker

		_markerName = format ["%1_returnIcon", _selectedObjective];
		_returnIcon = createMarker [_markerName, getPos _returnPad];
		_returnIcon setMarkerType "mil_pickup";
		_markerText = format ["Return %1 To Base", _targetDisplayName];
		_returnIcon setMarkerText _markerText;
		_returnIcon setMarkerSize [0.75, 0.75];
		_returnIcon setMarkerColor "colorYELLOW";
		
		
	// Send Message
	
		_message = format ["Well done DELTA, now bring the %1 back to base.", _targetDisplayName];
		[HQ , _message] remoteExec ["sideChat", 0];


waitUntil {!(triggerActivated _inArea) or !(objectiveMissionActive)};


	// Delete Triggers
	
		deleteVehicle _inArea;
		
	
	// Change Icon Color
	
		_playAreaIcon setMarkerColor "ColorBLUFOR";
		
		
	// Delete Area Marker 
	
		deleteMarker _playAreaMarker;


waitUntil {!(objectiveMissionActive) or ((_targetVeh distance getPos _returnPad < 50) and (isTouchingGround _targetVeh)) or !(alive _targetVeh)};

	// Reveal New Objective
	
	//	[_objectivePos, 2500] spawn BEW_FNC_RevealObjective;


	if (alive _targetVeh) then {
	
		// Eject Crew 
		
			_targetVeh setFuel 0;	
			_targetVeh setVehicleLock "LOCKED";
			
		// Mission Level
		
			missionLevel = missionLevel + 1;
			publicVariable "missionLevel";
				
			[format ["Mission Level %1 - Enemy Forces Have Been Reinforced", missionlevel]] remoteExec ["systemChat", 0];
			
			sleep 3;
		
			{_x action ["EJECT", _targetVeh];} forEach crew _targetVeh;		
						
	
		// Send Message
	
			[HQ , "Outstanding work! This will give us invaluable information on how enemy vehicle systems work."] remoteExec ["sideChat", 0];
			
		
		sleep 3;
		
	}else{
	
	
		// Send Message
	
			[HQ , "Mission failed. The vehicle has been destroyed."] remoteExec ["sideChat", 0];
	
	};
	
	
	// Create Spawn Point
	
		_nearestSpawnMarker = [BEW_v_militarySpawnMarkers, _objectivePos] call BIS_fnc_nearestPosition;
		_markerText = markerText _nearestSpawnMarker;
		[WEST, _nearestSpawnMarker, _markerText] call BIS_fnc_addRespawnPosition;

		respawnMarkerList = respawnMarkerList + [_nearestSpawnMarker];
		publicVariable "respawnMarkerList";

	
	// Clean Up Target Vehicle

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