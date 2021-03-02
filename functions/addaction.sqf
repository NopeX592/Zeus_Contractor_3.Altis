_run = true;

AI_fnc_action_1 = {
	player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";
	intel_gathered = intel_gathered + 1;
	publicVariable "intel_gathered";
	[intel_Unit_1, gatherIntel_1] remoteExec ["removeAction", 0, true];
};

AI_fnc_createAction = {
gatherIntel_1 = intel_Unit_1 addAction ["Give Water","[] call AI_fnc_action_1;",nil,2.5,true,false,"","true",3,false,"",""];
};

while {_run} do {
	if (isServer) then {
		//Play Fortunate Son, Create Intel, Create Give Water
		[AI_fnc_createAction] remoteExec ["call", 0, true];
		_run = false;
	};
};