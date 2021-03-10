	// Invulnerable Base Buildings
	
		_safeZoneMarkers = getMissionLayerEntities "Camps" select 1; 
	
	{
	
		_marker = _x;
		_markerPos = getMarkerPos _marker;
		_markerSize = getMarkerSize _marker;

		_objects = nearestObjects [_markerPos, ["HOUSE"], _markerSize select 0, false];
		
		{
		
			_x allowDamage false;
			
		}forEach _objects;
		
	} forEach _safeZoneMarkers;