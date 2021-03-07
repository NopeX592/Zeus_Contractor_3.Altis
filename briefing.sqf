_run = true;
briefing = false;
publicVariable "briefing";

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
    • Enemy Units<br/>
        • Should have intel on them<br/>
    • Kill Artillery<br/>
        • High Priority<br/>
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

while {_run} do {
    if (briefing) then {
        run = false;
        
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

        sleep 5;
        
        //Create Feed B
        [
            screen_lrg_4,
            uav_target_2,
            uav_2_recon
        ] spawn {
            params [
                ["_taget_screen", screen_lrg_3, []],
                ["_target_uav", uav_target_2, []],
                ["_uav_2", uav_2_recon, []]
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
        
        //Create Feed C
        [
            screen_lrg_5,
            uav_target_3,
            uav_3_recon
        ] spawn {
            params [
                ["_taget_screen", screen_lrg_3, []],
                ["_target_uav", uav_target_3, []],
                ["_uav_3", uav_3_recon, []]
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
    };
};