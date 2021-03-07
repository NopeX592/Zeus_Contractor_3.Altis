//Create Feed A
        [
            screen_lrg_3,
            uav_target_1,
            uav_1_recon
        ] spawn {
            params [
                ["_taget_screen", screen_lrg_3, []],
                ["_target_uav", uav_target_1, []],
                ["_uav_1", uav_1_recon, []]
            ];

            uav_1 = _uav_1;

            //Select screen
            [_taget_screen, 2] call BIS_fnc_DataTerminalAnimate;   
            _taget_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt1,1)"];

            //Create camera
            cam_1 = "camera" camCreate [0,0,0];
            cam_1 cameraEffect ["Internal", "Back", "uavrtt1"];
            cam_1 camSetFov 0.3;
            cam_1 attachTo [uav_1, [0,0,0], "PiP0_pos"];
            "uavrtt1" setPiPEffect [2];

            //Line up camera
            addMissionEventHandler ["Draw3D", {
                _dir =
                    (uav_1 selectionPosition "PiP0_pos")
                        vectorFromTo
                    (uav_1 selectionPosition "PiP0_dir");
                cam_1 setVectorDirAndUp [
                    _dir,
                    _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
                ];    
            }];

            //Target UAV camera
            cam_1 camPrepareTarget getpos _target_uav;
            cam_1 camSetTarget _target_uav;
            cam_1 lockCameraTo [_target_uav, [0]];
            cam_1 camCommit 1;
        };