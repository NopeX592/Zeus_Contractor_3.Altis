		
		
		_marker 	= 	_this select 0;
		_markerPos	= 	markerPos _marker;
			
			
		// Define Marker Type
				_origMarkerType = BLU_MarkerIcon;
				BEW_v_ResistanceCampMarkerType = [_origMarkerType] call BEW_FNC_TranslateClassNames;


		// Create Marker Icon
		
			_markerIcon = createMarker ["HQ Marker", _markerPos];
			_markerIcon setMarkerType BEW_v_ResistanceCampMarkerType;
			_markerIcon setMarkerAlpha 1;
			_markerIcon setMarkerText "Altis Airfield";
			_markerIcon setMarkerSize [0.75, 0.75];