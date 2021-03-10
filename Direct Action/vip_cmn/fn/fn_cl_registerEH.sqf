/*
	Author: voiper
	
	Description: Adds/removes eventhandlers, and automatically manages their indices.
	
	Parameters:
		0: String; name for EH index.
		1: Object/Control/Display/Bool; target of EH; if true, uses missionNameSpace.
		2: String; EH type.
		3: Code/Bool; if code, code to add to EH; if false, remove EH.
		4: Bool: if true, use MPEventHandler instead of eventHandler (only works with objects).

	Returns:
		None.
		
	Example:
		add: ["myEH", player, "Killed", {removeallWeapons player}] call vip_cmn_fnc_cl_registerEH;
		remove: ["myEH", player, "Killed", false] call vip_cmn_fnc_cl_registerEH;
*/

_variableName = [_this, 0, "", [""]] call BIS_fnc_param;
_target = [_this, 1, true, [objNull, controlNull, displayNull, false]] call BIS_fnc_param;
_eventHandlerName = [_this, 2, "", [""]] call BIS_fnc_param;
_input = [_this, 3, {}, [{}, false]] call BIS_fnc_param;
_mp = if (count _this > 4) then {[_this, 4, false, [false]] call BIS_fnc_param} else {false};

_object = if (typeName _target == "BOOL") then {true} else {false};
_recipient = if !(typeName _target == "BOOL") then {_target};
if (_object) then {if (isNull _target) exitWith {if (true) exitWith {["Attemped to add an EH to a nonexistent entity."] call BIS_fnc_error}}};
_arrayName = "vip_cmn_var_cl_EHArray";
if ((typeName _target == "CONTROL") || (typeName _target == "DISPLAY")) then {_arrayName = "vip_cmn_var_cl_EHArray" + str _target;};

_allHandlersArray = if (_mission) then {missionNameSpace getVariable _arrayName} else {_recipient getVariable _arrayName};

if (isNil "_allHandlersArray") then {  //if array doesn't exist, create it

	if (_mission) then {
	
		missionNameSpace setVariable [_arrayName, []];
		_allHandlersArray = missionNameSpace getVariable _arrayName;
	} else {
		_recipient setVariable [_arrayName, [], false];
		_allHandlersArray = _recipient getVariable _arrayName;
	};
};

_handlerArrayIndex = -1;

{
	if ((_x select 0) == _eventHandlerName) exitWith {_handlerArrayIndex = _forEachIndex};
} forEach _allHandlersArray;

if (typeName _input == "CODE") then { //add

	_index = switch (typeName _target) do {

		case "OBJECT": {if (_mp) then {_recipient addMPEventHandler [_eventHandlerName, _input]} else {_recipient addEventHandler [_eventHandlerName, _input]}};
		case "CONTROL": {_recipient ctrlAddEventHandler [_eventHandlerName, _input]};
		case "DISPLAY": {_recipient displayAddEventHandler [_eventHandlerName, _input]};
	};
	
	if (_mission) then {_index = addMissionEventHandler [_eventHandlerName, _input]};
	
	if (_index == -1) exitWith {["Attempted to add an EH type that does not exist."] call BIS_fnc_error};
	
	if (_handlerArrayIndex == -1) then {
	
		_allHandlersArray pushBack [_eventHandlerName, [[_variableName, _index]]];
	
	} else {
	
		_handlerArray = _allHandlersArray select _handlerArrayIndex;
		(_handlerArray select 1) pushBack [_variableName, _index];
		_allHandlersArray set [_handlerArrayIndex, _handlerArray];
	};
	
	//example array: [["Fired", [["author1_killedEH", 0], ["author2_killedEH", 1], ["author3_killedEH", 2]]], ["Killed", [["myEh1", 0], ["myEh2", 1]]]]
	if (_mission) then {missionNameSpace setVariable [_arrayName, _allHandlersArray]} else {_recipient setVariable [_arrayName, _allHandlersArray]};
};

if (typeName _input == "BOOL") then { //remove

	private ["_removeIndex"];
	
	if (_handlerArrayIndex == -1) exitWith {["Attempted to remove an EH when none of its type has been registered."] call BIS_fnc_error};
	
	_handlerArray = _allHandlersArray select _handlerArrayIndex;
	_handlerArrayEHList = _handlerArray select 1;
	_deleteIndex = -1;
	
	{
		if ((_x select 0) == _variableName) then {
				_deleteIndex = _forEachIndex;
				_removeIndex = _x select 1;
		} else {
			if ((_x select 1) > _removeIndex) then {_x set [1, (_x select 1) - 1]};
		};
	
	} forEach _handlerArrayEHList;
	
	if (_deleteIndex == -1) exitWith {["Attempted to remove an EH that has not been registered."] call BIS_fnc_error};
	if (_deleteIndex > -1) then {_handlerArrayEHList deleteAt _deleteIndex};
	
	_handlerArray set [1, _handlerArrayEHList];
	_allHandlersArray set [_handlerArrayIndex, _handlerArray];
	
	if (_mission) then {missionNameSpace setVariable [_arrayName, _allHandlersArray]} else {_recipient setVariable [_arrayName, _allHandlersArray]};
	
	switch (typeName _target) do {

		case "OBJECT": {if (_mp) then {_recipient removeMPEventHandler [_eventHandlerName, _removeIndex]} else {_recipient removeEventHandler [_eventHandlerName, _removeIndex]}};
		case "CONTROL": {_recipient ctrlRemoveEventHandler [_eventHandlerName, _removeIndex]};
		case "DISPLAY": {_recipient displayRemoveEventHandler [_eventHandlerName, _removeIndex]};
	};
	
	if (_mission) then {removeMissionEventHandler [_eventHandlerName, _removeIndex]};
};

systemChat str _allHandlersArray;