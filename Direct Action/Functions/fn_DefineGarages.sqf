

	private ["_buildings", "_building", "_type", "_buildingPos", "_positions", "_dir", "_returnArray"];

	_building = _this select 0;

		_type = typeOf _building;
		
		_buildingPos = getPos _building;

		_positions = [];


		if ((_type == "Land_IndustrialShed_01_F")) then {
		
			_building allowDamage false;
			
			_building animate ["door_1_rot", 1];
			_building animate ["door_2_rot", 1];
			_building animate ["door_3_rot", 1];
			_building animate ["door_4_rot", 1];
			
			_offsetPos = _building Modeltoworld [2.7, -5, -5];	
			_dir = getDir _building - 180;
				
				_positions = _positions + [[_offsetPos, _dir]];
				
				
			_building animate ["door_1_rot", 1];
			_building animate ["door_2_rot", 1];
			_building animate ["door_3_rot", 1];
			_building animate ["door_4_rot", 1];
			
			_offsetPos = _building Modeltoworld [-1.6, 5, -5];	
			_dir = getDir _building;
				
				_positions = _positions + [[_offsetPos, _dir]];	
			
				
		};
		
		
		if ((_type == "Land_Barn_03_small_F")) then {
		
			_building allowDamage false;
			
			_offsetPos = _building Modeltoworld [-2, 0, 0];	
			_dir = getDir _building;
				
				_positions = _positions + [[_offsetPos, _dir]];
				
		};
		
		
		if ((_type == "Land_Barn_03_large_F")) then {
		
			_building allowDamage false;
			
			_building animate ["Door_1_rot", 1];
			_building animate ["Door_2_rot", 1];
			
			_offsetPos = _building Modeltoworld [0, -10, 0];	
			_dir = getDir _building - 180;
				
				_positions = _positions + [[_offsetPos, _dir]];
				
				
			_building animate ["Door_1_rot", 1];
			_building animate ["Door_2_rot", 1];
			
			_offsetPos = _building Modeltoworld [0, 11, 0];	
			_dir = getDir _building;
				
				_positions = _positions + [[_offsetPos, _dir]];
				
		};


		if ((_type == "Land_Shed_14_F")) then {
		
			_building allowDamage false;
			
			_building animate ["door_1_rot", 1];
			_building animate ["door_2_rot", 1];
			
			_offsetPos = _building Modeltoworld [-0.05, 2, 0];	
			_dir = getDir _building - 180;
				
				_positions = _positions + [[_offsetPos, _dir]];
				
		};

		
		
		if ((_type == "Land_Workshop_01_F") or (_type == "Land_Workshop_01_grey_F")) then {
		
			_building allowDamage false;
			
			_building animate ["door_1_rot", 1];
			_building animate ["door_2_rot", 1];
			
			_offsetPos = _building Modeltoworld [3.4, -2.5, 0];	
			_dir = getDir _building;
				
				_positions = _positions + [[_offsetPos, _dir]];
				
		};

		
		if ((_type == "Land_i_Shed_Ind_F") or (_type == "Land_i_Shed_Ind_old_F")) then {
		
			_building allowDamage false;
			
			_building animate ["door_1_rot", 1];
			_building animate ["door_2_rot", 1];
			_building animate ["door_5_rot", 1];
			_building animate ["door_6_rot", 1];
			
			_offsetPos = _building Modeltoworld [-2, 6, 0];	
			_dir = getDir _building - 90;
				
				_positions = _positions + [[_offsetPos, _dir]];
					
			_offsetPos = _building Modeltoworld [13.65, 2, 0];	
			_dir = getDir _building - 180;
			
				_positions = _positions + [[_offsetPos, _dir]];

				
		};

		
		if ((_type == "Land_GarageRow_01_large_F")) then {
		
			_building allowDamage false;
			
			_building animate ["door_3_rot", 1];
			_building animate ["door_4_rot", 1];
			_building animate ["door_5_rot", 1];
			_building animate ["door_6_rot", 1];
			_building animate ["door_7_rot", 1];
			_building animate ["door_8_rot", 1];
			_building animate ["door_9_rot", 1];
			_building animate ["door_10_rot", 1];

			_offsetPos = _building Modeltoworld [-9, -0.5, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building -180;
			
			_empty = _offsetPos isFlatEmpty [0.1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};
				
			_offsetPos = _building Modeltoworld [-2.9, -0.5, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building -180;
					
			_empty = _offsetPos isFlatEmpty [0.1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};
				
			_offsetPos = _building Modeltoworld [2.9, -0.5, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building -180;
				
			_empty = _offsetPos isFlatEmpty [0.1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};
							
			_offsetPos = _building Modeltoworld [9, -0.5, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building -180;
				
			_empty = _offsetPos isFlatEmpty [0.1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};

		};	
		

		if ((_type == "Land_Barracks_06_F")) then {
		
			_building allowDamage false;
			
			_offsetPos = _building Modeltoworld [14, 2, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building + 90;
			
				_positions = _positions + [[_offsetPos, _dir]];

		};
		
		
		if ((_type == "Land_GarageRow_01_small_F")) then {
		
			_building allowDamage false;
			
			_building animate ["door_1_rot", 1];
			_building animate ["door_2_rot", 1];
			_building animate ["door_3_rot", 1];
			_building animate ["door_4_rot", 1];
			_building animate ["door_5_rot", 1];
			_building animate ["door_6_rot", 1];

			_offsetPos = _building Modeltoworld [-5.1, -1, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building;
			
			_empty = _offsetPos isFlatEmpty [0.1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};
				
			_offsetPos = _building Modeltoworld [0, -1, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building;
					
			_empty = _offsetPos isFlatEmpty [0.1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};
				
			_offsetPos = _building Modeltoworld [4.8, -1, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building;
				
			_empty = _offsetPos isFlatEmpty [0.1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};

		};
		
		
		if ((_type == "Land_Shed_Big_F") or (_type == "Land_SM_01_shelter_wide_F")) then {

			_building allowDamage false;
			
			_offsetPos = _building Modeltoworld [-2, -8, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building - 90;
			
			_empty = _offsetPos isFlatEmpty [0.1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};
				
			_offsetPos = _building Modeltoworld [-2, 0, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building - 90;
					
			_empty = _offsetPos isFlatEmpty [0.1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};
				
			_offsetPos = _building Modeltoworld [-2, 8, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building - 90;
				
			_empty = _offsetPos isFlatEmpty [0.1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};

		};
		
		
		
		if ((_type == "Land_Shed_Small_F") or (_type == "Land_SM_01_shelter_narrow_F")) then {

			_building allowDamage false;

			_offsetPos = _building Modeltoworld [2, -8, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building + 90;
			
			_empty = _offsetPos isFlatEmpty [1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};
				
			_offsetPos = _building Modeltoworld [2, 0, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building + 90;
					
			_empty = _offsetPos isFlatEmpty [1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};
				
			_offsetPos = _building Modeltoworld [2, 8, 0];
			_offsetPos = [_offsetPos select 0, _offsetPos select 1, _buildingPos select 2];
			_dir = getDir _building + 90;
				
			_empty = _offsetPos isFlatEmpty [1, -1, -1, 1, -1, false, nearestObject [_offsetPos, _type]];
			
				if (count _empty > 1) then {_positions = _positions + [[_offsetPos, _dir]];};

		};
		
	_positions;
