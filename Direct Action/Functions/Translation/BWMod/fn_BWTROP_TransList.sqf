
	// Units
	
		_officer 				=	"BWA3_Officer_Tropen";
		_teamLeader 			= 	"BWA3_TL_Tropen";
		_marksman 				= 	"BWA3_Marksman_Tropen";
		_sniper					=	"BWA3_Sniper_G29_Tropen";
		_spotter				=	"BWA3_Spotter_Tropen";
		_grenadier				=	"BWA3_Grenadier_Tropen";
		_autoRifleman			= 	"BWA3_MachineGunner_MG4_Tropen";
		_gunner					=	"BWA3_MachineGunner_MG3_Tropen";
		_medic					= 	"BWA3_Medic_Tropen";
		_repairSpecialist		=	"BWA3_Medic_Tropen";
		_engineer				= 	"BWA3_Crew_Tropen";
		_guidedLAT				=	"BWA3_RiflemanAT_PzF3_Tropen";
		_dumbLAT				=	"BWA3_RiflemanAT_RGW90_Tropen";
		_missileSpecialistAT	= 	"BWA3_RiflemanAT_CG_Tropen";
		_missileSpecialistAA	=	"BWA3_RiflemanAA_Fliegerfaust_Tropen";
		_ammoBearer				= 	"";
		_JTAC					= 	"BWA3_recon_Radioman_Tropen";
		_explosivesSpecialist	= 	"BWA3_Grenadier_G27_Tropen";
		_uavOperator			= 	"BWA3_Rifleman_Tropen";
		_paratrooper			=	"BWA3_Rifleman_G27_Tropen";
		_heliPilot 				=	"BWA3_Helipilot";
		_heliCrew				=	"BWA3_Helipilot";
		_fighterPilot			=	"BWA3_Helipilot";
		_pilot					=	"BWA3_Helipilot";
		_vehicleCrew			=  	"BWA3_Crew_Tropen";
		_diver 					=	"B_diver_F";
		_diverTeamLeader		=	"B_diver_TL_F";
		_diverExplosives		=	"B_diver_exp_F";
		


	// Vehicles
	
		_atTurret				=	"Redd_Milan_Static";
		_aaTurret				=	"RHS_Stinger_AA_pod_D";
		_mortar					=	"Redd_Tank_M120_Tampella";
		_attackBoat 			= switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "UK3CB_BAF_RHIB_HMG_DDPM_RM")): {"UK3CB_BAF_RHIB_HMG_DDPM_RM"};
			default {"B_Boat_Armed_01_minigun_F"};
			
		};	
		
		_quadBike 				=	"Redd_Tank_LKW_leicht_gl_Wolf_Tropentarn_FueFu";
		_smallCargoTruck		=	"rnt_lkw_5t_mil_gl_kat_i_transport_trope";
		_fuelTruck				=	"rnt_lkw_5t_mil_gl_kat_i_fuel_trope";
		_car					=	"KGB_B_MRAP_03_F_DES";
		_carHMG					=	"KGB_B_MRAP_03_hmg_F_DES";
		_carAT					=	"KGB_B_MRAP_03_gmg_F_DES";
		_Mrap					=	"BWA3_Eagle_FLW100_Tropen";
		_MrapHMG				=	"BWA3_Dingo2_FLW200_GMW_CG13_Tropen";
		_MrapGMG				=	"BWA3_Dingo2_FLW200_M2_CG13_Tropen";
		_cargoTruck				=	"B_T_Truck_01_flatbed_F";
		_lightIFV				=	"Redd_Tank_Wiesel_1A4_MK20_Tropentarn";
		_tank					=	"BWA3_Leopard2_Tropen";
		_antiAirAPC				=	"Redd_Tank_Gepard_1A2_Tropentarn";
		_artilleryAPC			=	"rhsusf_m109d_usarmy";
		_wheeledIFV 			= 	"rnt_sppz_2a2_luchs_tropentarn";		
		_trackedAPC				=	"BWA3_Puma_Tropen";
		_tankHunter				= 	"Redd_Marder_1A5_Tropentarn";
		_smallTrHeli			=	"bw_bo105_p1m";
		_mediumTrHeli			=	"bw_nh90_armed";
		_largeTrHeli			=	"kyo_MH47E_Ramp";
		_cargoHeli				=	"kyo_MH47E_Ramp";
		_smallAH				=	"bw_ec135_fz_raketen";
		_largeAH				=	"BWA3_Tiger_RMK_Universal";

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

				default {"RHSGREF_A29B_HIDF"};
			
			};	
					
					
			_plane_L2 = switch (true) do {
				
				default {"rhs_l159_cdf_b_CDF"};
				
			};	
					
					
			_plane_L3 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "EAWS_EF2000_Genericblu_CAP")): {"EAWS_EF2000_Genericblu_CAP"};
				case (isClass(configfile >> "CfgVehicles" >> "USAF_F35A_STEALTH")): {"USAF_F35A_STEALTH"};
				default {"B_Plane_Fighter_01_Stealth_F"};
				
			};	


			_plane_L4 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "EAWS_EF2000_GER_CAP")): {"EAWS_EF2000_GER_CAP"};
				case (isClass(configfile >> "CfgVehicles" >> "USAF_F35A_STEALTH")): {"USAF_F35A_STEALTH"};
				default {"B_Plane_Fighter_01_F"};
				
			};	

			_plane_L5 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "FIR_F35B_MFG2")): {"FIR_F35B_MFG2"};
				case (isClass(configfile >> "CfgVehicles" >> "USAF_F35A")): {"USAF_F35A"};
				default {"rhsusf_f22"};
				
			};	

			_plane_L6 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "Tornado_AWS_GER")): {"Tornado_AWS_GER"};
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
	























