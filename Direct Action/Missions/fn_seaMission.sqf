	private [

		"_selectedObjective", 
		"_playAreaIcon", 
		"_objectivePos", 
		"_objectiveSize", 
		"_objectiveText", 
		"_objectiveType", 
		"_iconType", 
		"_spawnPos", 
		"_enemyGroup", 
		"_side", 
		"_faction", 
		"_allmines", 
		"_nearestTowers", 
		"_delay",
		"_intelObj",
		"_missionProps",
		"_wreckObj"

	];

_selectedObjective = param [0];
_playAreaIcon = param [1];
_allTriggers = [];

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
				case "ColorKhaki": {_iconType = "o_naval"};
				
			};
		

	// Change Marker Icon
	
		deleteMarker _playAreaIcon;
	
		_markerName = format ["%1_activeObjectiveIcon", _selectedObjective];
		_playAreaIcon = createMarker [_markerName, _objectivePos];
		_playAreaIcon setMarkerType "o_naval";
		_playAreaIcon setMarkerText "Recover Intel";
		_playAreaIcon setMarkerSize [0.75, 0.75];
		_playAreaIcon setMarkerColor "ColorYellow";

	// Mission Active Flags
		
		objectiveMissionActive = TRUE;
		publicVariable "objectiveMissionActive";
		intelRecovered = false;
		publicVariable "intelRecovered";


	// Create Play Area
	
		_markerName = format ["%1_playArea", _selectedObjective];
	
		_playAreaMarker = createMarker [_markerName, _objectivePos];
		_playAreaMarker setMarkerShape "ELLIPSE";
		_playAreaMarker setMarkerSize [_objectiveSize select 0, _objectiveSize select 1];
		_playAreaMarker setMarkerColor "colorOPFOR";
		_playAreaMarker setMarkerAlpha 0.3;
		_playAreaSize = markerSize _playAreaMarker;
		
		
	// In Area Trigger
	
		_inArea = createTrigger ["EmptyDetector", _objectivePos];
		_inArea setTriggerArea [_objectiveSize select 0, _objectiveSize select 1, 0, false];
		_inArea setTriggerActivation ["WEST", "PRESENT", true];
		_inArea setTriggerStatements ["(this) && (({alive _x && _x inArea thisTrigger} count allPlayers) > 0)", "", ""];
		_allTriggers = _allTriggers + [_inArea];
	
		
	// Define Enemy Force

		_infSides = ["EAST"];  
		_infFactions = ["OPF_F"];  
			
		_vehSide = EAST;  
		_vehFactions = ["OPF_F"];  
		  
		   
		_force = [_objectivePos, _playAreaSize, [_infSides, _vehSide], [_infFactions, _vehFactions], true, true, true, true] call BEW_FNC_SpawnSeaForce;
		_allUnits = _force select 0;
		_allvehs  = _force select 1;
	

	// Create Object
	

	
	
		// Create Wreck
	
		_missionProps = [];
	
		for "_i" from 1 to 1 do {
	
			_type = [

				"Land_Wreck_Heli_02_Wreck_01_F",
				"Land_UWreck_Heli_Attack_02_F",
				"Land_UWreck_MV22_F",
				"Land_Wreck_Heli_Attack_01_F",
				"Land_Mi8_wreck_F",
				"Land_Wreck_Plane_Transport_01_F"

			] call BIS_fnc_selectRandom;

			_spawnPos = [_objectivePos, [100,_objectiveSize select 0], random 360, 2, [0]] call SHK_pos;
			_posATL = _spawnPos;
			_terrainHeight = getTerrainHeightASL _spawnPos;
			_bottomOceanOffset = [_posATL select 0, _posATL select 1, _terrainHeight];

			_wreckObj = _type createVehicle _bottomOceanOffset;
			_wreckObj allowDamage false;
					
			
			_spawnPos = [_bottomOceanOffset, [10, 30], random 360, 2, [0]] call SHK_pos;
			
			_posATL = _spawnPos;
			_terrainHeight = getTerrainHeightASL _spawnPos;
			_bottomOceanOffset = [_posATL select 0, _posATL select 1, _terrainHeight];

			_intelObj = "Land_PlasticCase_01_medium_gray_F" createVehicle _bottomOceanOffset;
			_intelObj allowDamage false;
			
	
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
				
		
			_missionProps = _missionProps + [_wreckObj];
			_missionProps = _missionProps + [_intelObj];
			
		
		// Spawn Guard Team
		
			_spawnPos = [getPos _wreckObj, 1, 15, 1, 2, 0, 0] call BIS_fnc_findSafePos;
			_guardGroup = [_spawnPos, ["EAST"], ["OPF_F"], ["SpecOps"], ["OI_diverTeam"]] call BEW_FNC_SpawnGroup;
			_allUnits = _allUnits + units _guardGroup;
			
			{
			
				_unitPos = getPos _x;
				_terrainHeight = getTerrainHeightASL _unitPos;
				_unitPos = [_unitPos select 0, _unitPos select 1, _terrainHeight];
				
				_x setPos _unitPos;
				_x swimInDepth _terrainHeight;
				
			} forEach units _guardGroup;
			
		
		// Spawn Beeper
		
			[_intelObj] spawn {
	
				_intelObj = _this select 0;
		
				while {!(IntelRecovered)} do {

					playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\timer.wss", _intelObj, false, getPos _intelObj, 2, 1, 0]; 

					sleep 1;

				};
	
			};
		
		};
		
		[{
			
			_delay = [baseCommander, "Come in DELTA. One of our aicraft has been shot down in the ocean near your position, carrying critical intel.", 1.5, '#ffff00'] call BEW_FNC_DialogWithDelay;
				
				sleep _delay;
				
			_delay = [baseCommander, "Be careful. CSAT diving teams, surface vessels and possibly aircraft are also in the AO searching for the data.", 1.5, '#ffff00'] call BEW_FNC_DialogWithDelay;
				
				sleep _delay;
				
			_delay = [baseCommander, "We need you to head to the AO and recover intel from the wreck. The data is equipped with a tracking beacon, so listen carefully as it will beep louder as you get closer.", 1.5, '#ffff00'] call BEW_FNC_DialogWithDelay;
				
				sleep _delay;
	
		}] remoteexec ["bis_fnc_call", 0];
		

	waitUntil {(intelRecovered) or !(objectiveMissionActive)};		

		playSound3D ["a3\sounds_f\sfx\beep_target.wss", _intelObj, false, getPos _intelObj, 2, 1, 0];
		
			sleep 3;

		_delay = [baseCommander, "Great. You've recovered the intel. Now leave the AO to complete the mission.", 1.5, '#ffff00'] call BEW_FNC_DialogWithDelay;
			
			sleep _delay;


