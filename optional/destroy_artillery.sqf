_run = true;
task_Opt_1_skip = false;
publicVariableServer "task_Opt_1_skip";

task_Opt_1 = player createSimpleTask ["Destroy Artillery (Optional)"];
	task_Opt_1 setSimpleTaskDescription ["Destroy the enemy Artillery.","Destroy Artillery (Optional)",""];
	task_Opt_1 setSimpleTaskDestination (getMarkerPos artillery_location);
	task_Opt_1 setSimpleTaskType "destroy";
	task_Opt_1 setTaskState "Created";

_marker_artillery = createMarker ["Takeout Artillery", getMarkerPos "artillery_location"];
	_marker_artillery setMarkerShape "ELLIPSE";
	_marker_artillery setMarkerSize [250, 250];

while {_run} do {
	if (!(alive sochor_1) && !(alive sochor_2)) then {
		task_Opt_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Destroy Artillery (Optional)"]] call BIS_fnc_showNotification;
		_marker_artillery setMarkerSize [0, 0];
		_run = false;
	};
};