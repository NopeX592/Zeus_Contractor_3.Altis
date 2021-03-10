_militarySpawnArrows = getMissionLayerEntities "MilitarySpawnPoints" select 0;
BEW_v_militarySpawnMarkers = [];
	publicVariable "BEW_v_militarySpawnMarkers";

{

	_centerPos = getPos _x;
	_centerDir = getDir _x;

	_markerName = format ["%1_Marker", _x];
	_marker = createMarker [_markerName, _centerPos];
	_marker setMarkerType "empty";
	_marker setMarkerDir _centerDir;
	
	BEW_v_militarySpawnMarkers = BEW_v_militarySpawnMarkers + [_marker];
		publicVariable "BEW_v_militarySpawnMarkers";

	deleteVehicle _x;

} forEach _militarySpawnArrows;
