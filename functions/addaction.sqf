PB_fnc_action_1 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	intel_gathered = intel_gathered + 1;
	publicVariable "intel_gathered";
	[intel_Unit_1, gatherIntel_1] remoteExec ["removeAction", 0, true];
};

gatherIntel_1 = intel_Unit_1 addAction ["Give Water","[] call PB_fnc_action_1;",nil,2.5,true,false,"","true",3,false,"",""];