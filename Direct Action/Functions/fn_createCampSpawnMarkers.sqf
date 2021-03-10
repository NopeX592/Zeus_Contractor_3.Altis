_campSpawnArrows = getMissionLayerEntities "CampRepawnArrows" select 0;
_allCampMarkers = getMissionLayerEntities "Camps" select 1;

BEW_v_CampSpawnMarkers = [];
	publicVariable "BEW_v_CampSpawnMarkers";

{

	_centerPos = getPos _x;
	_centerDir = getDir _x;
	
	_nearestObjectiveMarker = [_allCampMarkers, _centerPos] call BIS_fnc_nearestPosition;
	_markerText = markerText _nearestObjectiveMarker;

	_markerName = format ["%1_Marker", _x];
	_marker = createMarker [_markerName, _centerPos];
	_marker setMarkerType "empty";
	_marker setMarkerText _markerText;
	_marker setMarkerDir _centerDir;
	
	BEW_v_CampSpawnMarkers = BEW_v_CampSpawnMarkers + [_marker];
		publicVariable "BEW_v_CampSpawnMarkers";

	deleteVehicle _x;

} forEach _campSpawnArrows;
