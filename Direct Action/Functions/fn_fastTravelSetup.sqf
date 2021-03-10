	
	if (isServer) then {
	
		BEW_V_AllFastTravelFlags = getMissionLayerEntities "fastTravel" select 0; 
			publicVariable "BEW_V_AllFastTravelFlags";
			
		BEW_V_ActivatedFastTravelFlags = [];
			publicVariable "BEW_V_ActivatedFastTravelFlags";

	};
	
	if !(isDedicated) then {

		while {isNil "BEW_V_AllFastTravelFlags"} do {sleep 1};

		{

			_flagObj = _x;

			[_flagObj] spawn {
			
				_flagObj = _this select 0;
				
				waitUntil {((({(alive _x) and (_x distance2D _flagObj < 100) and !(vehicle _x isKindOf 'air') and (isNull (isVehicleCargo vehicle _x))} count allPlayers) > 0) or (_flagObj distance2D markerPos "safeZone_1" < 2500))};	


				BEW_V_ActivatedFastTravelFlags = BEW_V_ActivatedFastTravelFlags + [_flagObj];
					publicVariable "BEW_V_ActivatedFastTravelFlags";
				
				[	
					_flagObj,															// Object the action is attached to
					"<t color='#FFC0CB'>FAST TRAVEL",									// Title of the action
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",	// Idle icon shown on screen
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",	// Progress icon shown on screen
					"(player distance2D _target < 5) and !(visibleMap)",									// Condition for the action to be shown
					"(player distance2D _target < 5) and !(visibleMap)",									// Condition for the action to progress
					{},																	// Code executed when action starts
					{},																	// Code executed on every progress tick
					{		
				
							[] execVM "functions\fn_fastTravelTeleport.sqf";
						
					},																	// Code executed on completion
					{},																	// Code executed on interrupted
					[],																	// Arguments passed to the scripts as _this select 3
					0.5,																// Action duration [s]
					99,																	// Priority
					false,																// Remove on completion
					false																// Show in unconscious state
				] remoteExec ["BIS_fnc_holdActionAdd", player];
							
			};
			
		} forEach BEW_V_AllFastTravelFlags;
	
	};