[]execVM "main_script.sqf";
[]execVM "briefing.sqf";
[]execVM "post_briefing_init.sqf";

if (hasInterface) then {
	[] spawn {
		waitUntil {alive player};
		player setVariable ["loadout", getUnitLoadout player, false];
		player addEventHandler ["Respawn", {
			player setUnitLoadout (player getVariable "loadout");
		}];
	};
};
AD_fnc_airdropIDAP = compile preprocessFileLineNumbers "functions\airdrop.sqf";
AD_fnc_supplyDrop = compile preprocessFileLineNumbers "functions\supplydrop.sqf";
AI_fnc_addAction = compile preprocessFileLineNumbers "functions\addaction.sqf";