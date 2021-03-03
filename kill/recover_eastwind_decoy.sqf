_run_1 = true;
_run_2 = false;
task_3_7_skip = false;
eastwind_not = false;
publicVariableServer "task_3_7_skip";
publicVariableServer "eastwind_not";

task_3_7 = player createSimpleTask ["Recapture Eastwind Device"];
	task_3_7 setSimpleTaskDescription ["Recover the Eastwind Device from the hands of Miller.","Recapture Eastwind Device",""];
	task_3_7 setSimpleTaskDestination (getMarkerPos "eastwind_decoy");
	task_3_7 setSimpleTaskType "getin";
	task_3_7 setTaskState "Created";
	["TaskCreated",["","Recapture Eastwind Device"]] call BIS_fnc_showNotification;

_marker_eastwind_decoy = createMarker ["Recapture Eastwind Device", getMarkerPos "eastwind_decoy"];
	_marker_eastwind_decoy setMarkerShape "ELLIPSE";
	_marker_eastwind_decoy setMarkerSize [250, 250];

trg_tsk_3_7_1 = createTrigger ["EmptyDetector", getMarkerPos "eastwind_decoy"];
	trg_tsk_3_7_1 setTriggerArea [75, 75, 100, false];
	trg_tsk_3_7_1 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_3_7_1 setTriggerStatements ["this","",""];

while {_run_1} do {
	if (triggerActivated trg_tsk_3_7_1) then {
		trg_tsk_3_7_2 = createTrigger ["EmptyDetector", getMarkerPos "eastwind_decoy"];
			trg_tsk_3_7_2 setTriggerActivation ["JULIET", "PRESENT", false];
			trg_tsk_3_7_2 setTriggerStatements ["this","eastwind_not = true;",""];
			trg_tsk_3_7_2 setTriggerText "Report Eastwind not present";
			_run_1 = false;
			_run_2 = true;
	};
};

while {_run_2} do {
	if ((eastwind_not) || (task_3_7_skip)) then {
		task_3_7 setTaskState "Cancelled";
		["TaskSucceeded",["","Recapture Eastwind Device"]] call BIS_fnc_showNotification;
		_marker_eastwind_decoy setMarkerSize [0, 0];
		_run_2 = false;
	};
};