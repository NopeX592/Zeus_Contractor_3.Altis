
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
	_obj addWeapon "SMG_01_F";
	_obj addPrimaryWeaponItem "optic_Holosight_smg_blk_F";
	_obj addPrimaryWeaponItem "30Rnd_45ACP_Mag_SMG_01";

	comment "Add containers";
	_obj forceAddUniform "U_B_HeliPilotCoveralls";
	_obj addVest "V_TacVest_blk";
	_obj addBackpack "B_LegStrapBag_black_F";

	comment "Add items to containers";
	_obj addItemToUniform "FirstAidKit";
	for "_i" from 1 to 2 do {_obj addItemToUniform "30Rnd_45ACP_Mag_SMG_01";};
	_obj addItemToUniform "Chemlight_green";
	_obj addItemToVest "30Rnd_45ACP_Mag_SMG_01";
	_obj addItemToVest "SmokeShellGreen";
	_obj addItemToVest "SmokeShellBlue";
	_obj addItemToVest "SmokeShellOrange";
	_obj addItemToVest "Chemlight_green";
	_obj addItemToBackpack "ToolKit";
	_obj addHeadgear "H_PilotHelmetHeli_B";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "ItemGPS";
	_obj linkItem "NVGoggles_OPFOR";

	comment "Set identity";
	[_obj,"WhiteHead_01","male05eng"] call BIS_fnc_setIdentity;
