
private ["_classes", "_items", "_itemName", "_ItemPicture"];

while {true} do

{
  sleep 1;
  
  
  _classes = _this select 0;
  _items = _this select 1;


// UAV Terminal
  
  {
  
	if ((_x in assignedItems player) && !(typeOf player in _classes)) then {
	
		_itemName = getText(configFile >> "CfgWeapons" >>_x >> "displayName");
		_ItemPicture = getText(configFile >> "CfgWeapons" >>_x >> "picture");
		
		player unassignItem _x; 
		player removeItem _x;
		hint parseText format ["<t size = '1.5' color = '#FF0000'>RESTRICTED ITEM</t><br/><br/><img image='%2' size='5'/><br />Your class is not qualified<br/>to use %1",_itemName, _ItemPicture];
	
	};
  
  } forEach _items;
  
} forEach allUnits;







