

	// Units
	
		_officer 				=	"ADFU_AMC_PLTCMDR";
		_teamLeader 			= 	"ADFU_AMC_FTL";
		_marksman 				= 	"ADFU_AMC_Marksman";
		_sniper					=	"rhsusf_army_ocp_sniper_m107";
		_spotter				=	"rhsusf_army_ocp_sniper";
		_grenadier				=	"ADFU_AMC_GL";
		_autoRifleman			= 	"ADFU_AMC_LMG";
		_gunner					=	"ADFU_AMC_HMG";
		_medic					= 	"ADFU_AMC_CLS";
		_repairSpecialist		=	"ADFU_AMC_Combat_Engineer";
		_engineer				= 	"ADFU_AMC_Combat_Engineer";
		_guidedLAT				=	"ADFU_AMC_Gustav_Gunner";
		_dumbLAT				=	"ADFU_AMC_Rifleman_LAT";
		_missileSpecialistAT	= 	"ADFU_AMC_Gustav_Gunner";
		_missileSpecialistAA	=	"rhsusf_army_ocp_aa";
		_ammoBearer				= 	"ADFU_AMC_Heavy_Bearer";
		_JTAC					= 	"rhsusf_army_ocp_jfo";
		_explosivesSpecialist	= 	"ADFU_AMC_Explosive_Specialist";
		_uavOperator			= 	"ADFU_AMC_Rifleman";
		_paratrooper			=	"ADFU_AMC_Rifleman";
		_heliPilot 				=	"ADFU_AMC_Cav_Crew";
		_heliCrew				=	"ADFU_AMC_Cav_Crew";
		_fighterPilot			=	"ADFU_AMC_Cav_Crew";
		_pilot					=	"ADFU_AMC_Cav_Crew";
		_vehicleCrew			=  	"ADFU_AMC_Cav_Crew";
		_diver 					=	"ADFU_CD_Rifleman";
		_diverTeamLeader		=	"ADFU_CD_FTL";
		_diverExplosives		=	"ADFU_CD_Explosive_Specialist";


	// Vehicles
	
		_atTurret				=	"RHS_TOW_TriPod_D";
		_aaTurret				=	"RHS_Stinger_AA_pod_D";
		_mortar					=	"RHS_M119_D";
		
		if (isClass(configfile >> "CfgMods" >> "UK3CB_BAF_Units")) then {
		
			_attackBoat			=	"UK3CB_BAF_RHIB_HMG_DDPM_RM";
			
		}else{
		
			_attackBoat			=	"B_Boat_Armed_01_minigun_F";
			
		};
		
		_quadBike 				=	"rhsusf_mrzr4_d";
		_smallCargoTruck		=	"UK3CB_BAF_MAN_HX58_Cargo_Green_A_MTP";
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
			case (isClass(configfile >> "CfgVehicles" >> "ADFU_armour_aslav_t1")): {"ADFU_armour_aslav_t1"};
			default {"rhsusf_stryker_m1126_mk19_d"};				
		};
		
		_trackedAPC				=	"RHS_M2A3";
		
		_tankHunter	 = switch (true) do {
			case (isClass(configfile >> "CfgVehicles" >> "M1128_MGS_DG1_NOSLATDES")): {"M1128_MGS_DG1_NOSLATDES"};
			default {"rhsusf_stryker_m1134_d"};				
		};
		
		_smallTrHeli			=	"ADF_S70_T";
		_mediumTrHeli			=	"ADF_S70";
		_largeTrHeli			=	"ADF_S70_E";
		_cargoHeli				=	"RHS_CH_47F_10_cargo";
		_smallAH				=	"RHS_MELB_AH6M";
		_largeAH				=	"RHS_AH64D";
		_TrPlane				=	"RHS_C130J";
		_CargoPlane				=	"RHS_C130J_Cargo";
		
	// Planes
	
		_TrPlane = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "USAF_C130J")): {"USAF_C130J"};
			default {"RHS_C130J"};
			
		};	

		_CargoPlane = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "USAF_C130J_Cargo")): {"USAF_C130J_Cargo"};
			default {"RHS_C130J_Cargo"};
			
		};	
		
		_AttackCargoPlane = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "USAF_AC130U")): {"USAF_AC130U"};
			default {"RHS_C130J_Cargo"};
			
		};	

		_plane_L1 = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "bwi_a3_pc9a")): {"bwi_a3_pc9a"};
			default {"RHSGREF_A29B_HIDF"};
			
			};	
					
					
			_plane_L2 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "bwi_a3_pc9a_nta")): {"bwi_a3_pc9a_nta"};
				default {"rhs_l159_cdf_b_CDF"};
				
			};	
					
					
			_plane_L3 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "FIR_F18C_RAAF")): {"FIR_F18C_RAAF"};
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
	























