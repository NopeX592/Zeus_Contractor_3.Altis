
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
	_obj addPrimaryWeaponItem "muzzle_snds_H";
	_obj addPrimaryWeaponItem "acc_flashlight";
	_obj addPrimaryWeaponItem "optic_Hamr";
	_obj addPrimaryWeaponItem "30Rnd_65x39_caseless_black_mag";
	_obj addWeapon "launch_MRAWS_olive_F";
	_obj addSecondaryWeaponItem "MRAWS_HEAT_F";
	_obj addWeapon "hgun_P07_F";
	_obj addHandgunItem "16Rnd_9x21_Mag";

	comment "Add containers";
	_obj forceAddUniform "U_B_T_Soldier_SL_F";
	_obj addVest "V_Chestrig_rgr";
	_obj addBackpack "B_Kitbag_sgg";

	comment "Add items to containers";
	for "_i" from 1 to 3 do {_obj addItemToUniform "FirstAidKit";};
	_obj addItemToUniform "Chemlight_green";
	for "_i" from 1 to 2 do {_obj addItemToUniform "16Rnd_9x21_red_Mag";};
	for "_i" from 1 to 2 do {_obj addItemToVest "HandGrenade";};
	_obj addItemToVest "SmokeShell";
	_obj addItemToVest "SmokeShellGreen";
	_obj addItemToVest "SmokeShellBlue";
	_obj addItemToVest "SmokeShellOrange";
	_obj addItemToVest "Chemlight_green";
	for "_i" from 1 to 8 do {_obj addItemToVest "30Rnd_65x39_caseless_black_mag_Tracer";};
	_obj addItemToBackpack "ToolKit";
	_obj addItemToBackpack "MineDetector";
	for "_i" from 1 to 3 do {_obj addItemToBackpack "MRAWS_HEAT_F";};
	_obj addHeadgear "H_MilCap_tna_F";
	_obj addGoggles "G_Tactical_Clear";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "NVGoggles_tna_F";


	comment "Set identity";
	[_obj,"GreekHead_A3_09","male08eng"] call BIS_fnc_setIdentity;
