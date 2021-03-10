private ["_arsenalList", "_weaponList"];
	
		_arsenalList = param [0, arsenalList];
		_weaponList = param [1, BLU_WeaponList];
	
	
	// Add Weapons And Magazines By Level
	
		if (isNil "arsenalWeapons") then {arsenalWeapons = []};
		if (isNil "arsenalAllMagazines") then {arsenalAllMagazines = []};
		
	
	for "_i" from 0 to ((count _weaponList) - 1) do {

		waitUntil {missionLevel > (_i)};

		_newWeapons = _weaponList select _i;
		{arsenalWeapons pushBackUnique _x} forEach _newWeapons;
		
		arsenalWeapons = [arsenalWeapons] call BEW_FNC_FilterArsenalByRole;
		
				for "_j" from 0 to (count _arsenalList - 1) do {
				
					_obj = _arsenalList select _j;
					
					[_obj, arsenalWeapons] call BIS_fnc_addVirtualWeaponCargo;

				 };

			{

				_magazines = getArray (configFile / "CfgWeapons" / _x / "magazines");

				{arsenalAllMagazines pushBackUnique _x} forEach _magazines;

			} forEach arsenalWeapons;
			
			
			
			for "_j" from 0 to (count _arsenalList - 1) do {
				
					_obj = _arsenalList select _j;
					
					[_obj, arsenalAllMagazines] call BIS_fnc_addVirtualMagazineCargo;

			};	
		
	};

