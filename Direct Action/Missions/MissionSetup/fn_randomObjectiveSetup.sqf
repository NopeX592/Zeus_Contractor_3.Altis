if (!isServer) exitWith {};

private ["_allObjectives", "_randomMissionTypes"];

_objectiveTypes = ["INDUSTRIAL", "POWER", "TOWN", "AIRFIELD", "TOWER", "MILITARY"];

	objectiveMissionActive = FALSE;
	publicVariable "objectiveMissionActive";

{

	// Define All Objectives
	
			_allObjectives = [[_x]] call BEW_FNC_DefineObjectives; 

		
		_randomMissionTypes = switch (true) do
		
		{
			
			case (_x == "INDUSTRIAL"): {[
			
				[BEW_FNC_destroyVehicleMission, "mil_destroy", "Destroy Armoured Vehicle", "ColorYellow", "We have intel there is an enemy armoured vehicle operating in your area at %1. Check your map for the location."],
				[BEW_FNC_repairMission, "b_maint", "Recover Friendly Vehicle", "ColorYellow", "We have intel there is a friendly vehicle needing recovery at %1. Check your map for the location."],
				[BEW_FNC_SARMission, "b_med", "Rescue Friendly Pilot", "ColorYellow", "We have intel there is a downed friendly pilot in your area needing assistance at %1. Check your map for the location."],
				[BEW_FNC_supplyDropsMission, "mil_pickup", "Recover Supply Drops", "ColorYellow", "We have intel there are supply drops needing recovery at %1. Check your map for the location."],
				[BEW_FNC_cacheMission, "hd_unknown", "Find Enemy Cache", "ColorYellow", "We have intel the enemy have a hidden weapon cache somewhere in your area at %1. Check your map for the location."]
						
			]};
			
			case (_x == "POWER"): {[
			
				[BEW_FNC_repairPowerStation, "loc_Power", "Repair Power Station", "ColorYellow", "We have reports %1 has been disabled by enemy forces. Check your map for the location."]
			
			]};
			
			case (_x == "TOWN"): {[
			
				[BEW_FNC_destroyVehicleMission, "mil_destroy", "Destroy Armoured Vehicle", "ColorYellow", "We have intel there is an enemy armoured vehicle operating in your area at %1. Check your map for the location."],
				[BEW_FNC_repairMission, "b_maint", "Recover Friendly Vehicle", "ColorYellow", "We have intel there is a friendly vehicle needing recovery at %1. Check your map for the location."],
				[BEW_FNC_SARMission, "b_med", "Rescue Friendly Pilot", "ColorYellow", "We have intel there is a downed friendly pilot in your area needing assistance at %1. Check your map for the location."],
				[BEW_FNC_supplyDropsMission, "mil_pickup", "Recover Supply Drops", "ColorYellow", "We have intel are supply drops needing recovery at %1. Check your map for the location."],
				[BEW_FNC_cacheMission, "hd_unknown", "Find Enemy Cache", "ColorYellow", "We have intel the enemy have a hidden weapon cache somewhere in your area at %1. Check your map for the location."]
				
			]};
			
			case (_x == "AIRFIELD"): {[
			
				[BEW_FNC_captureMission, OPF_MarkerIcon, "Capture Airfield",  "ColorOPFOR", "We have intel there is an enemy force at %1. Check your map for the location."]
			
			]};
			
			case (_x == "TOWER"): {[
			
				[BEW_FNC_towerMission, "loc_Transmitter", "Destroy Enemy Tower",  "ColorYellow", "We have intel there is a enemy transmitter at %1 that we need taken out. Check your map for the location."]
			
			]};
			
			case (_x == "SEA"): {[
			
				[BEW_FNC_seaMission, "o_naval", "Recover Sunken Intel",  "ColorBlue", "We have intel there is a friendly aircraft carrying vital data on the seabed somewhere at %1. Check your map for the location."]
			
			]};
			
			case (_x == "MILITARY"): {[
			
				[BEW_FNC_captureMission, OPF_MarkerIcon, "Capture Enemy Camp",  "ColorOPFOR", "We have intel there is an enemy camp at %1 we need to neutralise. Check your map for the location."]
			
			]};
			
		};	
		
	// Select Random Mission Type
	
		{
		
			_randomMissionArray = _randomMissionTypes call BIS_fnc_selectRandom;
		
			_objectiveMarker = _x;
			_pos = markerPos _x;
			_size = markerSize _x;
			_text = markerText _x;
			_type = markerColor _x;

			_array = [_objectiveMarker, _pos, _size, _text, _type];
		
			[_objectiveMarker, 750, _randomMissionArray] spawn BEW_FNC_MissionTrigger;
			
		} forEach _allObjectives;
		
} forEach _objectiveTypes;