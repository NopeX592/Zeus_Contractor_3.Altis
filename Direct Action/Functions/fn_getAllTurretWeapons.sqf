	
	_veh = param [0, vehicle player];

	_allTurrets = allTurrets _veh;
	_allTurretWeapons = [];


	{

		_turret = _x;
		_turretWeapons = _veh weaponsTurret _turret;

		_turretWeapon = _x; 
		_allTurretWeapons append _turretWeapons;

	} forEach _allTurrets;


	systemchat format ["%1", _allTurretWeapons];
	[_allTurretWeapons] call BEW_FNC_CopyToClipboard;