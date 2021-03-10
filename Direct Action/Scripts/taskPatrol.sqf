// Example [this, getPos this, 300, 10] execVM "taskPatrol.sqf";
 
 
	private [

		"_unit",
		"_start",
		"_range",
		"_amount",
		"_grp",
		"_terrainHeight",
		"_distance",
		"_wdir",
		"_wx",
		"_wy",
		"_wp",
		"_debug",
		"_waypointSpeed"

	]; 
 
 
// Unit that should patrol
_unit   = _this select 0;
 
// Starting location
_start  = _this select 1;
 
// Maximum range
_range  = _this select 2 select 0;
 
// Amount of waypoints
_amount = _this select 3;
 
_grp = group _unit;
 	
// Debug

	_debug = false;
	
	
// Create waypoints
	
	_allWaypoints = [];
	
	if (vehicle _unit isKindOf "Air") then {
	
		_waypointSpeed = "FULL";
	
	}else{
	
		_waypointSpeed = "LIMITED";
	
	};
	 
	_i = 1;
	 
	while { _i < _amount} do {

			_distance = random _range;
			_wdir = random 360;
			_wx = (_start select 0) + (_distance * (sin _wdir));
			_wy = (_start select 1) + (_distance * (cos _wdir));
			
			if (underwater _unit) then {
			
				_terrainHeight = getTerrainHeightASL [_wx,_wy];
				_wp = _grp addWaypoint [[_wx,_wy,_terrainHeight] , 10, _i ];
				_allWaypoints = _allWaypoints + [_wp];
			
			}else{
			
				_wp = _grp addWaypoint [[_wx,_wy] , 10, _i ];
				_allWaypoints = _allWaypoints + [_wp];
			
			};
			
			_wp setWaypointType "MOVE";
	 
			if ( _i == 1 ) then {
					[_grp, _i] setWaypointBehaviour "SAFE";
					[_grp, _i] setWaypointFormation "COLUMN";
					[_grp, _i] setWaypointSpeed _waypointSpeed;
			};
	 
			_i = _i + 1;
				 
	};


// Return To Start Pos

	if (underwater _unit) then {

		_terrainHeight = getTerrainHeightASL _start;
		_wp = _grp addWaypoint [[_start select 0, _start select 0, _terrainHeight],10,_amount];
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointSpeed _waypointSpeed;
		_allWaypoints = _allWaypoints + [_wp];

	}else{

		_wp = _grp addWaypoint [_start,10,_amount];
		_allWaypoints = _allWaypoints + [_wp];

	}; 

// Cycle Waypoints

	[_grp, _amount] setWaypointType "CYCLE";


{

	if (_debug) then {
		
		_wpPos = waypointPosition _x;
		_findInArray = _allWaypoints find _x;
		_markerName = format ["Group_%1_Waypoint_%2", _grp, _findInArray];
		_marker = createMarker [_markerName, _wpPos];	
		_marker setMarkerType "hd_dot";
		
		_markerColor = switch (true) do {
		
			case (typeOf vehicle _unit isKindOf "Man"): {"colorRed"};
			case (typeOf vehicle _unit isKindOf "Helicoper"): {"colorBlue"};
			case (typeOf vehicle _unit isKindOf "Car"): {"colorYellow"};
			case (typeOf vehicle _unit isKindOf "Tank"): {"colorGreen"};
			case (typeOf vehicle _unit isKindOf "Ship"): {"colorPink"};
			case (typeOf vehicle _unit isKindOf "Plane"): {"colorWhite"};
			case (typeOf vehicle _unit isKindOf "StaticWeapon"): {"colorBrown"};
			default {"colorBlack"};
		
		};
		
		_marker setMarkerColor _markerColor;
		
	};

} forEach _allWaypoints;
