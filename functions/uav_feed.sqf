/*
Author: KillzoneKid
Modified by: Nope.X
Example:
[
	screen_lrg_3,
	getMarkerPos "uav_spawn_1",
	getMarkerPos "uav_target_1"
] call CF_fnc_createFeed;
__________________________________________________________________*/
// create render surface
params [
	["_target_screen", screen_lrg_3, []],
	["_spawn_pos", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]],
	["_target_pos", [0, 0, 0], ["", objNull, taskNull, locationNull, [], grpNull], [3]]
];

//Set Screen Texture
_target_screen setObjectTexture [0, "#(argb,2048,2048,1)r2t(uavrtt,1)"];

// create uav and make it fly
_uav = createVehicle ["O_UAV_01_F", _spawn_pos, [], 0, "FLY"];
createVehicleCrew _uav;
_uav lockCameraTo [_target_pos, [0]];
_uav flyInHeight 150;

// add loiter waypoint
_wp = group _uav addWaypoint [_target_pos, 0];
_wp setWaypointType "LOITER";
_wp setWaypointLoiterType "CIRCLE_L";
_wp setWaypointLoiterRadius 450;

// create camera and stream to render surface
_cam = "camera" camCreate [0,0,0];
_cam cameraEffect ["Internal", "Back", "uavrtt"];

// attach cam to gunner cam position
_cam attachTo [_uav, [0,0,0], "PiP0_pos"];

// make it zoom in a little
_cam camSetFov 0.35;

// switch cam to mode
"uavrtt" setPiPEffect [0];

// adjust cam orientation
[_cam, _uav] spawn {
	params ["_cam", "_uav"];
	while {true} do {
		_dir = 
			(_uav selectionPosition "PiP0_pos") 
				vectorFromTo 
			(_uav selectionPosition "PiP0_dir");
		_cam setVectorDirAndUp [
			_dir, 
			_dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
		];
		sleep 0.16;
	};
};