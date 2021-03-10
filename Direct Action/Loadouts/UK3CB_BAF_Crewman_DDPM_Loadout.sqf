
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
	_obj addWeapon "UK3CB_BAF_L91A1";
	_obj addPrimaryWeaponItem "UK3CB_BAF_9_30Rnd";
	_obj addWeapon "UK3CB_BAF_L131A1";
	_obj addHandgunItem "UK3CB_BAF_9_17Rnd";

	comment "Add containers";
	_obj forceAddUniform "UK3CB_BAF_U_CombatUniform_DDPM_RM";
	_obj addVest "UK3CB_BAF_V_Osprey_DDPM1";
	_obj addBackpack "B_LegStrapBag_coyote_F";

	comment "Add binoculars";
	_obj addWeapon "Binocular";

	comment "Add items to containers";
	for "_i" from 1 to 2 do {_obj addItemToUniform "FirstAidKit";};
	for "_i" from 1 to 2 do {_obj addItemToUniform "UK3CB_BAF_9_17Rnd";};
	for "_i" from 1 to 8 do {_obj addItemToVest "UK3CB_BAF_9_30Rnd";};
	_obj addItemToVest "rhs_mag_m18_green";
	_obj addItemToVest "rhs_mag_m18_red";
	_obj addItemToVest "rhs_mag_m67";
	_obj addItemToVest "rhs_grenade_anm8_mag";
	_obj addItemToBackpack "ToolKit";
	_obj addHeadgear "UK3CB_BAF_H_CrewHelmet_DDPM_A";
	_obj addGoggles "rhsusf_oakley_goggles_blk";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "ItemGPS";
	_obj linkItem "UK3CB_BAF_HMNVS";

