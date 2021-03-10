BEW_FNC_SpawnCrewedVehicle = {

	private ["_pos", "_side", "_kind", "_dir", "_patrol", "_radius", "_allTypes", "_type"];

	_pos = param [0];
	_side = param [1];
	_kind = param [2];
	_dir = param [3, random 360];
	_patrol = param [4];
		_radius = _patrol select 1;


	// Select Type

		_allTypes = [_side, _kind] call BEW_FNC_SortCFGVehicles;
		_type = _allTypes call BIS_fnc_selectRandom;


	// Spawn Vehicle

		_vehArray = [_pos, _dir, _type, _side] call bis_fnc_spawnvehicle;
		
		_veh = _vehArray select 0;
		_crew = _vehArray select 1;
		_group = _vehArray select 2;


	// Patrol

	if (_patrol select 0) then {


		[driver _veh, getPos _veh, _radius, 10] execVM "scripts\taskPatrol.sqf";


	};

	_vehArray;

};