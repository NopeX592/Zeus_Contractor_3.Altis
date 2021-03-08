_run = true;
task_1_2_skip = false;
task_1_2_done = false;
boxes_unloaded = 0;
publicVariableServer "task_1_2_skip";
publicVariableServer "task_1_2_done";

task_1_2 = player createSimpleTask ["Dropoff Food and Medical Supplies"];
	task_1_2 setSimpleTaskDescription ["Dropoff the food and medical supplies.","Dropoff Food and Medical Supplies",""];
	task_1_2 setSimpleTaskDestination (getMarkerPos "dropoff_idap");
	task_1_2 setSimpleTaskType "container";
	task_1_2 setTaskState "Created";

_marker_food_medical_dropoff = createMarker ["_marker_food_medical_dropoff", getMarkerPos "dropoff_idap"];
	_marker_food_medical_dropoff setMarkerShape "ELLIPSE";
	_marker_food_medical_dropoff setMarkerSize [50, 50];

while {_run} do {
	if ((boxes_unloaded == 6) || (task_1_2_skip)) then {
		task_1_2 setTaskState "Succeeded";
		["TaskSucceeded",["","Dropoff Food and Medical Supplies"]] call BIS_fnc_showNotification;
		_marker_food_medical_dropoff setMarkerSize [0, 0];
		task_1_2_done = true;
		publicVariableServer "task_1_2_done";
		_run = false;
	};
};