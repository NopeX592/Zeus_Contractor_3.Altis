
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
	_obj addWeapon "rhs_weap_sr25";
	_obj addPrimaryWeaponItem "rhsusf_acc_SR25S";
	_obj addPrimaryWeaponItem "rhsusf_acc_wmx_bk";
	_obj addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4_2";
	_obj addPrimaryWeaponItem "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";
	_obj addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
	_obj addWeapon "rhsusf_weap_m9";
	_obj addHandgunItem "rhsusf_mag_15Rnd_9x19_JHP";

	comment "Add containers";
	_obj forceAddUniform "rhs_uniform_FROG01_d";
	_obj addVest "rhsusf_spc_marksman";
	_obj addBackpack "rhsusf_assault_eagleaiii_coy";

	comment "Add binoculars";
	_obj addWeapon "rhsusf_bino_lerca_1200_black";

	comment "Add items to containers";
	for "_i" from 1 to 2 do {_obj addItemToUniform "FirstAidKit";};
	for "_i" from 1 to 3 do {_obj addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
	for "_i" from 1 to 4 do {_obj addItemToVest "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";};
	for "_i" from 1 to 6 do {_obj addItemToBackpack "rhsusf_20Rnd_762x51_SR25_m118_special_Mag";};
	for "_i" from 1 to 2 do {_obj addItemToBackpack "rhs_grenade_anm8_mag";};
	_obj addHeadgear "rhsusf_lwh_helmet_marpatd";
	_obj addGoggles "rhs_googles_black";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "ItemGPS";
	_obj linkItem "rhsusf_ANPVS_14";
