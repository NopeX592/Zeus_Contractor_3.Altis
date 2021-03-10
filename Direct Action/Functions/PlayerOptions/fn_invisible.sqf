private ["_veh", "_admin", "_conditions", "_actionColor", "_actionText"];

_veh = _this param [0];
_squadLeader = _this param [1,FALSE,[FALSE]];
_admin = _this param [2,FALSE,[FALSE]];
_actionPosition = _this param [3];
_actionColor = "<t color='#ffff33'>";
_actionTextON = "- Invisibility ON</t>";
_actionTextOFF = "- Invisibility OFF</t>";

// Select Action Color

	if (_squadLeader) then {

		_actionColor = "<t color='#00ff00'>";
		
	};


	if (_admin) then {

		_actionColor = "<t color='#0000FF'>";	
	};


// Action Conditions
	
	_conditions = "(isObjectHidden player) and (player getVariable 'AdminMenu')";
	_leaderConditions = "(true)";
	_adminConditions = "(true)";

	if (_squadLeader) then {

		_leaderConditions = "(player == leader group player)";
		
	};
	
	
	if (_admin) then {

		_adminConditions = "(serverCommandAvailable '#kick')";
		
	};


_conditionsON = format ["!%1 && %2 && %3", _conditions, _leaderConditions, _adminConditions];	
_conditionsOFF = format ["%1 && %2 && %3", _conditions, _leaderConditions, _adminConditions];	


// Main Script

	godMode = false;
	
	
	// Invisibility ON
	
		player addAction [
				
			_actionColor + _actionTextON,  
					
			{
								
				player hideObjectGlobal true;
				hint "Invisibility Enabled";
					
			}
								
		, [], _actionPosition, false, true, "", _conditionsON]; 
							
				
	// Invisibility OFF

		player addAction [
				
			_actionColor + _actionTextOFF,  
				
			{
				
				player hideObjectGlobal false;
				hint "Invisibility Disabled";
				
			}
						
		, [], _actionPosition, false, true, "", _conditionsOFF]; 