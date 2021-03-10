	private [

		"_numUnitsToSpawn",
		"_unitTypesToSpawn",
		"_allTypes",
		"_type"

	];

	_numUnitsToSpawn = 10 - ([] call BEW_FNC_CountAllGroupsWithPlayers);
	_unitTypesToSpawn = [];
	
	_allTypes = [
		
		"B_soldier_M_F",
		"B_Soldier_GL_F",
		"B_soldier_AR_F",
		"B_medic_F",
		"B_engineer_F",
		"B_soldier_AT_F",
		"B_soldier_AA_F",
		"B_recon_JTAC_F",
		"B_soldier_UAV_F"
	
	];
	
	
	
	for "_i" from 1 to _numUnitsToSpawn do {
	
		_type = _allTypes call BIS_FNC_SelectRandom;
		_type = [_type, _translationLists] call BEW_FNC_TranslateClassNames;	

		_unitTypesToSpawn = _unitTypesToSpawn + [_type];
	
	};

	_group = [getPos player, WEST, _unitTypesToSpawn,[],[],[],[],[],180] call BIS_fnc_spawnGroup;
	
	{[_x] joinSilent group player} forEach units _group;