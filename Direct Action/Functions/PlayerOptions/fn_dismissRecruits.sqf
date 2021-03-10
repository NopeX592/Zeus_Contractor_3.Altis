private ["_veh", "_admin", "_conditions", "_actionColor", "_actionText"];

_veh = _this param [0];
_squadLeader = _this param [1,FALSE,[FALSE]];
_admin = _this param [2,FALSE,[FALSE]];
_actionPosition = -95;
_actionColor = "<t color='#ffff33'>";
_actionText = "- Dismiss AI Recruits</t>";


// Select Action Color

	if (_squadLeader) then {

		_actionColor = "<t color='#00ff00'>";
		
	};


	if (_admin) then {

		_actionColor = "<t color='#FF0000'>";	
	};


// Action Conditions
	
	_conditions = "(player getVariable 'SquadLeaderMenu') and (count (units group player - playableUnits) > 0)";
	_leaderConditions = "(true)";
	_adminConditions = "(true)";

	if (_squadLeader) then {

		_leaderConditions = "(player == leader group player)";
		
	};
	
	
	if (_admin) then {

		_adminConditions = "(serverCommandAvailable '#kick')";
		
	};

_conditions = format ["%1 && %2 && %3", _conditions, _leaderConditions, _adminConditions];



	// Dismiss Recruits

		player addAction [ 
			 
			_actionColor + _actionText,  
			 
			{ 
			 
						_objs = units group player; 
						 
						{
						
							if (isplayer _x) then {
							
							
							} else {
							
								deleteVehicle _x
							
							}; 
						 
						}forEach _objs;
			
			} 
			 		 
		, [], _actionPosition, false, true, "", _conditions]; 