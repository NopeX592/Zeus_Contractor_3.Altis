/*

	// FACTION DETAILS (COPY AND PASTE these strings into the code below to change factions. Strings are CASE SENSITIVE.).
	
		// Vanilla Factions
		
			NATO 			 				- "USARMYD"
			NATO (Pacific)					- "NATO_T"
			NATO (Woodland)					- "NATO_W"
			*CTRG (British Special Forces)	- "CTRG"
			CSAT 							- "CSAT"
			CSAT (Pacific)					- "CSAT_T"
			*Altis Armed Forces				- "AAF"
			Livonia Defence Forces			- "LDF"
			*Freedom Independance Army		- "FIA"
			*Syndikat Rebels				- "SYNDIKAT"	
		
		
		// CUP Factions
		
			US Army (Woodland) 				- "CUP_USARMYW"
			US Army (Desert) 				- "CUP_USARMYD"
			USMC (Woodland) 				- "CUP_USMCW"
			USMC (Desert) 					- "CUP_USMCD"
			British Army (Woodland) 		- "CUP_BAFMTP"
			British Army (Desert) 			- "CUP_BAFD"
			Russian Army 					- "CUP_RUS"
		
		
		// RHS Factions
		
			US Army (Desert) 				- "USARMYD"
			US Army (Woodland) 				- "USARMYW" 
			US Marine Corps (Desert) 		- "USMCD"
			US Marine Woodland (Woodland) 	- "USMCW" (Not configured)
			US Special Operations 			- "SOCOM"
			Russian Airborne 				- "VDV"
			Russian Airborne (Desert)		- "VDV_D"
			*Serbian Armed Forces 			- "SAF"
			*Chernarus Defence Force 		- "CDF"
			*Chernarus Recels				- "CHDKZ"
			*Horizon Islands Defence Force 	- "HIDF"
		
		
		// RHS ADDON FACTIONS (Do not use without RHS)
		
		
			// 3CB Factions (British)
			
				British Army (MTP) 			- "3CBMTP"
				British Army (Desert) 		- "3CBD"
			
			
			// Project Uncut Factions (Australia)
			
				Australian Army				- "AUSArmy"

			
			// FFAA Factions (Spanish)
			
				Spanish Army (Arid)			- "FFAA"
			
			
			// BWMod Factions (German)
			
				Bundeswehr (Woodland)		- "BWFLEK"
				Bundeswehr (Desert)			- "BWTROP"
				
				
			// AMF Factions (French)
			
				French Army					- "FRENCH"
				
				
			// TFC-CAF Factions (Canada)
			
				Canadian Army (Temperate)	- "CAFT"
				
			
			// NZDF Factions (New Zealand)
			
				*NZ Army - "NZArmy"
				
				
			// SFP Factions (Sweden)
			
				*Swedish Army - "SWEDEArmy"
		
		
		* Small Faction - Only use for rebels and SOF factions
	
			
*/		
		

// USE THIS TO FORCE VANILLA

	forceVanilla = false;
	
	
// COPY AND PASTE FACTION STRINGS BELOW
	
		switch (true) do {
		
			// Vanilla Setup
			
				case ((!(isClass(configfile >> "CfgMods" >> "RHSUSAF")) and !(isClass(configfile >> "CfgMods" >> "CUP_Units"))) or (forceVanilla))	:	{
				
					bluFaction				=	"NATO";				// Main Blufor Faction
					blu_AltFaction			=	"NATO";				// Alt Blufor Faction (Unused)
					blu_SofFaction			=	"CTRG";				// Blufor SOF Faction
					opfFaction				=	"CSAT";				// Main Opfor Faction
					opf_SOFFaction			=	"CSAT";				// Opfor SOF Faction
					ind_1Faction			=	"AAF";				// Main Independant Faction 1
					ind_2Faction			=	"NATO_T";			// Main Independant Faction 2
					rebel_1Faction			=	"FIA";				// Rebel Faction 1
					rebel_2Faction			=	"LDF";				// Rebel Faction 2
					
					systemchat "Mission Configured For Vanilla";
				
				};
				
				
			// RHS Setup
		
				case ((isClass(configfile >> "CfgMods" >> "RHSUSAF")) and !(forceVanilla))	:	{

					bluFaction				=	"USARMYD";			// Main Blufor Faction
					blu_AltFaction			=	"USARMYD";			// Alt Blufor Faction (Unused)
					blu_SofFaction			=	"SAF";				// Blufor SOF Faction
					opfFaction				=	"VDV";				// Main Opfor Faction
					opf_SOFFaction			=	"VDV";				// Opfor SOF Faction
					ind_1Faction			=	"USARMYD";			// Main Independant Faction 1
					ind_2Faction			=	"USMCD";			// Main Independant Faction 2
					rebel_1Faction			=	"CDF";				// Rebel Faction 1
					rebel_2Faction			=	"HIDF";				// Rebel Faction 2
					
					systemchat "Mission Configured For RHS";
					
				};
				
				
			// CUP Setup
		
				case ((isClass(configfile >> "CfgMods" >> "CUP_Units")) and !(forceVanilla))	:	{

					bluFaction				=	"CUP_USARMYD";		// Main Blufor Faction
					blu_AltFaction			=	"CUP_USARMYD";		// Alt Blufor Faction (Unused)
					blu_SofFaction			=	"CUP_USARMYW";		// Blufor SOF Faction
					opfFaction				=	"CUP_RUS";				// Main Opfor Faction
					opf_SOFFaction			=	"CUP_RUS";				// Opfor SOF Faction
					ind_1Faction			=	"CUP_BAFMTP";		// Main Independant Faction 1
					ind_2Faction			=	"CUP_USMCD";		// Main Independant Faction 2
					rebel_1Faction			=	"FIA";				// Rebel Faction 1
					rebel_2Faction			=	"LDF";				// Rebel Faction 2
					
					systemchat "Mission Configured For CUP";
					
				};

		};
		
		
