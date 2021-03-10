

	// Setup Mission Level
		
		if (isNil "missionLevel") then {missionLevel = 1};
			publicVariable "missionLevel";
	
	
	// Load Scripts

		[] call BEW_FNC_hideMapMarkers;	
	
	
	// Set Up Comms Name

		HQ = [WEST, "HQ"];
		basecommander setName "Colonel Kilgore";
		
		
	// Respawn Positions

		respawnMarkerList = getMissionLayerEntities "SpawnMarkers" select 1;
			publicVariable "respawnMarkerList";
			
		[west] call BEW_FNC_setupSpawnPoints;

	
	// Switch Flags
	
		[] call BEW_FNC_SwitchFlags;


	// Fast Travel Setup

		if (isDedicated) then {
		
			[] call BEW_FNC_fastTravelSetup;
			
		};
		
		
	// Create Markers From Arrows
	
		[] call BEW_FNC_createMilitarySpawnMarkers;
		[] call BEW_FNC_createArtillerySpawnMarkers;
		[] call BEW_FNC_createCampSpawnMarkers;
		[] call BEW_FNC_createCampVehicleSpawnMarkers;
		[] call BEW_FNC_createSmallAASiteMarkers;

	// Flip Vehicle

		[] spawn BEW_FNC_flipVehicleInit;
		
		
	// Invunerable Base Buildings

		[] spawn BEW_FNC_invunerableBasebuildings;


	// GF Earplugs

		[] execVM "GF_Earplugs\Credits.sqf";	

		addMissionEventHandler ["Loaded", {
			params ["_saveType"];
			
			If(_saveType isEqualto "continue") then{
				[] execVM "GF_Earplugs\GF_Earplugs.sqf";
			};
		}];

		[] execVM "GF_Earplugs\GF_Earplugs.sqf";


	// Time Multipler

		setTimeMultiplier 20;
				
		
	// Supplies Setup

		[] spawn BEW_FNC_suppliesSetup;
		
		
	// Remove Fog

		[] spawn BEW_FNC_removeFog; 
		
		
	// Recruits Setup

		[] spawn BEW_FNC_recruitsSetup;
		
		
	// Drone Console Setup

		[] spawn BEW_FNC_UAVConsoleSetup;
		[] spawn BEW_FNC_UGVConsoleSetup;
		
		
	// Medical Setup

		[] call BEW_FNC_medicalSetup;
		
		
	// Safe Zones

		[] call BEW_FNC_safeZone;
		
		
	// Resistance Camps

		_resistanceCampTypes = ["BLU_SOF", "OPF_SOF", "IND_1", "IND_2", "REBEL_1", "REBEL_2"];
		_resistanceCampTypes spawn BEW_FNC_resistanceCamps;


	// Helipad Lights
	
		_allCamps = getMissionLayerEntities "Camps" select 1;
		
		{
			
			[_x] call BEW_FNC_replaceHelipadLights;
		
		} forEach _allCamps;
		
		
	// Define Mission Flag

		objectiveMissionActive = false;
		publicVariable "objectiveMissionActive";
		
		
	// AA Site Missions
	
		//[] execVM "missions\randomEncounters\fn_smallAASiteSetup.sqf";
	
		
	// Trigger Area Markers Setup

		[] call BEW_FNC_servicePadSetup;
		
		
	// SHK Pos
	
		call compile preprocessfile "SHK_pos\shk_pos_init.sqf";
		
		
	//Exec Vcom AI function
	
		[] execVM "Vcom\VcomInit.sqf";


	addMissionEventHandler ["HandleDisconnect", { 

		deleteVehicle _this select 0;

	false
	}];
		
	// Paradrop Vehicle

		_paraDropVehs = getMissionLayerEntities "ParaDropVehs" select 0;
		
		{
		
			[_x, getDir _x, typeOf _x, WEST] execVM "BEWparadrop\BEWparadrop.sqf";
			
		} forEach _paraDropVehs;
		
		
	// Player Vehicle Setup

		[] call BEW_FNC_playerVehicleSetup;	
	
		
	// Arsenal Setup

		[] call BEW_FNC_arsenalSetup;	
		
	
	// HQ Marker
	
		["safeZone_1"] call BEW_FNC_HQMarkerIcon;
	
	
	// Handle Player Disconnect

		addMissionEventHandler ['HandleDisconnect',{

		_player = (_this select 0);

			deleteVehicle _player;
			_markerName = format ["%1_movingMarker", _player];
			deleteMarker _markerName;

		}];
		
		
	// Disable Firewill AMS
	
		AWS_AMS_Disable = true;
		
		
waitUntil {time > 0};

	// Load Missions

		[["INDUSTRIAL", "POWER", "TOWN", "AIRFIELD", "TOWER", "SEA", "MILITARY", "AIRFIELD"]] call BEW_FNC_randomObjectiveSetup;
		[] call BEW_FNC_supplyConvoy;
		[] call BEW_FNC_randomEncounterSetup;
		
		
		
		

