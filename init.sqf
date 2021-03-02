[]execVM "main_script.sqf";
[]execVM "briefing.sqf";
[]execVM "addaction.sqf";

if (hasInterface) then {
	[] spawn {
		waitUntil {alive player};
		player setVariable ["loadout", getUnitLoadout player, false];
		player addEventHandler ["Respawn", {
			player setUnitLoadout (player getVariable "loadout");
		}];
	};
};

//Create Functions
AD_fnc_supplyDrop = compile preprocessFileLineNumbers "functions\supplydrop.sqf";
AD_fnc_airDrop = compile preprocessFileLineNumbers "functions\airdrop.sqf";
SU_fnc_spawnCSAT = compile preprocessFileLineNumbers "functions\spawn_qrf_east.sqf";
SU_fnc_spawnGUER = compile preprocessFileLineNumbers "functions\spawn_qrf_guer.sqf";
SU_fnc_spawnIDAP = compile preprocessFileLineNumbers "functions\spawn_qrf_idap.sqf";