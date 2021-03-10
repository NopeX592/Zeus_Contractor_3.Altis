
_object = _this select 0;


[
	_object,														// Object the action is attached to
	"Activate Me",													// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3",									// Condition for the action to be shown
	"_caller distance _target < 3",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{hint "working"},												// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	3,																// Action duration [s]
	0,																// Priority
	true,															// Remove on completion
	false															// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, _object];					// MP compatible implementation