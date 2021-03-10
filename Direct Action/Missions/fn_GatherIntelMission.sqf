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
		_playAreaIcon setMarkerText "Gather Intel";
		_playAreaIcon setMarkerSize [0.75, 0.75];
		_playAreaIcon setMarkerColor "colorYELLOW";
	
	
	// Mission Flag
		
		objectiveMissionActive = TRUE;
		publicVariable "objectiveMissionActive";
		IntelRecovered = false;


	// Create Play Area
	
		_markerName = format ["%1_playArea", _selectedObjective];
	
		_playAreaMarker = createMarker [_markerName, _objectivePos];
		_playAreaMarker setMarkerShape "ELLIPSE";
		_playAreaMarker setMarkerSize [500, 500];
		_playAreaMarker setMarkerColor "colorOPFOR";
		_playAreaMarker setMarkerAlpha 0.3;
		_playAreaSize = markerSize _playAreaMarker;
		
				
	// In Area Trigger
	
		_inArea = createTrigger ["EmptyDetector", _objectivePos];
		_inArea setTriggerArea [500, 500, 0, false];
		_inArea setTriggerActivation ["WEST", "PRESENT", true];
		_inArea setTriggerStatements ["(this) && (({alive _x && _x inArea thisTrigger} count allPlayers) > 0)", "", ""];
	
		
	// Spawn Force
	
		_force = [_objectivePos, _playAreaSize, OPF_InfantryArray, OPF_VehicleArray, true, true, true, true] call BEW_FNC_SpawnForce;
		_allUnits = _force select 0;
		_allvehs  = _force select 1;
		
	
	// Send Message
		[HQ , "Placeholder"] remoteExec ["sideChat", 0];
				
		

	// Find Positions In Buildings
	
		_buildingPositions = [_objectivePos, _objectiveSize select 0, 1] call BEW_fnc_findPositionsInNearBuildings;


	// Create Intel Objects
	
		_intelSpawnPos = (_buildingPositions select 0);
		_intelObj = createVehicle ["Land_tablet_02_black_F", _intelSpawnPos, [], 0, "CAN_COLLIDE"]; 
		_intelObj allowDamage false;
		_table = createVehicle ["Land_CampingTable_small_white_F", _intelSpawnPos, [], 0, "CAN_COLLIDE"]; 
		_table allowDamage false;
		_intelObj attachTo [_table, [0, 0, 0.45]]; 
			
	
	// Recover Intel Action
	
		[_intelObj,

			["<t color='#add8e6'>RECOVER INTEL", 
			
			{
			
				params ["_target", "_caller", "_actionId", "_arguments"];
				
				[[_target, _actionID], {
				
					(_this select 0) removeAction (_this select 1)
				
				}] remoteexec ["bis_fnc_call", 0];
				
				[{
				
					IntelRecovered = true;
					publicVariable "intelRecovered";
				
				}] remoteexec ["bis_fnc_call", 2];

			}
			
			, [], 99, true, true, "", "(_this distance _target < 5)" ]

		] remoteexec ["addaction", 0, true];
	
	
	// Spawn Beeper

		[_intelObj, {

			_intelObj = _this;
			
			[_intelObj] spawn BEW_fnc_trackingBeeper;
	
		}] remoteexec ["bis_fnc_call", 0, true];
	
	// Moving Marker
	
		[_intelObj, "Intel", "ColorYellow", "mil_objective"] execVM "scripts\movingMarker.sqf";


waitUntil {(IntelRecovered) or !(objectiveMissionActive)};


	// Delete Intel Object
	
		deleteVehicle _intelObj;

	// Recovered Sound
		
		playSound3D ["a3\sounds_f\sfx\beep_target.wss", _intelObj, false, getPos _intelObj, 2, 1, 0];
		

waitUntil {!(triggerActivated _inArea) or !(objectiveMissionActive)};


	// Delete Triggers
	
		deleteVehicle _inArea;
		
		
	// Change Icon Color
	
		_playAreaIcon setMarkerColor "ColorBLUFOR";
		
		
	// Delete Area Marker 
	
		deleteMarker _playAreaMarker;


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
		

	// Mission Flag

		objectiveMissionActive = FALSE;
		publicVariable "objectiveMissionActive";
