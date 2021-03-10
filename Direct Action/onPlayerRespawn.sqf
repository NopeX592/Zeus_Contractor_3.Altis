


if ((!isDedicated) && (player != player)) then

 	{
 	waitUntil {player == player};
 	};
	
	waitUntil {time > 0};

// Define Player Object

	_playerObject = player;
	
	
// On First Spawn

	if (isnil "firstSpawn") then { 
			
		// Welcome Hint

			[] call BEW_FNC_welcomeMessage;
			
			
		// Gear Restrictions

			[] call BEW_FNC_setupGearRestrictions;
	  
		firstSpawn = true;
	  
	};


// Action Menus

	player setVariable ["SquadLeaderMenu", FALSE];
	player setVariable ["AdminMenu", FALSE];

	[] execVM "functions\playerOptions\fn_squadLeaderMenu.sqf";
	[] execVM "functions\playerOptions\fn_adminMenu.sqf";


// Hint Message

	player addAction [
				
			"<t color='#FF3333'>HOW TO PLAY",  
					
			{
				
				[] call BEW_FNC_welcomeMessage;
					
			}
								
		, [], -93, false, true, "", "(player distance2D markerPos 'safeZone_1' < markerSize 'safeZone_1' select 0)"]; 


// Recall Saved Arsenal Loadout

	_inventorySaved = [player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;

	if (isNil "_inventorySaved") then {

			// Set Default Loadout And Save
				
				[player, true] call BEW_FNC_switchLoadout;
				
		};

	

// Disable Fatigue

//	player enableFatigue false;
//	player enableStamina false;
	
	
// Activate Vehicle Action
	
	[] call BEW_FNC_ActivateVehicle;
		
		
// Respawn Vehicle Action
	
	[] call BEW_FNC_respawnVehicleAction;
		
		
// Place Satchel Charge

	[] call BEW_FNC_setExplosiveChargeAction;
		
		
// Load Recruit In Vehicle

	[] call BEW_FNC_LoadRecruitInvehicle;
	

// Paradrop Vehicle Actions

	[allParadropVehs] call BEW_FNC_ParadropPlayerActions;
	
	
// Transport Heli Actions

	[allTransportHeliVehs] call BEW_FNC_HeliTransportPlayerActions;
	
	
// Call Reinforcements Actions

//	[] execVM "functions\reinforcements\fn_callReinforcementsAction.sqf";
	
	
// Nerf Weapon Sway

//	player setCustomAimCoef 0.35;
	
	
// Player Carry Object

	[] call BEW_FNC_playerCarryObject;


// Moving Marker

	[player] spawn BEW_FNC_movingMarkerPlayer;
	

// Mission Level	

	systemchat format ["Current Mission Level - %1", missionLevel];


// Ear Plugs
		
	[] call BEW_FNC_earPlugs;
	
		
// Fire Support

	[] call BEW_FNC_FireSupport;


// UAV Operator Setup

	if (typeOf player == "B_Soldier_UAV_F") then {
	
		[ player, {
		
			[[_this]] call BEW_FNC_UAVConsoleSetup;
			[[_this]] call BEW_FNC_UGVConsoleSetup;
		
		}] remoteExec ["bis_fnc_call", 2]; 
		
		
		player synchronizeObjectsAdd (activeUAVs select {alive _x});
		player synchronizeObjectsAdd (activeUGVs select {alive _x});
	
	};
	
	
// Crewman Setup

	if ((typeOf player == "B_crew_F") or (typeOf player == "B_Helipilot_F")) then {
	
		player setUnitTrait ["engineer", true];
	
	};
	
		
	// GROUP LEADER ACTIONS

				
			// Dismiss Recruits
		
					[player, TRUE, FALSE, -97] call BEW_FNC_dismissRecruits;
					
		
	// ADMIN ACTIONS
	
				// Cancel Current Mission
		
					[player, FALSE, TRUE, -99] call BEW_FNC_cancelCurrentMission;
				
					sleep 0.1;
			
			
				// Kill All Enemies
				
					[player, FALSE, TRUE, -99] call BEW_FNC_killAllEnemies;
					
					sleep 0.1;
					
					
				// Delete Cursor Object
			
					[player, FALSE, TRUE, -99] call BEW_FNC_deleteCursorObject;
					
					sleep 0.1;
					

				// Arsenal
		
					[player, FALSE, TRUE, -99] call BEW_FNC_arsenal;
					
					sleep 0.1;
					
				
				// Teleport Player
		
					[player, FALSE, TRUE, -99] call BEW_FNC_TeleportPlayer;
					
					sleep 0.1;
					
				
				// Teleport Selected Player
		
				//	[player, FALSE, TRUE, -99] call BEW_FNC_TeleportSelectedPlayer;
				
					sleep 0.1;
					
					
				// Teleport Group
		
					[player, FALSE, TRUE, -99] call BEW_FNC_TeleportGroup;
					
					sleep 0.1;
				
				
				// God Mode
		
					[player, FALSE, TRUE, -99] call BEW_FNC_godMode;
					
					sleep 0.1;
				
				
				// Invisible
				
					[player, FALSE, TRUE, -99] call BEW_FNC_invisible;
					
					sleep 0.1;
					
				
				// Next Mission Level

					[player, FALSE, TRUE, -99] call BEW_FNC_nextMissionLevel;
					
					sleep 0.1;
				
				
				// Set Time Midnight
					
					[player, FALSE, TRUE, -98] call BEW_FNC_setMidnight;
					
					sleep 0.1;

					
				// Set Time Midday
				
					[player, FALSE, TRUE, -98] call BEW_FNC_setMidday;
					
					sleep 0.1;
			
				
				
	sleep 1;
			
		// Respawn Message
	 
			_nearestMarker = [respawnMarkerList, player] call BIS_fnc_nearestPosition;
			_nearestMarkerText = markerText _nearestMarker;
			[ format ["%1 has respawned at %2", profileName, _nearestMarkerText]] remoteExec ["systemChat", 0];
			
			

