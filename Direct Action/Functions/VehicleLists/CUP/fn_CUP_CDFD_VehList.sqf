	
	_type = _this select 0;
	
		_type = toUpper _type;
	
	_bikes = [

		"B_Quadbike_01_F"

	];
	
	_carsUnarmed = [

		"B_MRAP_01_F",
		"B_LSV_01_unarmed_F"

	];
		
		
	_carsArmed = [

		"B_MRAP_01_gmg_F",
		"B_MRAP_01_hmg_F",
		"B_LSV_01_armed_F",
		"B_LSV_01_AT_F"

	];
		
		
	_trucks = [

		"B_Truck_01_transport_F",
		"B_Truck_01_covered_F",
		"B_Truck_01_mover_F",
		"B_Truck_01_box_F",
		"B_Truck_01_Repair_F",
		"B_Truck_01_ammo_F",
		"B_Truck_01_fuel_F",
		"B_Truck_01_medical_F",
		"B_Truck_01_flatbed_F",
		"B_Truck_01_cargo_F"

	];
		
		
	_apcs = [

		"B_APC_Wheeled_01_base_F",
		"B_APC_Wheeled_01_cannon_F",
		"B_APC_Wheeled_03_base_F",
		"B_APC_Wheeled_03_cannon_F",
		"B_AFV_Wheeled_01_cannon_F",
		"B_AFV_Wheeled_01_up_cannon_F",
		"B_APC_Tracked_01_base_F",
		"B_APC_Tracked_01_rcws_F",
		"B_APC_Tracked_01_CRV_F"

		];
		
		
	_AAs = [

		"B_APC_Tracked_01_AA_F"

		];
		
		
	_tanks = [

		"B_MBT_01_base_F",
		"B_MBT_01_cannon_F",
		"B_MBT_01_TUSK_F"

	];
		
		
	_artys = [

		"B_MBT_01_arty_base_F",
		"B_MBT_01_arty_F",
		"B_MBT_01_mlrs_base_F",
		"B_MBT_01_mlrs_F"

	];
		
	_transportHelis = [

		"B_Heli_Light_01_F",
		"B_Heli_Transport_01_F",
		"B_Heli_Transport_03_F"

	];
		
		
	_attackHelis = [

		"B_Heli_Light_01_armed_F",
		"B_Heli_Attack_01_F"

	];
		
		
	_capPlanes = [

		"B_Plane_Fighter_01_F"

	];
		
		
	_casPlanes = [

		"B_Plane_CAS_01_F"

	];

	_ships = [

		"B_Boat_Armed_01_minigun_F",
		"B_Boat_Transport_01_F",
		"B_Lifeboat",
		"B_SDV_01_F"

	];
	
	_staticGun = [
	
		"B_HMG_01_F",
		"B_HMG_01_high_F",
		"B_GMG_01_F",
		"B_GMG_01_high_F"
	
	];
	
	
	_staticAA = [
	
		"B_static_AA_F"
	
	];
	
	
	_staticAT = [
	
		"B_static_AT_F"
	
	];
	
	
	_staticMortar = [
	
		"B_Mortar_01_F"
	
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
