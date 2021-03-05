_run = true;
task_1_2_skip = false;
publicVariableServer "task_1_2_skip";

task_1_2 = player createSimpleTask ["Dropoff Food and Medical Supplies"];
	task_1_2 setSimpleTaskDescription ["Dropoff the food and medical supplies.","Dropoff Food and Medical Supplies",""];
	task_1_2 setSimpleTaskDestination (getMarkerPos "dropoff_idap");
	task_1_2 setSimpleTaskType "container";
	task_1_2 setTaskState "Created";

_marker_food_medical_dropoff = createMarker ["_marker_food_medical_dropoff", getMarkerPos "dropoff_idap"];
	_marker_food_medical_dropoff setMarkerShape "ELLIPSE";
	_marker_food_medical_dropoff setMarkerSize [50, 50];

trg_tsk_1_2 = createTrigger ["EmptyDetector", getMarkerPos "dropoff_idap"];
	trg_tsk_1_2 setTriggerArea [50, 50, 25, false];
	trg_tsk_1_2 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_1_2 setTriggerStatements ["this","",""];

while {_run} do {
	if ((boxes_unloaded == 4) || (task_1_2_skip)) then {
		task_1_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Dropoff Food and Medical Supplies"]] call BIS_fnc_showNotification;
		_marker_food_medical_dropoff setMarkerSize [0, 0];
		deleteVehicle trg_tsk_1_2;
		_run = false;
	};
};