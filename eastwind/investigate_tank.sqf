_run_1 = true;
_run_2 = false;
sent_data_tank = false;
task_2_3_skip = false;
publicVariableServer "task_2_3_skip";
publicVariableServer "sent_data_tank";

task_2_3 = player createSimpleTask ["Investigate Destroyed Tank", task_2_0];
	task_2_3 setSimpleTaskDescription ["Investigate the destroyed tanks you may find it in the estimated area.","Investigate Destroyed Tank",""];
	task_2_3 setSimpleTaskDestination (getMarkerPos "intel_tank");
	task_2_3 setSimpleTaskType "documents";
	task_2_3 setTaskState "Created";

_marker_intel = createMarker ["Investigate Destroyed Tank", getMarkerPos "intel_tank"];
	_marker_intel setMarkerShape "ELLIPSE";
	_marker_intel setMarkerSize [125, 125];

while {_run_1} do {
	if ((gathered_tank == 3) || (task_2_3_skip)) then {
		_run_1 = false;
		_run_2 = true;

		[sent_data_tank]spawn {
			params ["sent_data_tank"];
			for "_i" from 5 to 100 step 5 do { 
				hint str format ["Uploading Data.\n %1%/100%",str _i];
				sleep 9;
			};
		sent_data_tank = true;
		publicVariableServer "_sent_data_tank";
		};
	};
};

while {_run_2} do {
	if ((sent_data_tank) || (task_2_3_skip)) then {
		task_2_3 setTaskState "Succeeded";
		["TaskSucceeded",["","Investigate Destroyed Tank"]] call BIS_fnc_showNotification;
		_marker_intel setMarkerSize [0, 0];
		_run_2 = false;
	};
};