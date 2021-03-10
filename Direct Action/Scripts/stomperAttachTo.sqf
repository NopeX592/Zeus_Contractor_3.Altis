
// Mortar Stomper

	_pos = getPos returnHelipad;
	_posRel = [0.36, -0.875, 0];
	_vehicleType = "B_UGV_01_F"; 
	_turretType = "B_Mortar_01_F";

	_veh = createVehicle [_vehicleType, _pos, [], 0, "CAN_COLLIDE"];
	_turret = createVehicle [_turretType, _pos, [], 0, "CAN_COLLIDE"];


	_turret setdir (getdir _veh);

	_turret attachTo [_veh, _posRel];

	[_turret, _veh] call BIS_fnc_attachToRelative; 

	_turret enableWeaponDisassembly false;




// Low HMG Stomper

	_pos = getPos returnHelipad;
	_posRel = [0.54, -1.18, 0.5];
	_vehicleType = "B_UGV_01_F"; 
	_turretType = "B_HMG_01_F";

	_veh = createVehicle [_vehicleType, _pos, [], 0, "CAN_COLLIDE"];
	_turret = createVehicle [_turretType, _pos, [], 0, "CAN_COLLIDE"];


	_turret setdir (getdir _veh);

	_turret attachTo [_veh, _posRel];

	[_turret, _veh] call BIS_fnc_attachToRelative; 

	_turret enableWeaponDisassembly false;