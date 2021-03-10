	private ["_obj", "_parachutetype"];

	_obj = _this select 0;

		call compile format ["

			_obj setVariable['%1_Saved_Loadout',getUnitLoadout _obj];
			removeBackpack _obj;
						
			_parachutetype = 'B_Parachute';
						
			_obj addBackpack _parachutetype;
			
			_obj allowDamage false;
			
				sleep 6;

			_obj allowDamage true;

			waitUntil {(isTouchingGround _obj) and (vehicle _obj == _obj)};
			
			sleep 3;

			_obj setUnitLoadout(_obj getVariable['%1_Saved_Loadout',[]]);


		", _obj];
		
