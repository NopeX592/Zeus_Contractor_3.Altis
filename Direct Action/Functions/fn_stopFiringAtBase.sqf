	vehicle player addEventHandler ["FiredMan", {  

		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"]; 

		_safeZoneMarkers = getMissionLayerEntities "Camps" select 1; 

		{

			if ((player inArea _x) and (isTouchingGround vehicle player)) then {

				hintc "DISCHARGING A WEAPON IS NOT ALLOWED AT BASE";

				deletevehicle _projectile;

			};

		} forEach _safeZoneMarkers;

	}];