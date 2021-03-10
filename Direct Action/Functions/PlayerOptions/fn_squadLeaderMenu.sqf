
_actionPosition = -93;
_actionColor = "<t color='#99ccff'>";


	// Open Squad Leader Menu

		_actionText = "OPEN SQUAD LEADER MENU</t>";
		
		player addAction [ 
			 
			_actionColor + _actionText,  
			 
			{ 
			 
				player setVariable ["SquadLeaderMenu", TRUE];	
			
			} 
			 		 
		, [], _actionPosition, false, false, "", "(player == leader group player) and !(player getVariable 'SquadLeaderMenu')"]; 
		
		
		
	// Close Squad Leader Menu
	
		_actionText = "CLOSE SQUAD LEADER MENU</t>";

		player addAction [ 
			 
			_actionColor + _actionText,  
			 
			{ 
			 
				player setVariable ["SquadLeaderMenu", FALSE];	
			
			} 
			 		 
		, [], _actionPosition, false, false, "", "(player == leader group player) and (player getVariable 'SquadLeaderMenu')"]; 