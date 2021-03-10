private ["_obj", "_saveLoadout", "_debug", "_oldType", "_newType", "_loadoutScript", "_loadoutScriptHandle"];

	_obj = param [0];
	_saveLoadout = param [1, false];
	_debug = false;


// Translate Class Name

	_oldType = typeOf _obj;
	_newType = [_oldType] call BEW_FNC_TranslateClassNames;

// Debug Message

	if (_debug) then {
	
		systemchat format ["DEBUG: Old Type %1 - New Type %2", _oldType, _newType];
		
	};
	

// Name Loadout Script

	_loadoutScript = format ["loadouts\%1_loadout.sqf",  _newType];
	
	
// Check Loadout Exists

if !((loadFile _loadoutScript) isEqualTo "") then {
	
	// Exec Loadout Script

		_loadoutScriptHandle = [_obj] execVM _loadoutScript;

}else{

	_obj setUnitLoadout (configFile >> "CfgVehicles" >> _newType);

};
