_run = true;
task_1_0_skip = false;
publicVariableServer "task_1_0_skip";

task_1_0 = player createSimpleTask ["Investigatation"];
	task_1_0 setSimpleTaskDescription ["Investigate the downed blackfish and the killed squad.","Investigatation",""];
	task_1_0 setSimpleTaskDestination (getMarkerPos "intel_squad");
	task_1_0 setSimpleTaskType "container";
	task_1_0 setTaskState "Created";

[] execVM "humanitarian\dropoff_food_medical.sqf";
[] execVM "humanitarian\recapture_town.sqf";

while {_run} do {
	if (((boxes_unloaded == 4) || (task_1_2_skip) || ((triggerActivated trg_tsk_1_3) || (task_1_3_skip))) || (task_1_0_skip)) then {
		task_1_0 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigatation"]] call BIS_fnc_showNotification;
		_run = false;
	};
};