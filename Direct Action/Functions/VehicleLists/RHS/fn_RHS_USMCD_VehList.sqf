
	_type = _this select 0;
	
		_type = toUpper _type;
	
	_bikes = [

		"B_Quadbike_01_F"

	];
	
	_carsUnarmed = [
		
		"rhsusf_m1025_d_s",
		"rhsusf_m1043_d_s",
		"rhsusf_m998_d_s_2dr_halftop",
		"rhsusf_m998_d_s_2dr",
		"rhsusf_m998_d_s_2dr_fulltop",
		"rhsusf_m998_d_s_4dr_halftop",
		"rhsusf_m998_d_s_4dr",
		"rhsusf_m998_d_s_4dr_fulltop",
		"rhsusf_m1151_usmc_d",
		"rhsusf_m1152_usmc_d",
		"rhsusf_m1152_rsv_usmc_d",
		"rhsusf_m1165_usmc_d",
		
		"rhsusf_CGRCAT1A2_usmc_d",
		"rhsusf_m1240a1_usmc_d"

	];
	
	
	_carsArmed = [

		"rhsusf_m1025_d_s_m2",
		"rhsusf_m1025_d_s_Mk19",
		"rhsusf_m1043_d_s_m2",
		"rhsusf_m1043_d_s_mk19",
		"rhsusf_m1045_d_s",
		"rhsusf_m1151_m2crows_usmc_d",
		"rhsusf_m1151_mk19crows_usmc_d",
		"rhsusf_m1151_m2_v3_usmc_d",
		"rhsusf_m1151_m240_v3_usmc_d",
		"rhsusf_m1151_mk19_v3_usmc_d",
		
		"rhsusf_CGRCAT1A2_M2_usmc_d",
		"rhsusf_CGRCAT1A2_Mk19_usmc_d",
		"rhsusf_M1232_MC_M2_usmc_d",
		"rhsusf_M1232_MC_MK19_usmc_d",
		"rhsusf_m1240a1_m2_usmc_d",
		"rhsusf_m1240a1_mk19_usmc_d",
		"rhsusf_m1240a1_m240_usmc_d",
		"rhsusf_m1240a1_m2crows_usmc_d",
		"rhsusf_m1240a1_mk19crows_usmc_d"

	];
	
	
	_trucks = [

		"rhsusf_M1078A1P2_D_fmtv_usarmy",
		"rhsusf_M1078A1P2_D_flatbed_fmtv_usarmy",
		"rhsusf_M1078A1P2_B_D_fmtv_usarmy",
		"rhsusf_M1078A1P2_B_D_flatbed_fmtv_usarmy",
		"rhsusf_M1078A1P2_B_M2_D_fmtv_usarmy",
		"rhsusf_M1078A1P2_B_M2_D_flatbed_fmtv_usarmy",
		"rhsusf_M1078A1P2_B_D_CP_fmtv_usarmy",
		"rhsusf_M1083A1P2_D_fmtv_usarmy",
		"rhsusf_M1083A1P2_D_flatbed_fmtv_usarmy",
		"rhsusf_M1083A1P2_B_D_fmtv_usarmy",
		"rhsusf_M1083A1P2_B_D_flatbed_fmtv_usarmy",
		"rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy",
		"rhsusf_M1083A1P2_B_M2_D_flatbed_fmtv_usarmy",
		"rhsusf_M1084A1P2_D_fmtv_usarmy",
		"rhsusf_M1084A1P2_B_D_fmtv_usarmy",
		"rhsusf_M1084A1P2_B_M2_D_fmtv_usarmy",
		"rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy",
		"rhsusf_M977A4_usarmy_d",
		"rhsusf_M977A4_AMMO_usarmy_d",
		"rhsusf_M977A4_REPAIR_usarmy_d",
		"rhsusf_M977A4_BKIT_usarmy_d",
		"rhsusf_M977A4_AMMO_BKIT_usarmy_d",
		"rhsusf_M977A4_BKIT_M2_usarmy_d",
		"rhsusf_M977A4_AMMO_BKIT_M2_usarmy_d",
		"rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d",
		"rhsusf_M977A4_REPAIR_BKIT_usarmy_d",
		"rhsusf_M978A4_usarmy_d",
		"rhsusf_M978A4_BKIT_usarmy_d"

	];
	
	
	_apcs = [

		"rhsusf_stryker_m1126_m2_d",
		"rhsusf_stryker_m1126_mk19_d",
		"rhsusf_stryker_m1127_m2_d",
		"rhsusf_stryker_m1132_m2_np_d",
		"rhsusf_stryker_m1132_m2_d",
		"rhsusf_stryker_m1134_d",
		"rhsusf_m113d_usarmy_supply",
		"rhsusf_m113d_usarmy",
		"rhsusf_m113d_usarmy_M240",
		"rhsusf_m113d_usarmy_medical",
		"rhsusf_m113d_usarmy_MK19",
		"rhsusf_m113d_usarmy_unarmed",
		"RHS_M2A2",
		"RHS_M2A2_BUSKI",
		"RHS_M2A3",
		"RHS_M2A3_BUSKI",
		"RHS_M2A3_BUSKIII"

	];
	
	
	_AAs = [

		"RHS_M6"

	];
	
	
	_tanks = [

		"rhsusf_m1a1fep_d"

	];
	
	
	_artys = [

		"rhsusf_m109d_usarmy",
		"rhsusf_M142_usarmy_D"

	];
	
	
	
	_transportHelis = [

		"rhsusf_CH53E_USMC_D",
		"RHS_UH1Y_UNARMED_d"

	];
	
	
	_attackHelis = [

		"RHS_UH1Y_d",
		"RHS_AH1Z"

	];
	
	
	_capPlanes = [
		
		"rhsusf_f22"

	];
	
	
	_casPlanes = [

		"RHS_A10"

	];
	
	_ships = [

		"rhsusf_mkvsoc"

	];
	
	_staticGun = [
	
		"RHS_M2StaticMG_USMC_D",
		"RHS_M2StaticMG_MiniTripod_USMC_D",
		"RHS_MK19_TriPod_USMC_D"
	
	];
	
	
	_staticAA = [
	
		"RHS_Stinger_AA_pod_USMC_D"
	
	];
	
	
	_staticAT = [
		
		"RHS_TOW_TriPod_USMC_D"		
	
	];
	
	
	_staticMortar = [
	
		"RHS_M252_USMC_D"
	
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
