_run = true;
task_2_0_skip = false;
publicVariableServer "task_2_0_skip";

task_2_0 = player createSimpleTask ["Investigatation"];
	task_2_0 setSimpleTaskDescription ["Investigate the downed blackfish and the killed squad.","Investigatation",""];
	task_2_0 setSimpleTaskType "documents";
	task_2_0 setTaskState "Created";

[]execVM "eastwind\investigate_blackfish.sqf";
[]execVM "eastwind\investigate_squad.sqf";
[]execVM "eastwind\investigate_tank.sqf";

sleep 10;

while {_run} do {
	if ((((isNull flight_log) && (sent_data_blackfish)) || (task_2_1_skip)) && ((gathered_squad == 4) || (task_2_2_skip)) && ((sent_data_tank) || (task_2_3_skip)) || (task_2_0_skip)) then {
		task_2_0 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigatation"]] call BIS_fnc_showNotification;
		[] execVM "kill\kill_done.sqf";
		_run = false;
	};
};