

_camp = _this select 0;
_side = _this select 1;

_targetBuildings = [];
_vehs = [];

	_verySmallVehs = switch (_side) do {
	
		case west: {["B_Quadbike_01_F"]};
		case east: {["O_Quadbike_01_F"]};
		case resistance: {["I_E_Quadbike_01_F"]};
		case civilian: {[
		
			"C_Hatchback_01_F",
			"C_Hatchback_01_sport_F",
			"C_Kart_01_F",
			"C_Quadbike_01_F",
			"C_Offroad_02_unarmed_F"
		
		]};
		
	};
	
	_smallVehs = switch (_side) do {
	
		case west: {[
		
			"B_LSV_01_armed_F",
			"B_LSV_01_AT_F",
			"B_LSV_01_unarmed_F",
			"C_Offroad_01_comms_F",
			"C_Offroad_01_covered_F"

		]};
		
		case east: {[
		
			"O_LSV_02_AT_F",
			"O_LSV_02_armed_F",
			"O_LSV_02_unarmed_F",
			"C_Offroad_01_comms_F",
			"C_Offroad_01_covered_F"

		]};
		
		case resistance: {[
		
			"I_G_Offroad_01_AT_F",
			"I_G_Offroad_01_armed_F",
			"I_G_Offroad_01_repair_F",
			"I_G_Offroad_01_F"
				
		]};
		
		case civilian: {[
		
			"C_Offroad_01_F",
			"C_SUV_01_F"
		
		]};
		
	};
	
	
	_medVehs = switch (_side) do {
	
		case west: {[
		
			"B_MRAP_01_hmg_F",
			"B_MRAP_01_gmg_F",
			"B_MRAP_01_F"

		]};
		
		case east: {[
		
			"O_MRAP_02_F",
			"O_MRAP_02_gmg_F",
			"O_MRAP_02_hmg_F",
			"O_APC_Wheeled_02_rcws_v2_F"

		]};

		case resistance: {[
		
			"I_LT_01_AT_F",
			"I_LT_01_scout_F",
			"I_LT_01_cannon_F",
			"I_MRAP_03_F",
			"I_MRAP_03_gmg_F",
			"I_MRAP_03_hmg_F",
			"I_LT_01_AA_F"
		
		]};
		
		case civilian: {[
		
			"C_Van_01_fuel_F",
			"C_Tractor_01_F",
			"C_Van_01_transport_F"
		
		]};
		
	};
	
	
	_largeVehicles = switch (_side) do {
	
		case west: {[	
		
			"B_Truck_01_covered_F",
			"B_Truck_01_transport_F",
			"B_Truck_01_Repair_F",
			"B_Truck_01_medical_F",
			"B_Truck_01_fuel_F",
			"B_Truck_01_ammo_F",
			"B_APC_Wheeled_01_cannon_F",
			"B_AFV_Wheeled_01_up_cannon_F"
	
		]};
		
		case east: {[
		
			"O_Truck_03_ammo_F",
			"O_Truck_03_fuel_F",
			"O_Truck_03_medical_F",
			"O_Truck_03_repair_F",
			"O_Truck_03_transport_F",
			"O_Truck_03_covered_F"
		
		]};
		
		case resistance: {[
		
			"I_APC_Wheeled_03_cannon_F",
			"I_Truck_02_ammo_F",
			"I_Truck_02_fuel_F",
			"I_Truck_02_medical_F",
			"I_Truck_02_box_F",
			"I_Truck_02_transport_F",
			"I_Truck_02_covered_F"
		
		]};
		
		case civilian: {[
		
			"C_Van_02_transport_F",
			"C_Truck_02_fuel_F",
			"C_Truck_02_box_F",
			"C_Truck_02_transport_F",
			"C_Truck_02_covered_F"

		]};
		
	};
	
	
	_tanks = switch (_side) do {
	
		case west: {[	
		
			"B_APC_Tracked_01_rcws_F",
			"B_APC_Tracked_01_CRV_F",
			"B_MBT_01_arty_F",
			"B_MBT_01_mlrs_F",
			"B_APC_Tracked_01_AA_F",
			"B_MBT_01_TUSK_F"
	
		]};
		
		case east: {[
		
			"O_MBT_02_cannon_F",
			"O_MBT_04_command_F",
			"O_APC_Tracked_02_cannon_F",
			"O_MBT_02_arty_F",
			"O_APC_Tracked_02_AA_F"
		
		]};
		
		case resistance: {[
		
			"I_MBT_03_cannon_F",
			"I_APC_tracked_03_cannon_F"
		
		]};
		
		case civilian: {[]};
		
	};


		_campPos = markerPos _camp;
		_campSize = markerSize _camp;

		_buildingTypes = [
		
			"Land_Shed_Small_F", 
			"Land_Shed_Big_F", 
			"Land_i_Shed_Ind_old_F", 
			"Land_GarageRow_01_small_F", 
			"Land_GarageRow_01_large_F", 
			"Land_Barracks_06_F", 
			"Land_Workshop_01_F", 
			"Land_Workshop_01_grey_F",
			"Land_IndustrialShed_01_F",
			"Land_Barn_03_small_F",
			"Land_Barn_03_large_F",
			"Land_Shed_14_F"
		
		];

		_buildings = nearestObjects [_campPos, [], _campSize select 0];
		
		if (count _buildings > 0) then {

			{_targetBuildings = _targetBuildings + [_x];} forEach _buildings;
		
		};
		

	
	
	
	{
	
		_positions = [_x] call BEW_FNC_DefineGarages;
		
				_vehList = switch (typeOf _x) do {
				
					case "Land_Shed_Small_F": {_verySmallVehs + _smallVehs + _medVehs};
					case "Land_Shed_Big_F": {_largeVehicles + _tanks};
					case "Land_GarageRow_01_small_F": {_verySmallVehs + _smallVehs};
					case "Land_i_Shed_Ind_old_F": {_verySmallVehs + _smallVehs};
					case "Land_GarageRow_01_large_F": {_smallVehs + _medVehs};
					case "Land_Barracks_06_F": {_verySmallVehs};
					case "Land_Workshop_01_F": {_verySmallVehs};
					case "Land_IndustrialShed_01_F": {_largeVehicles + _medVehs};
					case "Land_Barn_03_small_F": {_medVehs};
					case "Land_Barn_03_large_F": {_largeVehicles + _medVehs};
					case "Land_Shed_14_F": {_verySmallVehs};
					case "Land_Workshop_01_grey_F": {_verySmallVehs};
					
				};

		{
		
			if (66 > random 100) then {
			
				
		
				_randomVeh = _vehList call BIS_fnc_selectRandom;
			
				_position = _x select 0;
				_dir = _x select 1;

				_veh = createVehicle [_randomVeh, _position, [], 0, "CAN_COLLIDE"];
				_veh allowDamage false;
				_veh setDir _dir;
				
				_veh addEventHandler ["GetIn", {
					
					params ["_vehicle", "_role", "_unit", "_turret"];

					_vehicle allowDamage true;
					 
				}];
				
				_vehs = _vehs + [_veh];
			
			};

		} forEach _positions;

	
	} forEach _targetBuildings;

	_vehs;

