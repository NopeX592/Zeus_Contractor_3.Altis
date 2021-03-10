	// Save Loadout On Arsenal Closed
		
		[missionNamespace, "arsenalClosed", { 
		 
			[player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;
			systemchat "NEW LOADOUT SAVED FOR RESPAWN";
		  
		}] call BIS_fnc_addScriptedEventHandler;
		
	// Add Loadout To Arsenal On Open
		
		
		[missionNamespace, "arsenalOpened", {

					
					arsenalBackpacks append [backpack player];
						arsenalBackpacks = arsenalBackpacks arrayIntersect arsenalBackpacks;
					
					arsenalHeadgear append [headgear player];
						arsenalHeadgear = arsenalHeadgear arrayIntersect arsenalHeadgear;
						
					arsenalGoggles append [goggles player];
						arsenalGoggles = arsenalGoggles arrayIntersect arsenalGoggles;
						
					arsenalUniforms append [uniform player];
						arsenalUniforms =arsenalUniforms arrayIntersect arsenalUniforms;
						
					arsenalVests append [vest player];
						arsenalVests = arsenalVests arrayIntersect arsenalVests;
					
					{arsenalprimaryAttachments append [_x]} forEach primaryWeaponItems player;
						arsenalprimaryAttachments = arsenalprimaryAttachments arrayIntersect arsenalprimaryAttachments;
						
					{arsenalsecondaryattachments append [_x]} forEach secondaryWeaponItems player;
						arsenalsecondaryattachments = arsenalsecondaryattachments arrayIntersect arsenalsecondaryattachments;
					
					{arsenalmisc append [_x]} forEach assignedItems player;
					{arsenalmisc append [_x]} forEach backpackItems player;
					{arsenalmisc append [_x]} forEach vestItems player;
					{arsenalmisc append [_x]} forEach uniformItems player;
						arsenalmisc = arsenalmisc arrayIntersect arsenalmisc;
					
					{arsenalallMagazines append [_x]} forEach magazines player;
						arsenalallMagazines = arsenalallMagazines arrayIntersect arsenalallMagazines;
						
					arsenalweapons append [primaryWeapon player];
					arsenalweapons append [secondaryWeapon player];
					arsenalweapons append [handgunWeapon player];
						arsenalweapons = arsenalweapons arrayIntersect arsenalweapons;
				
					
				for "_i" from 0 to (count arsenalList - 1) do {
				
					_obj = arsenalList select _i;
					
						[_obj, arsenalBackpacks + arsenalmisc] call BIS_fnc_addVirtualBackpackCargo;
						[_obj, arsenalHeadgear + arsenalGoggles + arsenalUniforms + arsenalVests + arsenalnvgoggles + arsenalprimaryAttachments + arsenalsecondaryattachments + arsenalmisc] call BIS_fnc_addVirtualItemCargo;
						[_obj, arsenalAllMagazines + arsenalexplosives + arsenalmisc] call BIS_fnc_addVirtualMagazineCargo;
						[_obj, arsenalWeapons + arsenalmisc] call BIS_fnc_addVirtualWeaponCargo;

				 };
		 
			
			systemchat "YOUR CURRENT LOADOUT HAS BEEN ADDED TO THE ARSENAL";
		  
		}] call BIS_fnc_addScriptedEventHandler;


	// Disable Arsenal Load

		[ missionNamespace, "arsenalOpened", {

			disableSerialization;

			_display = _this select 0;

			{

				( _display displayCtrl _x ) ctrlSetText "Disabled";

				( _display displayCtrl _x ) ctrlSetTextColor [ 1, 0, 0, 0.5 ];

				( _display displayCtrl _x ) ctrlRemoveAllEventHandlers "buttonclick";

			}forEach [ 44150, 44146, 44147 ];

		}] call BIS_fnc_addScriptedEventHandler;