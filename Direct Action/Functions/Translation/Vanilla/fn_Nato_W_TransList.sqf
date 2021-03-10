
	// Units
	
		_officer 				=	"B_W_officer_F";
		_teamLeader 			= 	"B_W_Soldier_TL_F";
		_marksman 				= 	"B_W_soldier_M_F";
		_sniper					=	"B_W_sniper_F";
		_spotter				=	"B_W_spotter_F";
		_grenadier				=	"B_W_Soldier_GL_F";
		_autoRifleman			= 	"B_W_soldier_AR_F";
		_gunner					=	"B_W_HeavyGunner_F";
		_medic					= 	"B_W_medic_F";
		_repairSpecialist		=	"B_W_soldier_repair_F";
		_engineer				= 	"B_W_engineer_F";
		_guidedLAT				=	"B_W_soldier_LAT_F";
		_dumbLAT				=	"B_W_soldier_LAT2_F";
		_missileSpecialistAT	= 	"B_W_soldier_AT_F";
		_missileSpecialistAA	=	"B_W_soldier_AA_F";
		_ammoBearer				= 	"B_W_Soldier_A_F";
		_JTAC					= 	"B_W_RadioOperator_F";
		_explosivesSpecialist	= 	"B_W_soldier_exp_F";
		_uavOperator			= 	"B_W_soldier_UAV_F";
		_paratrooper			=	"B_W_soldier_PG_F";
		_heliPilot 				=	"B_W_Helipilot_F";
		_heliCrew				=	"B_W_helicrew_F";
		_fighterPilot			=	"B_Fighter_Pilot_F";
		_pilot					=	"B_Pilot_F";
		_vehicleCrew			=  	"B_W_crew_F";
		_diver 					=	"B_W_diver_F";
		_diverTeamLeader		=	"B_W_diver_TL_F";
		_diverExplosives		=	"B_W_diver_exp_F";
	
	
	// Vehicles
	
		_atTurret				=	"B_T_static_AT_F";
		_aaTurret				=	"B_T_static_AA_F";
		_mortar					=	"B_T_Mortar_01_F";
		_AttackCargoPlane		=	"B_T_VTOL_01_armed_F";
		_attackBoat				=	"B_T_Boat_Armed_01_minigun_F";
		_quadBike 				=	"B_T_Quadbike_01_F";
		_smallCargoTruck		=	"C_Van_01_transport_F";
		_fuelTruck				=	"C_Van_01_fuel_F";
		_car					=	"B_T_LSV_01_unarmed_F";
		_carHMG					=	"B_T_LSV_01_armed_F";
		_carAT					=	"B_T_LSV_01_AT_F";
		_Mrap					=	"B_T_MRAP_01_F";
		_MrapHMG				=	"B_T_MRAP_01_hmg_F";
		_MrapGMG				=	"B_T_MRAP_01_gmg_F";
		_cargoTruck				=	"B_T_Truck_01_flatbed_F";
		_lightIFV				=	"I_LT_01_cannon_F";
		_tank					=	"B_T_MBT_01_TUSK_F";
		_antiAirAPC				=	"B_T_APC_Tracked_01_AA_F";
		_artilleryAPC			=	"B_T_MBT_01_arty_F";
		_wheeledIFV				=	"B_T_APC_Wheeled_01_cannon_F";
		_trackedAPC				=	"B_T_APC_Tracked_01_rcws_F";
		_tankHunter				=	"B_T_AFV_Wheeled_01_up_cannon_F";
		_smallTrHeli			=	"B_Heli_Light_01_F";
		_mediumTrHeli			=	"B_Heli_Transport_01_F";
		_largeTrHeli			=	"B_Heli_Transport_03_F";
		_cargoHeli				=	"B_Heli_Transport_03_unarmed_F";
		_smallAH				=	"B_Heli_Light_01_dynamicLoadout_F";
		_largeAH				=	"B_Heli_Attack_01_dynamicLoadout_F";
		_TrPlane				=	"B_T_VTOL_01_infantry_F";
		_CargoPlane				=	"B_T_VTOL_01_vehicle_F";
		_plane_L1				=	"I_Plane_Fighter_03_CAS_F";
		_plane_L2				=	"I_Plane_Fighter_03_AA_F";
		_plane_L3				=	"B_Plane_Fighter_01_Stealth_F";
		_plane_L4				=	"B_Plane_Fighter_01_F";
		_plane_L5				= 	"B_Plane_Fighter_01_Cluster_F";
		_plane_L6				= 	"B_Plane_CAS_01_dynamicLoadout_F";	
		_flag					=	"Flag_NATO_F";
		_marker					=	"flag_NATO";

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






















