
	_smallAASpawnArrows = getMissionLayerEntities "SmallAASiteArrows" select 0;

	BEW_v_smallAASiteMarkers = [];
		publicVariable "BEW_v_smallAASiteMarkers";

	{

		_centerPos = getPos _x;
		_centerDir = getDir _x;
		
		_markerName = format ["%1_Marker", _x];
		_marker = createMarker [_markerName, _centerPos];
		_marker setMarkerType "empty";
		_marker setMarkerDir _centerDir;
		
		BEW_v_smallAASiteMarkers = BEW_v_smallAASiteMarkers + [_marker];
			publicVariable "BEW_v_smallAASiteMarkers";

		deleteVehicle _x;

	} forEach _smallAASpawnArrows;
