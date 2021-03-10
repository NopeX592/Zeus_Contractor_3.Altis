
private ["_helipads"];

	_camp = _this select 0;
	
	_sideSetupArray = _this select 1;
		_side = _sideSetupArray select 0;
		_faction = _sideSetupArray select 1;

			_campPos = markerPos _camp;
			_campSize = markerSize _camp;
			
	_helis = [];

	_helipads = nearestObjects [_campPos, ["Land_HelipadSquare_F", "Land_HelipadEmpty_F"], _campSize select 0];

		{

			_pos = getPos _x;
			_dir = getDir _x;
			
			if (random 100 > 50) then {
			
				_types = []; 
				_types = _types + (["T_HELI"] call OPF_VehList); 
				
				_type = _types call BIS_fnc_selectRandom;		
				
				_heli = createVehicle [_type, _pos, [], 0, "NONE"];
				_heli setDir _dir;
				
				// Vehicle Restrictions

					[_heli, [["air", "B_Helipilot_F"], ["tank", "B_crew_F"], ["Wheeled_APC_F", "B_crew_F"]]] spawn BEW_FNC_VehicleRestrictions;
				
				_helis = _helis + [_heli];
				
			};

			_helipads = _helipads - [_x];

		} forEach _helipads;
	
	_helis;
	
