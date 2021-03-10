_veh = _this select 0;


if (typeOf _veh == "B_Heli_Light_01_dynamicLoadout_F") then {

	_veh addWeaponTurret ["CMFlareLauncher", [0]];
	_veh addWeaponTurret ["CMFlareLauncher", [-1]];
	_veh addMagazineTurret ["120Rnd_CMFlareMagazine",[0]];
	_veh addMagazineTurret ["120Rnd_CMFlareMagazine",[-1]];
	
};


if (typeOf _veh == "B_Heli_Light_01_F") then {

	_veh addWeaponTurret ["CMFlareLauncher", [0]];
	_veh addWeaponTurret ["CMFlareLauncher", [-1]];
	_veh addMagazineTurret ["120Rnd_CMFlareMagazine",[0]];
	_veh addMagazineTurret ["120Rnd_CMFlareMagazine",[-1]];
	
};


if ((_veh isKindOf "Plane") and (!(_veh isKindOf "UAV") or !(_veh isKindOf "UAV_03_base_F"))) then {


	_veh removeWeaponTurret ["Laserdesignator_pilotCamera", [-1]];


};