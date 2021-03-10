
	
	_type = _this select 0;
	
		_type = toUpper _type;
	
	_bikes = [

		"O_Quadbike_01_F"

	];
	
	_carsUnarmed = [
		
		"rhs_tigr_vdv",
		"rhs_uaz_vdv",
		"rhs_uaz_open_vdv"

	];
	
	
	_carsArmed = [

		"rhsgref_BRDM2_vdv",
		"rhs_tigr_sts_vdv"

	];
	
	
	_trucks = [

		"rhs_gaz66_vdv",
		"rhs_gaz66o_vdv",
		"rhs_kamaz5350_vdv",
		"rhs_kamaz5350_open_vdv",
		"RHS_Ural_VDV_01",
		"RHS_Ural_Open_VDV_01",
		"rhs_zil131_vdv",
		"rhs_zil131_open_vdv"

	];
	
	
	_apcs = [

		"rhs_bmp2k_vdv",
		"rhs_btr80_vdv",
		"rhs_sprut_vdv",
		"rhs_zsu234_aa"

	];
	
	
	_AAs = [

		"rhs_zsu234_aa"

	];
	
	
	_tanks = [

		"rhs_t72be_tv",
		"rhs_t80um",
		"rhs_t90sm_tv"

	];
	
	
	_artys = [

		"rhs_2s1_tv",
		"rhs_2s3_tv",
		"RHS_BM21_VMF_01"

	];
	
	
	
	_transportHelis = [

		"RHS_Mi8mt_vvs"

	];
	
	
	_attackHelis = [

		"rhs_mi28n_vvs",
		"RHS_Mi8MTV3_vvs",
		"RHS_Mi24P_vvs",
		"RHS_Ka52_vvs"

	];
	
	
	_capPlanes = [
		
		"rhs_mig29sm_vvs",
		"RHS_T50_vvs_generic_ext"

	];
	
	
	_casPlanes = [

		"RHS_Su25SM_vvs"

	];
	
	
	_ships = [

		"O_Boat_Armed_01_hmg_F"

	];
	
	_staticGun = [
			
		"RHS_NSV_TriPod_VDV",
		"rhs_KORD_high_VDV",
		"rhs_KORD_VDV",
		"RHS_AGS30_TriPod_VDV"
	
	];
	
	
	_staticAA = [
	
		"RHS_ZU23_VDV",
		"rhs_Igla_AA_pod_vdv"
	
	];
	
	
	_staticAT = [
	
		
		"rhs_Kornet_9M133_2_vdv",
		"rhs_D30_at_vdv"
	
	];
	
	
	_staticMortar = [
	
		"rhs_2b14_82mm_vdv",
		"rhs_D30_vdv"
	
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
