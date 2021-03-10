
	_veh = _this select 0;
	_debug = true;

	while {(alive _veh)} do {

		_veh lockDriver true;
		_veh lockTurret [[0],true];
	
		sleep 1;
		
		if (_debug) then {systemchat "working"};
	
	};
	
	if (_debug) then {systemchat "stopped"};
