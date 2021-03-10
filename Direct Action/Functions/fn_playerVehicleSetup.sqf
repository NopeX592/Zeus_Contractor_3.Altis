if (!isServer) exitWith {};

waitUntil {time > 0};

		
	// Define Pilots and Crew
	
		[] call BEW_FNC_defineCrewAndPilots;


private ["_veh", "_vehs", "_pos", "_dir", "_type", "_textures", "_missionLevel"];

_vehs = getMissionLayerEntities "PlayerVehicles" select 0; 
_blu_Vehs = getMissionLayerEntities "BLU_Vehicles" select 0; 
_opf_Vehs = getMissionLayerEntities "OPF_Vehicles" select 0; 
_blu_Sof_Vehs = getMissionLayerEntities "BLU_SOF_Vehicles" select 0; 
_opf_Sof_Vehs = getMissionLayerEntities "OPF_SOF_Vehicles" select 0; 
_ind_1_Vehs = getMissionLayerEntities "IND_1_Vehicles" select 0; 
_ind_2_Vehs = getMissionLayerEntities "IND_2_Vehicles" select 0; 
_rebel_1_Vehs = getMissionLayerEntities "Rebel_1_Vehicles" select 0; 
_rebel_2_Vehs = getMissionLayerEntities "Rebel_2_Vehicles" select 0; 

for "_i" from 0 to (count _vehs - 1) do {

	_x = _vehs select _i;

		_translationList = switch (true) do {

			case (_x in _blu_Vehs)		: {[[BLU_Map_TransList, BLU_New_TransList]]};
			case (_x in _opf_Vehs)		: {[[BLU_Map_TransList, BLU_New_TransList]]};
			case (_x in _blu_Sof_Vehs)	: {[[BLU_SOF_Map_TransList, BLU_SOF_New_TransList]]};
			case (_x in _opf_Sof_Vehs)	: {[[BLU_SOF_Map_TransList, BLU_SOF_New_TransList]]};
			case (_x in _ind_1_Vehs)	: {[[IND_1_Map_TransList, IND_1_New_TransList]]};
			case (_x in _ind_2_Vehs)	: {[[IND_2_Map_TransList, IND_2_New_TransList]]};
			case (_x in _rebel_1_Vehs)	: {[[Rebel_1_Map_TransList, Rebel_1_New_TransList]]};			
			case (_x in _rebel_2_Vehs)	: {[[Rebel_2_Map_TransList, Rebel_2_New_TransList]]};	
			default {all_TransLists};

		};	

	_pos = getPosATL _x;
	_dir = getDir _x;
	_origType = typeOf _x;
		if (_origType isKindOf "Ship") then {_pos = getPos _x};
	[_x] call BEW_FNC_ApplyCustomTexture;
	_textures = getObjectTextures _x;
	_missionLevel = _x getVariable "missionLevel";
	
	deleteVehicle _x;
	
	// Translate Class Names
		
		_newType = [_origType, _translationList] call BEW_FNC_TranslateClassNames;

	if !(_newType == _origType) then {_textures = []};
	
	sleep 0.25;

	[_pos, _dir, _newType, _textures, _missionLevel] spawn BEW_FNC_spawnVehicle;
	
	
};