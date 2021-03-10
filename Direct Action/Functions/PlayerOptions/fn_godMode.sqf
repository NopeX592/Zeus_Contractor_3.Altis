private ["_veh", "_admin", "_conditions", "_actionColor", "_actionText"];

_veh = _this param [0];
_squadLeader = _this param [1,FALSE,[FALSE]];
_admin = _this param [2,FALSE,[FALSE]];
_actionPosition = _this param [3];
_actionColor = "<t color='#ffff33'>";
_actionTextON = "- God Mode ON</t>";
_actionTextOFF = "- God Mode OFF</t>";

// Select Action Color

	if (_squadLeader) then {

		_actionColor = "<t color='#00ff00'>";
		
	};


	if (_admin) then {

		_actionColor = "<t color='#0000FF'>";	
	};


// Action Conditions
	
	_conditions = "(isDamageAllowed player) and (player getVariable 'AdminMenu')";
	_leaderConditions = "(true)";
	_adminConditions = "(true)";

	if (_squadLeader) then {

		_leaderConditions = "(player == leader group player)";
		
	};
	
	
	if (_admin) then {

		_adminConditions = "(serverCommandAvailable '#kick')";
		
	};

_conditionsON = format ["%1 && %2 && %3", _conditions, _leaderConditions, _adminConditions];	
_conditionsOFF = format ["!%1 && %2 && %3", _conditions, _leaderConditions, _adminConditions];	


// Main Script

	godMode = false;
	
	// God Mode ON
	
		player addAction [
				
			_actionColor + _actionTextON,  
					
			{
				
				player allowDamage false;
				hint "God Mode Enabled";
					
			}
								
		, [], _actionPosition, false, true, "", _conditionsON]; 
				
				
				
	// God Mode OFF

		player addAction [
				
			_actionColor + _actionTextOFF,  
				
			{
				
				player allowDamage true;
				hint "God Mode Disabled";
				
			}
						
		, [], _actionPosition, false, true, "", _conditionsOFF]; 