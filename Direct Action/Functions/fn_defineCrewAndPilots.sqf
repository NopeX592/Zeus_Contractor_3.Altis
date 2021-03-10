
	// Define Vanilla Crew
	
		_vanillaCrew = [

			"I_E_Crew_F",
			"I_crew_F",
			"B_T_Crew_F",
			"B_crew_F",
			"I_G_Soldier_lite_F",
			"B_W_Crew_F",
			"O_T_Crew_F",
			"O_crew_F"

		];



	// Define Vanilla Pilots

		_vanillaPilots = [

			"I_E_Helipilot_F",
			"I_helipilot_F",
			"B_T_Helipilot_F",
			"B_Helipilot_F",
			"I_G_Soldier_unarmed_F",
			"B_W_Helipilot_F",
			"O_T_Helipilot_F",
			"O_helipilot_F"

		];

	
	// Define Translated Crew
	
		BEW_v_allowedCrew = _vanillaCrew;
		
		{
			
			_type = [_x] call BEW_FNC_TranslateClassNames;
			BEW_v_allowedCrew = BEW_v_allowedCrew + [_type];

		} forEach _vanillaCrew;
		
		publicVariable "BEW_v_allowedCrew";
	
	
	// Define Translated Pilots
		
		BEW_v_allowedPilots = _vanillaPilots;
		
		{
			
			_type = [_x] call BEW_FNC_TranslateClassNames;
			BEW_v_allowedPilots = BEW_v_allowedPilots + [_type];

		} forEach _vanillaPilots;
		
		publicVariable "BEW_v_allowedPilots";
	
