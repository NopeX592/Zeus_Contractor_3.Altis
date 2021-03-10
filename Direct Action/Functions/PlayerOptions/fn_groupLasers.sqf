private ["_veh", "_admin", "_conditions", "_actionColor", "_actionText"];

_veh = _this param [0];
_squadLeader = _this param [1,FALSE,[FALSE]];
_admin = _this param [2,FALSE,[FALSE]];
_actionPosition = _this param [3];
_actionColor = "<t color='#ffff33'>";
_actionTextON = "- Group IR Lasers ON</t>";
_actionTextOFF = "- Group IR Lasers OFF</t>";

// Select Action Color

	if (_squadLeader) then {

		_actionColor = "<t color='#00ff00'>";
		
	};


	if (_admin) then {

		_actionColor = "<t color='#FF0000'>";	
	};


// Action Conditions
	
	_conditions = "(IRlasers) and (player getVariable 'AdminMenu')";
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


		// Turn ON IR Lasers

				player addAction [ 
				 
				_actionColor + _actionTextON,  
				 
				{ 
				 
				group player enableIRLasers true; 
				{IRlasers = true; publicVariable "IRlasers";} remoteExec ["bis_fnc_call", 2]; 
				 
				} 
				 
				 
				, [], _actionPosition, false, true, "", _conditionsON]; 
				 
				 
				 
		// Turn OFF IR Lasers		 
				 
				player addAction [ 
				 
				_actionColor + _actionTextOFF,  
				 
				{ 
				 
				group player enableIRLasers false; 
				{IRlasers = false; publicVariable "IRlasers";} remoteExec ["bis_fnc_call", 2];
				 
				} 
				 
				 
				, [], _actionPosition, false, true, "", _conditionsOFF];