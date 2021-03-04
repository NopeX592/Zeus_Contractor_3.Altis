_run_1 = true;
_run_2 = false;
task_1_1_skip = false;
publicVariableServer "task_1_1_skip";

task_1_1 = player createSimpleTask ["Collect Food and Medical Supplies"];
	task_1_1 setSimpleTaskDescription ["Collect the food and medical supplies.","Collect Food and Medical Supplies",""];
	task_1_1 setSimpleTaskDestination (getMarkerPos "dropsite");
	task_1_1 setSimpleTaskType "container";
	task_1_1 setTaskState "Created";

_marker_food_medical = createMarker ["marker_food_medical", getMarkerPos "dropsite"];
	_marker_food_medical setMarkerShape "ELLIPSE";
	_marker_food_medical setMarkerSize [75, 75];

FM_fnc_dropAirdrop = {
		[
			"Land_PaperBox_01_small_stacked_F",
			position player,
			125,
			750,
			1000,
			200,
			4,
			[0,0,-1.2]
		] call AD_fnc_airDrop;
		_marker_food_medical setMarkerSize [0, 0];
};
	
trg_tsk_1_1_1 = createTrigger ["EmptyDetector", getMarkerPos "dropsite"];
	trg_tsk_1_1_1 setTriggerArea [75, 75, 100, false];
	trg_tsk_1_1_1 setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	trg_tsk_1_1_1 setTriggerStatements ["this","",""];

while {_run_1} do {
	if (triggerActivated trg_tsk_1_1_1) then {
		trg_tsk_1_1_2 = createTrigger ["EmptyDetector", getMarkerPos "dropsite"];
			trg_tsk_1_1_2 setTriggerActivation ["JULIET", "PRESENT", false];
			trg_tsk_1_1_2 setTriggerStatements ["this","[] call FM_fnc_dropAirdrop;",""];
			trg_tsk_1_1_2 setTriggerText "Call in the IDAP supplies";
			_run_1 = false;
			_run_2 = true;
	};
};


while {_run} do {
	if (boxes_loaded == 4) then {
		task_1_1 setTaskState "Succeeded";
		["TaskSucceeded",["","Collect Food and Medical Supplies"]] call BIS_fnc_showNotification;
		_marker_food_medical setMarkerSize [0, 0];
		_run = false;
	};
};