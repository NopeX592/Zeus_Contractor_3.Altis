_veh = _this select 0;
_vehType = typeOf _veh;
_return = [_vehType];

_pylonLoadout = getPylonMagazines _veh;

_return append _pylonLoadout;

systemchat format ["%1", _return];

[_return] call BEW_FNC_CopyToClipboard;