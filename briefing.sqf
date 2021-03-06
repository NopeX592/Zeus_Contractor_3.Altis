_run_1 = true;
_run_2 = false;
_run_3 = false;

//Diary  by DaVidoSS
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
        • Some mechanized infantry<br/>
        • More ManPADs<br/>
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
Eastwind:<br/>
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
player createDiaryRecord ["Diary", ["Notes",_roles]];
player createDiaryRecord ["Diary", [_mission, _diary_text]];

[] spawn {
sleep 3;
[
    screen_lrg_4,
    getMarkerPos "uav_spawn_3",
    getMarkerPos "uav_target_3"
] call CF_fnc_createFeed;
sleep 1;
[
    screen_lrg_3,
    getMarkerPos "uav_spawn_1",
    getMarkerPos "uav_target_1"
] call CF_fnc_createFeed;
sleep 1;
[
    screen_lrg_5,
    getMarkerPos "uav_spawn_2",
    getMarkerPos "uav_target_2"
] call CF_fnc_createFeed;
};
/*
briefing_0_1 = false;
briefing_0_2 = false;
briefing_0_3 = false;
publicVariableServer "briefing_0_1";
publicVariableServer "briefing_0_2";
publicVariableServer "briefing_0_3";


while {_run_1} do {
	if (briefing_0_1) then {
        [
	        screen_lrg_3,
            getMarkerPos "uav_spawn_3",
            getMarkerPos "uav_target_3"
        ] call CF_fnc_createFeed;
	_run_1 = false;
	_run_2 = true;
	};
};

while {_run_2} do {
	if (briefing_0_2) then {
        [
	        screen_lrg_3,
            getMarkerPos "uav_spawn_1",
            getMarkerPos "uav_target_1"
        ] call CF_fnc_createFeed;
	_run_2 = false;
	_run_3 = true;
	};
};

while {_run_3} do {
	if (briefing_0_3) then {

	_run_3 = false;
	};
};