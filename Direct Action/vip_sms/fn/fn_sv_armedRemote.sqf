/*
	Author: voiper
	
	Description: Armed loop for when an explosive is remotely armed.
	
	Parameters:
		0: Object; dummy mine object originally created via server (typically a "Land_Map_F").

	Returns:
		Nothing.

	Example:
		[dummy] call vip_sms_fnc_sv_armedRemote;
*/

_dummy = _this select 0;
_mine = _dummy getVariable "vip_mineObj";

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 2, 50];

waitUntil {

	sleep 0.1;

	((_dummy getVariable "vip_mineArm") == 0) || (_dummy getVariable "vip_mineDet")
};

if ((_dummy getVariable "vip_mineArm") == 0) then {[_dummy] call vip_sms_fnc_sv_disarm} else {
	if (_dummy getVariable "vip_mineDet") then {[_dummy, true] call vip_sms_fnc_sv_detonate};
};