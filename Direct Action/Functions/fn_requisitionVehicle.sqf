

requisitionVehicleConditions = {

		private ['_cursorObject', '_return', '_vehKind', '_class'];

		_cursorObject = cursorObject;
		_return = true;

		if (!(vehicle player == player) or (_cursorObject distance player > 10) or (isNull _cursorObject) or (!isSimpleObject _cursorObject) or (isNil {_cursorObject getVariable 'CanBeRequisitioned'}) or (isNil {_cursorObject getVariable 'Missionlevel'})) exitWith {};

		if (!(_cursorObject getVariable 'CanBeRequisitioned') or !(missionlevel >= (_cursorObject getVariable 'MissionLevel'))) exitWith {};

		if ((typeOf _cursorObject isKindOf 'helicopter') and (typeOf player == 'B_Helipilot_F')) exitWith {};
		if !(typeOf _cursorObject isKindOf 'helicopter') exitWith {};

		_return

	};

[	
	player,																// Object the action is attached to
	"REQUISITION HELI TRANSPORT",										// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",	// Progress icon shown on screen
	"[] call requisitionVehicleConditions",								// Condition for the action to be shown
	"[] call requisitionVehicleConditions",								// Condition for the action to progress
	{},																	// Code executed when action starts
	{},																	// Code executed on every progress tick
	{		
	
			player playActionNow 'PutDown';
			playSound 'click';
			
			cursorObject setVariable ["isRequisitioned", true, true];
					
	},																	// Code executed on completion
	{},																	// Code executed on interrupted
	[],																	// Arguments passed to the scripts as _this select 3
	3,																	// Action duration [s]
	0,																	// Priority
	false,																// Remove on completion
	false																// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", player];										