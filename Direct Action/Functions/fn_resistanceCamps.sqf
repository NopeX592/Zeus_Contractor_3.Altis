private ["_factions", "_factionUpper", "_resistanceCamps", "_fnc", "_markerText", "_campMarkerType"];

	_factions = _this;

{
	
		_factionUpper = toUpper _x;
		_resistanceCamps = getMissionLayerEntities _x select 1;

			_fnc = {
			
				_marker = _this select 0;
				_factionUpper = _this select 1;
				
				_iconMarkerName = format ["resistance_icon_%1", _marker];
				_areaMarkerName = format ["resistance_area_%1", _marker];
				_markerPos = markerPos _marker;
				_markerText = markerText _marker;
				_markerSize = markerSize _marker;
				
waitUntil {(({(alive _x) and (_x distance2D _markerPos < (_markerSize select 1) * 3) and !(vehicle _x isKindOf 'air') and (isNull (isVehicleCargo vehicle _x))} count allPlayers) > 0) and !(objectiveMissionActive)};	
				
				
				// Define Marker Type
				
					_campMarkerType = call compile format ["
					
						_origMarkerType = %1_MarkerIcon;
						_campMarkerType = [_origMarkerType] call BEW_FNC_TranslateClassNames;
						_campMarkerType
					
					", _factionUpper];					
							
				
				// Create Marker Icon
				
					_markerIcon = createMarker [_iconMarkerName, _markerPos];
					_markerIcon setMarkerType _campMarkerType;
					_markerIcon setMarkerSize [0.5, 0.5];


				// Create Trigger

					_trg = createTrigger ["EmptyDetector", _markerPos];
					_trg setTriggerArea [_markerSize select 0, _markerSize select 1, 0, false, 5];
					_trg setTriggerActivation ["WEST", "PRESENT", true];
					_trg setTriggerStatements ["(this) && (({alive _x && _x inArea thisTrigger} count allPlayers) > 0)", "", ""];
					
					
				call compile format ["
					
						
					_markerAlphaTrigger = createTrigger [""EmptyDetector"", _markerPos];
					_markerAlphaTrigger setTriggerArea [1, 1, 0, false, 2];
					_markerAlphaTrigger setTriggerActivation [""ANY"", ""PRESENT"", TRUE];
					_markerAlphaTrigger setTriggerStatements [""(objectiveMissionActive)"", ""'%2' setMarkerAlpha 0"", ""'%2' setMarkerAlpha 1""];

					
				", _marker, _iconMarkerName];
				
				
				// Send Message
				
					_message = format ["We have reports of an allied camp at %1. Check your map for the location.", _markerText];
				
					[HQ , _message] remoteExec ["sideChat", 0];
				
				
waitUntil {(({(alive _x) and (_x distance2D _markerPos < _markerSize select 1) and !(vehicle _x isKindOf 'air') and (isNull (isVehicleCargo vehicle _x))} count allPlayers) > 0) and !(objectiveMissionActive)};	
								
				
				// Change Marker
				
					deleteMarker _markerIcon;
					
					_iconMarkerName = format ["new_resistance_icon_%1", _marker];
					_markerIcon = createMarker [_iconMarkerName, _markerPos];
					_markerIcon setMarkerType _campMarkerType;
					_markerIcon setMarkerSize [0.5, 0.5];
					_markerIcon setMarkerText _markerText;
				
					
				// Create Area Marker
				
					_markerArea = createMarker [_areaMarkerName, _markerPos];
					_markerArea setMarkerShape "ELLIPSE";
					_markerArea setMarkerSize [_markerSize select 0, _markerSize select 1];
					_markerArea setMarkerAlpha 0.3;
					_markerArea setMarkerColor "colorGUER";
				
				
				// Add Gear To Arsenal
								
						_weaponList = switch (_factionUpper) do {

							case "BLU"		: {BLU_WeaponList};
							case "OPF"		: {OPF_WeaponList};
							case "BLU_SOF"	: {BLU_SOF_WeaponList};
							case "OPF_SOF"	: {OPF_SOF_WeaponList};
							case "IND_1"	: {IND_1_WeaponList};
							case "IND_2"	: {IND_2_WeaponList};
							case "REBEL_1"	: {REBEL_1_WeaponList};
							case "REBEL_2"	: {REBEL_2_WeaponList};								

						};					

						
						_itemList = switch (_factionUpper) do {

							case "BLU"		: {BLU_ItemList};
							case "OPF"		: {OPF_ItemList};
							case "BLU_SOF"	: {BLU_SOF_ItemList};
							case "OPF_SOF"	: {OPF_SOF_ItemList};
							case "IND_1"	: {IND_1_ItemList};
							case "IND_2"	: {IND_2_ItemList};
							case "REBEL_1"	: {REBEL_1_ItemList};
							case "REBEL_2"	: {REBEL_2_ItemList};	

						};		
						
						[ArsenalList, _weaponList] remoteExec ["BEW_FNC_addWeaponsByLevel", 0, true];	
						[ArsenalList, _itemList] remoteExec ["BEW_FNC_addItems", 0, true];
						
						
						// Create Spawn Point
	
							_nearestSpawnMarker = [BEW_v_CampSpawnMarkers, _markerPos] call BIS_fnc_nearestPosition;
							_markerText = markerText _nearestSpawnMarker;
							[WEST, _nearestSpawnMarker, _markerText] call BIS_fnc_addRespawnPosition;
							
							respawnMarkerList = respawnMarkerList + [_nearestSpawnMarker];
							publicVariable "respawnMarkerList";
						
						
					// Send Message
				
						[HQ , format ["Well done! You have discovered %1. New equipment has been added to your arsenal.", _markerText]] remoteExec ["sideChat", 0];

			};


		{

			[_x, _factionUpper] spawn _fnc;

		} forEach _resistanceCamps;

} forEach _factions;