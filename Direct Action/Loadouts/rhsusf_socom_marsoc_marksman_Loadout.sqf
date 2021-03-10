
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
	_obj addWeapon "rhs_weap_m14_socom_rail";
	_obj addPrimaryWeaponItem "rhsusf_acc_aac_m14dcqd_silencer";
	_obj addPrimaryWeaponItem "rhsusf_acc_M8541_mrds";
	_obj addPrimaryWeaponItem "rhsusf_20Rnd_762x51_m80_Mag";
	_obj addPrimaryWeaponItem "rhsusf_acc_m14_bipod";
	_obj addWeapon "rhsusf_weap_glock17g4";
	_obj addHandgunItem "rhsusf_mag_17Rnd_9x19_JHP";

	comment "Add containers";
	_obj forceAddUniform "rhs_uniform_g3_mc";
	_obj addVest "rhsusf_mbav_rifleman";
	_obj addBackpack "rhsusf_falconii_mc";

	comment "Add binoculars";
	_obj addWeapon "Rangefinder";

	comment "Add items to containers";
	for "_i" from 1 to 2 do {_obj addItemToUniform "FirstAidKit";};
	for "_i" from 1 to 3 do {_obj addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP";};
	_obj addItemToVest "rhs_mag_m18_green";
	_obj addItemToVest "rhs_mag_m18_red";
	for "_i" from 1 to 2 do {_obj addItemToVest "rhs_grenade_anm8_mag";};
	for "_i" from 1 to 5 do {_obj addItemToVest "rhsusf_20Rnd_762x51_m80_Mag";};
	_obj addItemToVest "rhs_mag_m67";
	_obj addHeadgear "rhsusf_opscore_mc_cover_pelt_cam";
	_obj addGoggles "rhs_googles_black";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "ItemGPS";
	_obj linkItem "rhsusf_ANPVS_15";
