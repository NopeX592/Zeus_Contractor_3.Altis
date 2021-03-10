///////////////////////////////////////////////////////////////////////////////////////////////////
//  B2 Check Pilot Script v1.07                                                                  //
//  Execute from mission init.sqf                                                                //
//  [class,vehicleType] execVM "scripts\b2_checkPilot.sqf";                                      //
//  ["Helicopter","B_Helipilot_F"] execVM "scripts\b2_checkPilot.sqf";                           //
//  ["Wheeled_APC_F","B_Crew_F"] execVM "scripts\b2_checkPilot.sqf";                             //
///////////////////////////////////////////////////////////////////////////////////////////////////

private ["_vehType","_crewType","_crewTypeName","_veh","_seats", "_allVehAndCrewTypes", "_vehAndCrewType"];

// while {!(serverCommandAvailable "#kick")} do {
while {true} do {


	_allVehAndCrewTypes 	= 	_this select 1;
	
	{
		
		_vehAndCrewType	=	_x;
		
		_vehType 		= 	_vehAndCrewType select 0;
		_crewType 		= 	_vehAndCrewType select 1;

		_crewTypeName 	= 	getText(configFile >> "CfgVehicles" >> _crewType >> "displayName");
		
		
		
		if (typeOf player != _crewType) then {

			waitUntil {vehicle player != player};
			_veh = vehicle player;
			
			systemchat format ["%1", _veh];

			if (_veh isKindOf _vehType && !(_veh isKindOf "ParachuteBase")) then {
				
				_seats = [driver _veh];
					
				if (_veh isKindOf "Helicopter") then {_seats = _seats + [_veh turretUnit [0]];};
					
				if (player in _seats) then {
						
					player action ["GetOut",_veh];
					waitUntil {vehicle player == player};
					hint format ["RESTRICTED VEHICLE\n\nRequired class: %1",_crewTypeName];
					if (isEngineOn _veh) then {_veh engineOn false};
					
				};
			  
			};
		   
		};
	 
	} forEach _allVehAndCrewTypes; 

};