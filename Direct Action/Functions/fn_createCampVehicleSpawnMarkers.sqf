_campVehicleSpawnArrows = getMissionLayerEntities "VehicleSpawnArrows" select 0;
_allCampMarkers = getMissionLayerEntities "Camps" select 1;

BEW_v_CampVehicleSpawnMarkers = [];
	publicVariable "BEW_v_CampVehicleSpawnMarkers";

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
	
	BEW_v_CampVehicleSpawnMarkers = BEW_v_CampVehicleSpawnMarkers + [_marker];
		publicVariable "BEW_v_CampVehicleSpawnMarkers";

	deleteVehicle _x;

} forEach _campVehicleSpawnArrows;
