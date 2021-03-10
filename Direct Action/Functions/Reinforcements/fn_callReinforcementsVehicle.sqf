	private [
	
		"_veh",
		"_spawnPos",
		"_spawnDir",
		"_side",
		"_origType",
		"_origPilotType",
		"_squadType",
		"_translationList",
		"_newType",
		"_newPilotType"
	
	];
	
	
	_spawnPos 	= param [0];
	_spawnDir 	= param [1];
	_side		= param [2];
	
	
	// Create Vehicle
			
		// Define Vehicle And Pilot Type
			
			if (_side == WEST) then {
			
				_origType	= "B_T_VTOL_01_infantry_F";
				_origPilotType = "B_Helipilot_F";
				_squadType = BLU_infantryArray;
				_translationList = BLU_New_TransList;
			
			}else{
			
				_origType	= "O_T_VTOL_02_infantry_dynamicLoadout_F";
				_origPilotType = "O_helipilot_F";
				_squadType = OPF_infantryArray;
				_translationList = OPF_New_TransList;
			
			};
			
			_newType = [_origType] call BEW_FNC_TranslateClassNames;
			_newPilotType = [_origPilotType] call BEW_FNC_TranslateClassNames;
			
			_veh = createVehicle [_newType, _spawnPos, [], 0, "FLY"];
			_veh setDir _spawnDir;
			_veh setVelocityModelSpace [0, 100, 0];


		// Vehicle Setup

			_veh allowDamage true;
			_veh lockTurret [[1],true]; 
			_veh lockTurret [[2],true];
			clearItemCargo _veh;
			clearWeaponCargo _veh;
			clearMagazineCargo _veh;
			_veh setVehicleAmmo 0;
			[_veh] call BEW_FNC_ApplyCustomTexture;
		
		
		// VarName

			_varName = [_veh, "ParadropVeh_"] call bis_fnc_objectvar;
			_veh setvehiclevarname _varName;
			_displayName = [configFile >> "CfgVehicles" >> typeOf _veh] call BIS_fnc_displayName;
		
		
		// Create Crew

			_vehGroup = [_spawnPos, _side, [_newPilotType, _newPilotType],[],[],[],[],[],180] call BIS_fnc_spawnGroup;		
			[_vehGroup, [_displayName]] remoteExec ["setGroupId", 0, true];
		
			
		// Crew Setup

			_crew = units _vehGroup;
			(_crew select 0) moveInDriver _veh;
			(_crew select 1) moveInTurret [_veh, [0]];
			_vehGroup setVariable ["Vcm_Disable",true];
				
			{
				_x allowFleeing 0;
				_x disableAI "AUTOTARGET";
				_x enableSimulation FALSE;
				_x setBehaviour "CARELESS";
				_x disableAI "FSM";
				_x disableAI "SUPPRESSION";
				_x disableAI "COVER";
				_x disableAI "AUTOCOMBAT";
				_x disableAI "AUTOCOMBAT";
				_x disableAI "CHECKVISIBLE";

			}forEach _crew;
			
			
		// Set Altitude 
		
			_veh flyInHeight 200;
			
		
		// Create Moving Marker

			if (_side == WEST) then {

				[_veh , _displayName, "colorGreen", "b_plane"] execVM "scripts\MovingMarker.sqf";
				
			};


		// Spawn Inf Group

			_numUnitsToSpawn = 10 - ([] call BEW_FNC_CountAllGroupsWithPlayers);
			_unitTypesToSpawn = [];
			
			
			_allTypes = [
				
				"B_soldier_M_F",
				"B_Soldier_GL_F",
				"B_soldier_AR_F",
				"B_medic_F",
				"B_engineer_F",
				"B_soldier_AT_F",
				"B_soldier_AA_F",
				"B_recon_JTAC_F",
				"B_soldier_UAV_F"
			
			];
			
			
			for "_i" from 1 to _numUnitsToSpawn do {
			
				_type = _allTypes call BIS_FNC_SelectRandom;
				_type = [_type] call BEW_FNC_TranslateClassNames;	

				_unitTypesToSpawn = _unitTypesToSpawn + [_type];
			
			};


			_infGroup = [getPos _veh, WEST, _unitTypesToSpawn,[],[],[],[],[],180] call BIS_fnc_spawnGroup;
		
		
		// Move Inf Group In Cargo

			{

				_x moveInCargo _veh;

			} forEach units _infGroup;
	
	
			_return = [_veh, _vehGroup, _infGroup];

			_return
