

_marker = _this select 0;
	_markerPos = markerPos _marker;
	_markerDir = markerDir _marker;
_vehType = _this select 1;
_side = _this select 2;


_veh = createVehicle [_vehType, _markerPos, [], 0, "NONE"];
createVehicleCrew _veh;
_veh setDir _markerDir;



