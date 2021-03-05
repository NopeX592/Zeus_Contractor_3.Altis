_run = true;
task_3_0_skip = false;
publicVariableServer "task_3_0_skip";

task_3_0 = player createSimpleTask ["Investigatation"];
	task_3_0 setSimpleTaskDescription ["Investigate the downed blackfish and the killed squad.","Investigatation",""];
	task_3_0 setSimpleTaskDestination (getMarkerPos "intel_squad");
	task_3_0 setSimpleTaskType "kill";
	task_3_0 setTaskState "Created";

[] execVM "kill\destroy_big_antenna.sqf";
[] execVM "kill\destroy_small_antenna.sqf";
[] execVM "kill\destroy_helicopters.sqf";
[] execVM "kill\sweep_town.sqf";

while {_run} do {
	if (((!alive antenna_1) || (task_3_2_skip)) && (((!alive helicopter_1) && (!alive helicopter_2) && (!alive helicopter_3)) || (task_3_3_skip)) && ((!alive antenna_2) || (task_3_1_skip)) && ((triggerActivated trg_tsk_3_4) || (task_3_4_skip)) || (task_3_0_skip)) then {
		task_3_0 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigatation"]] call BIS_fnc_showNotification;
		_run = false;
	};
};