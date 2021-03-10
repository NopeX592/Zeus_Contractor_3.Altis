if (count BEW_v_CampVehicleSpawnMarkers < 1) exitWith {};

private [

	"_militaryCamps", 
	"_enemyMilitaryCamps", 
	"_startCamp", 
	"_endCamp",
	"_type",
	"_veh",
	"_vehGroup",
	"_startSpawnMarker",
	"_startSpawnPos",
	"_endSpawnMarker",
	"_endSpawnPos",
	"_respawnDelay"

];


_respawnDelay = 300;


while {true} do {


// Define All Camps

	_militaryCamps = [["MILITARY"]] call BEW_FNC_DefineObjectives; 


// Filter By Enemy Camps

	_enemyMilitaryCamps = _militaryCamps select {!(markerColor _x == "colorBLUFOR")};


	if (count _enemyMilitaryCamps > 1) then {


			// Define Start 
			
				_startCamp = _enemyMilitaryCamps call BIS_FNC_SelectRandom;
				_startSpawnMarker = [BEW_v_CampVehicleSpawnMarkers, markerPos _startCamp] call BIS_fnc_nearestPosition;
				_startSpawnPos = markerPos _startSpawnMarker;


			// Remove Start From All Camps
			
				_enemyMilitaryCamps = _enemyMilitaryCamps - [_startCamp]; 
				

			// Define End
			
				_endCamp = _enemyMilitaryCamps call BIS_FNC_SelectRandom;
				_endSpawnMarker = [BEW_v_CampVehicleSpawnMarkers, markerPos _endCamp] call BIS_fnc_nearestPosition;
				_endSpawnPos = markerPos _endSpawnMarker;
			
			
			
			// Define Vehicle Types
			
				_vehicleTypes = ["TRUCK"] call OPF_VehList; 
			
			
			// Select Vehicle Type
			
				_type = _vehicleTypes call BIS_FNC_SelectRandom;
				
			
			// Create Vehicle
			
				private _convoyVehs = []; 
				private _convoyUnits = []; 

				private _convoyTypes = [ 
				 
					"O_Truck_02_covered_F", 
					"O_APC_Wheeled_02_rcws_v2_F", 
					"O_MRAP_02_gmg_F" 
				 
				]; 
				 
				{ 
				 
					_type = [_x] call BEW_fnc_translateClassNames;
					_vehArray = [_startSpawnPos, markerDir _startSpawnMarker, _type, east] call BIS_fnc_spawnVehicle;
					_veh = _vehArray select 0;
					_crew = _vehArray select 1;
					_group = _vehArray select 2;
					_crew joinSilent group (leader (_convoyVehs select 0));
					
					
					// Clear Vehicle

						clearMagazineCargoGlobal _veh;
						clearWeaponCargoGlobal _veh;
						clearBackpackCargoGlobal _veh;
						clearItemCargoGlobal _veh;
					

					_veh setVehiclePosition [_startSpawnPos, [], 0, "CAN_COLLIDE"];
					_startSpawnPos = _veh modelToWorld [0,-12,0]; 

					_convoyVehs = _convoyVehs + [_veh];

					{_convoyUnits = _convoyUnits + [_x]} forEach _crew;
				 
					sleep 1;
				 
				} forEach _convoyTypes;
			
			
			// Setup Target Veh
			
				_targetVehicle = (_convoyVehs select 0);
				_targetVehicleGroup = group driver _targetVehicle;
				_targetVehicle setDir markerDir _startSpawnMarker;
				_targetVehicle setVariable ["canPlaceExplosives", TRUE, TRUE];
				_targetVehicle setVariable ["IntelRecovered", false, true];
				[_targetVehicle] spawn BEW_FNC_gatherIntelAction;
			
			
			// Moving Marker
			
				[_targetVehicle, "Supply Truck", "ColorOPFOR"] execVM "scripts\movingMarker.sqf";
				
				
			// Waypoint
			
				_createWaypoints = {
				
					_targetVehicle = _this select 0;
					_targetVehicleGroup = _this select 1;
					_targetVehicleGroup setVariable ["Vcm_Disable",true];
					_endSpawnPos = _this select 2;
					
					while {(alive _targetVehicle) and (canMove _targetVehicle) and (alive leader _targetVehicleGroup)} do {
					
						_wp = _targetVehicleGroup addWaypoint [_endSpawnPos, 0];
						_wp setWaypointType "MOVE";
						_wp setWaypointFormation "FILE";
						_wp setWaypointSpeed "LIMITED";
						_wp setWaypointBehaviour "CARELESS";
					
					};
				
				};
				
				[_targetVehicle, _targetVehicleGroup, _endSpawnPos] spawn _createWaypoints;
				
				
			[HQ , "We have intel on an enemy supply vehicle on the move. Intercept and destroy the convoy."] remoteExec ["sideChat", 0];
			
			
			waitUntil {!(alive _targetVehicle) or (_targetVehicle distance2D _endSpawnPos < 100) or (WEST knowsAbout _targetVehicle > 0)};
			
				if (WEST knowsAbout _targetVehicle > 0) then {
				
					[HQ , "Okay you've located the convoy. Make sure to check it for intel and supplies before you destroy it."] remoteExec ["sideChat", 0];
				
				};
				
			waitUntil {!(alive _targetVehicle) or (_targetVehicle distance2D _endSpawnPos < 100)};
			
			
			if (!alive _targetVehicle) then {
			
				[HQ , "Well done! The supply vehicle has been destroyed."] remoteExec ["sideChat", 0];
			
			} else {
			
				[HQ , "The supply vehicle has reached it's destination. Better luck next time."] remoteExec ["sideChat", 0];
				
				{deleteVehicle _x} forEach _convoyVehs;
				{deleteVehicle _x} forEach _convoyUnits;
			
			
			};
			
				sleep _respawnDelay;
			
		//Clean Up
			
			{deleteVehicle _x} forEach _convoyVehs;
			{deleteVehicle _x} forEach _convoyUnits;

	};

};