
	params [
		["_oldMarker", "", [""]]
	];

	// Check marker
	if !(_oldMarker in allMapMarkers) exitWith {
		diag_log format ["Marker: '%1' is not a valid marker or does not exist", _oldMarker];
	};

	// Store marker data
	private _name = _oldMarker;
	private _position = getMarkerPos _oldMarker;
	private _type = getMarkerType _oldMarker;
	private _colour = getMarkerColor _oldMarker;
	private _shape = markerShape _oldMarker;
	private _dir = markerDir _oldMarker;
	private _size = getMarkerSize _oldMarker;
	private _text = markerText _oldMarker;	
	private _alpha = markerAlpha _oldMarker;
	private _brush = markerBrush _oldMarker;

	// Hack due to bug in ARMA3 
	if !(_type isKindOf "CfgMarkers") then {_type = "";};
	if !(_shape in ["ICON", "RECTANGLE", "ELLIPSE", "POLYLINE"]) then {
		_shape = "ICON";
		_type = "hd_dot";
		_colour = "ColorUNKNOWN";
		_text = "Marker Error";
	};

	// Delete the marker
	deleteMarker _oldMarker;

	// re-create the marker on top of the object markers
	private _newMarker = createMarker [_name, _position];
	_newMarker setMarkerType _type;
	_newMarker setMarkerColor _colour;
	_newMarker setMarkerShape _shape;
	_newMarker setMarkerDir _dir;
	_newMarker setMarkerSize _size;
	_newMarker setMarkerText _text;
	_newMarker setMarkerAlpha _alpha;
	_newMarker setMarkerBrush _brush;

	// Return the new marker
	_newMarker
