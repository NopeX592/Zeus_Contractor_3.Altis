
	_centerPos 	=	param [0, getPos player];
	_radius 	= 	param [1, 100];
	
	_allMarkers = BEW_v_AllObjectiveTriggerMarkers;
	_invisibleMarkers = _allMarkers select {markerAlpha _x == 0};
	
	_markersInRadius = [];
	
	while {count _markersInRadius < 1} do {
		
		_markersInRadius = _invisibleMarkers select {(_centerPos distance2D markerPos _x < _radius) and (_centerPos distance2D markerPos _x > 2000)};
		_radius = _radius + 100;

	};
	
	_selectedMarker = _markersInRadius call BIS_FNC_SelectRandom;

	_selectedMarker setMarkerAlpha 1;