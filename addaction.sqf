_run = true;
gathered_squad = 0;
gathered_tank = 0;
sent_data_blackfish = false;
publicVariable "gathered_squad";
publicVariable "gathered_tank";
publicVariable "sent_data_blackfish";

PB_fnc_hardbass = {
	blyat_mobile say3D "Hardbass";
};

//Intel Squad
PB_fnc_action_1 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_squad = gathered_squad + 1;
	publicVariable "gathered_squad";
	[squad_intel_1, intel_gathered_1] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

PB_fnc_action_2 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_squad = gathered_squad + 1;
	publicVariable "gathered_squad";
	[squad_intel_2, intel_gathered_2] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

PB_fnc_action_3 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_squad = gathered_squad + 1;
	publicVariable "gathered_squad";
	[squad_intel_3, intel_gathered_3] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

PB_fnc_action_4 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_squad = gathered_squad + 1;
	publicVariable "gathered_squad";
	[squad_intel_4, intel_gathered_4] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

//Intel Blackfish
PB_fnc_action_5 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	[black_box, intel_gathered_5] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
	
	[]spawn {
		for "_i" from 5 to 100 step 5 do { 
			hint str format ["Uploading Data.\n %1%/100%",str _i];
			//["Uploading Data.\n %1%/100%",str _i] remoteExec ["hint str format", 0, true];
			sleep 9;
		};

	sent_data_blackfish = true;
	publicVariable "sent_data_blackfish";
	publicVariableServer "sent_data_blackfish";
	};

	//Spawn response
	_randomUnits = selectRandom [5,6,7,8];

	[
		getMarkerPos "qrf_spawn_11",
		getMarkerPos "qrf_target_6",
		_randomUnits,
		1,
		independent
	] call SU_fnc_spawnOPFOR;
	[
		getMarkerPos "qrf_spawn_12",
		getMarkerPos "qrf_target_6",
		_randomUnits,
		1,
		east
	] call SU_fnc_spawnOPFOR;
};

//Intel Tank
PB_fnc_action_6 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_tank = gathered_tank + 1;
	publicVariable "gathered_tank";
	[tank_intel_1, intel_gathered6] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

PB_fnc_action_7 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_tank = gathered_tank + 1;
	publicVariable "gathered_tank";
	[tank_intel_2, intel_gathered_7] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

PB_fnc_action_8 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_tank = gathered_tank + 1;
	publicVariable "gathered_tank";
	[tank_intel_3, intel_gathered_8] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

//Intel Miller
PB_fnc_action_9 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	player createDiaryRecord ["Intel", ["Title", "<img image='media\dropoff.paa'/>"]];
	[miller, intel_gathered_9] remoteExec ["BIS_fnc_holdActionRemove", 0, true];
};

//Create post briefing function
PB_fnc_postbriefing = {
	//Add Action to squad
	intel_gathered_1 = [squad_intel_1, "Pickup Intel", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[] call PB_fnc_action_1}, {}, [], 1.5, nil, false, false] call BIS_fnc_holdActionAdd;
	intel_gathered_2 = [squad_intel_2, "Pickup Intel", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[] call PB_fnc_action_2}, {}, [], 1.5, nil, false, false] call BIS_fnc_holdActionAdd;
	intel_gathered_3 = [squad_intel_3, "Pickup Intel", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[] call PB_fnc_action_3}, {}, [], 1.5, nil, false, false] call BIS_fnc_holdActionAdd;
	intel_gathered_4 = [squad_intel_4, "Pickup Intel", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[] call PB_fnc_action_4}, {}, [], 1.5, nil, false, false] call BIS_fnc_holdActionAdd;

	//Add Action to blackfish
	[flight_log, "Pickup Intel", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 5", "_caller distance _target < 5", {}, {}, {deleteVehicle flight_log}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;
	intel_gathered_5 = [black_box, "Send Data", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[] call PB_fnc_action_5}, {}, [], 3, nil, false, false] call BIS_fnc_holdActionAdd;

	//Add Action to tank
	intel_gathered_6 = [tank_intel_1, "Gather Data", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 5", "_caller distance _target < 5", {}, {}, {[] call PB_fnc_action_6}, {}, [], 3, nil, false, false] call BIS_fnc_holdActionAdd;
	intel_gathered_7 = [tank_intel_2, "Gather Data", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 5", "_caller distance _target < 5", {}, {}, {[] call PB_fnc_action_7}, {}, [], 3, nil, false, false] call BIS_fnc_holdActionAdd;
	intel_gathered_8 = [tank_intel_3, "Gather Data", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 5", "_caller distance _target < 5", {}, {}, {[] call PB_fnc_action_8}, {}, [], 3, nil, false, false] call BIS_fnc_holdActionAdd;

	//Add Action to miller
	intel_gathered_9 = [miller, "Add Diary Entry", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", "_this distance _target < 5", "_caller distance _target < 5", {}, {}, {[] call PB_fnc_action_9}, {}, [], 7, nil, false, false] call BIS_fnc_holdActionAdd;

	//Add Sites to screens
	[screen_lrg_3, "Dropoff Food and Medical Supplies", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;
	[screen_lrg_4, "Investigate Destroyed Tank", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;
	[screen_lrg_5, "Destroy Artillery", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;
	[screen_lrg_6, "Sweep Town Held by Enemies", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;
	[screen_lrg_7, "Destroy Enemy Helicopters", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;

	//Add Action to Strategic Map
	[board_map_1, "Open Strategic Map", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", "_this distance _target < 3", "_caller distance _target < 3", {}, {}, {[strat_map] spawn BIS_fnc_moduleStrategicMapOpen}, {}, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;
};

sleep 1;

if (isServer) then {
	//Add Actions
	[] remoteExec ["PB_fnc_postbriefing", 0, true];

	sleep 1;

	while {true} do {
		//Play Hardbass
		[] remoteExec ["PB_fnc_hardbass", 0, true];
		sleep 75;
	};
};