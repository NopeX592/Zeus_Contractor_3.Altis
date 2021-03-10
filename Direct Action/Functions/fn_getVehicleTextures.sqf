
_veh = _this select 0;

_return = [];

_vehicleType = format ["%1", typeOf _veh];
_return = _return + [_vehicleType];


_textures = getObjectTextures _veh;
_return append _textures;

[_return] call BEW_FNC_CopyToClipboard;