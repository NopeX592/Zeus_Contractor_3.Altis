	
	_type = _this select 0;
	
		_type = toUpper _type;
	
	_bikes = [

		"O_Quadbike_01_F"

	];
	
	_carsUnarmed = [

		"O_MRAP_02_F",
		"O_LSV_02_unarmed_F"

	];
	
	
	_carsArmed = [

		"O_MRAP_02_hmg_F",
		"O_MRAP_02_gmg_F",
		"O_LSV_02_armed_F",
		"O_LSV_02_AT_F"

	];
	
	
	_trucks = [

		"O_Truck_02_covered_F",
		"O_Truck_02_transport_F",
		"O_Truck_02_box_F",
		"O_Truck_02_medical_F",
		"O_Truck_02_Ammo_F",
		"O_Truck_02_fuel_F",
		"O_Truck_03_transport_F",
		"O_Truck_03_covered_F",
		"O_Truck_03_repair_F",
		"O_Truck_03_ammo_F",
		"O_Truck_03_fuel_F",
		"O_Truck_03_medical_F",
		"O_Truck_03_device_F"

	];
	
	
	_apcs = [

		"O_APC_Tracked_02_base_F",
		"O_APC_Tracked_02_cannon_F",
		"O_APC_Wheeled_02_base_F",
		"O_APC_Wheeled_02_rcws_F",
		"O_APC_Wheeled_02_rcws_v2_F"

	];
	
	
	_AAs = [

		"O_APC_Tracked_02_AA_F"

	];
	
	
	_tanks = [

		"O_MBT_02_base_F",
		"O_MBT_02_cannon_F",
		"O_MBT_04_cannon_F",
		"O_MBT_04_command_F"

	];
	
	
	_artys = [

		"O_MBT_02_arty_base_F",
		"O_MBT_02_arty_F"

	];
	
	
	
	_transportHelis = [

		"O_Heli_Light_02_unarmed_F",
		"O_Heli_Transport_04_black_F"

	];
	
	
	_attackHelis = [

		"O_Heli_Light_02_v2_F",
		"O_Heli_Attack_02_black_F"

	];
	
	
	_capPlanes = [

		"O_Plane_Fighter_02_F"

	];
	
	
	_casPlanes = [

		"O_Plane_CAS_02_F"

	];
	
	_ships = [

		"O_Boat_Armed_01_hmg_F"

	];
	
	_staticGun = [
	
		"O_HMG_01_high_F",
		"O_GMG_01_high_F",
		"O_GMG_01_F",
		"O_HMG_01_F"
	
	];
	
	
	_staticAA = [
	
		"O_static_AA_F"
	
	];
	
	
	_staticAT = [
	
		"O_static_AT_F"
	
	];
	
	
	_staticMortar = [
	
		"O_Mortar_01_F"
	
	];
	
	_return = switch (_type) do {

		case "BIKE": {_bikes};
		case "U_CAR": {_carsUnarmed};
		case "A_CAR": {_carsArmed};
		case "TRUCK": {_trucks};
		case "APC": {_apcs};
		case "AA": {_AAs};
		case "TANK": {_tanks};
		case "ARTY": {_artys};
		case "T_HELI": {_transportHelis};
		case "A_HELI": {_attackHelis};
		case "CAP": {_capPlanes};
		case "CAS": {_casPlanes};
		case "SHIP": {_ships};
		case "STATIC_GUN": {_staticGun};
		case "STATIC_AA": {_staticAA};
		case "STATIC_AT": {_staticAT};
		case "STATIC_MORTAR": {_staticMortar};		

	};
	
	_return;
