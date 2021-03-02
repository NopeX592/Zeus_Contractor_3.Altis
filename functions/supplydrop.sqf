/*
Author: HallyG
Spawns a supply drop of desired object.

Arguments(s):
0: Supply Drop Object (classname) to spawn - <STRING>
1: Supply Drop Centre - <MARKER, OBJECT, LOCATION, GROUP, TASK, POSITION>
2: Supply Drop Height - <SCALAR>
3: Supply Drop attachTo Position - <ARRAY>

Return Value:
<OBJECT>

Example:
[
	"B_supplyCrate_F",
	position player,
	750,
	1000,
	200,
	[0,0,-1.2],
	WEST
] call AD_fnc_supplyDrop;
__________________________________________________________________*/
params [
	["_object", "B_supplyCrate_F", [""]],
	["_centre", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]],
	["_height", 300, [0]],
	["_distance", 750, [0]],
	["_direction_s", 35, [0]],
	["_attachTo", [0, 0, -1.2], [[]], [3]]
];

//Create Flyby
_direction_e = _direction_s + 180;

_flyby_start = player getRelPos [_distance, _direction_s];
_flyby_end = player getRelPos [_distance, _direction_e];

[_flyby_start, _flyby_end, _height, "NORMAL", "B_T_VTOL_01_vehicle_F", west] call BIS_fnc_ambientFlyby;

_centre = _centre call {
	if (_this isEqualType objNull) exitWith {getPosASL _this};
	if (_this isEqualType grpNull) exitWith {getPosASL (leader _this)};
	if (_this isEqualType "") exitWith {getMarkerPos _this};
	if (_this isEqualType locationNull) exitWith {locationPosition _this};
	if (_this isEqualType taskNull) exitWith {taskDestination  _this};
	if (_this isEqualType []) exitWith {_this};
	[0, 0, 0]
};

if (!(isClass (configfile >> "cfgVehicles" >> _object)) || _centre isEqualTo [0, 0, 0]) exitWith {
	objNull
};

private _obj = createVehicle [_object, _centre vectorAdd [0, 0, _height], [], 0, "NONE"]; 
private _para = createVehicle ["B_parachute_02_F", [0,0,0], [], 0, "FLY"];

_para setDir getDir _obj;
_para setPos getPos _obj;
_obj lock false;
_obj attachTo [_para, _attachTo];

//Attach Smoke
_smoke = selectRandom ["Green"];
_smoke = createVehicle ["SmokeShell"+_smoke, [0,0,0], [], 0 , ""];

_smoke attachTo [_obj, [0,0,0]];

[_obj, _para] spawn {
	params ["_obj","_para"];
		
	waitUntil {
		sleep 0.01;
		((position _obj) select 2) < 2 
		|| 
		isNull _para 
		|| 
		(count (lineIntersectsWith [getPosASL _obj, (getPosASL _obj) vectorAdd [0, 0, -0.5], _obj, _para])) > 0
	};
		
	_para disableCollisionWith _obj;
	_obj setVectorUp [0,0,1];
	_obj setVelocity [0,0,0];
	detach _obj;
		
	if (!isNull _para) then {deleteVehicle _para};

	(format ["A supply drop has touched down, grid %1.", mapGridPosition getPosATL _obj]) remoteExec ["systemChat", 0, false]; 
};
//Attach Smoke
_smoke = selectRandom ["Blue"];
_smoke = createVehicle ["SmokeShell"+_smoke, [0,0,0], [], 0 , ""];

_smoke attachTo [_obj, [0,0,0]];

_obj 