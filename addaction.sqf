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
	[squad_intel_1, intel_gathered_1] remoteExec ["removeAction", 0, true];
};

PB_fnc_action_2 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_squad = gathered_squad + 1;
	publicVariable "gathered_squad";
	[squad_intel_2, intel_gathered_2] remoteExec ["removeAction", 0, true];
};

PB_fnc_action_3 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_squad = gathered_squad + 1;
	publicVariable "gathered_squad";
	[squad_intel_3, intel_gathered_3] remoteExec ["removeAction", 0, true];
};

PB_fnc_action_4 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_squad = gathered_squad + 1;
	publicVariable "gathered_squad";
	[squad_intel_4, intel_gathered_4] remoteExec ["removeAction", 0, true];
};

//Intel Blackfish
PB_fnc_action_5 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	[black_box, intel_gathered_5] remoteExec ["removeAction", 0, true];
	
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
	for "_i" from 1 to 2 step 1 do {
		_qrf_spawns = [qrf_spawn_11,qrf_spawn_12];
		_randomStarting = selectRandom _qrf_spawns;
		_randomUnits = selectRandom [5,6,7,8];

		[
			getMarkerPos _randomStarting,
			getMarkerPos "qrf_target_6",
			_randomUnits,
			1,
			independent
		] call SU_fnc_spawnOPFOR;

		_newArray = [];
		{ if (_x != _randomStarting) then {_newArray pushBack _x}; } forEach _qrf_spawns;
		_qrf_spawns = _newArray;
	};
};

//Intel Tank
PB_fnc_action_6 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_tank = gathered_tank + 1;
	publicVariable "gathered_tank";
	[tank_intel_1, intel_gathered_6] remoteExec ["removeAction", 0, true];
};

PB_fnc_action_7 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_tank = gathered_tank + 1;
	publicVariable "gathered_tank";
	[tank_intel_2, intel_gathered_7] remoteExec ["removeAction", 0, true];
};

PB_fnc_action_8 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	gathered_tank = gathered_tank + 1;
	publicVariable "gathered_tank";
	[tank_intel_3, intel_gathered_8] remoteExec ["removeAction", 0, true];
};

//Intel Miller
PB_fnc_action_9 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	[miller, intel_gathered_9] remoteExec ["removeAction", 0, true];
};

//Create post briefing function
PB_fnc_postbriefing = {
	//Add Action to squad
	intel_gathered_1 = squad_intel_1 addAction ["Pickup Intel","[] call PB_fnc_action_1;",nil,2.5,true,false,"","true",3,false,"",""];
	intel_gathered_2 = squad_intel_2 addAction ["Pickup Intel","[] call PB_fnc_action_2;",nil,2.5,true,false,"","true",3,false,"",""];
	intel_gathered_3 = squad_intel_3 addAction ["Pickup Intel","[] call PB_fnc_action_3;",nil,2.5,true,false,"","true",3,false,"",""];
	intel_gathered_4 = squad_intel_4 addAction ["Pickup Intel","[] call PB_fnc_action_4;",nil,2.5,true,false,"","true",3,false,"",""];

	//Add Action to blackfish
	flight_log addAction ["Pickup Intel","deleteVehicle flight_log;",nil,1.5,true,false,"","true",2,false,"",""];
	intel_gathered_5 = black_box addAction ["Send Data","[] call PB_fnc_action_5;",nil,2.5,true,false,"","true",3,false,"",""];

	//Add Action to tank
	intel_gathered_6 = tank_intel_1 addAction ["Gather Data","[] call PB_fnc_action_6;",nil,2.5,true,false,"","true",3,false,"",""];
	intel_gathered_7 = tank_intel_2 addAction ["Gather Data","[] call PB_fnc_action_7;",nil,2.5,true,false,"","true",3,false,"",""];
	intel_gathered_8 = tank_intel_3 addAction ["Gather Data","[] call PB_fnc_action_8;",nil,2.5,true,false,"","true",3,false,"",""];

	//Add Action to miller
	intel_gathered_9 = miller addAction ["Gather Data","[] call PB_fnc_action_9;",nil,2.5,true,false,"","true",3,false,"",""];
};

sleep 1;

if (isServer) then {
	//Add Actions to Blackfish and Squad
	[PB_fnc_postbriefing] remoteExec ["call", 0, true];
};

sleep 1;

while {true} do {
	if (isServer) then {
		//Play Hardbass
		[PB_fnc_hardbass] remoteExec ["call", 0, true];
		sleep 75;
	};
};