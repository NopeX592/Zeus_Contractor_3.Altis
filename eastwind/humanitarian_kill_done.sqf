_run = true;
task_4_0_skip = false;
task_1_0_done = false;
task_3_0_done = false;
publicVariable "task_4_0_skip";

while {_run} do {
	if (((task_1_0_done) && (task_3_0_done)) || (task_4_0_skip)) then {
		[]execVM "\kill\return_fob_1.sqf";
		
		_run = false;
	};
	sleep 1;
};