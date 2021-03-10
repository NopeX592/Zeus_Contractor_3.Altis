
	
	// Units
	
		_officer 				=	"rhsgref_cdf_reg_officer";
		_teamLeader 			= 	"";
		_marksman 				= 	"rhsgref_cdf_reg_marksman";
		_sniper					=	"";
		_spotter				=	"";
		_grenadier				=	"rhsgref_cdf_reg_grenadier";
		_autoRifleman			= 	"rhsgref_cdf_reg_machinegunner";
		_gunner					=	"rhsgref_cdf_reg_machinegunner";
		_medic					= 	"rhsgref_cdf_reg_medic";
		_repairSpecialist		=	"";
		_engineer				= 	"rhsgref_cdf_reg_engineer";
		_guidedLAT				=	"rhsgref_cdf_reg_rifleman_rpg75";
		_dumbLAT				=	"rhsgref_cdf_reg_rifleman_rpg75";
		_missileSpecialistAT	= 	"rhsgref_cdf_reg_grenadier_rpg";
		_missileSpecialistAA	=	"rhsgref_cdf_reg_specialist_aa";
		_ammoBearer				= 	"";
		_JTAC					= 	"";
		_explosivesSpecialist	= 	"rhsgref_cdf_reg_engineer";
		_uavOperator			= 	"";
		_paratrooper			=	"";
		_heliPilot 				=	"";
		_heliCrew				=	"";
		_fighterPilot			=	"";
		_pilot					=	"";
		_vehicleCrew			=  	"rhsgref_cdf_reg_crew";
		_diver 					=	"";
		_diverTeamLeader		=	"";
		_diverExplosives		=	"";
		

	// Vehicles
	
		_carrierPlane			= 	"B_Plane_Fighter_01_Stealth_F";
		_atTurret				=	"rhsgref_cdf_reg_d30_at";
		_aaTurret				=	"RHSgref_cdf_ZU23";
		_mortar					=	"rhsgref_cdf_reg_d30";
		_AttackCargoPlane		=	"USAF_AC130U";
		
		if (isClass(configfile >> "CfgMods" >> "UK3CB_BAF_Units")) then {
		
			_attackBoat				=	"UK3CB_BAF_RHIB_HMG_DDPM_RM";
			
		}else{
		
			_attackBoat				=	"B_Boat_Armed_01_minigun_F";
			
		};
		
		_quadBike 				=	"B_Quadbike_01_F";
		_smallCargoTruck		=	"C_Van_01_transport_F";
		_fuelTruck				=	"C_Van_01_fuel_F";
		_car					=	"rhsgref_cdf_reg_uaz";
		_carHMG					=	"rhsgref_cdf_reg_uaz_dshkm";
		_carAT					=	"rhsgref_cdf_reg_uaz_spg9";
		_Mrap					=	"rhsgref_BRDM2UM";
		_MrapHMG				=	"rhsgref_BRDM2";
		_MrapGMG				=	"rhsgref_BRDM2_ATGM";
		_cargoTruck				=	"rhsgref_cdf_zil131_flatbed_cover";
		_lightIFV				=	"rhsgref_cdf_bmd1k";
		_tank					=	"rhsgref_cdf_t72bb_tv";
		_antiAirAPC				=	"rhsgref_cdf_zsu234";
		_artilleryAPC			=	"rhsgref_cdf_2s1";
		_wheeledIFV				=	"rhsgref_cdf_btr80";
		_trackedAPC				=	"rhsgref_cdf_bmp2k";
		_tankHunter				=	"";
		_smallTrHeli			=	"rhsgref_cdf_reg_Mi8amt";
		_mediumTrHeli			=	"rhsgref_cdf_reg_Mi8amt";
		_largeTrHeli			=	"rhsgref_cdf_reg_Mi8amt";
		_cargoHeli				=	"rhsgref_cdf_reg_Mi8amt";
		_smallAH				=	"rhsgref_cdf_reg_Mi17Sh";
		_largeAH				=	"rhsgref_cdf_Mi35";
		_TrPlane				=	"RHS_AN2";
		_CargoPlane				=	"";
		_trainerPlane			=	"rhs_l159_CDF";
		_fighterPlane			=	"rhsgref_cdf_mig29s";
		_stealthFighterPlane	=	"";
		_groundAttackPlane		= 	"rhsgref_cdf_su25";
		_propPlane				=	"RHS_AN2";
		_flag					=	"rhs_Flag_Che_F";
		_marker					=	"flag_EU";
		

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
