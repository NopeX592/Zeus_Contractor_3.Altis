
	// Units
	
		_officer 				=	"ffaa_brilat_oficial_ds";
		_teamLeader 			= 	"ffaa_brilat_jefe_peloton_ds";
		_marksman 				= 	"ffaa_brilat_tirador_ds";
		_sniper					=	"ffaa_brilat_francotirador_accuracy_ds";
		_spotter				=	"ffaa_brilat_observador_ds";
		_grenadier				=	"ffaa_brilat_granadero_ds";
		_autoRifleman			= 	"ffaa_brilat_mg4_ds";
		_gunner					=	"ffaa_brilat_mg42_ds";
		_medic					= 	"ffaa_brilat_medico_ds";
		_repairSpecialist		=	"ffaa_brilat_ingeniero_ds";
		_engineer				= 	"ffaa_brilat_ingeniero_ds";
		_guidedLAT				=	"ffaa_brilat_c90_ds";
		_dumbLAT				=	"ffaa_brilat_c90_ds";
		_missileSpecialistAT	= 	"ffaa_brilat_alcotan_ds";
		_missileSpecialistAA	=	"ffaa_brilat_soldado_ds";
		_ammoBearer				= 	"ffaa_brilat_proveedor_mg4_ds";
		_JTAC					= 	"ffaa_brilat_soldado_ds";
		_explosivesSpecialist	= 	"ffaa_brilat_soldado_ds";
		_uavOperator			= 	"ffaa_brilat_operador_UAV_ds";
		_paratrooper			=	"ffaa_brilat_soldado_ds";
		_heliPilot 				=	"ffaa_piloto_famet_des";
		_heliCrew				=	"ffaa_piloto_famet_des";
		_fighterPilot			=	"ffaa_piloto_famet_des";
		_pilot					=	"ffaa_piloto_famet_des";
		_vehicleCrew			=  	"ffaa_crew_famet_des";
		_diver 					=	"B_diver_F";
		_diverTeamLeader		=	"B_diver_TL_F";
		_diverExplosives		=	"B_diver_exp_F";


	// Vehicles
	
		_atTurret				=	"ffaa_tow_tripode";
		_aaTurret				=	"ffaa_mistral_tripode";
		_mortar					=	"RHS_M252_D";
		_attackBoat 			= switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "UK3CB_BAF_RHIB_HMG_DDPM_RM")): {"UK3CB_BAF_RHIB_HMG_DDPM_RM"};
			default {"B_Boat_Armed_01_minigun_F"};
			
		};	
		
		_quadBike 				=	"ffaa_et_anibal";
		_smallCargoTruck		=	"ffaa_et_m250_municion_blin";
		_fuelTruck				=	"ffaa_et_m250_combustible_blin";
		_car					=	"ffaa_et_vamtac_trans";
		_carHMG					=	"ffaa_et_vamtac_m2";
		_carAT					=	"ffaa_et_vamtac_tow";
		_Mrap					=	"ffaa_et_vamtac_crows";
		_MrapHMG				=	"ffaa_et_lince_m2";
		_MrapGMG				=	"ffaa_et_lince_lag40";
		_cargoTruck				=	"B_T_Truck_01_flatbed_F";
		_lightIFV				=	"ffaa_et_rg31_samson";
		_tank					=	"ffaa_et_leopardo";
		_antiAirAPC				=	"ffaa_et_vamtac_mistral";
		_artilleryAPC			=	"ffaa_et_m250_sistema_nasams_blin";
		_wheeledIFV 			= 	"ffaa_et_toa_m2";		
		_trackedAPC				=	"ffaa_et_pizarro_mauser";
		_tankHunter				= 	"ffaa_et_toa_spike";
		
		_smallTrHeli = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "EC135Noirlu")): {"EC135Noirlu"};
			default {"ffaa_famet_ec135"};
			
		};	
		
		_mediumTrHeli			=	"ffaa_famet_cougar_armed";
		_largeTrHeli			=	"ffaa_nh90_tth_transport";
		_cargoHeli				=	"ffaa_nh90_tth_cargo";
		
		_smallAH = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "EC135Armedlu")): {"EC135Armedlu"};
			default {"RHS_MELB_AH6M"};
			
		};
		
		_largeAH				=	"ffaa_famet_tigre";


	// Planes
	
		_TrPlane = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "ffaa_ea_hercules")): {"ffaa_ea_hercules"};
			default {"RHS_C130J"};
			
		};	

		_CargoPlane = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "ffaa_ea_hercules_cargo")): {"ffaa_ea_hercules_cargo"};
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

				case (isClass(configfile >> "CfgVehicles" >> "ffaa_ar_harrier")): {"ffaa_ar_harrier"};
				default {"B_Plane_Fighter_01_Stealth_F"};
				
			};	


			_plane_L4 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "EAWS_EF2000_Spa_CAP")): {"EAWS_EF2000_Spa_CAP"};
				default {"rhsusf_f22"};
				
			};	

			_plane_L5 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "FMX_F35B_SP_B")): {"FMX_F35B_SP_B"};
				default {"rhsusf_f22"};
				
			};	

			_plane_L6 = switch (true) do {

				case (isClass(configfile >> "CfgVehicles" >> "FIR_F18C_SPAF")): {"FIR_F18C_SPAF"};
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
	























