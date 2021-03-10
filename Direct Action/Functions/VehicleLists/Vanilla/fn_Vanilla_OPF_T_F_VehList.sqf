	
	_type = _this select 0;
	
		_type = toUpper _type;
	
	_bikes = [

		"O_T_Quadbike_01_ghex_F"

	];
	
	_carsUnarmed = [

		"O_T_MRAP_02_ghex_F",
		"O_T_LSV_02_unarmed_F"

	];
	
	
	_carsArmed = [

		"O_T_MRAP_02_gmg_ghex_F",
		"O_T_MRAP_02_hmg_ghex_F",
		"O_T_LSV_02_AT_F",
		"O_T_LSV_02_armed_F"	

	];
	
	
	_trucks = [

		"O_T_Truck_03_transport_ghex_F"

	];
	
	
	_apcs = [
			
		"O_T_APC_Tracked_02_cannon_ghex_F",
		"O_T_APC_Wheeled_02_rcws_v2_ghex_F"		

	];
	
	
	_AAs = [

		"O_T_APC_Tracked_02_AA_ghex_F"

	];
	
	
	_tanks = [

		"O_T_MBT_02_arty_ghex_F",
		"O_T_MBT_04_command_F",
		"O_T_MBT_02_cannon_ghex_F",
		"O_T_MBT_04_cannon_F"

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

		"O_Plane_CAS_02_F",
		"O_T_VTOL_02_infantry_dynamicLoadout_F"

	];
	
	_ships = [

		"O_T_Boat_Armed_01_hmg_F"

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
