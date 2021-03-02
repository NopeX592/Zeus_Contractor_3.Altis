_run = true;
task_2_3_skip = false;
publicVariableServer "task_2_3_skip";

task_2_3 = player createSimpleTask ["Investigate Destroyed Tank", task_2_0];
	task_2_3 setSimpleTaskDescription ["Investigate the destroyed tanks you may find it in the estimated area.","Investigate Destroyed Tank",""];
	task_2_3 setSimpleTaskDestination (getMarkerPos "intel_tank");
	task_2_3 setSimpleTaskType "documents";
	task_2_3 setTaskState "Created";

_marker_intel = createMarker ["Investigate Destroyed Tank", getMarkerPos "intel_tank"];
	_marker_intel setMarkerShape "ELLIPSE";
	_marker_intel setMarkerSize [125, 125];

while {_run} do {
	if ((gathered_tank == 3) || (task_2_3_skip)) then {
		task_2_3 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigate Destroyed Tank"]] call BIS_fnc_showNotification;
		_marker_intel setMarkerSize [0, 0];
		_run = false;
	};
};