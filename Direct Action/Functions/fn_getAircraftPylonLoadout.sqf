
_veh = _this select 0;

_return = [];

_vehicleType = format ["%1", typeOf _veh];
_return = _return + [_vehicleType];


_loadout = getPylonMagazines _veh;
_return append _loadout;

[_return] call BEW_FNC_CopyToClipboard;