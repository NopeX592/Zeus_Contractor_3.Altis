	if (!isServer) exitWith {};

	waitUntil {time > 0};

	private ["_obj", "_pos", "_dir", "_oldType", "_newType", "_loadout", "_allRecruits"];

	_allRecruits = getMissionLayerEntities "Recruits" select 0; 

	{

		_x allowDamage false;
		_x disableAI "MOVE";
		
	} forEach _allRecruits;

	{
		
		[_x, getPosASL _x, getDir _x, typeOf _x, getUnitLoadout _x] spawn {
			
			_obj = param [0];
			_pos = param [1]; 
			_dir = param [2]; 
			_oldType = param [3]; 
			_loadout = param [4];
			_translationLists = param [5];			

			deleteVehicle _obj;
			
			sleep 0.5;			
		
			// Create Officer
								
				_newType = [_oldType] call BEW_FNC_TranslateClassNames;
								
				private _unit = createAgent [_newType, _pos, [], 0, "CAN_COLLIDE"];
						

			// Unit Setup
						
				removeAllWeapons _unit;
				_unit setVariable ["canSpawnRecruits", true, true];
				_unit setDir _dir;
				_unit setVehiclePosition [_pos, [], 0, "CAN_COLLIDE"];
				_unit allowDamage false;
				_unit setUnitRank "PRIVATE";
				_unit disableAI "MOVE";
				_unit disableAI "TARGET";
				_unit disableAI "AUTOTARGET";
				_unit setUnitPos "UP";
				
				sleep 3; 
				
				_unit enableSimulationGlobal false;
				
					private _translationLists = switch (_oldType) do { 
						case  "B_officer_F"   			: {[[BLU_Map_TransList, BLU_New_TransList]]}; 
						case "O_officer_F"    			: {[[BLU_Map_TransList, OPF_New_TransList]]}; 
						case "B_CTRG_Soldier_TL_tna_F" 	: {[[BLU_Map_TransList, BLU_SOF_New_TransList]]}; 
						case "I_officer_F"    			: {[[BLU_Map_TransList, IND_1_New_TransList]]}; 
						case "B_T_Officer_F"    		: {[[BLU_Map_TransList, IND_2_New_TransList]]}; 
						case "I_G_officer_F"    		: {[[BLU_Map_TransList, Rebel_1_New_TransList]]}; 
						case "I_E_Officer_F"   			 : {[[BLU_Map_TransList, Rebel_2_New_TransList]]}; 
						default {all_TransLists}; 
					   };

				[_unit, _translationLists] spawn BEW_FNC_spawnRecruit;
				
		};

	} forEach _allRecruits;