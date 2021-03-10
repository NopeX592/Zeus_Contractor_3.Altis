
		_arsenalList = param [0, arsenalList];
		_itemList = param [1, BLU_ItemList];


	// Setup Initial Arsenal Lists

		if (isNil "firstArsenal") then {
			
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
		
		}else{
		
			{
			
				_x = [_x] call BEW_FNC_FilterItemsByRole;
			
			} forEach _itemList;
			
			{arsenalHeadgear pushBackUnique _x} forEach (_itemList select 0);
			{arsenalGoggles pushBackUnique _x} forEach (_itemList select 1);
			{arsenalUniforms pushBackUnique _x} forEach (_itemList select 2);
			{arsenalVests pushBackUnique _x} forEach (_itemList select 3);
			{arsenalBackpacks pushBackUnique _x} forEach (_itemList select 4);
			{arsenalNvgoggles pushBackUnique _x} forEach (_itemList select 5);
			{arsenalPrimaryAttachments pushBackUnique _x} forEach (_itemList select 6);
			{arsenalSecondaryAttachments pushBackUnique _x} forEach (_itemList select 7);
			{arsenalExplosives pushBackUnique _x} forEach (_itemList select 8);
			{arsenalItems pushBackUnique _x} forEach (_itemList select 9);
		
		};


	// Add Items To Arsenal
	
		for "_i" from 0 to (count _arsenalList - 1) do {	
		
				_obj = _arsenalList select _i;
				
				[_obj,(arsenalBackpacks)] call BIS_fnc_addVirtualBackpackCargo;
				[_obj,(arsenalHeadgear + arsenalGoggles + arsenalUniforms + arsenalVests + arsenalnvgoggles + arsenalprimaryAttachments + arsenalsecondaryattachments + arsenalItems)] call BIS_fnc_addVirtualItemCargo;
				[_obj, arsenalExplosives] call BIS_fnc_addVirtualMagazineCargo;

		};	