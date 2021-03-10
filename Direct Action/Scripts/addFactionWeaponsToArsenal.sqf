	
	_faction = _this select 0;
		_factionUpper = toUpper _faction;
				
		_weaponList = switch (_factionUpper) do {

			case "BLU": {BLU_WeaponList};
			case "OPF": {OPF_WeaponList};
			case "BLU_SOF": {BLU_SOF_WeaponList};
			case "OPF_SOF": {OPF_SOF_WeaponList};
			case "IND_1": {IND_1_WeaponList};
			case "IND_2": {IND_2_WeaponList};
			case "REBEL": {REBEL_WeaponList};			
			case "POLICE": {[] call BEW_FNC_GendarmerieWeaponList};

		};					

		
		_itemList = switch (_factionUpper) do {

			case "BLU": {BLU_ItemList};
			case "OPF": {OPF_ItemList};
			case "BLU_SOF": {BLU_SOF_ItemList};
			case "OPF_SOF": {OPF_SOF_ItemList};
			case "IND_1": {IND_1_ItemList};
			case "IND_2": {IND_2_ItemList};
			case "REBEL": {REBEL_ItemList};			
			case "POLICE": {[] call POLICE_ItemList};

		};		

		[ArsenalList, _weaponList] call BEW_FNC_addWeaponsByLevel;
		[ArsenalList, _itemList] call BEW_FNC_addItems;
				
					
	
