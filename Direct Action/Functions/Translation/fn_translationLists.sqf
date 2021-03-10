	private ["_bluFaction", "_blu_SofFaction", "_opfFaction", "_opf_SOFFaction", "_ind_1Faction", "_ind_2Faction", "_rebel_1Faction"];
	
		_bluFaction				=	bluFaction;
		_blu_SofFaction			=	blu_SofFaction;
		_opfFaction				=	opfFaction;
		_opf_SOFFaction			=	opf_SOFFaction;
		_ind_1Faction			=	ind_1Faction;
		_ind_2Faction			=	ind_2Faction;
		_rebel_1Faction			=	rebel_1Faction;
		_rebel_2Faction			=	rebel_2Faction;

	
	// Define Translation Lists
					
					
		_factionTypes = ["BLU", "OPF", "BLU_SOF", "OPF_SOF", "IND_1", "IND_2", "REBEL_1", "REBEL_2"];
		
	{
		
		call compile format ["
					

			%1_Map_TransList = switch ((_%1Faction) select 0) do {
			
				case ""NATO""			:	{[] call BEW_FNC_Nato_TransList};
				case ""NATO_T""			:	{[] call BEW_FNC_Nato_T_TransList};
				case ""NATO_W""			:	{[] call BEW_FNC_Nato_W_TransList};
				case ""USARMYD""		:	{[] call BEW_FNC_USArmyD_TransList};
				case ""USARMYW""		:	{[] call BEW_FNC_USArmyW_TransList};
				case ""USMCD""			:	{[] call BEW_FNC_UsmcD_TransList};
				case ""CTRG""			:	{[] call BEW_FNC_CTRG_TransList};
				case ""SOCOM""			:	{[] call BEW_FNC_Socom_TransList};
				case ""AAF""			:	{[] call BEW_FNC_AAF_TransList};
				case ""LDF""			:	{[] call BEW_FNC_LDF_TransList};
				case ""CDF""			:	{[] call BEW_FNC_CDF_TransList};
				case ""FIA""			:	{[] call BEW_FNC_FIA_TransList};
				case ""SYNDIKAT""		:	{[] call BEW_FNC_SYNDIKAT_TransList};
				case ""CHDKZ""			:	{[] call BEW_FNC_ChDKZ_TransList};
				case ""HIDF""			:	{[] call BEW_FNC_HIDF_TransList};
				case ""USARMYE""		:	{[] call BEW_FNC_USArmyE_TransList};
				case ""CSAT""			:	{[] call BEW_FNC_CSAT_TransList};			
				case ""CSAT_T""			:	{[] call BEW_FNC_CSAT_T_TransList};
				case ""VDV""			:	{[] call BEW_FNC_VDV_TransList};
				case ""VDV_D""			:	{[] call BEW_FNC_VDV_D_TransList};
				case ""3CBD""			:	{[] call BEW_FNC_3cbD_TransList};
				case ""3CBMTP""			:	{[] call BEW_FNC_3CBMTP_TransList};
				case ""SAF""			:	{[] call BEW_FNC_SAF_TransList};
				case ""AUSArmy""		:	{[] call BEW_FNC_AUSArmy_TransList};
				case ""NZArmy""			:	{[] call BEW_FNC_NZArmy_TransList};
				case ""BWFLEK""			:	{[] call BEW_FNC_BWFLEK_TransList};	
				case ""BWTROP""			:	{[] call BEW_FNC_BWTROP_TransList};	
				case ""FFAA""			:	{[] call BEW_FNC_FFAA_TransList};		
				case ""ROARS""			:	{[] call BEW_FNC_ROARS_TransList};	
				case ""FRENCH""			:	{[] call BEW_FNC_FRENCH_TransList};		
				case ""CAFT""			:	{[] call BEW_FNC_CAFT_TransList};	
				case ""SWEDEArmy""		:	{[] call BEW_FNC_SWEDEArmy_TransList};		
				case ""ITALYArmy""		:	{[] call BEW_FNC_ITALYArmy_TransList};		
				case ""CUP_USARMYD""	:	{[] call BEW_FNC_CUP_USARMYD_TransList};
				case ""CUP_USARMYW""	:	{[] call BEW_FNC_CUP_USARMYW_TransList};
				case ""CUP_USMCD""		:	{[] call BEW_FNC_CUP_USMCD_TransList};
				case ""CUP_USMCW""		:	{[] call BEW_FNC_CUP_USMCW_TransList};
				case ""CUP_BAFD""		:	{[] call BEW_FNC_CUP_BAFD_TransList};
				case ""CUP_BAFMTP""		:	{[] call BEW_FNC_CUP_BAFMTP_TransList};
				case ""CUP_GERMANYD""	:	{[] call BEW_FNC_CUP_GERMANYD_TransList};
				case ""CUP_GERMANYW""	:	{[] call BEW_FNC_CUP_GERMANYW_TransList};
				case ""CUP_CDFD""		:	{[] call BEW_FNC_CUP_CDFD_TransList};
				case ""CUP_CDFW""		:	{[] call BEW_FNC_CUP_CDFW_TransList};
				case ""CUP_HIL""		:	{[] call BEW_FNC_CUP_HIL_TransList};
				case ""CUP_RUS""		:	{[] call BEW_FNC_CUP_RUS_TransList};			
				
			};			
			
			publicVariable ""%1_Map_TransList"";
							
		", _x];

	} forEach _factionTypes;

	
	{
		
		call compile format ["	
		

			%1_New_TransList = switch ((_%1Faction) select 1) do {
			
				case ""NATO""			:	{[] call BEW_FNC_Nato_TransList};
				case ""NATO_T""			:	{[] call BEW_FNC_Nato_T_TransList};
				case ""NATO_W""			:	{[] call BEW_FNC_Nato_W_TransList};
				case ""USARMYD""		:	{[] call BEW_FNC_USArmyD_TransList};
				case ""USARMYW""		:	{[] call BEW_FNC_USArmyW_TransList};
				case ""USMCD""			:	{[] call BEW_FNC_UsmcD_TransList};
				case ""CTRG""			:	{[] call BEW_FNC_CTRG_TransList};
				case ""SOCOM""			:	{[] call BEW_FNC_Socom_TransList};
				case ""AAF""			:	{[] call BEW_FNC_AAF_TransList};
				case ""LDF""			:	{[] call BEW_FNC_LDF_TransList};
				case ""CDF""			:	{[] call BEW_FNC_CDF_TransList};
				case ""FIA""			:	{[] call BEW_FNC_FIA_TransList};
				case ""SYNDIKAT""		:	{[] call BEW_FNC_SYNDIKAT_TransList};
				case ""CHDKZ""			:	{[] call BEW_FNC_ChDKZ_TransList};
				case ""HIDF""			:	{[] call BEW_FNC_HIDF_TransList};
				case ""USARMYE""		:	{[] call BEW_FNC_USArmyE_TransList};
				case ""CSAT""			:	{[] call BEW_FNC_CSAT_TransList};			
				case ""CSAT_T""			:	{[] call BEW_FNC_CSAT_T_TransList};
				case ""VDV""			:	{[] call BEW_FNC_VDV_TransList};
				case ""VDV_D""			:	{[] call BEW_FNC_VDV_D_TransList};
				case ""3CBD""			:	{[] call BEW_FNC_3cbD_TransList};
				case ""3CBMTP""			:	{[] call BEW_FNC_3CBMTP_TransList};
				case ""SAF""			:	{[] call BEW_FNC_SAF_TransList};
				case ""AUSArmy""		:	{[] call BEW_FNC_AUSArmy_TransList};
				case ""NZArmy""			:	{[] call BEW_FNC_NZArmy_TransList};
				case ""BWFLEK""			:	{[] call BEW_FNC_BWFLEK_TransList};	
				case ""BWTROP""			:	{[] call BEW_FNC_BWTROP_TransList};	
				case ""FFAA""			:	{[] call BEW_FNC_FFAA_TransList};		
				case ""ROARS""			:	{[] call BEW_FNC_ROARS_TransList};	
				case ""FRENCH""			:	{[] call BEW_FNC_FRENCH_TransList};		
				case ""CAFT""			:	{[] call BEW_FNC_CAFT_TransList};	
				case ""SWEDEArmy""		:	{[] call BEW_FNC_SWEDEArmy_TransList};		
				case ""ITALYArmy""		:	{[] call BEW_FNC_ITALYArmy_TransList};		
				case ""CUP_USARMYD""	:	{[] call BEW_FNC_CUP_USARMYD_TransList};
				case ""CUP_USARMYW""	:	{[] call BEW_FNC_CUP_USARMYW_TransList};
				case ""CUP_USMCD""		:	{[] call BEW_FNC_CUP_USMCD_TransList};
				case ""CUP_USMCW""		:	{[] call BEW_FNC_CUP_USMCW_TransList};
				case ""CUP_BAFD""		:	{[] call BEW_FNC_CUP_BAFD_TransList};
				case ""CUP_BAFMTP""		:	{[] call BEW_FNC_CUP_BAFMTP_TransList};
				case ""CUP_GERMANYD""	:	{[] call BEW_FNC_CUP_GERMANYD_TransList};
				case ""CUP_GERMANYW""	:	{[] call BEW_FNC_CUP_GERMANYW_TransList};
				case ""CUP_CDFD""		:	{[] call BEW_FNC_CUP_CDFD_TransList};
				case ""CUP_CDFW""		:	{[] call BEW_FNC_CUP_CDFW_TransList};
				case ""CUP_HIL""		:	{[] call BEW_FNC_CUP_HIL_TransList};
				case ""CUP_RUS""		:	{[] call BEW_FNC_CUP_RUS_TransList};			
				
			};
			
			publicVariable ""%1_New_TransList"";
							
		", _x];

	} forEach _factionTypes;	
			
			
	all_TransLists 	= [
	
		[BLU_Map_TransList, BLU_New_TransList],
		[OPF_Map_TransList, OPF_New_TransList],
		[BLU_SOF_Map_TransList, BLU_SOF_New_TransList],
		[IND_1_Map_TransList, IND_1_New_TransList],
		[IND_2_Map_TransList, IND_2_New_TransList],
		[Rebel_1_Map_TransList, Rebel_1_New_TransList],
		[Rebel_2_Map_TransList, Rebel_2_New_TransList]
	
	];