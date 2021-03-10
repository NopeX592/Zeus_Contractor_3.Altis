	_veh = param [0];
	_allTurrets = allTurrets _veh;
	clearMagazineCargoGlobal _veh;

	_magazinesToAdd = [

		["UK3CB_BAF_Bulldog_L111A1", ["UK3CB_BAF_127_100Rnd"], 5],
		["UK3CB_BAF_Bulldog_L7A2", ["UK3CB_BAF_762_200Rnd_T"], 5],
		["UK3CB_BAF_Coyote_Jackal_L111A1", ["UK3CB_BAF_127_100Rnd"], 5],
		["UK3CB_BAF_Coyote_Jackal_L134A1", ["UK3CB_BAF_32Rnd_40mm_G_Box"], 5],
		["UK3CB_BAF_Coyote_Jackal_L7A2_1", ["UK3CB_BAF_762_200Rnd_T"], 5],
		["UK3CB_BAF_Husky_L111A1", ["UK3CB_BAF_127_100Rnd"], 5],
		["UK3CB_BAF_Husky_L134A1", ["UK3CB_BAF_32Rnd_40mm_G_Box"], 5],
		["UK3CB_BAF_Husky_L7A2", ["UK3CB_BAF_762_200Rnd_T"], 5],
		["UK3CB_BAF_Landrover_L111A1", ["UK3CB_BAF_127_100Rnd"], 5],
		["UK3CB_BAF_Landrover_L134A1", ["UK3CB_BAF_32Rnd_40mm_G_Box"], 5],
		["UK3CB_BAF_Landrover_L7A2_1", ["UK3CB_BAF_762_200Rnd_T"], 5],
		["UK3CB_BAF_Landrover_L7A2_2", ["UK3CB_BAF_762_200Rnd_T"], 5],
		["UK3CB_BAF_Panther_L7A2_1", ["UK3CB_BAF_762_200Rnd_T"], 5],
		["UK3CB_BAF_L21A1_Rarden", ["UK3CB_BAF_6Rnd_30mm_L21A1_APDS", "UK3CB_BAF_6Rnd_30mm_L21A1_HE"], 20],
		["UK3CB_BAF_L21A1_Rarden_Laser", ["UK3CB_BAF_6Rnd_30mm_L21A1_APDS", "UK3CB_BAF_6Rnd_30mm_L21A1_HE"], 20],
		["UK3CB_BAF_L94A1_veh", ["UK3CB_BAF_762_800Rnd_T"], 2],
		["UK3CB_BAF_L94A1_veh_laser", ["UK3CB_BAF_762_800Rnd_T"], 2],
		["UK3CB_BAF_RHIB_L7A2", ["UK3CB_BAF_762_200Rnd_T"], 5],
		["UK3CB_BAF_RHIB_L111A1", ["UK3CB_BAF_127_100Rnd"], 5],
		["UK3CB_BAF_Milan_Launcher", ["UK3CB_BAF_1Rnd_Milan"], 5]

	];
		
		{
		
			_turretPosition = _x;
			_turretWeapons = _veh weaponsTurret _turretPosition;
			
			if ("UK3CB_BAF_Safe" in _turretWeapons) then {
			
				_turretWeapons = _turretWeapons - ["UK3CB_BAF_Safe"];
			
			};
			
			_turretMagazines = _veh magazinesTurret _turretPosition;
			
			for "_i" from 0 to (count _turretWeapons - 1) do {
			
				_turretWeapon = _turretWeapons select _i;
				_turretMagazine = _turretMagazines select _i;
				
				{
				
					_weaponType = _x select 0;
					_magazineTypes = _x select 1;
					_magazineCapacity = _x select 2;
					
					if (_weaponType == _turretWeapon) then {	
					
						{
							_veh removeMagazinesTurret [_x, _turretPosition];
							_veh addItemCargoGlobal [_x, _magazineCapacity];
						
							for "_i" from 1 to (_magazineCapacity) do {
							
								_veh addMagazineTurret [_x, _turretPosition];
							
							};
						
						} forEach _magazineTypes;

						
					};
				
				} forEach _magazinesToAdd;
			
			};
			
		
		} forEach _allTurrets;