// DON'T TOUCH THIS
		
	
	// British Army
		
		if ((isClass(configfile >> "CfgMods" >> "RHSUSAF")) and (isClass(configfile >> "CfgMods" >> "UK3CB_BAF_Units")) and !(forceVanilla)) then {

			_3CB_Factions = ["3CBD", "3CBMTP"];
			
			if !(bluFaction in _3CB_Factions) then {
			
				bluFaction = "3CBD";
			
			};

		};
	
	
	// German Bundeswehr
		
		if ((isClass(configfile >> "CfgMods" >> "RHSUSAF")) and (isClass(configfile >> "CfgMods" >> "BWA3")) and !(forceVanilla)) then {

			_BWMod_Factions = ["BWFLEK", "BWTROP"];
			
			if !(bluFaction in _BWMod_Factions) then {
			
				bluFaction = "BWTROP";
			
			};

		};
		
		
	// Spanish Army
		
		if ((isClass(configfile >> "CfgMods" >> "RHSUSAF")) and (isClass(configfile >> "CfgMods" >> "FFAAMOD")) and !(forceVanilla)) then {

			_FFAA_Factions = ["FFAA"];
			
			if !(bluFaction in _FFAA_Factions) then {
			
				bluFaction = "FFAA";
			
			};

		};
		
		
	// French Army
		
		if ((isClass(configfile >> "CfgMods" >> "RHSUSAF")) and (isClass(configfile >> "CfgMods" >> "AMF_AMF_DLC")) and !(forceVanilla)) then {

			_FRENCH_Factions = ["FRENCH"];
			
			if !(bluFaction in _FRENCH_Factions) then {
			
				bluFaction = "FRENCH";
			
			};

		};
		
		
	// Canadian Army
		
		if ((isClass(configfile >> "CfgMods" >> "RHSUSAF")) and (isClass(configfile >> "CfgMods" >> "TFC")) and !(forceVanilla)) then {

			_TFC_Factions = ["CAFT"];
			
			if !(bluFaction in _TFC_Factions) then {
			
				bluFaction = "CAFT";
			
			};

		};


	// Australian Army 
		
		if ((isClass(configfile >> "CfgMods" >> "RHSUSAF")) and (isClass(configfile >> "CfgMods" >> "ADFU")) and (isClass(configfile >> "CfgMods" >> "UK3CB_BAF_Units")) and !(forceVanilla)) then {

			_ADFU_Factions = ["AUSArmy"];		
			
			if !(bluFaction in _ADFU_Factions) then {
			
				bluFaction = "AUSArmy";
			
			};

		};


	// New Zealand Army
		
		if ((isClass(configfile >> "CfgMods" >> "RHSUSAF")) and (isClass(configfile >> "CfgMods" >> "NZDFMKII")) and (isClass(configfile >> "CfgMods" >> "UK3CB_BAF_Units")) and !(forceVanilla)) then {

			_NZDF_Factions = ["NZArmy"];		
			
			if !(bluFaction in _NZDF_Factions) then {
			
				bluFaction = "NZArmy";
			
			};

		};
		
		
	// Swedish Army
		
		if ((isClass(configfile >> "CfgMods" >> "RHSUSAF")) and (isClass(configfile >> "CfgMods" >> "sfp")) and !(forceVanilla)) then {

			_SFP_Factions = ["SWEDEArmy"];		
			
			if !(bluFaction in _SFP_Factions) then {
			
				bluFaction = "SWEDEArmy";
			
			};

		};
		
		
	// Italy Army
		
		if ((isClass(configfile >> "CfgMods" >> "RHSUSAF")) and (isClass(configfile >> "CfgFactionClasses" >> "PedagneMOD")) and !(forceVanilla)) then {

			_Pedagne_Factions = ["ITALYArmy"];		
			
			if !(bluFaction in _Pedagne_Factions) then {
			
				bluFaction = "ITALYArmy";
			
			};

		};
		
		
	// Commonwealth
		
		if ((isClass(configfile >> "CfgMods" >> "RHSUSAF")) and (isClass(configfile >> "CfgMods" >> "ADFU")) and (isClass(configfile >> "CfgMods" >> "TFC")) and (isClass(configfile >> "CfgMods" >> "NZDFMKII")) and (isClass(configfile >> "CfgMods" >> "UK3CB_BAF_Units")) and !(forceVanilla)) then {

				bluFaction = "3CBD";
				ind_1Faction = "CAFT";
				ind_2Faction = "USMCD";
				blu_SofFaction = "AUSArmy";
				rebel_1Faction = "SOCOM";
				rebel_2Faction = "NZArmy";
	
		};
	
	
	// European Union
		
		if ((isClass(configfile >> "CfgMods" >> "RHSUSAF")) and (isClass(configfile >> "CfgFactionClasses" >> "PedagneMOD")) and (isClass(configfile >> "CfgMods" >> "AMF_AMF_DLC")) and (isClass(configfile >> "CfgMods" >> "FFAAMOD")) and (isClass(configfile >> "CfgMods" >> "BWA3")) and (isClass(configfile >> "CfgMods" >> "sfp")) and !(forceVanilla)) then {

				bluFaction = "BWFLEK";
				ind_1Faction = "FFAA";
				ind_2Faction = "ITALYArmy";
				blu_SofFaction = "FRENCH";
				rebel_1Faction = "SOCOM";
				rebel_2Faction = "SWEDEArmy";
	
		};
