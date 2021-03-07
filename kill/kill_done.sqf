_run = true;
task_3_0_skip = false;
task_3_0_done = false;
publicVariableServer "task_3_0_skip";
publicVariableServer "task_3_0_done";

task_3_0 = player createSimpleTask ["Investigatation"];
	task_3_0 setSimpleTaskDescription ["Investigate the downed blackfish and the killed squad.","Investigatation",""];
	task_3_0 setSimpleTaskDestination (getMarkerPos "intel_squad");
	task_3_0 setSimpleTaskType "kill";
	task_3_0 setTaskState "Created";

[] execVM "kill\destroy_big_antenna.sqf";
[] execVM "kill\destroy_small_antenna.sqf";
[] execVM "kill\destroy_helicopters.sqf";
[] execVM "kill\sweep_town.sqf";

sleep 10;

while {_run} do {
	if (((task_3_1_done) && (task_3_2_done) && (task_3_3_done) && (task_3_4_done)) || (task_3_0_skip)) then {
		task_3_0 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigatation"]] call BIS_fnc_showNotification;
		task_3_0_done = true;
		_run = false;
		sleep 1;
	};
};