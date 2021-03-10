
	
	// Units
	
		_officer 				=	"";
		_teamLeader 			= 	"rhsgref_ins_g_squadleader";
		_marksman 				= 	"rhsgref_ins_g_sniper";
		_sniper					=	"rhsgref_ins_g_sniper";
		_spotter				=	"rhsgref_ins_g_spotter";
		_grenadier				=	"rhsgref_ins_g_grenadier";
		_autoRifleman			= 	"rhsgref_ins_g_machinegunner";
		_gunner					=	"rhsgref_ins_g_machinegunner";
		_medic					= 	"rhsgref_ins_g_medic";
		_repairSpecialist		=	"rhsgref_ins_g_engineer";
		_engineer				= 	"rhsgref_ins_g_engineer";
		_guidedLAT				=	"rhsgref_ins_g_rifleman_RPG26";
		_dumbLAT				=	"rhsgref_ins_g_rifleman_RPG26";
		_missileSpecialistAT	= 	"rhsgref_ins_g_grenadier_rpg";
		_missileSpecialistAA	=	"rhsgref_ins_g_specialist_aa";
		_ammoBearer				= 	"";
		_JTAC					= 	"";
		_explosivesSpecialist	= 	"rhsgref_ins_g_saboteur";
		_uavOperator			= 	"";
		_paratrooper			=	"";
		_heliPilot 				=	"";
		_heliCrew				=	"";
		_fighterPilot			=	"";
		_pilot					=	"";
		_vehicleCrew			=  	"rhsgref_ins_g_crew";
		_diver 					=	"";
		_diverTeamLeader		=	"";
		_diverExplosives		=	"";
		
	
	// Vehicles
	
		_carrierPlane			= 	"B_Plane_Fighter_01_Stealth_F";
		_atTurret				=	"B_static_AT_F";
		_aaTurret				=	"B_static_AA_F";
		_mortar					=	"B_Mortar_01_F";
		_AttackCargoPlane		=	"USAF_AC130U";
		
		if (isClass(configfile >> "CfgMods" >> "UK3CB_BAF_Units")) then {
		
			_attackBoat				=	"UK3CB_BAF_RHIB_HMG_DDPM_RM";
			
		}else{
		
			_attackBoat				=	"B_Boat_Armed_01_minigun_F";
			
		};
		
		_quadBike 				=	"B_Quadbike_01_F";
		_smallCargoTruck		=	"C_Van_01_transport_F";
		_fuelTruck				=	"C_Van_01_fuel_F";
		_car					=	"rhsgref_ins_g_uaz_open";
		_carHMG					=	"rhsgref_ins_g_uaz_dshkm_chdkz";
		_carAT					=	"rhsgref_ins_g_uaz_spg9";
		_Mrap					=	"rhsgref_BRDM2UM_ins_g";
		_MrapHMG				=	"rhsgref_BRDM2_ins_g";
		_MrapGMG				=	"rhsgref_BRDM2_ATGM_ins_g";
		_cargoTruck				=	"rhsgref_ins_g_gaz66o_flat";
		_lightIFV				=	"rhsgref_ins_g_bmd1";
		_tank					=	"rhsgref_ins_g_t72bc";
		_antiAirAPC				=	"rhsgref_ins_g_zsu234";
		_artilleryAPC			=	"rhsgref_ins_g_2s1";
		_wheeledIFV				=	"rhsgref_ins_g_btr60";
		_trackedAPC				=	"rhsgref_ins_g_bmp1";
		_tankHunter				=	"";
		_smallTrHeli			=	"rhsgref_ins_g_Mi8amt";
		_mediumTrHeli			=	"rhsgref_ins_g_Mi8amt";
		_largeTrHeli			=	"rhsgref_ins_g_Mi8amt";
		_cargoHeli				=	"";
		_smallAH				=	"";
		_largeAH				=	"";
		_TrPlane				=	"";
		_CargoPlane				=	"";
		_trainerPlane			=	"";
		_fighterPlane			=	"";
		_stealthFighterPlane	=	"";
		_groundAttackPlane		= 	"";
		_propPlane				=	"";
		_flag					=	"Flag_Red_F";
		_marker					=	"rhs_flag_che";
		

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























