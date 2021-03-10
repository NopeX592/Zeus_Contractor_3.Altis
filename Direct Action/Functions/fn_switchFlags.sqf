	
	private ["_flags", "_mapFaction", "_newFaction", "_flagTexture"];
	
	_allFactions = ["BLU", "OPF", "BLU_SOF", "OPF_SOF", "IND_1", "IND_2", "REBEL_1", "REBEL_2"];
	
	{
	
		
		call compile format ["
		
			_flags = getMissionLayerEntities ""FLAG_%1"" select 0; 
			_mapFaction = %1_MapFactionTag;
			_newFaction = %1_NewFactionTag;

		", _x];
		
		{
	
			_flagTexture = switch (true) do {
			
				case (_newFaction == "France_Faction"): {"VehicleTextures\Flags\west\flag_france_co.paa"};
				case (_newFaction == "PedagneMOD"): {"VehicleTextures\Flags\west\flag_italy_co.paa"};
				case (_newFaction == "UK3CB_BAF_Faction_Army_Desert"): {"\A3\Data_F\Flags\flag_uk_CO.paa"};
				case (_newFaction == "sfp_swe_2015"): {"sfp_config\data\flag_sweden_co.paa"};
				case (_newFaction == "UK3CB_BAF_Faction_Army_MTP"): {"\A3\Data_F\Flags\flag_uk_CO.paa"};
				case (_newFaction == "ADFU"): {"adfu_base\data\aus_flag_co.paa"};
				case (_newFaction == "BWA3_Faction_Fleck"): {"bwa3_common\data\bwa3_flag_germany_co.paa"};
				case (_newFaction == "BWA3_Faction_Tropen"): {"bwa3_common\data\bwa3_flag_germany_co.paa"};
				case (_newFaction == "ROARS"): {"a3\data_f\flags\flag_uno_co.paa"};
				default {getText (configfile >> "CfgFactionClasses" >> _newFaction >> "flag")};
				
			};
						
			_x setFlagTexture _flagTexture;
	
		} forEach _flags;
			
	} forEach _allFactions;
	
