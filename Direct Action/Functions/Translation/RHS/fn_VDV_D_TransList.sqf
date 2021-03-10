	
	// Units
	
		_officer 				=	"rhs_vdv_des_officer";
		_teamLeader 			= 	"rhs_vdv_des_sergeant";
		_marksman 				= 	"rhs_vdv_des_marksman";
		_sniper					=	"rhs_vdv_des_marksman_asval";
		_spotter				=	"rhs_vdv_des_rifleman";
		_grenadier				=	"rhs_vdv_des_grenadier";
		_autoRifleman			= 	"rhs_vdv_des_arifleman";
		_gunner					=	"rhs_vdv_des_machinegunner";
		_medic					= 	"rhs_vdv_des_medic";
		_repairSpecialist		=	"rhs_vdv_des_engineer";
		_engineer				= 	"rhs_vdv_des_engineer";
		_guidedLAT				=	"rhs_vdv_des_LAT";
		_dumbLAT				=	"rhs_vdv_des_LAT";
		_missileSpecialistAT	= 	"rhs_vdv_des_grenadier_rpg";
		_missileSpecialistAA	=	"rhs_vdv_des_aa";
		_ammoBearer				= 	"rhs_vdv_des_machinegunner_assistant";
		_JTAC					= 	"rhs_vdv_des_rifleman";
		_explosivesSpecialist	= 	"rhs_vdv_des_rifleman";
		_uavOperator			= 	"rhsusf_army_ocp_uav";
		_paratrooper			=	"rhs_vdv_des_rifleman";
		_heliPilot 				=	"rhs_pilot_tan";
		_heliCrew				=	"rhs_pilot_tan";
		_fighterPilot			=	"rhs_pilot_tan";
		_pilot					=	"rhs_pilot_tan";
		_vehicleCrew			=  	"rhs_vdv_des_combatcrew";
		_diver 					=	"O_diver_F";
		_diverTeamLeader		=	"O_diver_TL_F";
		_diverExplosives		=	"O_diver_exp_F";


	// Vehicles
		
		_carrierPlane			= 	"B_Plane_Fighter_01_Stealth_F";
		_atTurret				=	"rhs_D30_at_vdv";
		_aaTurret				=	"RHS_ZU23_VDV";
		_mortar					=	"rhs_D30_vdv";
		_AttackCargoPlane		=	"USAF_AC130U";
		
		if (isClass(configfile >> "CfgMods" >> "UK3CB_BAF_Units")) then {
		
			_attackBoat				=	"UK3CB_BAF_RHIB_HMG_DDPM_RM";
			
		}else{
		
			_attackBoat				=	"O_Boat_Armed_01_hmg_F";
			
		};
		
		_quadBike 				=	"B_Quadbike_01_F";
		_smallCargoTruck		=	"C_Van_01_transport_F";
		_fuelTruck				=	"C_Van_01_fuel_F";
		_car					=	"rhs_tigr_m_vdv";
		_carHMG					=	"rhs_tigr_sts_vdv";
		_carAT					=	"rhs_tigr_sts_vdv";
		_Mrap					=	"rhsusf_m1240a1_usarmy_d";
		_MrapHMG				=	"rhsgref_BRDM2_vdv";
		_MrapGMG				=	"rhsgref_BRDM2_ATGM_vdv";
		_cargoTruck				=	"RHS_Ural_Flat_VDV_01";
		_lightIFV				=	"rhs_bmd2m";
		_tank					=	"rhs_t90sm_tv";
		_antiAirAPC				=	"rhs_zsu234_aa";
		_artilleryAPC			=	"rhs_2s3_tv";
		_wheeledIFV				=	"rhs_btr80a_vdv";
		_trackedAPC				=	"rhs_bmp2k_vdv";
		_tankHunter				=	"rhs_sprut_vdv";
		_smallTrHeli			=	"rhs_ka60_grey";
		_mediumTrHeli			=	"RHS_Mi8mt_vvs";
		_largeTrHeli			=	"RHS_Mi8mt_vvs";
		_cargoHeli				=	"RHS_Mi8mt_Cargo_vvs";
		_smallAH				=	"RHS_Ka52_vvs";
		_largeAH				=	"rhs_mi28n_vvs";
		
		_TrPlane = switch (true) do {
			case (isClass(configfile >> "CfgVehicles" >> "il76td_BBC_blue")): {"il76td_BBC_blue"};
			default {"RHS_AN2"};				
		};	
		
		_CargoPlane				=	"RHS_Mi8mt_Cargo_vvs";
		_trainerPlane			=	"rhs_l159_CDF";
		_fighterPlane			=	"rhs_mig29sm_vvs";
		_stealthFighterPlane	=	"RHS_T50_vvs_054";
		_groundAttackPlane		= 	"RHS_Su25SM_vvs";
		_propPlane				=	"RHS_AN2";
		_flag					=	"Flag_US_F";
		_marker					=	"flag_Russia";
		
	
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
		
			_carrierPlane,
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
			_trainerPlane,
			_fighterPlane,
			_stealthFighterPlane,
			_groundAttackPlane,
			_propPlane,
			_flag,
			_marker

		];


	_return = _allUnitTypes + _allVehicleTypes;
	
	_return	
























