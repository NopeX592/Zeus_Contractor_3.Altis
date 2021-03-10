
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
	_obj addWeapon "rhs_weap_m4_m203S";
	_obj addPrimaryWeaponItem "rhsusf_acc_nt4_black";
	_obj addPrimaryWeaponItem "rhsusf_acc_wmx_bk";
	_obj addPrimaryWeaponItem "rhsusf_acc_ACOG2";
	_obj addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
	_obj addWeapon "rhsusf_weap_m9";
	_obj addHandgunItem "rhsusf_mag_15Rnd_9x19_JHP";

	comment "Add containers";
	_obj forceAddUniform "rhs_uniform_cu_ocp_101st";
	_obj addVest "rhsusf_spcs_ocp_teamleader";
	_obj addBackpack "rhsusf_assault_eagleaiii_ocp";

	comment "Add items to containers";
	for "_i" from 1 to 2 do {_obj addItemToUniform "FirstAidKit";};
	for "_i" from 1 to 3 do {_obj addItemToUniform "rhsusf_mag_15Rnd_9x19_JHP";};
	for "_i" from 1 to 6 do {_obj addItemToVest "rhs_mag_M441_HE";};
	for "_i" from 1 to 8 do {_obj addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
	for "_i" from 1 to 3 do {_obj addItemToVest "rhs_mag_m714_White";};
	_obj addHeadgear "rhsusf_ach_helmet_headset_ess_ocp_alt";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "rhsusf_ANPVS_14";