waitUntil {!(triggerActivated _inArea) or !(objectiveMissionActive)};

	
	_delay = [baseCommander, "Well done. It's lucky you were able to recover the data before CSAT's divers did.", 1.5, '#ffff00'] call BEW_FNC_DialogWithDelay;
			
			sleep _delay;


	// Delete Triggers
	
		deleteVehicle _inArea;


	// Clean Up Markers

		deleteMarker _playAreaMarker;
	
	// Change Icon To Captured

			_playAreaIcon setMarkerColor "colorBLUFOR";
		
	// Clean Up Force
	
		{deleteVehicle _x} forEach _allUnits;
		
		{
		
			if (count crew _x < 1) then {
			
				deleteVehicle _x;
				
			};
	
		} forEach _allvehs;
		
	// Delete Mission Props
	
		{deleteVehicle _x} forEach _missionProps;
		

	// Clean Up Triggers
	
		{deleteVehicle _x} forEach _allTriggers;
		
	
	// Mission Level
		
		missionLevel = missionLevel + 1;
		publicVariable "missionLevel";
			
		[format ["Mission Level %1 - Enemy Forces Have Been Reinforced", missionlevel]] remoteExec ["systemChat", 0];

	
objectiveMissionActive = FALSE;
publicVariable "objectiveMissionActive";
