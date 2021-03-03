_run = true;
task_3_6_skip = false;
publicVariableServer "task_3_6_skip";

task_3_6 = player createSimpleTask ["Recapture Eastwind Device"];
	task_3_6 setSimpleTaskDescription ["Recover the Eastwind Device from the hands of Miller.","Recapture Eastwind Device",""];
	task_3_6 setSimpleTaskDestination (getMarkerPos "eastwind_actual");
	task_3_6 setSimpleTaskType "getin";
	task_3_6 setTaskState "Created";
	["TaskCreated",["","Recapture Eastwind Device"]] call BIS_fnc_showNotification;

_marker_eastwind_actual = createMarker ["Recapture Eastwind Device", getMarkerPos "eastwind_actual"];
	_marker_eastwind_actual setMarkerShape "ELLIPSE";
	_marker_eastwind_actual setMarkerSize [250, 250];

while {_run} do {
	if ((player in eastwind_device) || (task_3_1_skip)) then {
		task_3_6 setTaskState "Succeeded";
		["TaskSucceeded",["","Recapture Eastwind Device"]] call BIS_fnc_showNotification;
		_marker_eastwind_actual setMarkerSize [0, 0];
		_run = false;
	};
};