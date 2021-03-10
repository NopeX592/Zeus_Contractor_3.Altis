waitUntil {time > 0};
	
	_obj = _this select 0;

// Spawn The Arsenal

	["AmmoboxInit",[_obj,false,{true}]] spawn BIS_fnc_arsenal;


// Setup Initial Arsenal Lists

	if (isNil "firstArsenal") then {
	
		_itemList = BLU_ItemList;
		
		{
		
			_x = [_x] call BEW_FNC_FilterItemsByRole;
		
		} forEach _itemList;
		
		arsenalHeadgear = _itemList select 0;
		arsenalGoggles = _itemList select 1;
		arsenalUniforms = _itemList select 2;
		arsenalVests = _itemList select 3;
		arsenalBackpacks = _itemList select 4;
		arsenalNvgoggles = _itemList select 5;
		arsenalPrimaryAttachments = _itemList select 6;
		arsenalSecondaryAttachments = _itemList select 7;
		arsenalExplosives = _itemList select 8;
		arsenalItems = _itemList select 9;
	
		firstArsenal = true
	
	};

// Add Items To Arsenal

	[_obj,(arsenalBackpacks)] call BIS_fnc_addVirtualBackpackCargo;
	[_obj,(arsenalHeadgear + arsenalGoggles + arsenalUniforms + arsenalVests + arsenalnvgoggles + arsenalprimaryAttachments + arsenalsecondaryattachments + arsenalItems)] call BIS_fnc_addVirtualItemCargo;
	[_obj, arsenalExplosives] call BIS_fnc_addVirtualMagazineCargo;

	
