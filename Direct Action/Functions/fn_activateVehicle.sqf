activateVehicleConditions = {

		private ['_cursorObject', '_return', '_vehKind', '_class'];

		_cursorObject = cursorObject;
		_return = true;

		if (!(vehicle player == player) or (_cursorObject distance player > 10) or (isNull _cursorObject) or (!isSimpleObject _cursorObject) or (isNil {_cursorObject getVariable 'CanBeActivated'}) or (isNil {_cursorObject getVariable 'Missionlevel'})) exitWith {};

		if (!(_cursorObject getVariable 'CanBeActivated') or !(missionlevel >= (_cursorObject getVariable 'MissionLevel'))) exitWith {};

		if ((typeOf _cursorObject isKindOf 'air') and !(typeOf player == 'B_Helipilot_F') and !(serverCommandAvailable '#kick')) exitWith {};
		if ((typeOf _cursorObject isKindOf 'tank') and !(typeOf player == 'B_crew_F') and !(serverCommandAvailable '#kick')) exitWith {};
		if ((typeOf _cursorObject isKindOf 'Wheeled_APC_F') and !(typeOf player == 'B_crew_F') and !(serverCommandAvailable '#kick')) exitWith {};

		_return

	};

[	
	player,																// Object the action is attached to
	"<t color='#add8e6'>ACTIVATE VEHICLE",								// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",	// Progress icon shown on screen
	"[] call activateVehicleConditions",								// Condition for the action to be shown
	"[] call activateVehicleConditions",								// Condition for the action to progress
	{},																	// Code executed when action starts
	{},																	// Code executed on every progress tick
	{		player playActionNow 'PutDown';
			playSound 'click';
			_veh = cursorObject;
			_displayName = [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName;
			[_veh] remoteexec ["deleteVehicle", 2];
			_message = format ["%1 has activated a %2", profileName, _displayName];				
			[_message] remoteExec ["systemChat", 0];			
	},																	// Code executed on completion
	{},																	// Code executed on interrupted
	[],																	// Arguments passed to the scripts as _this select 3
	0.5,																	// Action duration [s]
	99,																	// Priority
	false,																// Remove on completion
	false																// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", player];										