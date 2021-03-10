/*
	Author: voiper
	
	Description: Create and initialise a tripwire peg.
	
	Parameters:
		0: Array; positionATL where tripwire peg should be placed.
		1: Object; dummy mine object originally created via server (typically a "Land_Map_F") to which we're attaching the tripwire.

	Returns:
		Nothing.

	Example:
		[getPosATL player, dummy] call vip_sms_fnc_sv_createTripwire;
*/

_pos = _this select 0;
_dummy = _this select 1;

_trip = "Land_CanOpener_F" createVehicle _pos;
_trip setPosATL _pos;
_trip setDir 0;
_trip setVectorUp [1, -1, 0];
_trip enableSimulationGlobal false;

_dummy setVariable ["vip_mineTripObj", _trip, true];
_dummy setVariable ["vip_mineArm", 3, true];

_trip setVariable ["vip_mineTripAttachedMine", _dummy, true];

playSound3D ["a3\sounds_f\weapons\closure\sfx3.wss", _dummy, false, getPosASL _dummy, 1, 1, 50];