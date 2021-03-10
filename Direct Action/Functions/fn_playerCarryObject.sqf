// Carry Object

	BEW_v_CarryObjectConditions = "
	
		(cursorObject distance player < 3) and (cursorObject getVariable 'BEW_v_canCarry') and ((count attachedObjects player) < 1) and (vehicle player == player) and (getMass cursorObject <= 1500) and !(cursorObject isKindOf 'Man')
	
	";
	
	
	
	player addaction
				
		["<t color='#ffffff'>PICK UP OBJECT", 	
		
		{
			
			player action ["SWITCHWEAPON",player,player,-1];
			
			waitUntil {currentWeapon player == ""};
			
			_cursorObject = cursorObject;
			_cursorObject attachTo [player, [0,1,0], "pelvis"];
			
			{

				_x setDamage 0;

			} forEach attachedObjects player;
			
			player forceWalk true;
			
			waitUntil {(count attachedObjects player < 1) or !(currentWeapon player == "") or (!alive player) or (lifeState player == "INCAPACITATED") or !(vehicle player == player)};
			
			{

				detach _x;

			} forEach attachedObjects player;
			
			player forceWalk false;
			
		}
		
		, [], 99, true, true, "", BEW_v_CarryObjectConditions];
	


	player addaction
				
		["<t color='#ffffff'>DROP OBJECT", 	
		
		{
			
			{

				detach _x;

			} forEach attachedObjects player;
			
			player forceWalk false;
			
		}
		
		, [], 99, true, true, "", "((count attachedObjects player) > 0) and !((typeOf (attachedObjects player select 0)) == 'land_can_v2_f')"];



// Load Carried Object

	player addaction
				
		["<t color='#ffffff'>LOAD OBJECT IN VEHICLE", 	
		
		{
			
			cursorObject setVehicleCargo (attachedObjects player select 0);
			
		}
		
		, [], 99, true, true, "", "(cursorObject distance player < 10) and ((count attachedObjects player) > 0) and !((typeOf (attachedObjects player select 0)) == 'land_can_v2_f') and (vehicle player == player) and ((cursorObject canVehicleCargo (attachedObjects player select 0)) select 0) and ((cursorObject canVehicleCargo (attachedObjects player select 0)) select 1) and !(cursorObject isKindOf 'Man')"];
		
		
	// Can't Load Carried Object Not Enough Room	

		player addaction
					
			["<t color='#ffffff'>CAN'T LOAD OBJECT: NOT ENOUGH SPACE", 	
			
			{
				
				hintC "CAN'T LOAD OBJECT: NOT ENOUGH SPACE";
				
			}
			
			, [], 99, true, true, "", "(cursorObject distance player < 10) and ((count attachedObjects player) > 0) and (vehicle player == player) and !((cursorObject canVehicleCargo (attachedObjects player select 0)) select 0) and ((cursorObject canVehicleCargo (attachedObjects player select 0)) select 1) and !(cursorObject isKindOf 'Man')"];
			
	
// Load Object Into Vehicle If Player In Cargo Vehicle

		player addaction
				
		["<t color='#ffffff'>LOAD OBJECT IN VEHICLE", 	
		
		{
			
			vehicle player setVehicleCargo cursorObject;
			
		}
		
		, [], 99, true, true, "", "!(vehicle player == player) and ((vehicle _target canVehicleCargo cursorObject) select 0) and ((vehicle _target canVehicleCargo cursorObject) select 1) and (vehicle _target distance2D cursorObject < 10) and !(cursorObject isKindOf 'Man')"];



	// Can Load Object But Won't Currently Fit

			player addaction
					
			["<t color='#ffffff'>CAN'T LOAD OBJECT: NOT ENOUGH SPACE", 	
			
			{
				
				hintC "CAN'T LOAD OBJECT: NOT ENOUGH SPACE";
				
			}
			
			, [], 99, true, true, "", "!(vehicle player == player) and !((vehicle _target canVehicleCargo cursorObject) select 0)and ((vehicle _target canVehicleCargo cursorObject) select 1) and (vehicle _target distance2D cursorObject < 10) and !(cursorObject isKindOf 'Man')"];




// Load Object Into Vehicle If Player In Vehicle To Be Loaded

		player addaction
				
		["<t color='#ffffff'>LOAD VEHICLE", 	
		
		{
			
			cursorObject setVehicleCargo vehicle player;
			
		}
		
		, [], 99, true, true, "", "!(vehicle player == player) and ((cursorObject canVehicleCargo vehicle _target) select 0) and ((cursorObject canVehicleCargo vehicle _target) select 1) and (vehicle _target distance2D cursorObject < 10)"];


	// Can Load Object But Won't Currently Fit

			player addaction
					
			["<t color='#ffffff'>LOAD OBJECT IN VEHICLE", 	
			
			{
				
				hintC "CAN'T LOAD OBJECT: NOT ENOUGH SPACE";
				
			}
			
			, [], 99, true, true, "", "!(vehicle player == player) and !((cursorObject canVehicleCargo vehicle _target) select 0) and ((cursorObject canVehicleCargo vehicle _target) select 1) and (vehicle _target distance2D cursorObject < 10)"];
