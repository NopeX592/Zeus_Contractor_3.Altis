_run = true;
task_3_3_skip = false;
publicVariableServer "task_3_3_skip";

task_3_3 = player createSimpleTask ["Destroy Enemy Helicopters", task_3_0];
	task_3_3 setSimpleTaskDescription ["Destroy the enemy helicopters.","Destroy Enemy Helicopters",""];
	task_3_3 setSimpleTaskDestination (getMarkerPos "helicopter_location");
	task_3_3 setSimpleTaskType "destroy";
	task_3_3 setTaskState "Created";
	["TaskCreated",["","Destroy Enemy Helicopters"]] call BIS_fnc_showNotification;

_marker_helicopters = createMarker ["Destroy Enemy Helicopters", getMarkerPos "helicopter_location"];
	_marker_helicopters setMarkerShape "ELLIPSE";
	_marker_helicopters setMarkerSize [250, 250];

while {_run} do {
	if (((!alive helicopter_1) && (!alive helicopter_2) && (!alive helicopter_3)) || (task_3_3_skip)) then {
		task_3_3 setTaskState "Succeeded";
		["TaskSucceeded",["","Destroy Enemy Helicopters"]] call BIS_fnc_showNotification;
		_marker_helicopters setMarkerSize [0, 0];
		_run = false;
	};
};