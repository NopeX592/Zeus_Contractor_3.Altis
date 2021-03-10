private ["_arrow"];

	_veh = param [0];
		_driver = driver _veh;
		_copilot = _veh turretUnit [0];
		_group = group _driver;
		_crew = units _group;
		_passengers = crew _veh;
		_passengers = _passengers - [_driver]; 
		_passengers = _passengers - [_copilot]; 
	
	_startPad = param [1];
		_startPos = getPos _startPad;
		_startDir = getDir _startPad;	
	_callsign = param [2];		

	if ((canMove _veh) and (alive _veh) and (alive _driver)) then {
	
		_arrow = "Sign_Arrow_Large_Blue_F" createVehicle _startPos;
		_arrow setPosATL [getPos _arrow select 0, getPos _arrow select 1, (getPos _arrow select 2) +1];

		_wp = _group addWaypoint [_startPos, 0];
		_wp setWaypointType "MOVE";
		
		// Close Ramp
		
			_veh animatedoor ["door_rear_source", 0]; 
			_veh animatesource ["ramp_anim", 0];
			_veh animatesource ["ramp", 0];
			_veh animateDoor ["CargoRamp_Open", 0];
		
	};
			
			
waitUntil {((_veh distance2D _startPos) < 150) or (!canMove _veh) or (!alive _veh) or (!alive _driver)};
	
	if ((canMove _veh) and (alive _veh) and (alive _driver)) then {
				
		_veh land "LAND";
		_veh landAt _startPad;
		
		// Open Ramp
		
			_veh animatedoor ["door_rear_source", 1]; 
			_veh animatesource ["ramp_anim", 1];
			_veh animatesource ["ramp", 1];
			_veh animateDoor ["CargoRamp_Open", 1];
	
	};		

	
	// Create Headwind
		
		[_veh] execVM "scripts\heliTransport\createHeadwind.sqf";

			
waitUntil {(isTouchingGround _veh) or (!canMove _veh) or (!alive _veh) or (!alive _driver)};

	_respawnDelay = 30;

	if ((canMove _veh) and (alive _veh) and (alive _driver)) then {
	
		_message = format ["We're back at base. Ready for tasking in %1 seconds.", _respawnDelay];
		[_veh, _message] remoteExec ["sideChat", 0];	
	
	};

		deleteVehicle _arrow;

		{doGetOut _x} forEach _passengers;
		_veh setVehicleLock "LOCKED";
		
		sleep 5;
		
		{deleteVehicle _x} forEach _crew;
				
		deleteVehicle _veh;
		
			sleep _respawnDelay - 15;
		

