_run = true;
task_2_0_skip = false;
publicVariableServer "task_2_0_skip";

task_2_0 = player createSimpleTask ["Investigatation"];
	task_2_0 setSimpleTaskDescription ["Investigate the downed blackfish and the killed squad.","Investigatation",""];
	task_2_0 setSimpleTaskDestination (getMarkerPos "intel_squad");
	task_2_0 setSimpleTaskType "documents";
	task_2_0 setTaskState "Created";

[]execVM "eastwind\investigate_blackfish.sqf";
[]execVM "eastwind\investigate_squad.sqf";
[]execVM "eastwind\investigate_tank.sqf";

while {_run} do {
	if (("task_2_1" call BIS_fnc_taskCompleted) && ("task_2_2" call BIS_fnc_taskCompleted) && ("task_2_3" call BIS_fnc_taskCompleted) || (task_2_0_skip)) then {
		task_2_0 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigatation"]] call BIS_fnc_showNotification;
		[] execVM "kill\kill_done.sqf";
		_run = false;
	};
};