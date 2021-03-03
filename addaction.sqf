_run = true;
gathered_squad = 0;
gathered_tank = 0;
sent_data = false;
publicVariable "gathered_squad";
publicVariable "gathered_tank";
publicVariable "send_data";

//Remove Action
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

PB_fnc_action_5 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	[black_box, intel_gathered_5] remoteExec ["removeAction", 0, true];

	[US_fnc_uploadHint] remoteExec ["call", 0, true];

	sent_data_blackfish = true;
	publicVariable "send_data";
};

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

//Create post briefing function
PB_fnc_postbriefing = {
	//Add Action to blackfish
	flight_log addAction ["Pickup Intel","deleteVehicle flight_log;",nil,1.5,true,false,"","true",2,false,"",""];
	intel_gathered_5 = black_box addAction ["Send Data","[] call PB_fnc_action_5;",nil,2.5,true,false,"","true",3,false,"",""];
	
	//Add Action to squad
	intel_gathered_1 = squad_intel_1 addAction ["Pickup Intel","[] call PB_fnc_action_1;",nil,2.5,true,false,"","true",3,false,"",""];
	intel_gathered_2 = squad_intel_2 addAction ["Pickup Intel","[] call PB_fnc_action_2;",nil,2.5,true,false,"","true",3,false,"",""];
	intel_gathered_3 = squad_intel_3 addAction ["Pickup Intel","[] call PB_fnc_action_3;",nil,2.5,true,false,"","true",3,false,"",""];
	intel_gathered_4 = squad_intel_4 addAction ["Pickup Intel","[] call PB_fnc_action_4;",nil,2.5,true,false,"","true",3,false,"",""];

	//Add Action to debris
	intel_gathered_6 = tank_intel_1 addAction ["Gather Data","[] call PB_fnc_action_6;",nil,2.5,true,false,"","true",3,false,"",""];
	intel_gathered_7 = tank_intel_2 addAction ["Gather Data","[] call PB_fnc_action_7;",nil,2.5,true,false,"","true",3,false,"",""];
	intel_gathered_8 = tank_intel_3 addAction ["Gather Data","[] call PB_fnc_action_7;",nil,2.5,true,false,"","true",3,false,"",""];
};

sleep 1;

if (isServer) then {
	//Add Actions to Blackfish and Squad
	[PB_fnc_postbriefing] remoteExec ["call", 0, true];
	_run = false;
};