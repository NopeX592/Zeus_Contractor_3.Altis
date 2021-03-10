/*
	Author: voiper
	
	Description: Disarm a mine.
	
	Parameters:
		0: Object; dummy mine object originally created via server (typically a "Land_Map_F").

	Returns:
		Nothing.

	Example:
		[dummy] call vip_sms_fnc_sv_disarm;
*/

_dummy = _this select 0;

playSound3D ["a3\sounds_f\weapons\closure\sfx4.wss", _mine, false, getPosASL _mine, 1, 1.5, 50];
[_dummy] spawn vip_sms_fnc_sv_idle;