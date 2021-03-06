_run = true;
task_1_0_skip = false;
task_1_0_done = false;
task_1_2_done = false;
task_1_3_done = false;
publicVariableServer "task_1_0_skip";
publicVariableServer "task_1_0_done";

task_1_0 = player createSimpleTask ["Investigatation"];
	task_1_0 setSimpleTaskDescription ["Investigate the downed blackfish and the killed squad.","Investigatation",""];
	task_1_0 setSimpleTaskDestination (getMarkerPos "intel_squad");
	task_1_0 setSimpleTaskType "container";
	task_1_0 setTaskState "Created";

[] execVM "humanitarian\dropoff_food_medical.sqf";
[] execVM "humanitarian\recapture_town.sqf";

while {_run} do {
	if (((task_1_2_done) && (task_1_3_done)) || (task_1_0_skip)) then {
		task_1_0 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigatation"]] call BIS_fnc_showNotification;
		_run = false;
		sleep 1;
	};
};