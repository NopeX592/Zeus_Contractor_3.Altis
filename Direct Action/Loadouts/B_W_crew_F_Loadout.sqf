
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
	_obj addWeapon "arifle_MXC_Black_F";
	_obj addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
	_obj addWeapon "hgun_P07_F";
	_obj addHandgunItem "16Rnd_9x21_Mag";

	comment "Add containers";
	_obj forceAddUniform "U_B_CombatUniform_vest_mcam_wdl_f";
	_obj addVest "V_BandollierB_rgr";
	_obj addBackpack "B_LegStrapBag_black_F";

	comment "Add items to containers";
	_obj addItemToUniform "FirstAidKit";
	_obj addItemToUniform "Chemlight_green";
	for "_i" from 1 to 3 do {_obj addItemToUniform "30Rnd_65x39_caseless_black_mag";};
	for "_i" from 1 to 2 do {_obj addItemToVest "16Rnd_9x21_Mag";};
	for "_i" from 1 to 2 do {_obj addItemToVest "HandGrenade";};
	_obj addItemToVest "SmokeShell";
	_obj addItemToVest "SmokeShellGreen";
	_obj addItemToVest "Chemlight_green";
	_obj addItemToBackpack "ToolKit";
	_obj addHeadgear "H_HelmetCrew_B";
	_obj addGoggles "G_Combat";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "ItemGPS";
	_obj linkItem "NVGoggles_INDEP";
