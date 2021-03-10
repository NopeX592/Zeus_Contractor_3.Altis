// Weapon Restriction Script
// Created By Schadler.C

private ["_classes", "_items", "_primaryWeapon", "_secondaryWeapon", "_handgunWeapon", "_primaryName", "_secondaryName", "_uavTerminalName", "_uavTerminalPicture"];

while {true} do

{
  sleep 1;
  
  
  _classes = _this select 0;
  _items = _this select 1;

  _primaryWeapon = primaryWeapon player;
  _secondaryWeapon = secondaryWeapon player;
  _handgunWeapon = handgunWeapon player;


// Primary Weapons

  if ((_primaryWeapon in _items) && !(typeOf player in _classes)) then {
	_primaryName = getText(configFile >> "CfgWeapons" >>_primaryWeapon >> "displayName");
	_primaryPicture = getText(configFile >> "CfgWeapons" >>_primaryWeapon >> "picture");
	
    player removeWeapon _primaryWeapon;
    hint parseText format ["<t size = '1.5' color = '#FF0000'>RESTRICTED ITEM</t><br/><br/><img image='%2' size='5'/><br />Your class is not qualified<br/>to use %1",_primaryName, _primaryPicture];
	
  };

  
// Secondary Weapons
  
  if ((_secondaryWeapon in _items) && !(typeOf player in _classes)) then {
	_secondaryName = getText(configFile >> "CfgWeapons" >>_secondaryWeapon >> "displayName");
	_secondaryPicture = getText(configFile >> "CfgWeapons" >>_secondaryWeapon >> "picture");
	
    player removeWeapon _secondaryWeapon;
    hint parseText format ["<t size = '1.5' color = '#FF0000'>RESTRICTED ITEM</t><br/><br/><img image='%2' size='5'/><br />Your class is not qualified<br/>to use %1",_secondaryName, _secondaryPicture];
	
  };
  
  
// Handgun Weapons
  
  if ((_handgunWeapon in _items) && !(typeOf player in _classes)) then {
	_handgunName = getText(configFile >> "CfgWeapons" >>_handgunWeapon >> "displayName");
	_handgunPicture = getText(configFile >> "CfgWeapons" >>_handgunWeapon >> "picture");
	
    player removeWeapon _handgunWeapon;
    hint parseText format ["<t size = '1.5' color = '#FF0000'>RESTRICTED ITEM</t><br/><br/><img image='%2' size='5'/><br />Your class is not qualified<br/>to use %1",_handgunName, _handgunPicture];
	
  };
  
  
// UAV Terminal
  
  {
  
	if ((_x in assignedItems player) && !(typeOf player in _classes)) then {
	
		_uavTerminalName = getText(configFile >> "CfgWeapons" >>_x >> "displayName");
		_uavTerminalPicture = getText(configFile >> "CfgWeapons" >>_x >> "picture");
		
		player unassignItem "B_UavTerminal"; 
		player removeItem "B_UavTerminal";
		hint parseText format ["<t size = '1.5' color = '#FF0000'>RESTRICTED ITEM</t><br/><br/><img image='%2' size='5'/><br />Your class is not qualified<br/>to use %1",_uavTerminalName, _uavTerminalPicture];
	
	};
  
  } forEach _items;
  
} forEach allUnits;







