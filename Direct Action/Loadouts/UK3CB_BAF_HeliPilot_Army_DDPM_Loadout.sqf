
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
	_obj forceAddUniform "UK3CB_BAF_U_HeliPilotCoveralls_RN";
	_obj addVest "V_TacVest_blk";
	_obj addBackpack "B_LegStrapBag_black_F";

	comment "Add binoculars";
	_obj addWeapon "Binocular";

	comment "Add items to containers";
	for "_i" from 1 to 2 do {_obj addItemToUniform "FirstAidKit";};
	for "_i" from 1 to 2 do {_obj addItemToUniform "UK3CB_BAF_9_17Rnd";};
	for "_i" from 1 to 5 do {_obj addItemToVest "UK3CB_BAF_9_30Rnd";};
	_obj addItemToVest "rhs_mag_m18_green";
	_obj addItemToVest "rhs_mag_m18_red";
	for "_i" from 1 to 2 do {_obj addItemToVest "rhs_grenade_anm8_mag";};
	_obj addItemToBackpack "ToolKit";
	_obj addHeadgear "UK3CB_BAF_H_PilotHelmetHeli_A";
	_obj addGoggles "UK3CB_BAF_G_Tactical_Yellow";

	comment "Add items";
	_obj linkItem "ItemMap";
	_obj linkItem "ItemCompass";
	_obj linkItem "ItemWatch";
	_obj linkItem "ItemRadio";
	_obj linkItem "ItemGPS";
	_obj linkItem "UK3CB_BAF_HMNVS";

