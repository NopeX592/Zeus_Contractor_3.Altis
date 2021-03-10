
	_centerPos = param [0, getPos player];
	_radius = param [1, 100];
	_buildingTypes = [

		"Land_Cargo_Tower_V1_No1_F", 
		"Land_Cargo_Tower_V1_No2_F", 
		"Land_Cargo_Tower_V1_No3_F", 
		"Land_Cargo_Tower_V1_No4_F", 
		"Land_Cargo_Tower_V1_No5_F", 
		"Land_Cargo_Tower_V1_No6_F", 
		"Land_Cargo_Tower_V1_No7_F", 
		"Land_Cargo_Tower_V3_F", 
		"Land_Cargo_Tower_V1_F", 
		"Land_Cargo_Tower_V2_F", 
		"Land_i_Barracks_V1_F", 
		"Land_i_Barracks_V2_F", 
		"Land_u_Barracks_V2_F", 
		"Land_Cargo_House_V3_F", 
		"Land_Cargo_House_V1_F", 
		"Land_Medevac_house_V1_F", 
		"Land_Cargo_House_V2_F", 
		"Land_Cargo_HQ_V3_F",
		"Land_Cargo_HQ_V1_F",
		"Land_Medevac_HQ_V1_F", 
		"Land_Cargo_HQ_V2_F",
		"Land_MilOffices_V1_F"

	];
	
	// Define Buildings

		_allBuildings = nearestObjects [_centerPos, _buildingTypes, _radius];
		
		if (count _allBuildings < 1) then {
		
			_allBuildings = nearestObjects [_centerPos, ["House"], _radius];
			
		};

	
	// Define Positions

		_buildingPositions = [_centerPos, _radius, 1, _buildingTypes] call BEW_fnc_findPositionsInNearBuildings;
		_selectedPosition = _buildingPositions call BIS_FNC_SelectRandom;


	// Define Nearest Building To Position
	
		_nearestBuilding = nearestBuilding _selectedPosition;
	
	
	// Create Hostage
	
		_hostageType = "B_officer_F";
		_hostageType = [_hostageType] call BEW_FNC_TranslateClassNames;
	
		_hostage = (createGroup civilian) createUnit [_hostageType, _selectedPosition, [], 0, "NONE"];
	
		_hostage setDir getDir _nearestBuilding;
		_hostage setDamage 0.8;
		removeAllItems _hostage;
		removeAllWeapons _hostage;
		removeHeadgear _hostage;
			
		_hostage setCaptive TRUE;
		_hostage disableAI "MOVE";
		_hostage disableAI "TARGET";
		_hostage disableAI "AUTOTARGET";
		_hostage setUnitPos "MIDDLE";
		_hostage setVariable ["HostageRescued", false, true];
	
	
	// Hostage Action
	
		[
			_hostage,																	// Object the action is attached to
			"Free Hostage",																// Title of the action
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",				// Idle icon shown on screen
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",				// Progress icon shown on screen
			"(_target distance _this < 3) and !(_target getVariable 'HostageRescued')",	// Condition for the action to be shown
			"(_target distance _this < 3) and !(_target getVariable 'HostageRescued')",	// Condition for the action to progress
			{},																			// Code executed when action starts
			{},																			// Code executed on every progress tick
			{
				player playActionNow 'PutDown';
				playSound 'click';			   
				_target setVariable ["HostageRescued", true, true];	   
				
			},																			// Code executed on completion
			{},																			// Code executed on interrupted
			[],																			// Arguments passed to the scripts as _this select 3
			3,																			// Action duration [s]
			99,																			// Priority
			true,																		// Remove on completion
			false																		// Show in unconscious state			
        ] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
		
		
	waitUntil {(({alive _x && _x distance _hostage < 3} count allPlayers) > 0) or !(alive _hostage)};
		
		if (alive _hostage) then {
		
			// Send Message
			
				_nearestPlayer = [_hostage] call BEW_FNC_FindNearestPlayer;
				[_nearestPlayer , "Come in HQ. We've found a hostage."] remoteExec ["sideChat", 0];
		
			// Hostage Moving Marker
			
				[_hostage, "Escort Hostage", "ColorYellow", "mil_objective"] execVM "scripts\movingMarker.sqf";
		
		};
		
	waitUntil {(_hostage getVariable "HostageRescued") or !(alive _hostage)};	
		
		if ((alive _hostage) and (_hostage getVariable "HostageRescued")) then {
		
			// Send Message
			
				[HQ , "Well done DELTA. Now escort the hostage back to base."] remoteExec ["sideChat", 0];
		
			// Hostage Setup
			
				_hostage setCaptive false;
				_hostage allowDamage TRUE;
				_hostage enableAI "MOVE";
				_hostage enableAI "TARGET";
				_hostage enableAI "AUTOTARGET";
				_hostage setUnitPos "UP";
				_nearestPlayer = [_hostage] call BEW_FNC_FindNearestPlayer;
				[_hostage] joinSilent group _nearestPlayer;

		};
		
		// Create Return Marker

			_markerName = "hostageReturnIcon";
			_returnIcon = createMarker [_markerName, getPos returnHelipad];
			_returnIcon setMarkerType "mil_pickup";
			_returnIcon setMarkerText "Return Hostage To Base";
			_returnIcon setMarkerSize [0.75, 0.75];
			_returnIcon setMarkerColor "colorYELLOW";
			
			
		// Return Marker Area

			_markerName = "hostageReturnArea";
			_returnArea = createMarker [_markerName, getPos returnHelipad];
			_returnArea setMarkerShape "ELLIPSE";
			_returnArea setMarkerSize [20, 20];
			_returnArea setMarkerColor "colorYELLOW";
			_returnArea setMarkerAlpha 0.3;
		
		
	waitUntil {(_hostage distance getPos returnHelipad < 20) or !(alive _hostage)};
	
		if (alive _hostage) then {
	
			// Recover Intel
		
				[_selectedPosition, 2500] remoteExec ["BEW_FNC_RevealObjective", 2];
			
		}else{
		
			// Send Message
		
				[HQ , "Fuck DELTA. A hostage has been killed."] remoteExec ["sideChat", 0];
		
		};
	
	// Clean Up Hostage
	
		if (alive _hostage) then {deleteVehicle _hostage};
		
	// Delete Markers
	
		deleteMarker _returnIcon;
		deleteMarker _returnArea;