if (!isServer) exitWith {};

private ["_side", "_marker", "_markerName"];

_markers = getMissionLayerEntities "SpawnMarkers" select 1; 

_side = _this select 0;

	{

		_marker = _x;
		_markerName = markerText _marker;

		[_side, _marker, _markerName] call BIS_fnc_addRespawnPosition;

	} forEach _markers;