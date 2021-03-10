
_obj = param [0];

if (!local _obj) exitWith {};

	comment "Remove existing items";
	removeAllWeapons _obj;
	removeAllItems _obj;
	removeAllAssignedItems _obj;
	removeUniform _obj;
	removeVest _obj;
	removeBackpack _obj;
	removeHeadgear _obj;
	removeGoggles _obj;

	comment "Add weapons";
	_obj addWeapon "rhs_weap_m4";
	_obj addPrimaryWeaponItem "rhsusf_acc_nt4_black";
	_obj addPrimaryWeaponItem "rhsusf_acc_wmx_bk";
	_obj addPrimaryWeaponItem "rhsusf_acc_ACOG2_USMC";
	_obj addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
	_obj addWeapon "rhsusf_weap_m9";
	_obj addHandgunItem "rhsusf_mag_15Rnd_9x19_JHP";

	comment "Add containers";
	_obj forceAddUniform "rhs_uniform_FROG01_d";
	_obj addVest "rhsusf_spc_rifleman";
	_obj addBackpack "rhsusf_assault_eagleaiii_coy";

	comment "Add binoculars";
	_obj addMagazine "Laserbatteries";
	_obj addWeapon "Laserdesignator";

	comment "Add items to containers";
	for "_i" from 1 to 2 do {_obj addItemToUniform "FirstAidKit";};
	for "_i" from 1 to 3 do {_obj addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
	for "_i" from 1 to 8 do {_obj addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	_obj addItemToVest "rhs_mag_m18_green";
	_obj addItemToVest "rhs_mag_m18_red";
	for "_i" from 1 to 2 do {_obj addItemToVest "rhs_mag_m67";};
	for "_i" from 1 to 2 do {_obj addItemToVest "rhs_grenade_anm8_mag";};
	_obj addHeadgear "rhsusf_lwh_helmet_marpatd";
	_obj addGoggles "rhs_googles_black";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "ItemGPS";
	_obj linkItem "rhsusf_ANPVS_14";
