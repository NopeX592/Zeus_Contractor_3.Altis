	private ["_translationLists"];

	_obj = param [0];
	_translationLists = param [1];
	
	_allTypes = [
		
		"B_soldier_M_F",
		"B_Soldier_GL_F",
		"B_soldier_AR_F",
		"B_medic_F",
		"B_engineer_F",
		"B_soldier_AT_F",
		"B_soldier_AA_F",
		"B_recon_JTAC_F",
		"B_soldier_UAV_F",
		"B_Helipilot_F",
		"B_crew_F"
	
	];

	{

		_type = _x; 	
		_type = [_type, _translationLists] call BEW_FNC_TranslateClassNames;	
		_displayName = _type call ISSE_Cfg_Vehicle_GetName;
		_actionText = format ["<t color='#00ff00'>Recruit %1", _displayName];
		
		
		call compile format ["
		
			[
			
					_obj,																	
					_actionText,															
					""\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa"",		
					""\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa"",		
					""(player distance2D _target < 5) and !(count ((units group player) select {typeOf _x == '%1'}) > 0) and (player == leader group player) and ((call BEW_FNC_CountAllGroupsWithPlayers) < 10)"",			
					""(player distance2D _target < 5) and !(count ((units group player) select {typeOf _x == '%1'}) > 0) and (player == leader group player) and ((call BEW_FNC_CountAllGroupsWithPlayers) < 10)"",			
					{},																		
					{},																		
					{
					
						_type = (_this select 3 select 0);
						_pos = getPosASL player;
						_group = group player;

						private ['_unit'];
														
						_type createUnit [
							_pos,
							_group,
							""_unit = this;"",
							1,
							""private""
						];
						
						_unit setVehiclePosition [_pos, [], 0, 'NONE'];
						
						
						[

							_unit,																	
							""<t color='#00ff00'>Dismiss Recruit"",															
							""\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa"",		
							""\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa"",		
							""(_this distance2D _target < 5) and (_this == leader group _this)"",			
							""(_caller distance2D _target < 5) and (_caller == leader group _caller)"",			
							{},																		
							{},																		
							{

								deleteVehicle (_this select 0);
							
							},																		
							{},																		
							[],																
							0.5,																	
							99,																		
							true,																	
							false																	
									
						] remoteExec [""BIS_fnc_holdActionAdd"", 0, true];	
					   
					},																		
					{},																		
					['%1'],																
					0.5,																	
					99,																		
					false,																	
					false																	
					
			] remoteExec [""BIS_fnc_holdActionAdd"", 0, true];
		
		", _type];	
		
		
	} forEach _allTypes;	
		
		
		[
		
			_obj,																	
			"<t color='#00ff00'>Cannot Recruit: Not The Squad Leader",															
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",		
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",		
			"(player distance2D _target < 5) and !(player == leader group player)",			
			"(player distance2D _target < 5) and !(player == leader group player)",			
			{},																		
			{},																		
			{

				hintC "You must be the SQUAD LEADER to command recruits.";
			
			},																		
			{},																		
			['%1'],																
			0.5,																	
			99,																		
			false,																	
			false																	
			
		] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
	
	
		[
		
			_obj,																	
			"<t color='#00ff00'>Cannot Recruit: Squad Full",															
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",		
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",		
			"(player distance2D _target < 5) and (player == leader group player) and ((call BEW_FNC_CountAllGroupsWithPlayers) > 9)",			
			"(player distance2D _target < 5) and (player == leader group player) and ((call BEW_FNC_CountAllGroupsWithPlayers) > 9)",			
			{},																		
			{},																		
			{

				hintC "You cannot recruit any more units. The squad is already full.";
			
			},																		
			{},																		
			['%1'],																
			0.5,																	
			99,																		
			false,																	
			false																	
			
		] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
	