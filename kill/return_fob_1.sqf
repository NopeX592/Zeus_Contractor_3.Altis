_run = true;
task_3_5_skip = false;
task_3_5_done = false;
publicVariableServer "task_3_5_skip";
publicVariableServer "task_3_5_done";

task_3_5 = player createSimpleTask ["Return to FOB to get CBRN suits and Briefing"];
	task_3_5 setSimpleTaskDescription ["Return to the FOB to get CBRN suits and Briefing.","Return to FOB to get CBRN suits and Briefing",""];
	task_3_5 setSimpleTaskDestination (getMarkerPos "FOB_Contractor_E");
	task_3_5 setSimpleTaskType "meet";
	task_3_5 setTaskState "Assigned";
	["TaskAssigned",["","Return to FOB to get CBRN suits and Briefing"]] call BIS_fnc_showNotification;
	
trg_tsk_3_5 = createTrigger ["EmptyDetector", getMarkerPos "FOB_Contractor_E"];
	trg_tsk_3_5 setTriggerArea [15, 15, 15, false];
	trg_tsk_3_5 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_3_5 setTriggerStatements ["this","",""];

while {_run} do {
	if ((triggerActivated trg_tsk_3_5) || (task_3_5_skip)) then {
		task_3_5 setTaskState "Succeeded";
		["TaskSucceeded",["","Return to FOB to get CBRN suits and Briefing"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_3_5;
		[]execVM "eastwind\kill_miller.sqf";
		[]execVM "eastwind\recover_eastwind_actual.sqf";
		[]execVM "eastwind\recover_eastwind_decoy.sqf";
		task_3_5_done = true;
		_run = false;
	};
};