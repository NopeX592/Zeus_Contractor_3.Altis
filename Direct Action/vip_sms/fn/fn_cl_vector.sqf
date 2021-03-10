/*
	Author: voiper
	
	Description: Apply the vectors and direction of the dummy mine--necessary because Arma treats ammo objects (munitions like mines) diffently than vehicles and doesn't sync their orientations over the network.
	
	Parameters:
		0: Object; dummy mine object originally created via server (typically a "Land_Map_F").

	Returns:
		Nothing.

	Example:
		[dummy] call vip_sms_fnc_cl_vector;
*/

_dummy = _this select 0;
waitUntil {!isNull (_dummy getVariable ["vip_mineObj", objNull])};
waitUntil {count (_dummy getVariable ["vip_mineVector", []]) > 0};
_mine = _dummy getVariable "vip_mineObj";
_vectorDir = _dummy getVariable "vip_mineVector";

_mine setDir (_vectorDir select 0);
_mine setVectorUp (_vectorDir select 1);