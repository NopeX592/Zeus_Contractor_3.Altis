

	private ["_veh", "_pos", "_side", "_faction", "_kind", "_dir", "_patrol", "_radius", "_center", "_allTypes", "_type"];

	_pos = param [0];
	_side = param [1];
	_faction = param [2];
		_faction = toUpper _faction;
		
	_kind = param [3];
	_dir = param [4, random 360];

	// Select Type

		_types = switch (_faction) do {
		
			case "BLU_F": {[_kind] call BLU_VehList};
			case "BLU_T_F": {[_kind] call BLU_VehList};
			case "BLU_W_F": {[_kind] call BLU_VehList};
			case "OPF_F": {[_kind] call OPF_VehList};
			case "OPF_T_F": {[_kind] call OPF_VehList};
		
		};

		_type = _types call BIS_fnc_selectRandom;


	// Spawn Vehicle
	
		if (_type isKindOf "AIR") then {
		
			_veh = createVehicle [_type, _pos, [], 0, "FLY"];
			_veh setVelocityModelSpace [0, 100, 0];
		
		}else{
	
			_veh = createVehicle [_type, _pos, [], 0, "NONE"];
		
		};
		
		
		_crew = crew _veh;
		_group = createVehicleCrew _veh;	
		
		_vehArray = [_veh, _crew, _group];

	_vehArray;

