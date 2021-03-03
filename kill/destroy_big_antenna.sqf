_run = true;
task_3_1_skip = false;
publicVariableServer "task_3_1_skip";

task_3_1 = player createSimpleTask ["Destroy Large Antenna"];
	task_3_1 setSimpleTaskDescription ["Destroy the large antenna tower.","Destroy Large Antenna",""];
	task_3_1 setSimpleTaskDestination (getMarkerPos "antenna_location_1");
	task_3_1 setSimpleTaskType "destroy";
	task_3_1 setTaskState "Created";
	["TaskCreated",["","Destroy Large Antenna"]] call BIS_fnc_showNotification;

_marker_artillery_lrg = createMarker ["Destroy Large Antenna", getMarkerPos "antenna_location_1"];
	_marker_artillery_lrg setMarkerShape "ELLIPSE";
	_marker_artillery_lrg setMarkerSize [250, 250];

while {_run} do {
	if (!(alive antenna_1) || (task_3_1_skip)) then {
		task_3_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Destroy Large Antenna"]] call BIS_fnc_showNotification;
		_marker_artillery_lrg setMarkerSize [0, 0];
		_run = false;
	};
};