

	// Units
	
		_officer 				=	"ncs_nzdf_mc_officer";
		_teamLeader 			= 	"ncs_nzdf_mc_grenadier";
		_marksman 				= 	"ncs_nzdf_mc_marksman";
		_sniper					=	"ncs_nzdf_mc_sniper";
		_spotter				=	"ncs_nzdf_mc_scout";
		_grenadier				=	"ncs_nzdf_mc_grenadier";
		_autoRifleman			= 	"ncs_nzdf_mc_ar";
		_gunner					=	"ncs_nzdf_mc_mg";
		_medic					= 	"ncs_nzdf_mc_medic";
		_repairSpecialist		=	"ncs_nzdf_mc_eng";
		_engineer				= 	"ncs_nzdf_mc_eng";
		_guidedLAT				=	"ncs_nzdf_mc_rifleman";
		_dumbLAT				=	"ncs_nzdf_mc_rifleman";
		_missileSpecialistAT	= 	"ncs_nzdf_mc_at";
		_missileSpecialistAA	=	"rhsusf_army_ocp_aa";
		_ammoBearer				= 	"ncs_nzdf_mc_rifleman";
		_JTAC					= 	"rhsusf_army_ocp_jfo";
		_explosivesSpecialist	= 	"ncs_nzdf_mc_eng";
		_uavOperator			= 	"ncs_nzdf_mc_rifleman";
		_paratrooper			=	"ncs_nzdf_mc_rifleman";
		_heliPilot 				=	"ncs_nzdf_heli_pilot_mc";
		_heliCrew				=	"ncs_nzdf_heli_pilot_mc";
		_fighterPilot			=	"ncs_nzdf_t6_pilot";
		_pilot					=	"ncs_nzdf_tspt_pilot";
		_vehicleCrew			=  	"ncs_nzdf_mc_crewman";
		_diver 					=	"B_diver_F";
		_diverTeamLeader		=	"B_diver_TL_F";
		_diverExplosives		=	"B_diver_exp_F";
		

	// Vehicles
	
		_atTurret				=	"RHS_TOW_TriPod_D";
		_aaTurret				=	"RHS_Stinger_AA_pod_D";
		_mortar					=	"RHS_M119_D";
		
		if (isClass(configfile >> "CfgMods" >> "UK3CB_BAF_Units")) then {
		
			_attackBoat				=	"UK3CB_BAF_RHIB_HMG_DDPM_RM";
			
		}else{
		
			_attackBoat				=	"ncs_nzdf_rhib";
			
		};
		
		_quadBike 				=	"rhsusf_mrzr4_d";
		_smallCargoTruck		=	"ncs_nzdf_hx58_ammo";
		_fuelTruck				=	"UK3CB_BAF_Husky_Logistics_HMG_Green_MTP_RM";
		_car					=	"UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Green_A_MTP";
		_carHMG					=	"UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_A_MTP";
		_carAT					=	"UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_A_MTP";
		_Mrap					=	"UK3CB_BAF_Jackal2_L2A1_W_MTP";
		_MrapHMG				=	"UK3CB_BAF_Husky_Passenger_HMG_Green_MTP";
		_MrapGMG				=	"UK3CB_BAF_Husky_Passenger_GMG_Green_MTP";
		_cargoTruck				=	"B_T_Truck_01_flatbed_F";
		_lightIFV				=	"rhsusf_M1117_D";
		_tank					=	"rhsusf_m1a1hc_wd";
		_antiAirAPC				=	"RHS_M6";
		_artilleryAPC			=	"rhsusf_m109d_usarmy";
		
		_wheeledIFV = switch (true) do {
			case (isClass(configfile >> "CfgVehicles" >> "ncs_nzdf_laviii")): {"ncs_nzdf_laviii"};
			default {"rhsusf_stryker_m1126_mk19_d"};				
		};
		
		_trackedAPC				=	"RHS_M2A3";
		
		_tankHunter	 = switch (true) do {
			case (isClass(configfile >> "CfgVehicles" >> "M1128_MGS_DG1_NOSLATDES")): {"M1128_MGS_DG1_NOSLATDES"};
			default {"rhsusf_stryker_m1134_d"};				
		};
		
		_smallTrHeli			=	"ncs_nzdf_a109";
		_mediumTrHeli			=	"ncs_nzdf_a109";
		_largeTrHeli			=	"ncs_nzdf_a109_mg";
		_cargoHeli				=	"UK3CB_BAF_Merlin_HC4_Cargo_MTP";
		_smallAH				=	"ncs_nzdf_a109_mg";
		_largeAH				=	"RHS_AH64D";
		_TrPlane				=	"RHS_C130J";
		_CargoPlane				=	"RHS_C130J_Cargo";
		

	// Planes
	
		_TrPlane = "ncs_nzdf_c130h";	

		_CargoPlane = "ncs_nzdf_c130h";
		
		_AttackCargoPlane = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "USAF_AC130U")): {"USAF_AC130U"};
			default {"RHS_C130J_Cargo"};
			
		};	

		_plane_L1 = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "ncs_nzdf_t6c")): {"ncs_nzdf_t6c"};
			default {"RHSGREF_A29B_HIDF"};
			
			};	
					
					
			_plane_L2 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "ncs_nzdf_t6c_1")): {"ncs_nzdf_t6c_1"};
				default {"rhs_l159_cdf_b_CDF"};
				
			};	
					
					
			_plane_L3 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "FIR_F18C_RNZAF")): {"FIR_F18C_RNZAF"};
				case (isClass(configfile >> "CfgVehicles" >> "USAF_F22")): {"USAF_F22"};
				default {"rhs_l159_cdf_b_CDF"};
				
			};	


			_plane_L4 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "FIR_F35B_Blank1")): {"FIR_F35B_Blank1"};
				case (isClass(configfile >> "CfgVehicles" >> "USAF_F22_Heavy")): {"USAF_F22_Heavy"};
				default {"rhsusf_f22"};
				
			};	


			_plane_L5 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "EA18G_RAAF")): {"EA18G_RAAF"};
				default {"rhsusf_f22"};
				
			};	


			_plane_L6 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "FIR_FA18F")): {"FIR_FA18F"};
				case (isClass(configfile >> "CfgVehicles" >> "USAF_A10")): {"USAF_A10"};
				default {"RHS_A10"};
				
			};
				
		_flag					=	"Flag_US_F";
		_marker					=	"flag_aus";
		
	
	// Arrays

		_allUnitTypes = [
		
			_officer,
			_teamLeader, 
			_marksman, 
			_sniper, 
			_spotter, 
			_grenadier, 
			_autoRifleman, 
			_gunner, _medic, 
			_repairSpecialist, 
			_engineer, 
			_guidedLAT, 
			_dumbLAT, 
			_missileSpecialistAT, 
			_missileSpecialistAA, 
			_ammoBearer, 
			_JTAC, 
			_explosivesSpecialist, 
			_uavOperator, 
			_paratrooper, 
			_heliPilot, 
			_heliCrew, 
			_fighterPilot, 
			_pilot, 
			_vehicleCrew,
			_diver,
			_diverTeamLeader,
			_diverExplosives
		
		];


		_allVehicleTypes = [
		
			_plane_L5,
			_atTurret,
			_aaTurret,
			_mortar,
			_AttackCargoPlane,
			_attackBoat,
			_quadBike,
			_smallCargoTruck,
			_fuelTruck,
			_car,
			_carHMG,
			_carAT,
			_Mrap,
			_MrapHMG,
			_MrapGMG,
			_cargoTruck,
			_lightIFV,
			_tank,
			_antiAirAPC,
			_artilleryAPC,
			_wheeledIFV,
			_trackedAPC,
			_tankHunter,
			_smallTrHeli,
			_mediumTrHeli,
			_largeTrHeli,
			_cargoHeli,
			_smallAH,
			_largeAH,
			_TrPlane,
			_CargoPlane,
			_plane_L1,
			_plane_L2,
			_plane_L3,
			_plane_L6,
			_plane_L4,
			_flag,
			_marker

		];


	_return = _allUnitTypes + _allVehicleTypes;
	
	_return	
	























