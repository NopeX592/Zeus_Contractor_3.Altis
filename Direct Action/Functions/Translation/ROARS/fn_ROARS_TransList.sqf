
	
	// Units
	
		_officer 				=	"ROARS_Officer";
		_teamLeader 			= 	"ROARS_Team_Leader";
		_marksman 				= 	"RO_ARMY_Desert_Marksman";
		_sniper					=	"RO_ARMY_Desert_Marksman";
		_spotter				=	"RO_ARMY_Desert_Marksman";
		_grenadier				=	"ROARS_Rifleman";
		_autoRifleman			= 	"ROARS_Machinegunner";
		_gunner					=	"ROARS_Machinegunner";
		_medic					= 	"ROARS_Medic";
		_repairSpecialist		=	"ROARS_Rifleman";
		_engineer				= 	"ROARS_AT";
		_guidedLAT				=	"ROARS_AT";
		_dumbLAT				=	"ROARS_AT";
		_missileSpecialistAT	= 	"ROARS_AT";
		_missileSpecialistAA	=	"ROARS_AT";
		_ammoBearer				= 	"ROARS_Rifleman";
		_JTAC					= 	"ROARS_Rifleman";
		_explosivesSpecialist	= 	"ROARS_Demo";
		_uavOperator			= 	"ROARS_Rifleman";
		_paratrooper			=	"ROARS_Rifleman";
		_heliPilot 				=	"ROARS_Rifleman";
		_heliCrew				=	"ROARS_Rifleman";
		_fighterPilot			=	"ROARS_Rifleman";
		_pilot					=	"ROARS_Rifleman";
		_vehicleCrew			=  	"ROARS_Rifleman";
		_diver 					=	"";
		_diverTeamLeader		=	"";
		_diverExplosives		=	"";


	// Vehicles
	
		_carrierPlane			= 	"B_Plane_Fighter_01_Stealth_F";
		_atTurret				=	"RHS_TOW_TriPod_D";
		_aaTurret				=	"RHS_Stinger_AA_pod_D";
		_mortar					=	"RHS_M119_D";
		_AttackCargoPlane		=	"USAF_AC130U";
		
		if (isClass(configfile >> "CfgMods" >> "UK3CB_BAF_Units")) then {
		
			_attackBoat				=	"UK3CB_BAF_RHIB_HMG_DDPM_RM";
			
		}else{
		
			_attackBoat				=	"B_Boat_Armed_01_minigun_F";
			
		};
		
		_quadBike 				=	"B_Quadbike_01_F";
		_smallCargoTruck		=	"rhssaf_m1152_olive";
		_fuelTruck				=	"rhssaf_m1152_rsv_olive";
		_car					=	"rhsgref_nat_uaz";
		_carHMG					=	"rhsgref_nat_uaz_dshkm";
		_carAT					=	"rhsgref_nat_uaz_spg9";
		_Mrap					=	"rhssaf_m1025_olive";
		_MrapHMG				=	"rhssaf_m1025_olive_m2";
		_MrapGMG				=	"rhssaf_m1025_olive_m2";
		_cargoTruck				=	"rhssaf_army_ural_open";
		_lightIFV				=	"rhssaf_m1151_olive_pkm";
		_tank					=	"rhssaf_army_t72s";
		_antiAirAPC				=	"rhs_zsu234_aa";
		_artilleryAPC			=	"rhssaf_army_2s1";
		_wheeledIFV				=	"rhs_btr80_vmf";
		_trackedAPC				=	"rhs_Ob_681_2";
		_tankHunter				=	"rhs_sprut_vdv";
		_smallTrHeli			=	"rhssaf_airforce_ht48";
		_mediumTrHeli			=	"rhssaf_airforce_ht48";
		_largeTrHeli			=	"rhssaf_airforce_ht48";
		_cargoHeli				=	"rhssaf_airforce_ht48";
		_smallAH				=	"rhsgref_mi24g_CAS";
		_largeAH				=	"rhsgref_mi24g_CAS";
		_TrPlane				=	"RHS_AN2";
		_CargoPlane				=	"RHS_AN2";
		_trainerPlane			=	"rhs_l159_CDF";
		_fighterPlane			=	"rhssaf_airforce_l_18";
		_stealthFighterPlane	=	"rhssaf_airforce_l_18_101";
		_groundAttackPlane		= 	"rhssaf_airforce_l_18";
		_propPlane				=	"RHS_AN2";
		_flag					=	"";
		_marker					=	"flag_UN";



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
