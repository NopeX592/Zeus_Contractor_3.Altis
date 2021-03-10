	
	_type = _this select 0;
	
		_type = toUpper _type;
	
	_bikes = [

		"C_Quadbike_01_F"

	];
	
	_carsUnarmed = [

		"CUP_O_UAZ_Unarmed_RU",
		"CUP_O_GAZ_Vodnik_Unarmed_RU"

	];
		
		
	_carsArmed = [

		"CUP_O_GAZ_Vodnik_PK_RU",
		"CUP_O_GAZ_Vodnik_BPPU_RU",
		"CUP_O_GAZ_Vodnik_KPVT_RU",
		"CUP_O_UAZ_SPG9_RU",
		"CUP_O_UAZ_MG_RU"

	];
		
		
	_trucks = [

		"CUP_O_Ural_Reammo_RU",
		"CUP_O_Ural_Open_RU",
		"CUP_O_Ural_Refuel_RU",
		"CUP_O_Ural_Repair_RU"

	];
		
		
	_apcs = [

		"CUP_O_BTR90_RU",
		"CUP_O_BRDM2_RUS",
		"CUP_O_BMP2_RU",
		"CUP_O_BMP3_RU"

	];
		
		
	_AAs = [

		"CUP_O_2S6M_RU",
		"CUP_O_Ural_ZU23_RU"

	];
		
		
	_tanks = [

		"CUP_O_T72_RU",
		"CUP_O_T90_RU"

	];
		
		
	_artys = [

		"CUP_O_BM21_RU"

	];
		
	_transportHelis = [

		"CUP_O_Mi8AMT_RU"

	];
		
		
	_attackHelis = [

		"CUP_O_Ka50_DL_RU",
		"CUP_O_Ka52_RU",
		"CUP_O_Mi24_V_Dynamic_RU",
		"CUP_O_Mi8_RU",
		"CUP_O_Ka60_Grey_RU"

	];
		
		
	_capPlanes = [

		"CUP_O_SU34_RU"

	];
		
		
	_casPlanes = [

		"CUP_O_Su25_Dyn_RU"

	];

	_ships = [
		
		"O_Boat_Armed_01_hmg_F"

	];
	
	_staticGun = [


		"CUP_O_KORD_high_RU",
		"CUP_O_KORD_RU",
		"CUP_O_AGS_RU"
	
	];
	
	
	_staticAA = [
	
		"CUP_O_Igla_AA_pod_RU",
		"CUP_O_ZU23_RU"
	
	];
	
	
	_staticAT = [
	
		"CUP_O_D30_AT_RU",
		"CUP_O_Kornet_RU",
		"CUP_O_Metis_RU"
	
	];
	
	
	_staticMortar = [
	
		"CUP_O_D30_RU",
		"CUP_O_2b14_82mm_RU"
	
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
