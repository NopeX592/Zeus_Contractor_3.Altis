

	private ["_dir","_veh","_dir2"];

	_veh = _this select 0;
	_dir = getDir _veh;
	if (_dir <= 180) then {_dir2 = _dir + 180} else {_dir2 = _dir - 180}; 

	for "_i" from 0 to 60 do 
	{
	
		0 setWindDir _dir2;

		sleep 1;
	
	};
			
