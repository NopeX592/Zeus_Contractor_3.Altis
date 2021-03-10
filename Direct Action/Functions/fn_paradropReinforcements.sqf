
	if (!isServer) exitWith {};
	
		private [
			
			"_veh",
			"_vehGroup",
			"_displayName",
			"_centerPos",
			"_dropPos",
			"_endPos",
			"_origType",
			"_newType",
			"_origPilotType",
			"_newPilotType",
			"_squadType",
			"_translationList",
			"_side"
		
		];
		
		_centerPos = _this select 0;
		_spawnPos = _this select 1;
			_spawnDir = random 360;
		_dropPos = _this select 2;
		_side =_this select 3;
		_endPos = _spawnPos;
	
		// Create _veh
			
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

			_veh allowDamage FALSE;
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


		// Paradrop Started Flag

			call compile format ["
			
				%1_paraDropMissionActive = true;
				publicVariable ""%1_paraDropMissionActive"";
				
			", _veh];
			

		// Create Waypoint
								
			_dropZoneWP = _vehGroup addWaypoint [_centerPos, -1];

			_dropZoneWP setWaypointType "SCRIPTED";
			_dropZoneWP setWaypointScript "BEWparadrop\ParadropReinforcementsWaypointCompleted.sqf";
			_dropZoneWP setWaypointCompletionRadius 300;

		
		// Set Altitude 
		
			_veh flyInHeight 200;

		
		// Create marker
			
			_markerName = format ["%1_Dropzone", _veh];
			_marker = createMarker [_markerName, _dropPos]; 
			_marker setMarkerShape "ICON";
			_marker setMarkerType "hd_objective";						
			_marker setMarkerColor "ColorGREEN";
			_marker setMarkeralpha 0;
			
			_markerText = format ["%1 Drop Zone", _displayName];
			
			_marker setMarkerText _markerText;
			
			
		// Setup Vehicle
		
			{_x enableSimulation TRUE} forEach units _vehGroup;
			{_x setCaptive FALSE} forEach units _vehGroup;
			
			_veh animatedoor ["door_1_source", 0];

		
		// Create Moving Marker

			if (_side == WEST) then {

				[_veh , _displayName, "colorGreen", "b_plane"] execVM "scripts\MovingMarker.sqf";
				
			};
			
		// Create Paradrop Squad
		
			_infGroup = [getPos _veh, _squadType] call BEW_FNC_SpawnGroup; 

			{

				_x moveInCargo _veh;

			} forEach units _infGroup;
	
			_return = [_veh, _vehGroup, _infGroup, _marker];

			_return