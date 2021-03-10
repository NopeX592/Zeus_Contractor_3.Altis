

	// Units
	
		_officer 				=	"rhsusf_army_ocp_officer";
		_teamLeader 			= 	"rhsusf_army_ocp_teamleader";
		_marksman 				= 	"rhsusf_army_ocp_marksman";
		_sniper					=	"rhsusf_army_ocp_sniper_m107";
		_spotter				=	"rhsusf_army_ocp_sniper";
		_grenadier				=	"rhsusf_army_ocp_grenadier";
		_autoRifleman			= 	"rhsusf_army_ocp_autorifleman";
		_gunner					=	"rhsusf_army_ocp_machinegunner";
		_medic					= 	"rhsusf_army_ocp_medic";
		_repairSpecialist		=	"rhsusf_army_ocp_engineer";
		_engineer				= 	"rhsusf_army_ocp_engineer";
		_guidedLAT				=	"rhsusf_army_ocp_riflemanat";
		_dumbLAT				=	"rhsusf_army_ocp_riflemanat";
		_missileSpecialistAT	= 	"rhsusf_army_ocp_arb_maaws";
		_missileSpecialistAA	=	"rhsusf_army_ocp_aa";
		_ammoBearer				= 	"rhsusf_army_ocp_autoriflemana";
		_JTAC					= 	"rhsusf_army_ocp_jfo";
		_explosivesSpecialist	= 	"rhsusf_army_ocp_explosives";
		_uavOperator			= 	"rhsusf_army_ocp_uav";
		_paratrooper			=	"rhsusf_army_ocp_rifleman_101st";
		_heliPilot 				=	"rhsusf_army_ocp_helipilot";
		_heliCrew				=	"rhsusf_army_ocp_helicrew";
		_fighterPilot			=	"rhsusf_airforce_jetpilot";
		_pilot					=	"rhsusf_airforce_pilot";
		_vehicleCrew			=  	"rhsusf_army_ocp_combatcrewman";
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
		
			_attackBoat				=	"B_Boat_Armed_01_minigun_F";
			
		};
		
		_quadBike 				=	"rhsusf_mrzr4_d";
		_smallCargoTruck		=	"rhsusf_M1084A1R_SOV_M2_D_fmtv_socom";
		_fuelTruck				=	"rhsusf_m1152_rsv_usarmy_d";
		_car					=	"rhsusf_m998_d_4dr";
		_carHMG					=	"rhsusf_m1043_d_m2";
		_carAT					=	"rhsusf_m1045_d";
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
		_mediumTrHeli			=	"RHS_UH60M_d";
		_largeTrHeli			=	"RHS_CH_47F_10";
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

		case (isClass(configfile >> "CfgVehicles" >> "bwi_a3_t6a")): {"bwi_a3_t6a"};
		default {"RHSGREF_A29B_HIDF"};
		
		};	
				
				
		_plane_L2 = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "bwi_a3_at6b")): {"bwi_a3_at6b"};
			default {"rhs_l159_cdf_b_CDF"};
			
		};	
				
				
		_plane_L3 = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "FIR_F16C")): {"FIR_F16C"};
			case (isClass(configfile >> "CfgVehicles" >> "USAF_F35A_STEALTH")): {"USAF_F35A_STEALTH"};
			default {"B_Plane_Fighter_01_Stealth_F"};
			
		};	


		_plane_L4 = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "FIR_F15E_SJ")): {"FIR_F15E_SJ"};
			case (isClass(configfile >> "CfgVehicles" >> "USAF_F35A")): {"USAF_F35A"};
			default {"B_Plane_Fighter_01_F"};
			
		};	


		_plane_L5 = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "FIR_F22")): {"FIR_F22"};
			case (isClass(configfile >> "CfgVehicles" >> "USAF_F22_Heavy")): {"USAF_F22_Heavy"};
			default {"rhsusf_f22"};
			
		};	


		_plane_L6 = switch (true) do {

			case (isClass(configfile >> "CfgVehicles" >> "FIR_A10C_MD")): {"FIR_A10C_MD"};
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
	























