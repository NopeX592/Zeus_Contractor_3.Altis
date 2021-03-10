if (!isServer) exitWith {};

waitUntil {time > 0};

private ["_obj"];


// Define Arsenal Objects

	// Arsenal Crates
	
		_arsenalCrateObjs = getMissionLayerEntities "Arsenal" select 0; 
		
	// Arsenal Men
		_arsenalManObjs = getMissionLayerEntities "ArsenalMan" select 0; 
	
	
	// Define The Arsenal List
	
		arsenalList = _arsenalCrateObjs + _arsenalManObjs;
			publicVariable "arsenallist";									// Broadcast To Clients

	{

		_obj = _x;

		// Set Dynamic Arsenal Name

			_varName = [_obj, "Arsenal_"] call bis_fnc_objectvar;
			_obj setvehiclevarname _varName;
		
		
		// Call Arsenal Init On Object On All Clients
		
			[_obj, {
		
				_obj = _this;
				
				["AmmoboxInit",[_obj,false,{true}]] spawn BIS_fnc_arsenal;
			
			}] remoteexec ["bis_fnc_call", 0, true];

		
		// Create Arsenal Marker

			call compile format ["
			
				%1_Arsenal_Marker = createMarker [""%1_Arsenal_Marker"", getPos %1];
				%1_Arsenal_Marker setMarkerType ""b_service"";
				%1_Arsenal_Marker setMarkerSize [0.5, 0.5];
				%1_Arsenal_Marker setMarkerColor ""colorPink"";
				%1_Arsenal_Marker setMarkerAlpha 0;
				
				_trg = createTrigger [""EmptyDetector"", getPos %1];
				_trg setTriggerArea [100, 100, 100, false, 2];
				_trg setTriggerActivation [""WEST"", ""PRESENT"", false];
				_trg setTriggerStatements [""(this) && (vehicle player in thisList)"", ""%1_Arsenal_Marker setMarkerAlpha 1;"", """"];

			", _obj];

	} forEach _arsenalCrateObjs;


	// Make Man Marker Invisible

		{

			_obj = _x;

			call compile format ["
			
				%1_Arsenal_Marker setMarkerAlpha 0;
				
			", _obj];

		} forEach _arsenalManObjs;


	// Call Populate Scripts On All Clients


		[ArsenalList, BLU_WeaponList] remoteExec ["BEW_FNC_addWeaponsByLevel", 0, true];	
		[ArsenalList, BLU_ItemList] remoteExec ["BEW_FNC_addItems", 0, true];
		[] remoteExec ["BEW_FNC_arsenalOnOpen", 0, true];

