	_noAttachments = param [0, true];
	_getRifles = param [1, true];
	_getHandguns = param [2, true];
	_getLaunchers = param [3, true];
	_getItems = param [4, true];
	_getBackpacks = param [5, true];
	_author = param [6, "Bohemia Interactive"];
	_dlc = param [7];


	// Define All Weapons

		_allWeapons = [];
		_baseWeapons = [];


	// Rifles	
			
		if (_getRifles) then {

			// Get All Rifles
			
				_rifles = ["CFGWeapons", "Rifle"] call BEW_FNC_SortCfgByType;


			// Filter By Author

				
				if !(_author == "") then {
				
					{

						_authorFromConfig = getText (configfile >> "CfgWeapons" >> _x >> "author");
					
						if !(_authorFromConfig == _author) then {

							_rifles = _rifles - [_x];

						};				

					} forEach _rifles;
					
				};
					
				
			// Filter By DLC
			
				if !(_dlc == "") then {
			
					{

						_dlcFromConfig = getText (configfile >> "CfgWeapons" >> _x >> "dlc");
					
						if !(_dlcFromConfig == _dlc) then {

							_rifles = _rifles - [_x];

						};				

					} forEach _rifles;
				
				};


			// Get Base Weapons

				{

					_baseWeapon = getText (configfile >> "CfgWeapons" >> _x >> "baseWeapon");
				
					if !(_baseWeapon == "") then {

						_rifles = _rifles - [_x];
						_rifles = _rifles + [_baseWeapon];

					};				

				} forEach _rifles;


			// Add Base Weapons To All Weapons
				
				
				_allWeapons = _allWeapons + _rifles;
				_allWeapons = _allWeapons arrayIntersect _allWeapons;
				
		};	



	// Handguns

		if (_getHandguns) then {	
	
			// Get All Handguns
			
				_handguns = ["CFGWeapons", "Pistol"] call BEW_FNC_SortCfgByType;
				
			
			// Filter By Author
			
			if !(_author == "") then {
			
				{

					_authorFromConfig = getText (configfile >> "CfgWeapons" >> _x >> "author");
				
					if !(_authorFromConfig == _author) then {

						_handguns = _handguns - [_x];

					};				

				} forEach _handguns;
				
			};


			// Filter By DLC
			
			if !(_dlc == "") then {
			
				{

					_dlcFromConfig = getText (configfile >> "CfgWeapons" >> _x >> "dlc");
				
					if !(_dlcFromConfig == _dlc) then {

						_handguns = _handguns - [_x];

					};				

				} forEach _handguns;
				
			};


			// Get Base Weapons

				{

					_baseWeapon = getText (configfile >> "CfgWeapons" >> _x >> "baseWeapon");
				
					if !(_baseWeapon == "") then {

						_handguns = _handguns - [_baseWeapon];

					};				

				} forEach _handguns;


			// Add Base Weapons To All Weapons
				
				_allWeapons = _allWeapons + _handguns;
				_allWeapons = _allWeapons arrayIntersect _allWeapons;
					
		};	



	// Launchers

		if (_getLaunchers) then {				
				
			// Get All Launchers
			
				_launchers = ["CFGWeapons", "Launcher"] call BEW_FNC_SortCfgByType;


			// Filter By Author
			
			if !(_author == "") then {
			
				{

					_authorFromConfig = getText (configfile >> "CfgWeapons" >> _x >> "author");
				
					if !(_authorFromConfig == _author) then {

						_launchers = _launchers - [_x];

					};				

				} forEach _launchers;
				
			};


			// Filter By DLC
			
			if !(_dlc == "") then {
			
				{

					_dlcFromConfig = getText (configfile >> "CfgWeapons" >> _x >> "dlc");
				
					if !(_dlcFromConfig == _dlc) then {

						_launchers = _launchers - [_x];

					};				

				} forEach _launchers;
				
			};
				

			// Add Launchers To All Weapons
				
				_allWeapons = _allWeapons + _launchers;

		};	
		
	// Items	
			
		if (_getItems) then {

			// Get All Items
			
				_itemTypes = ["ItemCore", "Binocular"];
				_items = [];
				
				{
					
					_newItems = ["CFGWeapons", _x] call BEW_FNC_SortCfgByType;
					_items = _items + _newItems;
					
				} forEach _itemTypes;


			// Filter By Author

			if !(_author == "") then {

				{

					_authorFromConfig = getText (configfile >> "CfgWeapons" >> _x >> "author");
				
					if !(_authorFromConfig == _author) then {

						_items = _items - [_x];

					};				

				} forEach _items;
				
			};
				
				
			// Filter By DLC
			
			if !(_dlc == "") then {
			
				{

					_dlcFromConfig = getText (configfile >> "CfgWeapons" >> _x >> "dlc");
				
					if !(_dlcFromConfig == _dlc) then {

						_items = _items - [_x];

					};				

				} forEach _items;
			
			};
				
				
			// Add Items To All Weapons
				
				
				_allWeapons = _allWeapons + _items;
				_allWeapons = _allWeapons arrayIntersect _allWeapons;
				
		};	
		
	// Backpacks	
			
		if (_getBackpacks) then {

			// Get All Backpacks
			
				_backpacks = ["CFGVehicles", "Bag_Base"] call BEW_FNC_SortCfgByType;	

			// Filter By Author
			
			if !(_author == "") then {

				{

					_authorFromConfig = getText (configfile >> "CFGVehicles" >> _x >> "author");
				
					if !(_authorFromConfig == _author) then {

						_backpacks = _backpacks - [_x];

					};				

				} forEach _backpacks;	
				
			};
				
				
			// Filter By DLC
			
			if !(_dlc == "") then {
			
				{

					_dlcFromConfig = getText (configfile >> "CFGVehicles" >> _x >> "dlc");
				
					if !(_dlcFromConfig == _dlc) then {

						_backpacks = _backpacks - [_x];

					};				

				} forEach _backpacks;
				
			};
				
				
			// Add Items To All Weapons
				
				
				_allWeapons = _allWeapons + _backpacks;
				_allWeapons = _allWeapons arrayIntersect _allWeapons;
				
		};
		
	_allWeapons