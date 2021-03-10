
	// Units
	
		_officer 				=	"rhsgref_hidf_squadleader";
		_teamLeader 			= 	"rhsgref_hidf_teamleader";
		_marksman 				= 	"rhsgref_hidf_marksman";
		_sniper					=	"rhsgref_hidf_sniper";
		_spotter				=	"rhsgref_hidf_rifleman";
		_grenadier				=	"rhsgref_hidf_grenadier";
		_autoRifleman			= 	"rhsgref_hidf_autorifleman";
		_gunner					=	"rhsgref_hidf_machinegunner";
		_medic					= 	"rhsgref_hidf_medic";
		_repairSpecialist		=	"rhsgref_hidf_rifleman";
		_engineer				= 	"rhsgref_hidf_rifleman";
		_guidedLAT				=	"rhsgref_hidf_rifleman_m72";
		_dumbLAT				=	"rhsgref_hidf_rifleman_m72";
		_missileSpecialistAT	= 	"rhsgref_hidf_rifleman_m72";
		_missileSpecialistAA	=	"rhsgref_hidf_rifleman";
		_ammoBearer				= 	"rhsgref_hidf_rifleman";
		_JTAC					= 	"rhsgref_hidf_rifleman";
		_explosivesSpecialist	= 	"rhsgref_hidf_rifleman";
		_uavOperator			= 	"rhsgref_hidf_rifleman";
		_paratrooper			=	"rhsgref_hidf_rifleman";
		_heliPilot 				=	"rhsgref_hidf_helipilot";
		_heliCrew				=	"rhsgref_hidf_helipilot";
		_fighterPilot			=	"rhsgref_hidf_helipilot";
		_pilot					=	"rhsgref_hidf_helipilot";
		_vehicleCrew			=  	"rhsgref_hidf_crewman";
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
		_car					=	"rhsgref_hidf_m1025";
		_carHMG					=	"rhsgref_hidf_m1025_m2";
		_carAT					=	"rhsgref_hidf_m1025_mk19";
		_Mrap					=	"rhsgref_hidf_m1025";
		_MrapHMG				=	"rhsgref_hidf_m1025_m2";
		_MrapGMG				=	"rhsgref_hidf_m1025_mk19";
		_cargoTruck				=	"";
		_lightIFV				=	"";
		_tank					=	"";
		_antiAirAPC				=	"";
		_artilleryAPC			=	"";
		_wheeledIFV				=	"rhsgref_hidf_m113a3_m2";
		_trackedAPC				=	"rhsgref_hidf_m113a3_mk19";
		_tankHunter				=	"";
		_smallTrHeli			=	"rhs_uh1h_hidf";
		_mediumTrHeli			=	"rhs_uh1h_hidf";
		_largeTrHeli			=	"rhs_uh1h_hidf";
		_cargoHeli				=	"";
		_smallAH				=	"rhs_uh1h_hidf_gunship";
		_largeAH				=	"rhs_uh1h_hidf_gunship";
		_TrPlane				=	"";
		_CargoPlane				=	"";
		_trainerPlane			=	"RHSGREF_A29B_HIDF";
		_fighterPlane			=	"RHSGREF_A29B_HIDF";
		_stealthFighterPlane	=	"RHSGREF_A29B_HIDF";
		_groundAttackPlane		= 	"RHSGREF_A29B_HIDF";
		_propPlane				=	"RHSGREF_A29B_HIDF";
		_flag					=	"Flag_HorizonIslands_F";
		_marker					=	"flag_Tanoa";
		
	
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


















