
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
	_obj addWeapon "UK3CB_BAF_L85A2_UGL";
	_obj addPrimaryWeaponItem "rhsusf_acc_su230";
	_obj addPrimaryWeaponItem "UK3CB_BAF_SFFH";
	_obj addPrimaryWeaponItem "UK3CB_BAF_556_30Rnd";
	_obj addWeapon "UK3CB_BAF_L131A1";
	_obj addHandgunItem "UK3CB_BAF_9_17Rnd";

	comment "Add containers";
	_obj forceAddUniform "UK3CB_BAF_U_CombatUniform_DDPM_RM";
	_obj addVest "UK3CB_BAF_V_Osprey_DDPM1";
	_obj addBackpack "UK3CB_BAF_B_Bergen_DDPM_SL_A";

	comment "Add binoculars";
	_obj addWeapon "Binocular";

	comment "Add items to containers";
	for "_i" from 1 to 2 do {_obj addItemToUniform "FirstAidKit";};
	for "_i" from 1 to 2 do {_obj addItemToUniform "UK3CB_BAF_9_17Rnd";};
	for "_i" from 1 to 8 do {_obj addItemToVest "UK3CB_BAF_556_30Rnd";};
	for "_i" from 1 to 8 do {_obj addItemToVest "ACE_HuntIR_M203";};
	for "_i" from 1 to 3 do {_obj addItemToVest "1Rnd_Smoke_Grenade_shell";};
	_obj addItemToVest "1Rnd_SmokeRed_Grenade_shell";
	_obj addItemToVest "1Rnd_SmokeGreen_Grenade_shell";
	for "_i" from 1 to 2 do {_obj addItemToBackpack "SatchelCharge_Remote_Mag";};
	_obj addHeadgear "UK3CB_BAF_H_Mk6_DDPM_A";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "ItemGPS";
	_obj linkItem "UK3CB_BAF_HMNVS";
