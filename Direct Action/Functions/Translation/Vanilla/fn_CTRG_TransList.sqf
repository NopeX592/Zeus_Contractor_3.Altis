
	// Units
	
		_officer 				=	"B_CTRG_Soldier_TL_tna_F";
		_teamLeader 			= 	"";
		_marksman 				= 	"B_CTRG_Soldier_M_tna_F";
		_sniper					=	"";
		_spotter				=	"";
		_grenadier				=	"";
		_autoRifleman			= 	"B_CTRG_Soldier_AR_tna_F";
		_gunner					=	"";
		_medic					= 	"B_CTRG_Soldier_Medic_tna_F";
		_repairSpecialist		=	"";
		_engineer				= 	"B_CTRG_Soldier_LAT_tna_F";
		_guidedLAT				=	"";
		_dumbLAT				=	"";
		_missileSpecialistAT	= 	"B_CTRG_Soldier_LAT2_tna_F";
		_missileSpecialistAA	=	"";
		_ammoBearer				= 	"";
		_JTAC					= 	"B_CTRG_Soldier_JTAC_tna_F";
		_explosivesSpecialist	= 	"B_CTRG_Soldier_Exp_tna_F";
		_uavOperator			= 	"";
		_paratrooper			=	"";
		_heliPilot 				=	"B_W_Helipilot_F";
		_heliCrew				=	"";
		_fighterPilot			=	"";
		_pilot					=	"";
		_vehicleCrew			=  	"B_W_Crew_F";
		_diver 					=	"";
		_diverTeamLeader		=	"";
		_diverExplosives		=	"";
	
	
	// Vehicles
	
		_atTurret				=	"B_T_static_AT_F";
		_aaTurret				=	"B_T_static_AA_F";
		_mortar					=	"B_T_Mortar_01_F";
		_AttackCargoPlane		=	"B_T_VTOL_01_armed_F";
		_attackBoat				=	"B_T_Boat_Armed_01_minigun_F";
		_quadBike 				=	"B_T_Quadbike_01_F";
		_smallCargoTruck		=	"C_Van_01_transport_F";
		_fuelTruck				=	"C_Van_01_fuel_F";
		_car					=	"B_CTRG_LSV_01_light_F";
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
		_largeTrHeli			=	"I_Heli_Transport_02_F";
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
		_flag					=	"Flag_CTRG_F";
		_marker 				=	"flag_CTRG";
		

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
			_flag,
			_marker 

		];


	_return = _allUnitTypes + _allVehicleTypes;
	
	_return	
	
















