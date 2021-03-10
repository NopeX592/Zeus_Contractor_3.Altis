private ["_pad", "_pads"];

_pads = getMissionLayerEntities "servicePad" select 0; 

{

		[_x] execVM "scripts\triggerAreaMarker.sqf";

} forEach _pads;
