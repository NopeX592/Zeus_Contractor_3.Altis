_run = true;
task_3_4_skip = false;
publicVariableServer "task_3_4_skip";

task_3_4 = player createSimpleTask ["Sweep Town Held by Enemies", task_3_0];
	task_3_4 setSimpleTaskDescription ["Sweep the town of Chalkeia clean of enemies.","Sweep Town Held by Enemies",""];
	task_3_4 setSimpleTaskDestination (getMarkerPos "sweep_town");
	task_3_4 setSimpleTaskType "attack";
	task_3_4 setTaskState "Created";
	["TaskAssigned",["","Sweep Town Held by Enemies"]] call BIS_fnc_showNotification;
	
trg_tsk_3_4 = createTrigger ["EmptyDetector", getMarkerPos "sweep_town"];
	trg_tsk_3_4 setTriggerArea [300, 300, 300, false];
	trg_tsk_3_4 setTriggerActivation ["GUER", "NOT PRESENT", false];
	trg_tsk_3_4 setTriggerStatements ["this","",""];
	
_marker_sweep_town = createMarker ["Takeout or Capture Source", getMarkerPos "sweep_town"];
	_marker_sweep_town setMarkerShape "ELLIPSE";
	_marker_sweep_town setMarkerSize [300, 300];

while {_run} do {
	if ((triggerActivated trg_tsk_3_4) || (task_3_4_skip)) then {
		task_3_4 setTaskState "Succeeded";
		["TaskSucceeded",["","Sweep Town Held by Enemies"]] call BIS_fnc_showNotification;
		deletevehicle trg_tsk_3_4;
		_marker_sweep_town setMarkerSize [0, 0];
		_run = false;
	};
};