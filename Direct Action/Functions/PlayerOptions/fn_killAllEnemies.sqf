private ["_veh", "_admin", "_conditions", "_actionColor", "_actionText", "_radius"];

_veh = _this param [0];
_squadLeader = _this param [1,FALSE,[FALSE]];
_admin = _this param [2,FALSE,[FALSE]];
_actionPosition = _this param [3];
_actionColor = "<t color='#ffff33'>";
_actionText = "- Kill Enemies In 500m</t>";
_radius = 500;

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
		
			_radius = (_this select 3) select 0;
	
			_nearEnemies = (player nearEntities ["Man", _radius]) select {side _x == EAST};
			_nearVehicles = (player nearEntities ["Landvehicle", _radius]);

			{
			
				_enemyCrew = crew _x select {side _x == EAST};
				_nearEnemies append _enemyCrew;
			
			} forEach _nearVehicles;
			
			{_x setDamage 1} forEach _nearEnemies;

		}
	
	
	, [_radius], _actionPosition, false, true, "", _conditions]; 