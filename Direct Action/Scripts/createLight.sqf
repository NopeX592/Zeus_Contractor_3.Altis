_pos = _this select 0;
_brightness = param [1, 1.0];
_ambient = param [2, [1.0, 1.0, 1.0]];
_color = param [3, [1.0, 1.0, 1.0]];

private ["_pos", "_brightness", "_ambient", "_color"];


_light = "#lightpoint" createVehicleLocal _pos;
_light setLightBrightness _brightness;
_light setLightAmbient _ambient;
_light setLightColor _color;