
_actionPosition = -96;
_actionColor = "<t color='#99ccff'>";


	// Open Admin Menu

		_actionText = "OPEN ADMIN MENU</t>";
		
		player addAction [ 
			 
			_actionColor + _actionText,  
			 
			{ 
			 
				player setVariable ["AdminMenu", TRUE];	
			
			} 
			 		 
		, [], _actionPosition, false, false, "", "(serverCommandAvailable '#kick') and !(player getVariable 'AdminMenu')"]; 
		
		
		
	// Close Squad Leader Menu
	
		_actionText = "CLOSE ADMIN MENU</t>";

		player addAction [ 
			 
			_actionColor + _actionText,  
			 
			{ 
			 
				player setVariable ["AdminMenu", FALSE];	
			
			} 
			 		 
		, [], _actionPosition, false, false, "", "(serverCommandAvailable '#kick') and (player getVariable 'AdminMenu')"]; 