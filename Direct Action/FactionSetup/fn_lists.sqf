	private ["_bluFaction", "_blu_AltFaction", "_blu_SofFaction", "_opfFaction", "_opf_SOFFaction", "_ind_1Faction", "_ind_2Faction", "_rebel_1Faction", "_rebel_2Faction"];


		_bluFaction				=	["NATO", bluFaction];
		_blu_AltFaction			=	["NATO", blu_AltFaction];
		_blu_SOFFaction			=	["CTRG", blu_SOFFaction];
		_opfFaction				=	["CSAT", opfFaction];
		_opf_SOFFaction			=	["CSAT", opf_SOFFaction];
		_ind_1Faction			=	["AAF", ind_1Faction];				
		_ind_2Faction			=	["NATO_T", ind_2Faction];
		_rebel_1Faction			=	["FIA", rebel_1Faction];
		_rebel_2Faction			=	["LDF", rebel_2Faction];


		bluFaction				=	_bluFaction;
		blu_AltFaction			=	_bluFaction;
		blu_SofFaction			=	_blu_SofFaction;
		opfFaction				=	_opfFaction;
		opf_SOFFaction			=	_opf_SOFFaction;
		ind_1Faction			=	_ind_1Faction;
		ind_2Faction			=	_ind_2Faction;
		rebel_1Faction			=	_rebel_1Faction;
		rebel_2Faction			=	_rebel_2Faction;
	
	

	// Define Infantry Setup
	
		// Define Blufor Infantry Setup
		
			BLU_InfantryArray = switch (_bluFaction select 1) do {
			
				case "NATO"			:	{[WEST, "BLU_F", "Infantry"]};
				case "NATO_T"		:	{[WEST, "BLU_T_F", "Infantry"]};
				case "NATO_W"		:	{[WEST, "BLU_W_F", "Infantry"]};
				
				case "USARMYD"		:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				case "USARMYW"		:	{[WEST, "rhs_faction_usarmy_wd", "rhs_group_nato_usarmy_wd_infantry"]};
				case "USMCD"		:	{[WEST, "rhs_faction_usmc_d", "rhs_group_nato_usmc_d_infantry"]};
				
				case "CUP_USARMYD"	:	{[WEST, "CUP_B_US_Army", "Infantry"]};
				case "CUP_USARMYW"	:	{[WEST, "CUP_B_US_Army", "Infantry"]};
				case "CUP_USMCD"	:	{[WEST, "CUP_B_USMC", "Infantry_DES"]};
				case "CUP_USMCW"	:	{[WEST, "CUP_B_USMC", "Infantry"]};
				case "CUP_BAFD"		:	{[WEST, "CUP_B_GB", "Infantry_DDPM"]};
				case "CUP_BAFMTP"	:	{[WEST, "CUP_B_GB", "Infantry"]};
				case "CUP_GERMANYD"	:	{[WEST, "CUP_B_GER", "Infantry"]};
				case "CUP_GERMANYW"	:	{[WEST, "CUP_B_GER", "Infantry_WDL"]};
				case "CUP_CDFD"		:	{[WEST, "CUP_B_CDF", "Infantry_DST"]};
				case "CUP_CDFW"		:	{[WEST, "CUP_B_CDF", "Infantry_FST"]};
				case "CUP_HIL"		:	{[WEST, "CUP_B_HIL", "Infantry"]};
				
				case "3CDB"			:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				case "3CBMTP"		:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				
				case "AUSArmy"		:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				
				case "NZArmy"		:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				
				case "BWFLEK"		:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				
				case "BWTROP"		:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				
				case "FFAA"			:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				
				case "ROARS"		:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				
				case "FRENCH"		:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				
				case "CAFT"			:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				
				case "SWEDEArmy"	:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				
				case "ITALYArmy"	:	{[WEST, "rhs_faction_usarmy_d", "rhs_group_nato_usarmy_d_infantry"]};
				
				case "USARMYE"		:	{[WEST, "BLU_F", "Infantry"]};

			};
		
		
		// Define Opfor Infantry Setup
		
			OPF_InfantryArray = switch (_opfFaction select 1) do {
			
				case "CSAT"			:	{[EAST,"OPF_F","Infantry"]};
				case "CSAT_T"		:	{[EAST,"OPF_T_F","Infantry"]};
				
				case "VDV"			:	{[EAST,"rhs_faction_vdv","rhs_group_rus_vdv_infantry"]};
				case "VDV_D"		:	{[EAST,"rhs_faction_vdv","rhs_group_rus_vdv_des_infantry"]};
				
				case "CUP_RUS"		:	{[EAST, "CUP_O_RU", "Infantry_VDV_EMR"]};

			};
	
	
	
	// Define Vehicle Lists
	
		// Define BLUFOR Vehicle Lists
		
			BLU_VehList = switch (_bluFaction select 1) do {
			
				case "NATO"			:	{BEW_FNC_Vanilla_BLU_F_VehList};
				case "NATO_T"		:	{BEW_FNC_Vanilla_BLU_F_T_VehList};
				case "NATO_W"		:	{BEW_FNC_Vanilla_BLU_F_T_VehList};
				
				case "USARMYD"		:	{BEW_FNC_RHS_USArmyD_VehList};
				case "USARMYW"		:	{BEW_FNC_RHS_USArmyW_VehList};
				case "USMCD"		:	{BEW_FNC_RHS_USMCD_VehList};
				case "SOCOM"		:	{BEW_FNC_RHS_SOCOM_VehList};
				
				case "CUP_USARMYD"	:	{BEW_FNC_CUP_USARMYD_VehList};
				case "CUP_USARMYW"	:	{BEW_FNC_CUP_USARMYW_VehList};
				case "CUP_USMCD"	:	{BEW_FNC_CUP_USMCD_VehList};
				case "CUP_USMCW"	:	{BEW_FNC_CUP_USMCW_VehList};
				case "CUP_BAFD"		:	{BEW_FNC_CUP_BAFD_VehList};
				case "CUP_BAFMTP"	:	{BEW_FNC_CUP_BAFMTP_VehList};
				case "CUP_GERMANYD"	:	{BEW_FNC_CUP_GERMANYD_VehList};
				case "CUP_GERMANYW"	:	{BEW_FNC_CUP_GERMANYW_VehList};
				case "CUP_CDFD"		:	{BEW_FNC_CUP_CDFD_VehList};
				case "CUP_CDFW"		:	{BEW_FNC_CUP_CDFW_VehList};
				case "CUP_HIL"		:	{BEW_FNC_CUP_HIL_VehList};
				
				case "3CBD"			:	{BEW_FNC_3CBD_VehList};
				case "3CBMTP"		:	{BEW_FNC_3CBMTP_VehList};
				
				case "AUSArmy"		:	{BEW_FNC_AUSArmy_VehList};
				case "AUSArmy"		:	{BEW_FNC_NZArmy_VehList};
				
				case "BWFLEK"		:	{BEW_FNC_BWFLEK_VehList};
				case "BWTROP"		:	{BEW_FNC_BWTROP_VehList};
				
				case "FFAA"			:	{BEW_FNC_FFAA_VehList};
				
				case "ROARS"		:	{BEW_FNC_ROARS_VehList};
				
				case "FRENCH"		:	{BEW_FNC_FRENCH_VehList};
				
				case "CAFT"			:	{BEW_FNC_CAFT_VehList};
				
				case "SWEDEArmy"	:	{BEW_FNC_SWEDEArmy_VehList};
				
				case "ITALYArmy"	:	{BEW_FNC_ITALYArmy_VehList};
				
				case "USARMYE"		:	{BEW_FNC_Vanilla_BLU_F_VehList};
				
			};
			
		// Define OPFOR Vehicle Lists
		
			OPF_VehList = switch (_opfFaction select 1) do {
			
				case "CSAT"			:	{BEW_FNC_Vanilla_OPF_F_VehList};
				case "CSAT_T"		:	{BEW_FNC_Vanilla_OPF_T_F_VehList};
				
				case "VDV"			:	{BEW_FNC_RHS_Russia_VehList};
				case "VDV_D"		:	{BEW_FNC_RHS_Russia_VehList};
				
				case "CUP_RUS"		:	{BEW_FNC_CUP_RUS_VehList};
				
			};
	
	
	
	// Define Vehicle Setup
	
		// BLU Vehicle Setup

			BLU_VehicleArray = switch (_bluFaction select 1) do {
			
				case "NATO"			:	{[WEST,"BLU_F"]};
				case "NATO_T"		:	{[WEST,"BLU_F"]};
				case "NATO_W"		:	{[WEST,"BLU_F"]};
				
				case "USARMYD"		:	{[WEST,"BLU_F"]};
				case "USARMYW"		:	{[WEST,"BLU_F"]};
				case "USMCD"		:	{[WEST,"BLU_F"]};
				
				case "CUP_USARMYD"	:	{[WEST,"BLU_F"]};
				case "CUP_USARMYW"	:	{[WEST,"BLU_F"]};
				case "CUP_USMCD"	:	{[WEST,"BLU_F"]};
				case "CUP_USMCW"	:	{[WEST,"BLU_F"]};
				case "CUP_BAFD"		:	{[WEST,"BLU_F"]};
				case "CUP_BAFMTP"	:	{[WEST,"BLU_F"]};
				case "CUP_GERMANYD"	:	{[WEST,"BLU_F"]};
				case "CUP_GERMANYW"	:	{[WEST,"BLU_F"]};
				case "CUP_CDFD"		:	{[WEST,"BLU_F"]};
				case "CUP_CDFW"		:	{[WEST,"BLU_F"]};
				case "CUP_HIL"		:	{[WEST,"BLU_F"]};
				
				case "3CDB"			:	{[WEST,"BLU_F"]};
				case "3CBMTP"		:	{[WEST,"BLU_F"]};
				
				case "AUSArmy"		:	{[WEST,"BLU_F"]};
				case "NZArmy"		:	{[WEST,"BLU_F"]};
				
				case "BWFLEK"		:	{[WEST,"BLU_F"]};
				case "BWTROP"		:	{[WEST,"BLU_F"]};
				
				case "FFAA"			:	{[WEST,"BLU_F"]};
				
				case "ROARS"		:	{[WEST,"BLU_F"]};
				
				case "FRENCH"		:	{[WEST,"BLU_F"]};
					
				case "CAFT"			:	{[WEST,"BLU_F"]};
				
				case "SWEDEArmy"	:	{[WEST,"BLU_F"]};
				
				case "ITALYArmy"	:	{[WEST,"BLU_F"]};
				
				case "USARMYE"		:	{[WEST,"BLU_F"]};
				
			};
	
	
		// OPF Vehicle Setup

			OPF_VehicleArray = switch (_opfFaction select 1) do {
			
				case "CSAT"		:	{[EAST,"OPF_F"]};
				case "CSAT_T"	:	{[EAST,"OPF_T_F"]};
				
				case "VDV"		:	{[EAST,"OPF_F"]};
				case "VDV_D"	:	{[EAST,"OPF_F"]};
				
				case "CUP_RUS"	:	{[EAST,"OPF_F"]};
				
			};



	_factionTypes = ["BLU", "OPF", "BLU_SOF", "OPF_SOF", "IND_1", "IND_2", "REBEL_1", "REBEL_2"];
	
	
	
	// Marker Icon Faction Tag
		
		{
		
			call compile format ["	
			
			
				%1_MarkerIcon = switch (_%1Faction select 1) do {
				
					case ""NATO""		:	{""flag_NATO""};
					case ""NATO_T""		:	{""flag_NATO""};
					case ""NATO_W""		:	{""flag_NATO""};
					case ""CSAT""		:	{""flag_CSAT""};
					case ""CSAT_T""		:	{""flag_CSAT""};
					case ""AAF""		:	{""flag_AAF""};
					case ""LDF""		:	{""flag_EAF""};
					case ""FIA""		:	{""flag_FIA""};
					case ""CTRG""		:	{""flag_CTRG""};
					case ""SYNDIKAT""	:	{""flag_Syndicat""};					
					
					case ""USARMYD""	:	{""flag_USA""};
					case ""USARMYW""	:	{""flag_USA""};
					case ""USMCD""		:	{""flag_USA""};
					case ""VDV""		:	{""flag_Russia""};
					case ""VDV_D""		:	{""flag_Russia""};
					case ""HIDF""		:	{""flag_Tanoa""};
					case ""CDF""		:	{""flag_EU""};
					case ""SAF""		:	{""USP_MARKER_REPUBLIC_SERBIA""};
					case ""SOCOM""		:	{""flag_USA""};
					case ""CHDKZ""		:	{""rhs_flag_che""};
					
					case ""CUP_USARMYD"":	{""flag_USA""};
					case ""CUP_USARMYW"":	{""flag_USA""};
					case ""CUP_USMCD""	:	{""flag_USA""};
					case ""CUP_USMCW""	:	{""flag_USA""};
					case ""CUP_BAFD""	:	{""flag_UK""};
					case ""CUP_BAFMTP""	:	{""flag_UK""};
					case ""CUP_GERMANYD"":	{""flag_Germany""};
					case ""CUP_GERMANYW"":	{""flag_Germany""};
					case ""CUP_CDFD""	:	{""flag_EU""};
					case ""CUP_CDFW""	:	{""flag_EU""};
					case ""CUP_HIL""	:	{""flag_Tanoa""};
					case ""CUP_RUS""	:	{""Flag_Russia""};
					
					case ""3CBD""		:	{""flag_UK""};
					case ""3CBMTP""		:	{""flag_UK""};
					
					case ""AUSArmy""	:	{""flag_aus""};
					case ""NZArmy""		:	{""USP_MARKER_NEW_ZEALAND""};
					
					case ""BWFLEK""		:	{""flag_Germany""};
					case ""BWTROP""		:	{""flag_Germany""};
					
					case ""FFAA""		:	{""flag_Spain""};
					
					case ""ROARS""		:	{""flag_UN""};
					
					case ""FRENCH""		:	{""flag_France""};
					
					case ""CAFT""		:	{""flag_Canada""};
					
					case ""SWEDEArmy""	:	{""sfp_marker_sweden""};
					
					case ""ITALYArmy""	:	{""flag_Italy""};
					
					case ""USARMYE""	:	{};
					
				};
				
			", _x];

		} forEach _factionTypes;	
	
	
	
	// Map Faction Tag
		
		{
		
			call compile format ["	
		
			
				%1_MapFactionTag = switch (_%1Faction select 0) do {
				
					case ""NATO""		:	{""BLU_F""};
					case ""NATO_T""		:	{""BLU_T_F""};
					case ""NATO_W""		:	{""BLU_W_F""};
					case ""CSAT""		:	{""OPF_F""};
					case ""CSAT_T""		:	{""OPF_T_F""};
					case ""AAF""		:	{""IND_F""};
					case ""LDF""		:	{""IND_E_F""};
					case ""FIA""		:	{""IND_G_F""};
					case ""CTRG""		:	{""BLU_CTRG_F""};
					case ""SYNDIKAT""	:	{""IND_C_F""};					
					
					case ""USARMYD""	:	{""rhs_faction_usarmy_d""};
					case ""USARMYW""	:	{""rhs_faction_usarmy_wd""};
					case ""USMCD""		:	{""rhs_faction_usmc_d""};
					case ""VDV""		:	{""rhs_faction_vdv""};
					case ""VDV_D""		:	{""rhs_faction_vdv""};
					case ""HIDF""		:	{""rhsgref_faction_hidf""};
					case ""CDF""		:	{""rhsgref_faction_cdf_ground""};
					case ""SAF""		:	{""rhssaf_faction_army""};
					case ""SOCOM""		:	{""rhs_faction_socom""};
					case ""CHDKZ""		:	{""rhsgref_faction_chdkz""};
					
					case ""CUP_USARMYD"":	{""CUP_B_US_Army""};
					case ""CUP_USARMYW"":	{""CUP_B_US_Army""};
					case ""CUP_USMCD""	:	{""CUP_B_USMC""};
					case ""CUP_USMCW""	:	{""CUP_B_USMC""};
					case ""CUP_BAFD""	:	{""CUP_B_GB""};
					case ""CUP_BAFMTP""	:	{""CUP_B_GB""};
					case ""CUP_GERMANYD"":	{""CUP_B_GER""};
					case ""CUP_GERMANYW"":	{""CUP_B_GER""};
					case ""CUP_CDFD""	:	{""CUP_B_CDF""};
					case ""CUP_CDFW""	:	{""CUP_B_CDF""};
					case ""CUP_HIL""	:	{""CUP_B_HIL""};
					case ""CUP_RUS""	:	{""CUP_O_RU""};
					
					case ""3CBD""		:	{""UK3CB_BAF_Faction_Army_Desert""};
					case ""3CBMTP""		:	{""UK3CB_BAF_Faction_Army_MTP""};
					
					case ""AUSArmy""	:	{""ADFU""};
					case ""NZArmy""		:	{""NZDFMKII""};
					
					case ""BWFLEK""		:	{""BWA3_Faction_Fleck""};
					case ""BWTROP""		:	{""BWA3_Faction_Tropen""};
					
					case ""FFAA""		:	{""FFAA""};
					
					case ""ROARS""		:	{""ROARS""};
					
					case ""FRENCH""		:	{""R3F_BLUFOR""};
					
					case ""CAFT""		:	{""TFC_A3_TEMPERATE""};
					
					case ""SWEDEArmy""	:	{""sfp_swe_2015""};
					
					case ""ITALYArmy""	:	{""PedagneMOD""};
					
					case ""USARMYE""	:	{};
					
				};
				
			", _x];

		} forEach _factionTypes;	
	
	
	
	// New Faction Tag
		
		{
		
			call compile format ["	
			
				%1_NewFactionTag = switch (_%1Faction select 1) do {
				
					case ""NATO""		:	{""BLU_F""};
					case ""NATO_T""		:	{""BLU_T_F""};
					case ""NATO_W""		:	{""BLU_W_F""};
					case ""CSAT""		:	{""OPF_F""};
					case ""CSAT_T""		:	{""OPF_T_F""};
					case ""AAF""		:	{""IND_F""};
					case ""LDF""		:	{""IND_E_F""};
					case ""FIA""		:	{""IND_G_F""};
					case ""CTRG""		:	{""BLU_CTRG_F""};
					case ""SYNDIKAT""	:	{""IND_C_F""};					
					
					case ""USARMYD""	:	{""rhs_faction_usarmy_d""};
					case ""USARMYW""	:	{""rhs_faction_usarmy_wd""};
					case ""USMCD""		:	{""rhs_faction_usmc_d""};
					case ""VDV""		:	{""rhs_faction_vdv""};
					case ""VDV_D""		:	{""rhs_faction_vdv""};
					case ""HIDF""		:	{""rhsgref_faction_hidf""};
					case ""CDF""		:	{""rhsgref_faction_cdf_ground""};
					case ""SAF""		:	{""rhssaf_faction_army""};
					case ""SOCOM""		:	{""rhs_faction_socom""};
					case ""CHDKZ""		:	{""rhsgref_faction_chdkz""};
					
					case ""CUP_USARMYD"":	{""CUP_B_US_Army""};
					case ""CUP_USARMYW"":	{""CUP_B_US_Army""};
					case ""CUP_USMCD""	:	{""CUP_B_USMC""};
					case ""CUP_USMCW""	:	{""CUP_B_USMC""};
					case ""CUP_BAFD""	:	{""CUP_B_GB""};
					case ""CUP_BAFMTP""	:	{""CUP_B_GB""};
					case ""CUP_GERMANYD"":	{""CUP_B_GER""};
					case ""CUP_GERMANYW"":	{""CUP_B_GER""};
					case ""CUP_CDFD""	:	{""CUP_B_CDF""};
					case ""CUP_CDFW""	:	{""CUP_B_CDF""};
					case ""CUP_HIL""	:	{""CUP_B_HIL""};
					case ""CUP_RUS""	:	{""CUP_O_RU""};
					
					case ""3CBD""		:	{""UK3CB_BAF_Faction_Army_Desert""};
					case ""3CBMTP""		:	{""UK3CB_BAF_Faction_Army_MTP""};
					
					case ""AUSArmy""	:	{""ADFU""};
					case ""NZArmy""		:	{""NZDFMKII""};
					
					case ""BWFLEK""		:	{""BWA3_Faction_Fleck""};
					case ""BWTROP""		:	{""BWA3_Faction_Tropen""};
					
					case ""FFAA""		:	{""FFAA""};
					
					case ""ROARS""		:	{""ROARS""};
					
					case ""FRENCH""		:	{""France_Faction""};
					
					case ""CAFT""		:	{""TFC_A3_TEMPERATE""};
					
					case ""SWEDEArmy""	:	{""sfp_swe_2015""};
				
					case ""ITALYArmy""	:	{""PedagneMOD""};
					
					case ""USARMYE""	:	{};
					
				};
				
			", _x];

		} forEach _factionTypes;	
	
	
	
	// Weapon Lists
		
		{
		
			call compile format ["	
			
				%1_WeaponList = switch (_%1Faction select 1) do {
				
					case ""NATO""		:	{[] call BEW_FNC_Nato_WeaponList};
					case ""NATO_T""		:	{[] call BEW_FNC_Nato_T_WeaponList};
					case ""NATO_W""		:	{[] call BEW_FNC_Nato_W_WeaponList};
					case ""CSAT""		:	{[] call BEW_FNC_CSAT_WeaponList};
					case ""CSAT_T""		:	{[] call BEW_FNC_CSAT_T_WeaponList};
					case ""AAF""		:	{[] call BEW_FNC_AAF_WeaponList};
					case ""LDF""		:	{[] call BEW_FNC_LDF_WeaponList};
					case ""FIA""		:	{[] call BEW_FNC_FIA_WeaponList};
					case ""CTRG""		:	{[] call BEW_FNC_CTRG_WeaponList};	
					case ""SYNDIKAT""	:	{[] call BEW_FNC_Syndikat_WeaponList};					
					
					case ""USARMYD""	:	{[] call BEW_FNC_USArmyDWeaponList};
					case ""USARMYW""	:	{[] call BEW_FNC_USArmyWWeaponList};
					case ""USMCD""		:	{[] call BEW_FNC_USMCDWeaponList};
					case ""VDV""		:	{[] call BEW_FNC_VDVWeaponList};
					case ""VDV_D""		:	{[] call BEW_FNC_VDV_DWeaponList};
					case ""HIDF""		:	{[] call BEW_FNC_HIDFWeaponList};
					case ""CDF""		:	{[] call BEW_FNC_CDFWeaponList};
					case ""SAF""		:	{[] call BEW_FNC_SAFWeaponList};
					case ""SOCOM""		:	{[] call BEW_FNC_SocomWeaponList};
					case ""CHDKZ""		:	{[] call BEW_FNC_CHDKZWeaponList};
					
					case ""CUP_USARMYD"":	{[] call BEW_FNC_CUP_USARMYD_WeaponList};
					case ""CUP_USARMYW"":	{[] call BEW_FNC_CUP_USARMYW_WeaponList};
					case ""CUP_USMCD""	:	{[] call BEW_FNC_CUP_USMCD_WeaponList};
					case ""CUP_USMCW""	:	{[] call BEW_FNC_CUP_USMCW_WeaponList};
					case ""CUP_BAFD""	:	{[] call BEW_FNC_CUP_BAFD_WeaponList};
					case ""CUP_BAFMTP""	:	{[] call BEW_FNC_CUP_BAFMTP_WeaponList};
					case ""CUP_GERMANYD"":	{[] call BEW_FNC_CUP_GERMANYD_WeaponList};
					case ""CUP_GERMANYW"":	{[] call BEW_FNC_CUP_GERMANYW_WeaponList};
					case ""CUP_CDFD""	:	{[] call BEW_FNC_CUP_CDFD_WeaponList};
					case ""CUP_CDFW""	:	{[] call BEW_FNC_CUP_CDFW_WeaponList};
					case ""CUP_HIL""	:	{[] call BEW_FNC_CUP_HIL_WeaponList};
					case ""CUP_RUS""	:	{[] call BEW_FNC_CUP_RUS_WeaponList};
					
					case ""3CBD""		:	{[] call BEW_FNC_3CBDWeaponList};
					case ""3CBMTP""		:	{[] call BEW_FNC_3CBMTPWeaponList};
					
					case ""AUSArmy""	:	{[] call BEW_FNC_AUSArmyWeaponList};
					case ""NZArmy""		:	{[] call BEW_FNC_NZArmyWeaponList};
					
					case ""BWFLEK""		:	{[] call BEW_FNC_BWFLEKWeaponList};
					case ""BWTROP""		:	{[] call BEW_FNC_BWTROPWeaponList};
					
					case ""FFAA""		:	{[] call BEW_FNC_FFAAWeaponList};
					
					case ""ROARS""		:	{[] call BEW_FNC_ROARSWeaponList};
					
					case ""FRENCH""		:	{[] call BEW_FNC_FRENCHWeaponList};
					
					case ""CAFT""		:	{[] call BEW_FNC_CAFTWeaponList};
					
					case ""SWEDEArmy""	:	{[] call BEW_FNC_SWEDEArmyWeaponList};
					
					case ""ITALYArmy""	:	{[] call BEW_FNC_ITALYArmyWeaponList};
					
					case ""USARMYE""	:	{[] call BEW_FNC_Nato_WeaponList};
					
				};
				
			", _x];

		} forEach _factionTypes;	
	
	
	
	// Item Lists
		
		{
		
			call compile format ["		
				
				%1_ItemList = switch (_%1Faction select 1) do {
				
					case ""NATO""		:	{[] call BEW_FNC_NATO_ItemList};
					case ""NATO_T""		:	{[] call BEW_FNC_NATO_T_ItemList};
					case ""NATO_W""		:	{[] call BEW_FNC_NATO_W_ItemList};
					case ""CSAT""		:	{[] call BEW_FNC_NATO_ItemList};
					case ""CSAT_T""		:	{[] call BEW_FNC_NATO_ItemList};
					case ""AAF""		:	{[] call BEW_FNC_NATO_ItemList};
					case ""LDF""		:	{[] call BEW_FNC_NATO_ItemList};
					case ""FIA""		:	{[] call BEW_FNC_NATO_ItemList};
					case ""CTRG""		:	{[] call BEW_FNC_NATO_ItemList};	
					case ""SYNDIKAT""	:	{[] call BEW_FNC_NATO_ItemList};
					
					case ""USARMYD""	:	{[] call BEW_FNC_USArmyD_ItemList};
					case ""USARMYW""	:	{[] call BEW_FNC_USArmyW_ItemList};
					case ""USMCD""		:	{[] call BEW_FNC_USMCD_ItemList};
					case ""VDV""		:	{[] call BEW_FNC_VDVItemList};
					case ""VDV_D""		:	{[] call BEW_FNC_VDV_DItemList};
					case ""HIDF""		:	{[] call BEW_FNC_USArmyD_ItemList};
					case ""CDF""		:	{[] call BEW_FNC_VDVItemList};
					case ""SAF""		:	{[] call BEW_FNC_SAFItemList};
					case ""SOCOM""		:	{[] call BEW_FNC_SOCOM_ItemList};
					case ""CHDKZ""		:	{[] call BEW_FNC_VDVItemList};
					
					case ""CUP_USARMYD"":	{[] call BEW_FNC_CUP_USARMYD_ItemList};
					case ""CUP_USARMYW"":	{[] call BEW_FNC_CUP_USARMYW_ItemList};
					case ""CUP_USMCD""	:	{[] call BEW_FNC_CUP_USMCD_ItemList};
					case ""CUP_USMCW""	:	{[] call BEW_FNC_CUP_USMCW_ItemList};
					case ""CUP_BAFD""	:	{[] call BEW_FNC_CUP_BAFD_ItemList};
					case ""CUP_BAFMTP""	:	{[] call BEW_FNC_CUP_BAFMTP_ItemList};
					case ""CUP_GERMANYD"":	{[] call BEW_FNC_CUP_GERMANYD_ItemList};
					case ""CUP_GERMANYW"":	{[] call BEW_FNC_CUP_GERMANYW_ItemList};
					case ""CUP_CDFD""	:	{[] call BEW_FNC_CUP_CDFD_ItemList};
					case ""CUP_CDFW""	:	{[] call BEW_FNC_CUP_CDFW_ItemList};
					case ""CUP_HIL""	:	{[] call BEW_FNC_CUP_HIL_ItemList};
					case ""CUP_RUS""	:	{[] call BEW_FNC_CUP_RUS_ItemList};
					
					case ""3CBD""		:	{[] call BEW_FNC_3CBDItemList};
					case ""3CBMTP""		:	{[] call BEW_FNC_3CBMTPItemList};
					
					case ""AUSArmy""	:	{[] call BEW_FNC_AUSArmyItemList};
					case ""NZArmy""		:	{[] call BEW_FNC_NZArmyItemList};
					
					case ""BWFLEK""		:	{[] call BEW_FNC_BWFLEKItemList};
					case ""BWTROP""		:	{[] call BEW_FNC_BWTROPItemList};
					
					case ""FFAA""		:	{[] call BEW_FNC_FFAAItemList};
					
					case ""ROARS""		:	{[] call BEW_FNC_ROARSItemList};
					
					case ""FRENCH""		:	{[] call BEW_FNC_FRENCHItemList};
					
					case ""CAFT""		:	{[] call BEW_FNC_CAFTItemList};
					
					case ""SWEDEArmy""	:	{[] call BEW_FNC_SWEDEArmyItemList};
				
					case ""ITALYArmy""	:	{[] call BEW_FNC_ITALYArmyItemList};
					
					case ""USARMYE""	:	{[] call BEW_FNC_NATO_ItemList};
					
				};
				
			", _x];

		} forEach _factionTypes;	
	
	
	
	// Weapon Restrictions
		
		{
		
			call compile format ["	
				
				%1_WeaponRestrictionList = switch (_%1Faction select 1) do {
				
					case ""NATO""		:	{[] call BEW_FNC_Vanilla_WeaponRestrictionList};
					case ""NATO_T""		:	{[] call BEW_FNC_Vanilla_WeaponRestrictionList};
					case ""NATO_W""		:	{[] call BEW_FNC_Vanilla_WeaponRestrictionList};
					case ""CSAT""		:	{[] call BEW_FNC_Vanilla_WeaponRestrictionList};
					case ""CSAT_T""		:	{[] call BEW_FNC_Vanilla_WeaponRestrictionList};
					case ""AAF""		:	{[] call BEW_FNC_Vanilla_WeaponRestrictionList};
					case ""LDF""		:	{[] call BEW_FNC_Vanilla_WeaponRestrictionList};
					case ""FIA""		:	{[] call BEW_FNC_Vanilla_WeaponRestrictionList};
					case ""CTRG""		:	{[] call BEW_FNC_Vanilla_WeaponRestrictionList};	
					case ""SYNDIKAT""	:	{[] call BEW_FNC_Vanilla_WeaponRestrictionList};					
					
					case ""USARMYD""	:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					case ""USARMYW""	:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					case ""USMCD""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					case ""VDV""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					case ""VDV_D""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					case ""HIDF""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					case ""CDF""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					case ""SAF""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					case ""SOCOM""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					case ""CHDKZ""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					
					case ""CUP_USARMYD"":	{[] call BEW_FNC_CUP_WeaponRestrictionList};
					case ""CUP_USARMYW"":	{[] call BEW_FNC_CUP_WeaponRestrictionList};
					case ""CUP_USMCD""	:	{[] call BEW_FNC_CUP_WeaponRestrictionList};
					case ""CUP_USMCW""	:	{[] call BEW_FNC_CUP_WeaponRestrictionList};
					case ""CUP_BAFD""	:	{[] call BEW_FNC_CUP_WeaponRestrictionList};
					case ""CUP_BAFMTP""	:	{[] call BEW_FNC_CUP_WeaponRestrictionList};
					case ""CUP_GERMANYD"":	{[] call BEW_FNC_CUP_WeaponRestrictionList};
					case ""CUP_GERMANYW"":	{[] call BEW_FNC_CUP_WeaponRestrictionList};
					case ""CUP_CDFD""	:	{[] call BEW_FNC_CUP_WeaponRestrictionList};
					case ""CUP_CDFW""	:	{[] call BEW_FNC_CUP_WeaponRestrictionList};
					case ""CUP_HIL""	:	{[] call BEW_FNC_CUP_WeaponRestrictionList};
					case ""CUP_RUS""	:	{[] call BEW_FNC_CUP_WeaponRestrictionList};
					
					case ""3CBD""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					case ""3CBMTP""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					
					case ""AUSArmy""	:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					case ""NZArmy""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					
					case ""BWFLEK""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					case ""BWTROP""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					
					case ""FFAA""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					
					case ""ROARS""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					
					case ""FRENCH""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					
					case ""CAFT""		:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					
					case ""SWEDEArmy""	:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					
					case ""ITALYArmy""	:	{[] call BEW_FNC_RHS_WeaponRestrictionList};
					
					case ""USARMYE""	:	{[] call BEW_FNC_Vanilla_WeaponRestrictionList};
					
				};
				
			", _x];

		} forEach _factionTypes;	
		
		
		
	// Item Restrictions
		
		{
		
			call compile format ["
				
				%1_ItemRestrictionList = switch (_%1Faction select 1) do {
			
					case ""NATO""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""NATO_T""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""NATO_W""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CSAT""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CSAT_T""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""AAF""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""LDF""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""FIA""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CTRG""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};	
					case ""SYNDIKAT""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};						
					
					case ""USARMYD""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""USARMYW""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""USMCD""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""VDV""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""VDV_D""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""HIDF""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CDF""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""SAF""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""SOCOM""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CHDKZ""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					
					case ""CUP_USARMYD"":	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CUP_USARMYW"":	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CUP_USMCD""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CUP_USMCW""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CUP_BAFD""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CUP_BAFMTP""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CUP_GERMANYD"":	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CUP_GERMANYW"":	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CUP_CDFD""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CUP_CDFW""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CUP_HIL""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""CUP_RUS""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					
					case ""3CBD""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""3CBMTP""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					
					case ""AUSArmy""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""NZArmy""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
						
					case ""BWFLEK""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					case ""BWTROP""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					
					case ""FFAA""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					
					case ""ROARS""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					
					case ""FRENCH""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					
					case ""CAFT""		:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					
					case ""SWEDEArmy""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					
					case ""ITALYArmy""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					
					case ""USARMYE""	:	{[] call BEW_FNC_Vanilla_ItemRestrictionList};
					
				};
	
			", _x];

		} forEach _factionTypes;	