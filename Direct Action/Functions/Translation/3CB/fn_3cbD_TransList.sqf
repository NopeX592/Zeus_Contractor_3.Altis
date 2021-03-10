	
	// Units
	
		_officer 				=	"UK3CB_BAF_Officer_DDPM";
		_teamLeader 			= 	"UK3CB_BAF_SC_DDPM";
		_marksman 				= 	"UK3CB_BAF_Marksman_DDPM";
		_sniper					=	"UK3CB_BAF_Sniper_DDPM_Ghillie_L115";
		_spotter				=	"UK3CB_BAF_Spotter_DDPM_Ghillie_L129";
		_grenadier				=	"UK3CB_BAF_Grenadier_DDPM";
		_autoRifleman			= 	"UK3CB_BAF_LSW_DDPM";
		_gunner					=	"UK3CB_BAF_MGGPMG_DDPM";
		_medic					= 	"UK3CB_BAF_Medic_DDPM";
		_repairSpecialist		=	"UK3CB_BAF_Repair_DDPM";
		_engineer				= 	"UK3CB_BAF_Engineer_DDPM";
		_guidedLAT				=	"UK3CB_BAF_LAT_DDPM";
		_dumbLAT				=	"UK3CB_BAF_LAT_ILAW_DDPM";
		_missileSpecialistAT	= 	"UK3CB_BAF_MAT_DDPM";
		_missileSpecialistAA	=	"UK3CB_BAF_MGGPMG_DDPM";
		_ammoBearer				= 	"UK3CB_BAF_Rifleman_762_DDPM";
		_JTAC					= 	"UK3CB_BAF_FAC_DDPM";
		_explosivesSpecialist	= 	"UK3CB_BAF_Explosive_DDPM";
		_uavOperator			= 	"UK3CB_BAF_UAV_MTP_RM";
		_paratrooper			=	"UK3CB_BAF_Rifleman_DDPM";
		_heliPilot 				=	"UK3CB_BAF_HeliPilot_Army_DDPM";
		_heliCrew				=	"UK3CB_BAF_HeliCrew_DDPM";
		_fighterPilot			=	"UK3CB_BAF_HeliPilot_RAF_DDPM";
		_pilot					=	"UK3CB_BAF_HeliPilot_RAF_DDPM";
		_vehicleCrew			=  	"UK3CB_BAF_Crewman_DDPM";
		_diver 					=	"B_diver_F";
		_diverTeamLeader		=	"B_diver_TL_F";
		_diverExplosives		=	"B_diver_exp_F";
	

	// Vehicles
	
		_atTurret				=	"RHS_TOW_TriPod_D";
		_aaTurret				=	"RHS_Stinger_AA_pod_D";
		_mortar					=	"RHS_M119_D";
		_attackBoat				=	"UK3CB_BAF_RHIB_HMG_DDPM_RM";
		_quadBike 				=	"rhsusf_mrzr4_d";
		_smallCargoTruck		=	"UK3CB_BAF_MAN_HX58_Cargo_Sand_A_DDPM";
		_fuelTruck				=	"UK3CB_BAF_Husky_Logistics_GPMG_Sand_DDPM";
		_car					=	"UK3CB_BAF_Jackal2_L2A1_D_MTP_RM";
		_carHMG					=	"UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A_DDPM";
		_carAT					=	"UK3CB_BAF_LandRover_WMIK_Milan_FFR_Sand_A_DDPM";
		_Mrap					=	"UK3CB_BAF_Panther_GPMG_Sand_A_MTP";
		_MrapHMG				=	"UK3CB_BAF_Husky_Passenger_HMG_Sand_DDPM";
		_MrapGMG				=	"UK3CB_BAF_Husky_Passenger_GMG_Sand_MTP";
		_cargoTruck				=	"UK3CB_BAF_MAN_HX58_Cargo_Sand_A_DDPM";
		_lightIFV				=	"UK3CB_BAF_Coyote_Passenger_L111A1_D_DDPM";
		
		_tank	 = switch (true) do {
			case (isClass(configfile >> "CfgVehicles" >> "Burnes_FV4034_02")): {"Burnes_FV4034_02"};
			default {"rhsusf_m1a1fep_d"};				
		};
		
		_antiAirAPC				=	"RHS_M6";
		_artilleryAPC			=	"rhsusf_m109d_usarmy";
		_wheeledIFV				=	"UK3CB_BAF_FV432_Mk3_GPMG_Sand_MTP";
		_trackedAPC				=	"UK3CB_BAF_Warrior_A3_D_MTP";
		_tankHunter				=	"B_AFV_Wheeled_01_up_cannon_F";
		_smallTrHeli			=	"RHS_MELB_MH6M";
		_mediumTrHeli			=	"UK3CB_BAF_Wildcat_AH1_TRN_8A_DDPM";
		_largeTrHeli			=	"UK3CB_BAF_Merlin_HC3_18_GPMG_DDPM";
		_cargoHeli				=	"UK3CB_BAF_Merlin_HC3_Cargo_DDPM";
		_smallAH				=	"UK3CB_BAF_Wildcat_AH1_CAS_8D_DDPM";
		_largeAH				=	"UK3CB_BAF_Apache_AH1_Arctic";
		
		// Planes
		
			_TrPlane = "UK3CB_BAF_Hercules_C4";

			_CargoPlane = "UK3CB_BAF_Hercules_C4";

			_AttackCargoPlane = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "USAF_AC130U")): {"USAF_AC130U"};
				default {"RHS_C130J_Cargo"};
				
			};	
		
			_plane_L1 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "bwi_a3_t6c_raf_nta_1")): {"bwi_a3_t6c_raf_nta_1"};
				case (isClass(configfile >> "CfgVehicles" >> "bwi_a3_t6a_nta_2")): {"bwi_a3_t6a_nta_2"};
				default {"RHSGREF_A29B_HIDF"};
				
			};	
					
					
			_plane_L2 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "bwi_a3_at6b_raf_1")): {"bwi_a3_at6b_raf_1"};
				case (isClass(configfile >> "CfgVehicles" >> "bwi_a3_t6a_nta_2")): {"bwi_a3_t6a_nta_2"};
				default {"rhs_l159_cdf_b_CDF"};
				
			};	
					
					
			_plane_L3 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "FIR_AV8B_GR7A_Lucy")): {"FIR_AV8B_GR7A_Lucy"};
				case (isClass(configfile >> "CfgVehicles" >> "USAF_F35A_STEALTH")): {"USAF_F35A_STEALTH"};
				default {"B_Plane_Fighter_01_Stealth_F"};
				
			};	


			_plane_L4 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "EAWS_EF2000_rafhist_CAP")): {"EAWS_EF2000_rafhist_CAP"};
				case (isClass(configfile >> "CfgVehicles" >> "USAF_F35A_STEALTH")): {"USAF_F35A_STEALTH"};
				default {"B_Plane_Fighter_01_F"};
				
			};	


			_plane_L5 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "FIR_F35B_RAF01")): {"FIR_F35B_RAF01"};
				case (isClass(configfile >> "CfgVehicles" >> "USAF_F35A")): {"USAF_F35A"};
				default {"rhsusf_f22"};
				
			};	


			_plane_L6 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "Tornado_AWS_camo_uk")): {"Tornado_AWS_camo_uk"};
				case (isClass(configfile >> "CfgVehicles" >> "USAF_A10")): {"USAF_A10"};
				default {"RHS_A10"};
				
			};
			
		_flag					=	"Flag_US_F";
		_marker					=	"flag_UK";	
		
	
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
	























