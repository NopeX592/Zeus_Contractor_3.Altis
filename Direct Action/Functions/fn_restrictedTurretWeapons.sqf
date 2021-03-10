	
	_veh = param [0, vehicle player];
	_restrictedTurretWeapons = param [1, []];

	_allTurrets = allTurrets _veh;

	{

		_turret = _x;
		_turretWeapons = _veh weaponsTurret _turret;

		{

			_turretWeapon = _x; 

			if (_turretWeapon in _turretWeapons) then {

				_veh removeWeaponTurret [_turretWeapon, _turret];

			};

		} forEach _restrictedTurretWeapons 

	} forEach _allTurrets;