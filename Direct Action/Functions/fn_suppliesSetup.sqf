private ["_veh", "_vehs", "_pos", "_dir", "_type", "_textures", "_missionLevel"];

_vehs = getMissionLayerEntities "Supplies" select 0; 

{

	_pos = getPosATL _x;
	_dir = getDir _x;
	_type = typeOf _x;
	_missionLevel = _x getVariable "missionLevel";
	_arsenal = _x getVariable ["arsenal", false];
	_spawnPoint = _x getVariable ["spawnPoint", false];

	
	deleteVehicle _x;
	
	sleep 0.5;

	[_pos, _dir, _type, _missionLevel, _arsenal, _spawnPoint] spawn BEW_FNC_spawnSupplies;
	
	
} forEach _vehs;