
	
	// Units
	
		_officer 				=	"rhsusf_socom_marsoc_elementleader";
		_teamLeader 			= 	"rhsusf_socom_marsoc_teamleader";
		_marksman 				= 	"rhsusf_socom_marsoc_marksman";
		_sniper					=	"rhsusf_socom_marsoc_sniper";
		_spotter				=	"rhsusf_socom_marsoc_spotter";
		_grenadier				=	"rhsusf_socom_marsoc_cso_grenadier";
		_autoRifleman			= 	"rhsusf_army_ocp_arb_autorifleman";
		_gunner					=	"rhsusf_army_ocp_arb_machinegunner";
		_medic					= 	"rhsusf_socom_marsoc_sarc";
		_repairSpecialist		=	"rhsusf_socom_marsoc_cso_mechanic";
		_engineer				= 	"rhsusf_socom_marsoc_cso_mechanic";
		_guidedLAT				=	"rhsusf_army_ocp_arb_riflemanat";
		_dumbLAT				=	"rhsusf_army_ocp_arb_riflemanat";
		_missileSpecialistAT	= 	"rhsusf_army_ocp_javelin";
		_missileSpecialistAA	=	"rhsusf_socom_marsoc_cso_grenadier";
		_ammoBearer				= 	"rhsusf_army_ocp_arb_autoriflemana";
		_JTAC					= 	"rhsusf_socom_marsoc_jtac";
		_explosivesSpecialist	= 	"rhsusf_socom_marsoc_cso_eod";
		_uavOperator			= 	"rhsusf_socom_marsoc_cso";
		_paratrooper			=	"rhsusf_socom_marsoc_cso";
		_heliPilot 				=	"rhsusf_army_ocp_helipilot";
		_heliCrew				=	"rhsusf_army_ocp_helicrew";
		_fighterPilot			=	"rhsusf_airforce_jetpilot";
		_pilot					=	"rhsusf_airforce_pilot";
		_vehicleCrew			=  	"rhsusf_army_ocp_combatcrewman";
		_diver 					=	"B_T_Diver_F";
		_diverTeamLeader		=	"B_T_Diver_TL_F";
		_diverExplosives		=	"B_T_Diver_Exp_F";
		_TrPlane				=	"RHS_C130J";
		_CargoPlane				=	"RHS_C130J_Cargo";


	// Vehicles
	
		_atTurret				=	"RHS_TOW_TriPod_D";
		_aaTurret				=	"RHS_Stinger_AA_pod_D";
		_mortar					=	"RHS_M119_D";
		
		if (isClass(configfile >> "CfgMods" >> "UK3CB_BAF_Units")) then {
		
			_attackBoat				=	"UK3CB_BAF_RHIB_HMG_DDPM_RM";
			
		}else{
		
			_attackBoat				=	"B_Boat_Armed_01_minigun_F";
			
		};
		
		_quadBike 				=	"rhsusf_mrzr4_d";
		_smallCargoTruck		=	"rhsusf_M1084A1R_SOV_M2_D_fmtv_socom";
		_fuelTruck				=	"rhsusf_M1078A1R_SOV_M2_D_fmtv_socom";
		_car					=	"rhsusf_m1151_usarmy_d";
		_carHMG					=	"B_LSV_01_armed_F";
		_carAT					=	"B_LSV_01_AT_F";
		_Mrap					=	"rhsusf_m1151_m2crows_usarmy_d";
		_MrapHMG				=	"rhsusf_m1240a1_m2crows_usarmy_d";
		_MrapGMG				=	"rhsusf_m1240a1_mk19crows_usarmy_d";
		_cargoTruck				=	"B_Truck_01_flatbed_F";
		_lightIFV				=	"rhsusf_M1117_D";
		_tank					=	"rhsusf_m1a1aim_tuski_d";
		_antiAirAPC				=	"RHS_M6";
		_artilleryAPC			=	"rhsusf_m109d_usarmy";
		
		_wheeledIFV = switch (true) do {
			case (isClass(configfile >> "CfgVehicles" >> "Cha_Des1_LAV25A2")): {"Cha_Des1_LAV25A2"};
			default {"rhsusf_stryker_m1126_mk19_d"};				
		};
		
		_trackedAPC				=	"RHS_M2A3";
		
		_tankHunter	 = switch (true) do {
			case (isClass(configfile >> "CfgVehicles" >> "M1128_MGS_DG1_NOSLATDES")): {"M1128_MGS_DG1_NOSLATDES"};
			default {"rhsusf_stryker_m1134_d"};				
		};
		
		_smallTrHeli			=	"RHS_MELB_MH6M";
		_mediumTrHeli			=	"RHS_UH60M";
		_largeTrHeli			=	"rhsusf_CH53E_USMC_D";
		_cargoHeli 				= 	"rhsusf_CH53e_USMC_cargo";				
		_smallAH				=	"RHS_UH1Y_d";
		_largeAH				=	"RHS_AH1Z";
		
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
				case (isClass(configfile >> "CfgVehicles" >> "bwi_a3_t6a_2")): {"bwi_a3_t6a_2"};
				default {"RHSGREF_A29B_HIDF"};	
		};	
				
				
		_plane_L2 = switch (true) do {
			case (isClass(configfile >> "CfgVehicles" >> "bwi_a3_t6a_11")): {"bwi_a3_t6a_11"};
			default {"rhs_l159_cdf_b_CDF"};				
		};	
				
				
		_plane_L3 = switch (true) do {
			case (isClass(configfile >> "CfgVehicles" >> "FIR_FA18E")): {"FIR_FA18E"};
			case (isClass(configfile >> "CfgVehicles" >> "USAF_F35A_STEALTH")): {"USAF_F35A_STEALTH"};
			default {"B_Plane_Fighter_01_Stealth_F"};				
		};	


		_plane_L4 = switch (true) do {
			case (isClass(configfile >> "CfgVehicles" >> "F_35C")): {"F_35C"};
			case (isClass(configfile >> "CfgVehicles" >> "FIR_F35B_Standard")): {"FIR_F35B_Standard"};
			case (isClass(configfile >> "CfgVehicles" >> "USAF_F35A_STEALTH")): {"USAF_F35A_STEALTH"};
			default {"B_Plane_Fighter_01_F"};				
		};	


		_plane_L5 = switch (true) do {
			case (isClass(configfile >> "CfgVehicles" >> "FIR_EA18G_Blank")): {"FIR_EA18G_Blank"};
			case (isClass(configfile >> "CfgVehicles" >> "USAF_F35A")): {"USAF_F35A"};
			default {"rhsusf_f22"};				
		};	


		_plane_L6 = switch (true) do {
			case (isClass(configfile >> "CfgVehicles" >> "FIR_FA18F_VFA106")): {"FIR_FA18F_VFA106"};
			case (isClass(configfile >> "CfgVehicles" >> "USAF_A10")): {"USAF_A10"};
			default {"RHS_A10"};				
		};	
		
		_flag					=	"Flag_US_F";
		_marker					=	"flag_USA";

		
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























