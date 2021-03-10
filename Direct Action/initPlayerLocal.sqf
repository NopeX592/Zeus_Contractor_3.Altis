

	// Functions

		[] call BEW_FNC_Functions;


waitUntil {(time > 0)};


if ((!isDedicated) && (player != player)) then {waitUntil {player == player}};


	// Move Player To Start Position
		
		player setpos MarkerPos "HQ_Spawn";
		player setdir MarkerDir "HQ_Spawn";


	// Set Up Comms Name

		HQ = [WEST, "HQ"];
		basecommander setName "Colonel Kilgore";


	// Fast Travel Setup

		[] call BEW_FNC_fastTravelSetup;


	// Flip Vehicle

		[] call BEW_FNC_flipVehicleInit;
		
		
	// Invunerable Base Buildings

		[] call BEW_FNC_invunerableBasebuildings;


	// GF Earplugs

		[] execVM "GF_Earplugs\Credits.sqf";	

		addMissionEventHandler ["Loaded", {
			params ["_saveType"];
			
			If(_saveType isEqualto "continue") then{
				[] execVM "GF_Earplugs\GF_Earplugs.sqf";
			};
		}];

		[] execVM "GF_Earplugs\GF_Earplugs.sqf";
		

	// Set View Distance

		setViewDistance 1200;
		setObjectViewDistance 800;	
		
		
	// Disable Firewill AMS
	
		AWS_AMS_Disable = true;
		
	
	// No Firing At Base
	
		[] spawn BEW_FNC_stopFiringAtBase;
	
	
	// On Player Disconnect Script
	
		onPlayerDisconnected { [_id, _name, _uid] call compile preprocessfilelinenumbers "playerDisconnected.sqf" };
	
	// CH View Distance
	
		CHVD_allowNoGrass = false;
		//CHVD_maxView = 7500;
		//CHVD_maxObj = 5000;
		
	