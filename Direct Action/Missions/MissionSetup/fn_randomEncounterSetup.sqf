if (!isServer) exitWith {};

waitUntil {time > 1};

_allObjectives = [] call BEW_FNC_randomEncounterPositions;

{

	[_x] spawn BEW_FNC_randomEncounterTrigger

} forEach _allObjectives;