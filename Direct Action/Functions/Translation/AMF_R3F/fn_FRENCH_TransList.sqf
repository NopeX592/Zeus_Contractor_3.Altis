
	// Units
	
		_officer 				=	"B_FR_Officier_Terrain_01";
		_teamLeader 			= 	"B_FR_Chef_de_groupe_01";
		_marksman 				= 	"B_BFR_Tireur_de_precision_SCAR_H_01";
		_sniper					=	"B_BFR_Tireur_de_precision_FrF2_01";
		_spotter				=	"B_FR_Spotteur_01";
		_grenadier				=	"B_FR_Grenadier_01";
		_autoRifleman			= 	"B_FR_Fusilier_auto_01";
		_gunner					=	"B_FR_Gunner_01";
		_medic					= 	"B_FR_Infirmier_01";
		_repairSpecialist		=	"B_FR_Sapeur_01";
		_engineer				= 	"B_FR_Sapeur_01";
		_guidedLAT				=	"B_FR_Fusilier_AC_01";
		_dumbLAT				=	"B_FR_Fusilier_AC_01";
		_missileSpecialistAT	= 	"B_FR_Fusilier_Missile_01";
		_missileSpecialistAA	=	"B_FR_Fusilier_01";
		_ammoBearer				= 	"B_FR_Equipage_01";
		_JTAC					= 	"B_FR_Fusilier_01";
		_explosivesSpecialist	= 	"B_FR_Sapeur_01";
		_uavOperator			= 	"B_FR_Fusilier_01";
		_paratrooper			=	"B_FR_Fusilier_01";
		_heliPilot 				=	"B_FR_Pilote_helico_01";
		_heliCrew				=	"B_FR_Pilote_helico_01";
		_fighterPilot			=	"B_FR_Pilote_Chasse_01";
		_pilot					=	"B_BFR_Pilote_01";
		_vehicleCrew			=  	"B_FR_Equipage_tank_01";
		_diver 					=	"B_diver_F";
		_diverTeamLeader		=	"B_diver_TL_F";
		_diverExplosives		=	"B_diver_exp_F";


	// Vehicles
	
		_atTurret				=	"R3F_MMP_STATIC";
		_aaTurret				=	"RHS_Stinger_AA_pod_D";
		_mortar					=	"R3F_MO81_LLR";
		_attackBoat 			= switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "UK3CB_BAF_RHIB_HMG_DDPM_RM")): {"UK3CB_BAF_RHIB_HMG_DDPM_RM"};
			default {"B_Boat_Armed_01_minigun_F"};
			
		};	
		
		_quadBike 				=	"B_T_Quadbike_01_F";
		_smallCargoTruck		=	"C_Van_01_transport_F";
		_fuelTruck				=	"C_Van_01_fuel_F";
		_car					=	"R3F_PVP_CE";
		_carHMG					=	"R3F_PVP_FN_CE";
		_carAT					=	"R3F_PVP_WASP_CE";
		_Mrap					=	"R3F_VBMR";
		_MrapHMG				=	"R3F_VBMR_TOP_127";
		_MrapGMG				=	"R3F_VBMR_TOP_LG40";
		_cargoTruck				=	"B_T_Truck_01_flatbed_F";
		_lightIFV				=	"rhsusf_m113_usarmy";
		_tank					=	"B_FR_Leclerc_01";
		_antiAirAPC				=	"RHS_M6_wd";
		_artilleryAPC			=	"rhsusf_m109_usarmy";
		_wheeledIFV 			= 	"B_FR_VAB_Ultima_TOP_01";		
		_trackedAPC				=	"B_FR_AMX_10_RCR_01";
		_tankHunter				= 	"B_FR_AMX_10_RCR_01";
		
		_smallTrHeli = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "EC135Noirlu")): {"EC135Noirlu"};
			default {"RHS_MELB_MH6M"};
			
		};	
	
		_mediumTrHeli			=	"B_FR_AS565_Panther_Marine_Nationale_01";
		_largeTrHeli			=	"B_FR_H225_MCaracal_01";
		_cargoHeli				=	"B_FR_H225_MCaracal_01";
		

		_smallAH = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "EC135Armedlu")): {"EC135Armedlu"};
			default {"RHS_MELB_AH6M"};
			
		};
		
		_largeAH = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "ATM_Tiger_CE_CAS")): {"ATM_Tiger_CE_CAS"};
			default {"RHS_AH64D_wd"};
			
		};	


	// Planes
	
		_TrPlane = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "B_FR_Casa_C235_01")): {"B_FR_Casa_C235_01"};
			default {"RHS_C130J"};
			
		};	

		_CargoPlane = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "B_FR_Casa_C235_01")): {"B_FR_Casa_C235_01"};
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

				case (isClass(configfile >> "CfgVehicles" >> "B_AMF_PLANE_FIGHTER_02_F")): {"B_AMF_PLANE_FIGHTER_02_F"};
				default {"B_Plane_Fighter_01_Stealth_F"};
				
			};	


			_plane_L4 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "B_FR_Mirage_2000_5F_01")): {"B_FR_Mirage_2000_5F_01"};
				default {"rhsusf_f22"};
				
			};	

			_plane_L5 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "AMF_RAFALE_M_01_F")): {"AMF_RAFALE_M_01_F"};
				default {"rhsusf_f22"};
				
			};	

			_plane_L6 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "B_FR_Rafale_M_01")): {"B_FR_Rafale_M_01"};
				default {"RHS_A10"};
				
			};
				
		_flag					=	"Flag_US_F";
		_marker					=	"flag_France";


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
	























