
	// Wait Until Restriction Lists Defined

		if (isnil "BLU_WeaponRestrictionList") then {waitUntil {!(isnil "BLU_WeaponRestrictionList")}};
		if (isnil "BLU_ItemRestrictionList") then {waitUntil {!(isnil "BLU_ItemRestrictionList")}};


	// Get Weapon Restriction List

		_weaponRestrictionClassnames = BLU_WeaponRestrictionList select 0;
		_weaponRestrictedLists = BLU_WeaponRestrictionList select 1;
		
		
	// Get Item Restriction List

		_itemRestrictionClassnames = BLU_ItemRestrictionList select 0;
		_itemRestrictedLists = BLU_ItemRestrictionList select 1;


	// Weapon Restrictions

		for "_i" from 0 to (count _weaponRestrictionClassnames - 1) do {

			
			_classes = [_weaponRestrictionClassnames select _i];
			_gear = _weaponRestrictedLists select _i;

			_nil = [_classes, _gear] spawn BEW_FNC_weaponRestriction;

		};
		
		
	// Item Restrictions

		for "_i" from 0 to (count _itemRestrictionClassnames - 1) do {

			
			_classes = [_itemRestrictionClassnames select _i];
			_gear = _itemRestrictedLists select _i;

			_nil = [_classes, _gear] spawn BEW_FNC_itemRestriction;

		};