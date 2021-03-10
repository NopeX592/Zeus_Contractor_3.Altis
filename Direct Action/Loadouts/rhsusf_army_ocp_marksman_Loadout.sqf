
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
	_obj addWeapon "rhs_weap_m14ebrri";
	_obj addPrimaryWeaponItem "rhsusf_acc_aac_762sdn6_silencer";
	_obj addPrimaryWeaponItem "rhsusf_acc_wmx_bk";
	_obj addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4";
	_obj addPrimaryWeaponItem "rhsusf_20Rnd_762x51_m118_special_Mag";
	_obj addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
	_obj addWeapon "rhsusf_weap_m9";
	_obj addHandgunItem "rhsusf_mag_15Rnd_9x19_JHP";

	comment "Add containers";
	_obj forceAddUniform "rhs_uniform_cu_ocp_101st";
	_obj addVest "rhsusf_spcs_ocp_sniper";
	_obj addBackpack "rhsusf_falconii_mc";

	comment "Add binoculars";
	_obj addWeapon "rhsusf_bino_lerca_1200_black";

	comment "Add items to containers";
	for "_i" from 1 to 2 do {_obj addItemToUniform "FirstAidKit";};
	for "_i" from 1 to 3 do {_obj addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
	_obj addItemToVest "rhs_mag_m18_green";
	_obj addItemToVest "rhs_mag_m18_purple";
	_obj addItemToVest "rhs_mag_m18_red";
	_obj addItemToVest "rhs_mag_m18_yellow";
	for "_i" from 1 to 2 do {_obj addItemToVest "rhs_mag_m67";};
	for "_i" from 1 to 2 do {_obj addItemToVest "rhs_grenade_anm8_mag";};
	for "_i" from 1 to 8 do {_obj addItemToVest "10Rnd_Mk14_762x51_Mag";};
	_obj addHeadgear "rhsusf_ach_helmet_headset_ess_ocp_alt";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "ItemGPS";
	_obj linkItem "rhsusf_ANPVS_14";
	