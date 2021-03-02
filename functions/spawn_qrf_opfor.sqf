/*
Example:
[
	getMarkerPos "qrf_spawn_4",
	getMarkerPos "qrf_target_1",
	5,
	10,
	EAST
] call SU_fnc_spawnOPFOR;
__________________________________________________________________*/
params [
	["_location_start", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]],
	["_location_end", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]],
	["_amount", 10, [0]],
	["_delay", 90, [0]],
	["_side", EAST, []]
];

//Reset Variables
waypoint_0_done = false;
waypoint_1_done = false;
waypoint_2_done = false;

//Delay QRF
[_location_start, _location_end, _amount, _delay, _side] spawn {

	params ["_location_start", "_location_end", "_amount", "_delay", "_side"];

	sleep _delay;

	//Create Group
	private _qrf_group = createGroup [_side, false];

	//Spawn units
	if (_side == independent) then {
			//Spawn IND Units
			//Spawn Mandatory
			squad_lead = "I_G_Soldier_SL_F" createUnit [_location_start, _qrf_group];
			auto_rifle = "I_G_Soldier_AR_F" createUnit [_location_start, _qrf_group];
			grenadier = "I_G_Soldier_GL_F" createUnit [_location_start, _qrf_group];

			//Spawn Riflemen
			_amount = _amount - 3;

			for "_i" from 1 to _amount step 1 do {
			rifle_man = "I_G_Soldier_F" createUnit [_location_start, _qrf_group];
			};

			//Spawn Vehicle
			if (_amount <= 6) then {
				vehicleSpawn = "I_G_Offroad_01_F" createVehicle _location_start;
				} else {
				vehicleSpawn = "I_G_Van_01_transport_F" createVehicle _location_start;
			};
		} else {
			//Spawn CSAT Units
			//Spawn Officer
			squad_lead = "O_Soldier_SL_F" createUnit [_location_start, _qrf_group];
			auto_rifle = "O_Soldier_AR_F" createUnit [_location_start, _qrf_group];
			grenadier = "O_Soldier_GL_F" createUnit [_location_start, _qrf_group];

			//Spawn Riflemen
			_amount = _amount - 3;

			for "_i" from 1 to _amount step 1 do {
			rifle_man = "O_Soldier_F" createUnit [_location_start, _qrf_group];
			};

			//Spawn Vehicle
			if (_amount <= 5) then {
				vehicleSpawn = "O_MRAP_02_hmg_F" createVehicle _location_start;
				} else {
				vehicleSpawn = "O_Truck_02_transport_F" createVehicle _location_start;
			};
		};

	//Order Get In
	_wp_getIn = _qrf_group addWaypoint [_location_start, 0];
		_wp_getIn waypointAttachVehicle vehicleSpawn;
		_wp_getIn setWaypointType "GETIN";
		_wp_getIn setWaypointSpeed "FULL";

	//Order to Target
	_wp_move = _qrf_group addWaypoint [_location_end, 1];
		_wp_move setWaypointType "MOVE";
		_wp_move setWaypointSpeed "FULL";
		[_qrf_group, 1] setWaypointCompletionRadius 75;

	//Order Get Out
	_wp_getOut = _qrf_group addWaypoint [_location_end, 2];
		_wp_getOut setWaypointType "GETOUT";
		_wp_getOut setWaypointSpeed "FULL";
		_wp_getOut setWaypointStatements ["true", "waypoint_2_done = true;"];

	//Order SAD
	_wp_sad = _qrf_group addWaypoint [_location_end, 3];
		_wp_sad setWaypointType "SAD";
		_wp_sad setWaypointSpeed "FULL";
		[_qrf_group, 1] setWaypointCompletionRadius 35;
};