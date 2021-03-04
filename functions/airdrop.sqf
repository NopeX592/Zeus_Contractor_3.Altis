/*
Author: HallyG
Example:
[
	"CargoNet_01_box_F",
	position player,
	125,
	750,
	1000,
	200,
	4,
	[0,0,-1.2],
	WEST
] call AD_fnc_airDrop;
__________________________________________________________________*/
params [
	["_object", "C_IDAP_CargoNet_01_supplies_F", [""]],
	["_centre", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]],
	["_drop_distance", 125, [0]],
	["_height", 300, [0]],
	["_distance", 750, [0]],
	["_direction_s", 35, [0]],
	["_repetitions", 4, [0]],
	["_attachTo", [0, 0, -1.2], [[]], [3]]
];

//Create Flyby
_direction_e = _direction_s + 180;

_flyby_start = dropsite_logic getRelPos [_distance, _direction_s];
_flyby_end = dropsite_logic getRelPos [_distance, _direction_e];

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

//Delay drops
[_object, _centre, _drop_distance, _height, _distance, _direction_s, _repetitions, _attachTo, _direction_e] spawn {

	params ["_object", "_centre", "_drop_distance", "_height", "_distance", "_direction_s", "_repetitions", "_attachTo", "_direction_e"];

	sleep 9.75;

	//Repeat
	_objArray = [];

	for "_i" from 1 to _repetitions step 1 do {
		//Space out drops
		_centre_distance = dropsite_logic getRelPos [_drop_distance, _direction_e];
		_objArray pushBack createVehicle [_object, _centre_distance vectorAdd [0, 0, _height], [], 0, "NONE"]; 
		_drop_distance = _drop_distance * 1.5;
	}; 

	_count = 1;

	//Create Airdrops
	{
		private _para = createVehicle ["B_parachute_02_F", [0,0,0], [], 0, "FLY"];

		_para setDir getDir _x;
		_para setPos getPos _x;
		_x lock false;
		_x attachTo [_para, _attachTo];

		[_x, _para] spawn {
			params ["_x","_para"];
				
			waitUntil {
				sleep 0.01;
				((position _x) select 2) < 2 
				|| 
				isNull _para 
				|| 
				(count (lineIntersectsWith [getPosASL _x, (getPosASL _x) vectorAdd [0, 0, -0.5], _x, _para])) > 0
			};
				
			_para disableCollisionWith _x;
			_x setVectorUp [0,0,1];
			_x setVelocity [0,0,0];
			detach _x;
				
			if (!isNull _para) then {deleteVehicle _para};

			//Attach Smoke
			_smoke = "Orange";
			_smoke = createVehicle ["SmokeShell"+_smoke, [0,0,0], [], 0 , ""];
			_smoke attachTo [_x, [0,0,0]];
		};

		//Add Action
		AD_fnc_createAction = {
			params ["_hemtt", "_box"];
			hint "got to createAction";
			_box_loaded = _box addAction ["Load Goods onto HEMTT","
				params ['_hemtt', '_box', '_box_loaded'];
				player playMove 'AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon';
				_box attachTo [_hemtt, [0, 0, 0]];
				[_box, _box_loaded] remoteExec ['removeAction', 0, true];
			",nil,1,true,false,"","true",3,false,"",""];
		};

		box = _x;

		if (isServer) then {
			hint "2";
			if (_count mod 2 == 0) then {
				hint "even";
				_hemtt = hemtt_collect_1;
				[_hemtt, box] remoteExec ["AD_fnc_createAction", 0, true];
			} else {
				hint "odd";
				_hemtt = hemtt_collect_2;
				[_hemtt, box] remoteExec ["AD_fnc_createAction", 0, true];
			};
		};
		
		//Cycle HEMTT
		_count = _count + 1;
	} forEach _objArray;

	//Spawn QRF
	_repetitions = _repetitions - 1;
	_qrf_spawns = ["qrf_spawn_1","qrf_spawn_2","qrf_spawn_3","qrf_spawn_4"];
	for "_i" from 1 to _repetitions step 1 do {
		_randomStarting = selectRandom _qrf_spawns;
		_randomUnits = selectRandom [4,5,6,7];

		[
			getMarkerPos _randomStarting,
			getMarkerPos "qrf_target_1",
			_randomUnits,
			1,
			independent
		] call SU_fnc_spawnOPFOR;

		_newArray = [];
		{ if (_x != _randomStarting) then {_newArray pushBack _x}; } forEach _qrf_spawns;
		_qrf_spawns = _newArray;
	};
};