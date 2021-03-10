
	private ["_objectivePos", "_objectivePosFound", "_allObjectives", "_allMarkers", "_randomEncounterPositions", "_inArea"];
	
	_allObjectives = [["INDUSTRIAL", "POWER", "TOWN", "AIRFIELD", "TOWER", "SEA", "MILITARY", "RESISTANCE"]] call BEW_FNC_DefineObjectives; 

		_allMarkers = [];
		
		_randomEncounterPositions = [];
			
		while {count _randomEncounterPositions < count _allObjectives * 1} do {
					
			// Define Pos
				
				_objectivePos = [markerPos "safeZone_1", [markerSize "safeZone_1" select 0, markerSize "wholeMapMarker" select 0], random 360, 0, [2, 1000], 10] call SHK_pos;
				
				
			// If Pos Found add To Road Positions
				
				if (count _objectivePos > 0) then {_randomEncounterPositions append [_objectivePos];};
				
				
			// Check Pos Isnt In Objective Area	
			
				{
			
					if (count _objectivePos > 0) then {
					
						_inArea = _objectivePos inArea [markerPos _x, 800, 800, 0, false];
						if (_inArea) then {
						
							_randomEncounterPositions = _randomEncounterPositions - [_objectivePos];

						};
					
					};
			
				} forEach _allObjectives;
				
				
			// Check Pos Isnt In Camp Area	
			
				_allCamps = getMissionLayerEntities "Camps" select 1; 
				
				{
			
					if (count _objectivePos > 0) then {
					
						_inArea = _objectivePos inArea [markerPos _x, markerSize _x select 0, markerSize _x select 1, 0, false];
						if (_inArea) then {
						
							_randomEncounterPositions = _randomEncounterPositions - [_objectivePos];

						};
					
					};
			
				} forEach _allCamps;
				
				
			// Check Pos Isnt Near Road Positions
			
				{
			
					if (count _objectivePos > 0) then {
					
						_inArea = _objectivePos inArea [_x, 1000, 1000, 0, false];
						if (!(_objectivePos distance _x == 0) and (_inArea)) then {
						
							_randomEncounterPositions = _randomEncounterPositions - [_objectivePos];

						};
					
					};
			
				} forEach _randomEncounterPositions;
							
		};

			// Create Debug Marker
				
				{
		
					_markerName = format ["%1_Marker", _x];
					_objectiveMarker = createMarker [_markerName, _x];
					_objectiveMarker setMarkerShape "ELLIPSE";
					_objectiveMarker setMarkerSize [100, 100];
					_objectiveMarker setMarkerAlpha 0;
					_allMarkers = _allMarkers + [_objectiveMarker];
				
				} forEach _randomEncounterPositions;	
		
		

	_allMarkers