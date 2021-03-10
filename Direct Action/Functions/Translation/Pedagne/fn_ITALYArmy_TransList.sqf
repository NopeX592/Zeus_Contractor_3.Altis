	
	// Units
	
		_officer 				=	"ASZ_operator_CM";
		_teamLeader 			= 	"ASZ_SOF_operator_01";
		_marksman 				= 	"ASZ_SOF_operator_04";
		_sniper					=	"ASZ_SOF_Sharpshooter_03";
		_spotter				=	"ASZ_SOF_Sharpshooter_02";
		_grenadier				=	"ASZ_SOF_operator_05";
		_autoRifleman			= 	"ASZ_SOF_operatorMG";
		_gunner					=	"ASZ_SOF_operatorMG";
		_medic					= 	"ASZ_SOF_operator_Medic";
		_repairSpecialist		=	"ASZ_SOF_sabotatore";
		_engineer				= 	"ASZ_SOF_sabotatore";
		_guidedLAT				=	"ASZ_SOF_operator_AT";
		_dumbLAT				=	"ASZ_SOF_operator_AT";
		_missileSpecialistAT	= 	"ASZ_SOF_operator_AT";
		_missileSpecialistAA	=	"ASZ_SOF_operator_AA";
		_ammoBearer				= 	"ASZ_SOF_operator_02";
		_JTAC					= 	"ASZ_SOF_operator_03";
		_explosivesSpecialist	= 	"ASZ_SOF_sabotatore";
		_uavOperator			= 	"ASZ_SOF_operator_02";
		_paratrooper			=	"ASZ_SOF_operator_02";
		_heliPilot 				=	"ASZ_Pilot_Hely_AM";
		_heliCrew				=	"ASZ_Pilot_Hely_AM";
		_fighterPilot			=	"ASZ_Pilot_EFA_AM";
		_pilot					=	"ASZ_Pilot_Air_cargo_AM";
		_vehicleCrew			=  	"ASZ_Driver_Wheel_EI";
		_diver 					=	"B_diver_F";
		_diverTeamLeader		=	"B_diver_TL_F";
		_diverExplosives		=	"B_diver_exp_F";
	

	// Vehicles
	
		_atTurret				=	"RHS_TOW_TriPod_D";
		_aaTurret				=	"RHS_Stinger_AA_pod_D";
		_mortar					=	"RHS_M119_D";
		_attackBoat				=	"sfp_strb90";
		_quadBike 				=	"ASZ_LR90_MM";
		_smallCargoTruck		=	"ASZ_ACTL6x6_EI_logistic";
		_fuelTruck				=	"ASZ_ACTL6x6_EI_fuel";
		_car					=	"ASZ_VM90spop";
		_carHMG					=	"ASZ_LR90_M2";
		_carAT					=	"ASZ_LR90_TOW";
		_Mrap					=	"ASZ_VTML_MM_TOW";
		_MrapHMG				=	"ASZ_VTML_long_range_MM_M2";
		_MrapGMG				=	"ASZ_VTML_MM_MK19";
		_cargoTruck				=	"B_T_Truck_01_flatbed_F";
		_lightIFV				=	"ASZ_PUMA6x6_hitrole";
		_tank					=   "ASZ_Ariete_camo_plus";
		
		_antiAirAPC				=	"RHS_M6_wd";
		_artilleryAPC			=	"rhsusf_m109_usarmy";
		_wheeledIFV				=	"ASZ_Freccia";
		_trackedAPC				=	"ASZ_AAV_EI";
		_tankHunter				=	"ASZ_Centauro_B1";
		_smallTrHeli			=	"ASZ_AH6_EI_reos";
		_mediumTrHeli			=	"ASZ_AB412_EI_reos";
		_largeTrHeli			=	"ASZ_NH90_EI_reos";
		_cargoHeli				=	"ASZ_CH47_EI";
		_smallAH				=	"ASZ_AH6_EI_ffar";
		_largeAH				=	"ASZ_A129_GA";
		
		// Planes
		
			_TrPlane = "DDL_C27J_AM";

			_CargoPlane = "ASZ_C130J_AM";

			_AttackCargoPlane = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "USAF_AC130U")): {"USAF_AC130U"};
				default {"RHS_C130J_Cargo"};
				
			};	
		
			_plane_L1 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "bwi_a3_t6a_10")): {"bwi_a3_t6a_10"};
				default {"RHSGREF_A29B_HIDF"};
				
			};	
					
					
			_plane_L2 = switch (true) do {

				default {"rhs_l159_cdf_b_CDF"};
				
			};	
					
					
			_plane_L3 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "ASZ_AV8B_MM_GBU")): {"ASZ_AV8B_MM_GBU"};
				default {"ASZ_AV8B_MM_GBU"};
				
			};	


			_plane_L4 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "EAWS_EF2000_ITA51_CAP")): {"EAWS_EF2000_ITA51_CAP"};
				default {"B_Plane_Fighter_01_F"};
				
			};	


			_plane_L5 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "FMX_F35B_IT_B")): {"FMX_F35B_IT_B"};
				default {"rhsusf_f22"};
				
			};	


			_plane_L6 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "Tornado_AWS_ADV_ita")): {"Tornado_AWS_ADV_ita"};
				default {"RHS_A10"};
				
			};
			
		_flag					=	"Flag_US_F";
		_marker					=	"flag_Italy";	
		
	
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
	























