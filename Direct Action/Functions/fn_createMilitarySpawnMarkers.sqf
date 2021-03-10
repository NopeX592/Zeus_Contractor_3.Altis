_militarySpawnArrows = getMissionLayerEntities "MilitarySpawnPoints" select 0;
_allObjectiveMarkers = getMissionLayerEntities "allObjectiveMarkers" select 1;

BEW_v_militarySpawnMarkers = [];
	publicVariable "BEW_v_militarySpawnMarkers";

{

	_centerPos = getPos _x;
	_centerDir = getDir _x;
	
	_nearestObjectiveMarker = [_allObjectiveMarkers, _centerPos] call BIS_fnc_nearestPosition;
	_markerText = markerText _nearestObjectiveMarker;

	_markerName = format ["%1_Marker", _x];
	_marker = createMarker [_markerName, _centerPos];
	_marker setMarkerType "empty";
	_marker setMarkerText _markerText;
	_marker setMarkerDir _centerDir;
	
	BEW_v_militarySpawnMarkers = BEW_v_militarySpawnMarkers + [_marker];
		publicVariable "BEW_v_militarySpawnMarkers";

	deleteVehicle _x;

} forEach _militarySpawnArrows;
