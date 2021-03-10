private ["_obj", "_soundType", "_maxDistance", "_delay"];

_obj = param [0];   
_soundType = param [1, "FD_Timer_F"];
_maxDistance = param [2, 300];

while {alive _obj} do {   

	_obj say3D [_soundType, _maxDistance, 1, false, 0];    

	_delay = ((player distance _obj) / 150);  

	if (_delay < 0.1) then {_delay = 0.1};  

	sleep _delay;   

};   
