/*
	Author: voiper
	
	Description: Start or change a timed mine's timer.
	
	Parameters:
		0: Object; dummy mine object originally created via server (typically a "Land_Map_F").

	Returns:
		Nothing.

	Example:
		[dummy] call vip_sms_fnc_cl_changeTimer;
*/

_dummy = _this select 0;
_secs = _this select 1;

_dummy setVariable ["vip_mineTimer", _secs, true];

if (_dummy getVariable "vip_mineArm" > 0) then {

	_dummy setVariable ["vip_mineArm", 0, true];
	waitUntil {_dummy getVariable "vip_mineArm" == 0};
	_dummy setVariable ["vip_mineArm", 5, true];	
};