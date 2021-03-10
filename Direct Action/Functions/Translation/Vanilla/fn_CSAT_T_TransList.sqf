
	// Units
	
		_officer 				=	"O_T_Officer_F";
		_teamLeader 			= 	"O_T_Soldier_TL_F";
		_marksman 				= 	"O_T_Soldier_M_F";
		_sniper					=	"O_T_Sniper_F";
		_spotter				=	"O_T_Spotter_F";
		_grenadier				=	"O_T_Soldier_GL_F";
		_autoRifleman			= 	"O_T_Soldier_AR_F";
		_gunner					=	"O_HeavyGunner_F";
		_medic					= 	"O_T_Medic_F";
		_repairSpecialist		=	"O_T_Soldier_Repair_F";
		_engineer				= 	"O_T_Engineer_F";
		_guidedLAT				=	"O_T_Soldier_HAT_F";
		_dumbLAT				=	"O_T_Soldier_LAT_F";
		_missileSpecialistAT	= 	"O_T_Soldier_AT_F";
		_missileSpecialistAA	=	"O_T_Soldier_AA_F";
		_ammoBearer				= 	"O_T_Soldier_A_F";
		_JTAC					= 	"O_T_Recon_JTAC_F";
		_explosivesSpecialist	= 	"O_T_Soldier_Exp_F";
		_uavOperator			= 	"O_T_Soldier_UAV_F";
		_paratrooper			=	"O_T_Soldier_PG_F";
		_heliPilot 				=	"O_T_Helipilot_F";
		_heliCrew				=	"O_T_Helicrew_F";
		_fighterPilot			=	"O_Fighter_Pilot_F";
		_pilot					=	"O_T_Pilot_F";
		_vehicleCrew			=  	"O_T_Crew_F";
		_diver 					=	"O_T_Diver_F";
		_diverTeamLeader		=	"O_T_Diver_TL_F";
		_diverExplosives		=	"O_T_Diver_Exp_F";
		
  
	// Vehicles
	
		_carrierPlane			= 	"B_Plane_Fighter_01_Stealth_F";
		_atTurret				=	"O_static_AT_F";
		_aaTurret				=	"O_static_AA_F";
		_mortar					=	"O_Mortar_01_F";
		_AttackCargoPlane		=	"B_T_VTOL_01_armed_F";
		_attackBoat				=	"O_T_Boat_Armed_01_hmg_F";
		_quadBike 				=	"O_T_Quadbike_01_ghex_F";
		_smallCargoTruck		=	"C_Van_01_transport_F";
		_fuelTruck				=	"C_Van_01_fuel_F";
		_car					=	"O_T_LSV_02_unarmed_F";
		_carHMG					=	"O_T_LSV_02_armed_F";
		_carAT					=	"O_T_LSV_02_AT_F";
		_Mrap					=	"O_T_MRAP_02_ghex_F";
		_MrapHMG				=	"O_T_MRAP_02_hmg_ghex_F";
		_MrapGMG				=	"O_T_MRAP_02_gmg_ghex_F";
		_cargoTruck				=	"O_T_Truck_03_transport_ghex_F";
		_lightIFV				=	"O_APC_Wheeled_02_rcws_v2_F";
		_tank					=	"O_T_MBT_04_command_F";
		_antiAirAPC				=	"O_T_APC_Tracked_02_AA_ghex_F";
		_artilleryAPC			=	"O_T_MBT_02_arty_ghex_F";
		_wheeledIFV				=	"O_T_APC_Wheeled_02_rcws_v2_ghex_F";
		_trackedAPC				=	"O_T_APC_Tracked_02_cannon_ghex_F";
		_tankHunter				=	"O_MBT_04_command_F";
		_smallTrHeli			=	"O_Heli_Light_02_unarmed_F";
		_mediumTrHeli			=	"O_Heli_Light_02_unarmed_F";
		_largeTrHeli			=	"O_Heli_Transport_04_covered_F";
		_cargoHeli				=	"O_Heli_Transport_04_box_F";
		_smallAH				=	"O_Heli_Light_02_dynamicLoadout_F";
		_largeAH				=	"O_Heli_Attack_02_dynamicLoadout_F";
		_TrPlane				=	"O_T_VTOL_02_infantry_dynamicLoadout_F";
		_CargoPlane				=	"O_T_VTOL_02_vehicle_dynamicLoadout_F";
		_trainerPlane			=	"I_Plane_Fighter_03_dynamicLoadout_F";
		_fighterPlane			=	"O_Plane_Fighter_02_F";
		_stealthFighterPlane	=	"O_Plane_Fighter_02_Stealth_F";
		_groundAttackPlane		= 	"O_Plane_CAS_02_dynamicLoadout_F";
		_propPlane				=	"C_Plane_Civil_01_F";
		_flag					=	"Flag_US_F";
		_marker 				=	"flag_CSAT";
		
	
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



















