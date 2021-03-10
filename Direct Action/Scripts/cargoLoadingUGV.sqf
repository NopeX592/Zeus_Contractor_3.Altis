
private ["_x", "_veh", "_radius", "_liftableObjects", "_nearObjects"];


_radius = 20;

while {alive vehicle player} do {

	if (vehiclecargoenabled vehicle player) then {
	

	_liftableObjects = [];
	_nearObjects = position vehicle player nearObjects _radius;

		{
		
			private ["_x", "_object"];
			
			_object = _x;
		
		
			if ((simulationEnabled _object) and !(isSimpleObject _object) and !(locked _object == 2)) then {
			
				if ((_object isKindOf "thing") or (_object isKindOf "landvehicle") or (_object isKindOf "ship")) then {
			
					if (_object getVariable ["liftingActionCheck", true]) then {
			
						_object setVariable ["liftingActionCheck", false];
					
					
							 _actionText = format ["<t color='#ffff00'>LOAD %1 AS CARGO", [configFile >> "CfgVehicles" >> typeOf _object] call BIS_fnc_displayName];
					
							_object addaction [_actionText, 	
							
							{
								
					
								vehicle player setVehicleCargo (_this select 0);
							
							}
							
							, [], 98, true, true, "", "((driver vehicle _this == _this) or (unitIsUAV vehicle _this)) and (_this distance _target < 10) and ((vehicle _this canVehicleCargo _target) select 0) and (simulationEnabled _target)" ]
				
					};

				};
						
			};
					
		} forEach _nearObjects;
	
}else{


};
	
	sleep 1;

};