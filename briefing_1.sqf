_run_1 = true;
_run_2 = true;
drone_feed_on = false;
drone_feed_off = false;
publicVariable "drone_feed_on";
publicVariable "drone_feed_off";

private ["_mission", "_diary_text", "_roles"];
_mission = toUpper (format ["%1",getText (missionconfigfile >> "onLoadName")]);

_diary_text = _mission + "<br/>" + 
format [" Date: %3.%2.%1<br/>",date select 0,date select 1,date select 2]+
format [" Location: %1<br/>",worldName]+
format [" Type: %1<br/>",getText (missionconfigfile >> "Header" >> "gameType")]+
format [" Players: %1-%2<br/>",getNumber (missionconfigfile >> "Header" >> "minPlayers"),getNumber (missionconfigfile >> "Header" >> "maxPlayers")]+
format [" Authors: %1<br/><br/>",getText (missionconfigfile >> "author")]+
"<br/>"+
"FEATURES:<br/>"+
"• Virtual Arsenal<br/>"+
"• Artillery Support<br/>"+
"• Mortar Support<br/>"+
"• V-44X Blackfish Support<br/>"+
"• Supply Drop<br/>"+
"<br/>"+
"THANKS:<br/>"+
"• Oskar for playtesting<br/>"+
"• Oskar for bearing with my expressions of frustration<br/>"+
"• Alex for helping me with programming<br/>"+
"";

_roles = "<br/>"+
"General:<br/>
    • Since your last deployment a week ago tensions rose<br/>
        • More CSAT activity<br/>
        • Tried evacuate all civilians<br/>
            • Still high civilian activity<br/>
    • Enemy Types to expect:<br/>
        • Mostly infantry<br/>
        • Some Technicals<br/>
        • Expect some armour<br/>
        • More ManPADs<br/>
        • Mine fields are marked on map<br/>
    • Front line markings only accurate for CSAT<br/>
        • Past front line expect CSAT and IND<br/>
        • Within should only be IND<br/>
    • Virus Outbreak<br/>
        • Orange Markings are infected areas<br/>
        • Do not enter without consulting with me<br/>
        • Do not enter without CBRN Suits<br/>
    • Enemy is more reactive<br/>
        • More QRFs<br/>
<br/>
Humanitarian:<br/>
    • Collect Food and Medical supplies<br/>
    • Load supplies on to HEMTTs<br/>
    • Dropoff supplies in Kalithea<br/>
    • Recapture Kalithea from IND<br/>
    • Enemies will let off once IDAP arrives<br/>
    • Air Drop can be called in via the radio in the marked area<br/>
<br/>
Investigation:<br/>
    • Lost contact to squad<br/>
        • Investigate their deaths<br/>
        • Search them for Intel<br/>
    • Lost contact to Blackfish<br/>
        • Search for Blackbox and upload Datais<br/>
        • Search for flight log<br/>
    • Lost contact to Tank<br/>
        • Investigate Debris<br/>
    • Intel is for my eyes only<br/>
    • Datais transferred automatically<br/>
<br/>
Kill:<br/>
    • Kill Artillery<br/>
            • High Priority<br/>
    • After done with investigation:<br/>
        • Sweep town of Chalkeia<br/>
        • Destroy stationed Helicopters nearby<br/>
        • Destroy the nearby comms towers<br/>
            • You'll need charges<br/>
            • RTB if necessary<br/>
<br/>
Support:<br/>
    • Artillery Strikes possible<br/>
        • Use only if no other way<br/>
    • Mortar Support possible<br/>
    • Supply drop<br/>
        • If called in IND will most likely respond<br/>
<br/>"+
"";

waitUntil {!isNull player};
player createDiaryRecord ["Diary", ["Briefing 1",_roles]];
player createDiaryRecord ["Diary", [_mission, _diary_text]];

