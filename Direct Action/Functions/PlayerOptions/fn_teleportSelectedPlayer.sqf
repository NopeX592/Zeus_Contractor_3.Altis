private ["_veh", "_admin", "_conditions", "_actionColor", "_actionText"];

_veh = _this param [0];
_squadLeader = _this param [1,FALSE,[FALSE]];
_admin = _this param [2,FALSE,[FALSE]];
_actionPosition = _this param [3];
_actionColor = "<t color='#ffff33'>";
_actionText = "- Teleport Selected Player</t>";


// Select Action Color

	if (_squadLeader) then {

		_actionColor = "<t color='#00ff00'>";
		
	};


	if (_admin) then {

		_actionColor = "<t color='#0000FF'>";	
	};


// Action Conditions
	
	_conditions = "(player getVariable 'AdminMenu')";
	_leaderConditions = "(true)";
	_adminConditions = "(true)";

	if (_squadLeader) then {

		_leaderConditions = "(player == leader group player)";
		
	};
	
	
	if (_admin) then {

		_adminConditions = "(serverCommandAvailable '#kick')";
		
	};

_conditions = format ["%1 && %2 && %3", _conditions, _leaderConditions, _adminConditions];	
	
	
// Main Script
	
	// Next Mission Level
	
		player addAction [
	
		_actionColor + _actionText,  
	
		{
			private ["_nearestPlayer"];
	
				//openmap [true,true]; 
				onMapSingleClick { 
				onMapSingleClick {}; 
				hint "Select Player To Teleport";
				_nearestPlayer = (_pos nearEntities ["Man", 3]) select {_x in allPlayers};
				
				systemchat format ["%1", _nearestPlayer];

				
				};
				

				onMapSingleClick { 
				onMapSingleClick {}; 
				hint "Select Teleport Position";
				_nearestPlayer setPos _pos; 
				openmap [false,false];
				
				};
	
		}
	
	
	, [], _actionPosition, false, true, "", _conditions]; 