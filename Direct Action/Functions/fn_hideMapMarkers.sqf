if (!isServer) exitWith {};


// Define Objectives

_allObjectives = [["ALL"]] call BEW_FNC_DefineObjectives; 


// Hide Map Markers

	{_x setMarkerAlpha 0;} forEach _allObjectives;