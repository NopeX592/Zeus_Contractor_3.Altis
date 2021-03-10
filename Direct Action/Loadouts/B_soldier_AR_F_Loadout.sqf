
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
	_obj addWeapon "arifle_MX_SW_Black_F";
	_obj addPrimaryWeaponItem "muzzle_snds_H";
	_obj addPrimaryWeaponItem "acc_flashlight";
	_obj addPrimaryWeaponItem "optic_Hamr";
	_obj addPrimaryWeaponItem "100Rnd_65x39_caseless_black_mag";
	_obj addPrimaryWeaponItem "bipod_01_F_blk";
	_obj addWeapon "hgun_P07_F";
	_obj addHandgunItem "16Rnd_9x21_Mag";

	comment "Add containers";
	_obj forceAddUniform "U_B_CombatUniform_mcam";
	_obj addVest "V_PlateCarrier2_rgr";

	comment "Add items to containers";
	_obj addItemToUniform "FirstAidKit";
	_obj addItemToUniform "HandGrenade";
	_obj addItemToUniform "SmokeShell";
	_obj addItemToUniform "SmokeShellGreen";
	_obj addItemToUniform "Chemlight_green";
	_obj addItemToUniform "30Rnd_9x21_Red_Mag";
	_obj addItemToVest "Chemlight_green";
	for "_i" from 1 to 5 do {_obj addItemToVest "100Rnd_65x39_caseless_black_mag_tracer";};
	_obj addHeadgear "H_HelmetB_light_snakeskin";
	_obj addGoggles "G_Tactical_Clear";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "NVGoggles";

	comment "Set identity";
	[_obj,"WhiteHead_12","male05eng"] call BIS_fnc_setIdentity;