//Create Drone Feeds
while {_run_1} do {
    sleep 1;

    if (drone_feed_on) then {
        _run_1 = false;
        _run_2 = true;

        //Create Feed A - Humanitarian
        [
            screen_lrg_3,
            uav_target_1,
            uav_recon_1
        ] spawn {
            params [
                ["_taget_screen", screen_lrg_3, []],
                ["_target_uav", uav_target_1, []],
                ["_uav_1", uav_recon_1, []]
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

        sleep 5;

        //Create Feed B - Investigate
        [
            screen_lrg_4,
            uav_target_2,
            uav_recon_2
        ] spawn {
            params [
                ["_taget_screen", screen_lrg_4, []],
                ["_target_uav", uav_target_2, []],
                ["_uav_2", uav_recon_2, []]
            ];

            uav_2 = _uav_2;

            //Select screen
            [_taget_screen, 2] call BIS_fnc_DataTerminalAnimate;   
            _taget_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt2,1)"];

            //Create camera
            cam_2 = "camera" camCreate [0,0,0];
            cam_2 cameraEffect ["Internal", "Back", "uavrtt2"];
            cam_2 camSetFov 0.3;
            cam_2 attachTo [uav_2, [0,0,0], "PiP0_pos"];
            "uavrtt2" setPiPEffect [2];

            //Line up camera
            addMissionEventHandler ["Draw3D", {
                _dir =
                    (uav_2 selectionPosition "PiP0_pos")
                        vectorFromTo
                    (uav_2 selectionPosition "PiP0_dir");
                cam_2 setVectorDirAndUp [
                    _dir,
                    _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
                ];    
            }];

            //Target UAV camera
            cam_2 camPrepareTarget getpos _target_uav;
            cam_2 camSetTarget _target_uav;
            cam_2 lockCameraTo [_target_uav, [0]];
            cam_2 camCommit 1;
        };

        sleep 5;

        //Create Feed C - Kill
        [
            screen_lrg_5,
            uav_target_3,
            uav_recon_3
        ] spawn {
            params [
                ["_taget_screen", screen_lrg_5, []],
                ["_target_uav", uav_target_3, []],
                ["_uav_3", uav_recon_3, []]
            ];

            uav_3 = _uav_3;

            //Select screen
            [_taget_screen, 2] call BIS_fnc_DataTerminalAnimate;   
            _taget_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt3,1)"];

            //Create camera
            cam_3 = "camera" camCreate [0,0,0];
            cam_3 cameraEffect ["Internal", "Back", "uavrtt3"];
            cam_3 camSetFov 0.3;
            cam_3 attachTo [uav_3, [0,0,0], "PiP0_pos"];
            "uavrtt3" setPiPEffect [2];

            //Line up camera
            addMissionEventHandler ["Draw3D", {
                _dir =
                    (uav_3 selectionPosition "PiP0_pos")
                        vectorFromTo
                    (uav_3 selectionPosition "PiP0_dir");
                cam_3 setVectorDirAndUp [
                    _dir,
                    _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
                ];    
            }];

            //Target UAV camera
            cam_3 camPrepareTarget getpos _target_uav;
            cam_3 camSetTarget _target_uav;
            cam_3 lockCameraTo [_target_uav, [0]];
            cam_3 camCommit 1;
        };

        sleep 5;

        //Create Feed D - Kill
        [
            screen_lrg_6,
            uav_target_4,
            uav_recon_4
        ] spawn {
            params [
                ["_taget_screen", screen_lrg_6, []],
                ["_target_uav", uav_target_4, []],
                ["_uav_4", uav_recon_4, []]
            ];

            uav_4 = _uav_4;

            //Select screen
            [_taget_screen, 2] call BIS_fnc_DataTerminalAnimate;   
            _taget_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt4,1)"];

            //Create camera
            cam_4 = "camera" camCreate [0,0,0];
            cam_4 cameraEffect ["Internal", "Back", "uavrtt4"];
            cam_4 camSetFov 0.3;
            cam_4 attachTo [uav_4, [0,0,0], "PiP0_pos"];
            "uavrtt4" setPiPEffect [2];

            //Line up camera
            addMissionEventHandler ["Draw3D", {
                _dir =
                    (uav_4 selectionPosition "PiP0_pos")
                        vectorFromTo
                    (uav_4 selectionPosition "PiP0_dir");
                cam_4 setVectorDirAndUp [
                    _dir,
                    _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
                ];    
            }];

            //Target UAV camera
            cam_4 camPrepareTarget getpos _target_uav;
            cam_4 camSetTarget _target_uav;
            cam_4 lockCameraTo [_target_uav, [0]];
            cam_4 camCommit 1;
        };

        sleep 5;

        //Create Feed E - Kill
        [
            screen_lrg_7,
            helicopter_2,
            uav_recon_5
        ] spawn {
            params [
                ["_taget_screen", screen_lrg_7, []],
                ["_target_uav", helicopter_2, []],
                ["_uav_5", uav_recon_5, []]
            ];

            uav_5 = _uav_5;

            //Select screen
            [_taget_screen, 2] call BIS_fnc_DataTerminalAnimate;   
            _taget_screen setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt5,1)"];

            //Create camera
            cam_5 = "camera" camCreate [0,0,0];
            cam_5 cameraEffect ["Internal", "Back", "uavrtt5"];
            cam_5 camSetFov 0.3;
            cam_5 attachTo [uav_5, [0,0,0], "PiP0_pos"];
            "uavrtt5" setPiPEffect [2];

            //Line up camera
            addMissionEventHandler ["Draw3D", {
                _dir =
                    (uav_5 selectionPosition "PiP0_pos")
                        vectorFromTo
                    (uav_5 selectionPosition "PiP0_dir");
                cam_5 setVectorDirAndUp [
                    _dir,
                    _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]
                ];    
            }];

            //Target UAV camera
            cam_5 camPrepareTarget getpos _target_uav;
            cam_5 camSetTarget _target_uav;
            cam_5 lockCameraTo [_target_uav, [0]];
            cam_5 camCommit 1;
        };
    };
};

while {_run_2} do {
    sleep 1;

    if (drone_feed_off) then {
        _run_2 = false;
        
        //Remove event handler Draw3D
        removeAllMissionEventHandlers "Draw3D";
    };
};