private ["_objectivePos", "_radius", "_markerType", "_iconMarkerName", "_randomMission", "_infGroup", "_mines"];			
	
	_objectiveMarker = _this select 0;
	_radius = markerSize _objectiveMarker select 0;
	_objectivePos = markerPos _objectiveMarker;
	
	
	_encounterTypes = [];
	_encounterUnits = [];
	_encounterObjects = [];
	_encounterVehicles = [];
	

	
waitUntil {((({(alive _x) and (_x distance2D _objectivePos < _radius * 3) and !(vehicle _x isKindOf 'air') and (isNull (isVehicleCargo vehicle _x))} count allPlayers) > 0))};	
		
		_spawnInfantryPatrol = {
		
			_spawnPos = [_objectivePos, 1, _radius, 1, 0, 0, 0] call BIS_fnc_findSafePos;
			_infGroup = [_spawnPos, OPF_InfantryArray] call BEW_FNC_SpawnGroup;	
			
			_leader = leader _infGroup;
			removeFromRemainsCollector [_leader];
			_leader setVariable ["IntelRecovered", false, true];
			[_leader] spawn BEW_FNC_gatherIntelAction;
			
			
			[_leader, _objectivePos, [_radius], 10] execVM "scripts\taskPatrol.sqf";
			_infGroupUnits = units _infGroup;
			_encounterUnits append _infGroupUnits;
			
		};
		
		_encounterTypes append [_spawnInfantryPatrol];
			
		
		_spawnEnemyVehicle	=	{
			
			_spawnPos = [_objectivePos, 1, _radius, 1, 0, 0, 0] call BIS_fnc_findSafePos;
			_vehArray = [_spawnPos, OPF_VehicleArray select 0, OPF_VehicleArray select 1, "A_CAR", random 360] call BEW_FNC_SpawnCrewedVehicle;
				
				_veh = _vehArray select 0;
				_vehCrew = _vehArray select 1;
				_vehGroup = _vehArray select 2;
			
			[leader _vehGroup, _objectivePos, [_radius], 10] execVM "scripts\taskPatrol.sqf";
			
				_encounterVehicles append [_veh];
				_encounterUnits append _vehCrew;
		
		};
		
		
		_encounterTypes append [_spawnEnemyVehicle];
		
		_spawnMineField = {
		
			_mines = [_objectivePos, 0, 2, [["SLAMDirectionalMine", "ATMine"], [0.5, 0.5]], 1, EAST] call BEW_FNC_CreateMinefield;
			_encounterObjects append _mines;
			
		};
			
		//_encounterTypes append [_spawnMineField];
		
		
	// Select Encounter
	
		_selectedEncounter = _encounterTypes call BIS_FNC_SelectRandom;
		
	// Spawn Encounter 
	
		call _selectedEncounter;
		
	
waitUntil {((({(alive _x) and (_x distance2D _objectivePos < _radius * 3) and !(vehicle _x isKindOf 'air') and (isNull (isVehicleCargo vehicle _x))} count (allUnits select {side _x == WEST})) < 1))};	


	// Clean Up Units
	
		{
					
			deleteVehicle _x;
		
		} forEach _encounterUnits;
		
		
	// Clean Up Objects
	
		{
					
			deleteVehicle _x;
		
		} forEach _encounterObjects;


	// Clean Up Vehicles

		{
		
			if (count crew _x < 1) then {
			
				deleteVehicle _x;
				
			};
		
		} forEach _encounterVehicles;
		deleteMarker _objectiveMarker;

	