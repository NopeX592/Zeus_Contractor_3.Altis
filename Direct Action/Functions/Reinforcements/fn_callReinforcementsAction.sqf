	// Set Reinforcement Mission Flag

		if (isnil "BEW_V_reinforcementRequestActive") then {
		
			BEW_V_reinforcementRequestActive = FALSE;	
				publicVariable "BEW_V_reinforcementRequestActive";
		
		};
	
	
	// Available Action
	
		player addAction [ 
			 
			"<t color='#00ff00'>- Call Reinforcements",  
			 
			{ 
			
				_caller =  (_this select 1);
			 
				openMap true;
				hint "SELECT DROP ZONE FOR REINFORCEMENTS";
				
				_array = [group _caller];
				
				_array onMapSingleClick {	

					_callerGroup = _this select 0;
					
				onMapSingleClick {};

					openMap false;
					playSound 'click';
					
					[_pos, _callerGroup] remoteExec ["BEW_FNC_callReinforcementsScript", 2];

				};						
			
			} 
			 		 
		, [], -95, false, true, "", "(player getVariable 'SquadLeaderMenu') and !(BEW_V_reinforcementRequestActive) and (player == leader group player) and (player distance2D markerPos 'safeZone_1' > markerSize 'safeZone_1' select 0)"]; 
		
	
	
	// Unavailable Action
	
		player addAction [ 
			 
			"<t color='#00ff00'>- Reinforcements Unavailable At This Time",  
			 
			{ 
			
				hint "REINFORCEMENTS UNAVAILABLE AT THIS TIME";
							
			} 
			 		 
		, [], -95, false, true, "", "(([] call BEW_FNC_CountAllGroupsWithPlayers) < 10) and (player getVariable 'SquadLeaderMenu') and (BEW_V_reinforcementRequestActive) and (player == leader group player) and (player distance2D markerPos 'safeZone_1' > markerSize 'safeZone_1' select 0)"]; 