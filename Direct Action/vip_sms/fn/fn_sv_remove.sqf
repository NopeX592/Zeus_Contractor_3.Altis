/*
	Author: voiper
	
	Description: Completely remove a mine (without detonation).
	
	Parameters:
		0: Object; dummy mine object originally created via server (typically a "Land_Map_F").

	Returns:
		Nothing.

	Example:
		[dummy] call vip_sms_fnc_sv_remove;
*/

_dummy = _this select 0;
_mine = _dummy getVariable "vip_mineObj";
_type = _dummy getVariable "vip_mineType";

vip_sms_var_gl_jipMines deleteAt (vip_sms_var_gl_jipMines find _dummy);
publicVariable "vip_sms_var_gl_jipMines";

deleteVehicle _mine;
deleteVehicle _dummy;