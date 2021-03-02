_run = true;
task_0_1_skip = false;
publicVariableServer "task_0_1_skip";

task_0_1 = player createSimpleTask ["Get Briefing"];
	task_0_1 setSimpleTaskDescription ["Get your Briefing.","Get Briefing",""];
	task_0_1 setSimpleTaskDestination (getMarkerPos "first_brief");
	task_0_1 setSimpleTaskType "whiteboard";
	task_0_1 setTaskState "Assigned";
	["TaskAssigned",["","Get Briefing"]] call BIS_fnc_showNotification;

while {_run} do {
	if (task_0_1_skip) then {
		task_0_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Get Briefing"]] call BIS_fnc_showNotification;
		
		//Execute Missions
		[]execVM "humanitarian\.sqf";
		[]execVM "kill\.sqf";
		[]execVM "eastwind\.sqf";
		[]execVM "optional\destroy_artillery.sqf";
		
		_run = false;
	};
};