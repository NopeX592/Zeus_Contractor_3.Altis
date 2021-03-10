
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
	_obj addWeapon "arifle_MX_GL_Black_F";
	_obj addPrimaryWeaponItem "muzzle_snds_H";
	_obj addPrimaryWeaponItem "acc_flashlight";
	_obj addPrimaryWeaponItem "optic_Hamr";
	_obj addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
	_obj addWeapon "hgun_P07_F";
	_obj addHandgunItem "16Rnd_9x21_Mag";

	comment "Add containers";
	_obj forceAddUniform "U_B_CombatUniform_mcam_vest";
	_obj addVest "V_PlateCarrierGL_mtp";
	_obj addBackpack "B_Kitbag_mcamo";

	comment "Add binoculars";
	_obj addWeapon "Binocular";

	comment "Add items to containers";
	for "_i" from 1 to 2 do {_obj addItemToUniform "FirstAidKit";};
	_obj addItemToUniform "Chemlight_green";
	for "_i" from 1 to 2 do {_obj addItemToUniform "30Rnd_9x21_Red_Mag";};
	for "_i" from 1 to 2 do {_obj addItemToVest "SmokeShell";};
	for "_i" from 1 to 8 do {_obj addItemToVest "30Rnd_65x39_caseless_black_mag";};
	for "_i" from 1 to 3 do {_obj addItemToVest "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 2 do {_obj addItemToVest "1Rnd_Smoke_Grenade_shell";};
	_obj addItemToBackpack "SatchelCharge_Remote_Mag";
	_obj addHeadgear "H_HelmetB_light";
	_obj addGoggles "G_Tactical_Clear";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "ItemGPS";
	_obj linkItem "NVGoggles";

	comment "Set identity";
	[_obj,"GreekHead_A3_06","male07eng"] call BIS_fnc_setIdentity;
