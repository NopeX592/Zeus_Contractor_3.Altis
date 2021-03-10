// EXAMPLE: [_object, _side, _markerText, markerColor, _markerType, _aliveMessage, _deadMessage, _enableDamage] spawn BEW_FNC_KnowsAboutMovingMarker; 


private ["_object", "_side", "_markerText", "_markerColor", "_markerType", "_aliveMessage", "_deadMessage", "_enableDamage"];


	_object 			= param [0];
	_side 				= param [1, WEST];
	_markerText			= param [2, ""];
	_markerColor		= param [3, "ColorWHITE"];
	_markerType 		= param [4, "mil_objective"];
	_aliveMessage 		= param [5, ""];
	_deadMessage 		= param [6, ""];
	_enableDamage		= param [7, FALSE];
			
			
waitUntil {(_side knowsAbout _object > 0) or !(alive _object) or !(objectiveMissionActive)};
	
	
	// Sidechat Message
	
		if (alive _object) then {
	
				[HQ , _aliveMessage] remoteExec ["sideChat", 0];
			
			// Enable Damage
		
				if (_enableDamage) then {_object allowDamage true};

			// Create Moving Marker
	
				[_object, _markerText, _markerColor, _markerType] execVM "scripts\movingMarker.sqf";
				
		};