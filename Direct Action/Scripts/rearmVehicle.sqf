// type none
// activation blufor
// activation type present
// repeatable
// this and ((getPos (thisList select 0)) select 2 < 1)
// _handle = [(thisList select 0)] execVM "rearmVehicle.sqf";
                                                       
private ["_veh", "_type"];
_veh = _this select 0;
_type = _this select 1;
_delay = param [2, 20];
	_delay = _delay/4;


if (_veh isKindOf "ParachuteBase" || !alive _veh) exitWith {};

if !(_veh isKindOf _type) exitWith {

	switch (true) do {
	
		case (_type == "Helicopter"): {_veh vehicleChat "Unable to resupply. This pad is for HELICOPTERS only."};
		case (_type == "Plane"): {_veh vehicleChat "Unable to resupply. This pad is for PLANES only."};
		case (_type == "Land"): {_veh vehicleChat "Unable to resupply. This pad is for LAND VEHICLES only."};
		default {_veh vehicleChat "Your vehicle is unable to resupply at this pad."};
	
	};
 	
};

_veh vehicleChat "Servicing vehicle, Stand by...";

_veh setFuel 0;

//---------- RE-ARMING

sleep _delay;

_veh vehicleChat "Re-arming ...";

//---------- REPAIRING

sleep _delay;

_veh vehicleChat "Repairing ...";

//---------- REFUELING

sleep _delay;

_veh vehicleChat "Refueling ...";

//---------- FINISHED

sleep _delay;

_veh setDamage 0;
_veh vehicleChat "Repaired (100%).";

_veh setVehicleAmmo 1;

	_authorFromConfig = getText (configfile >> "CfgVehicles" >> typeOf _veh >> "author");
			
	if (_authorFromConfig == "www.3commandobrigade.com") then {

		[_veh] spawn BEW_FNC_3CBturretAmmoFix;

	};	

_veh vehicleChat "Re-armed (100%).";

_veh setFuel 1;
_veh vehicleChat "Refuelled (100%).";

sleep 2;

_veh vehicleChat "Service complete. Ready to GO.!";