if (!(isClass(configfile >> "CfgMods" >> "RHSUSAF")) or (forceVanilla)) exitWith {};

private ["_veh", "_textureList", "_texturesApplied"];

	_veh = param [0];
	_textureList = param [1, []];
	
	
	
if (count _textureList < 1) then {
	
	_textureList = switch (typeOf _veh) do {	
			
		case	"rhsusf_stryker_m1126_m2_d"		:	{
		
			[
		
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_hull_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_parts_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_slat_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_crows_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_wheels_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_ca.paa",
				"rhsusf\addons\rhsusf_m1a1\DUKE\data\duke_antennae_c_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMFC\data\rhsusf_mfc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMFC\data\rhsusf_mfc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMWC\data\rhsusf_mwc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMWC\data\rhsusf_mwc_d_co.paa"

			];

		};
		
		case	"rhsusf_stryker_m1126_mk19_d"	:	{
		
			[

				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_hull_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_parts_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_slat_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_crows_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_wheels_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_ca.paa",
				"rhsusf\addons\rhsusf_m1a1\duke\data\duke_antennae_c_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\sceptermfc\data\rhsusf_mfc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\sceptermfc\data\rhsusf_mfc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\sceptermwc\data\rhsusf_mwc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\sceptermwc\data\rhsusf_mwc_d_co.paa",
				"rhsusf\addons\rhsusf_decals\data\numbers\usstencil\r_ca.paa",
				"rhsusf\addons\rhsusf_decals\data\numbers\usstencil\-_ca.paa",
				"rhsusf\addons\rhsusf_decals\data\numbers\usstencil\1_ca.paa",
				"rhsusf\addons\rhsusf_decals\data\numbers\usstencil\2_ca.paa",
				"rhsusf\addons\rhsusf_decals\data\labels\hulldecals_stryker_wd\rhusf_hulldecal_dragonwd_ca.paa",
				"a3\map_altis\data\picturemap_ca.paa"

			];
		
		};
		
		case	"rhsusf_stryker_m1127_m2_d"		:	{
		
			[

				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_hull_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_parts_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_slat_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_crows_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_wheels_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_M1127_des_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_LRAS3_d_CO.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_ca.paa",
				"rhsusf\addons\rhsusf_m1a1\DUKE\data\duke_antennae_c_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMFC\data\rhsusf_mfc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMFC\data\rhsusf_mfc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMWC\data\rhsusf_mwc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMWC\data\rhsusf_mwc_d_co.paa"

			];

		};
		
		case	"rhsusf_stryker_m1132_m2_np_d"	:	{
		
			[

				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_hull_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_parts_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_slat_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_crows_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_wheels_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1132_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_ca.paa",
				"rhsusf\addons\rhsusf_m1a1\DUKE\data\duke_antennae_c_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMFC\data\rhsusf_mfc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMFC\data\rhsusf_mfc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMWC\data\rhsusf_mwc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMWC\data\rhsusf_mwc_d_co.paa"

			];
		
		};
		
		case	"rhsusf_stryker_m1134_d"	:	{
		
			[

				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_hull_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_parts_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_slat_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_crows_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_wheels_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1134_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1134_int_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_ca.paa",
				"rhsusf\addons\rhsusf_m1a1\DUKE\data\duke_antennae_c_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMFC\data\rhsusf_mfc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMFC\data\rhsusf_mfc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMWC\data\rhsusf_mwc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMWC\data\rhsusf_mwc_d_co.paa"

			];
		
		};
		
		case	"rhsusf_stryker_m1132_m2_d"		:	{
		
			[

				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_hull_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_parts_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_slat_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_crows_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_wheels_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1132_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_co.paa",
				"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_ca.paa",
				"rhsusf\addons\rhsusf_m1a1\DUKE\data\duke_antennae_c_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMFC\data\rhsusf_mfc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMFC\data\rhsusf_mfc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMWC\data\rhsusf_mwc_d_co.paa",
				"rhsusf\addons\rhsusf_props\jerrycans\scepterMWC\data\rhsusf_mwc_d_co.paa"

			];
		
		};
		
		case	"RHS_C130J"		:	{
		
			[

				"vehicleTextures\C130\c130j_body_co.paa",
				"vehicleTextures\C130\c130j_wings_co.paa"
				
			]
		
		};
		
		case	"RHS_C130J_Cargo"	:	{
		
			[

				"vehicleTextures\C130\c130j_body_co.paa",
				"vehicleTextures\C130\c130j_wings_co.paa"
				
			]
		
		};
			
		case	"B_LSV_01_AT_F"		:	{
		
			[
			
				"vehicleTextures\prowler\DES_Dagor_Body_co.paa", 
				"vehicleTextures\prowler\DES_Dagor_Adds_co.paa", 
				"vehicleTextures\prowler\DES_Dagor_Int_co.paa", 
				"vehicleTextures\prowler\DES_Dagor_Adds_Ext_co.paa"
				
			]
		
		};
		
		case	"B_LSV_01_armed_F"	:	{
		
			[
			
				"vehicleTextures\prowler\DES_Dagor_Body_co.paa", 
				"vehicleTextures\prowler\DES_Dagor_Adds_co.paa", 
				"vehicleTextures\prowler\DES_Dagor_Int_co.paa", 
				"vehicleTextures\prowler\DES_Dagor_Adds_Ext_co.paa"
			
			]
		
		};
		
		case	"B_LSV_01_unarmed_F"	:	{
		
			[
			
				"vehicleTextures\prowler\DES_Dagor_Body_co.paa", 
				"vehicleTextures\prowler\DES_Dagor_Adds_co.paa", 
				"vehicleTextures\prowler\DES_Dagor_Int_co.paa", 
				"vehicleTextures\prowler\DES_Dagor_Adds_Ext_co.paa"
			
			]
		
		};
		
		case	"B_Truck_01_flatbed_F"	:	{
		
			[
			
				"vehicleTextures\HEMTT\HEMTT_desert_front_basic.paa", 
				"vehicleTextures\HEMTT\HEMTT_desert_top_basic.paa"
			
			]
		
		};
		
		case	"UK3CB_BAF_MQ9_Reaper"	:	{
		
			[
			
				
			
			]
		
		};
		
		case	"sab_t45goshawk_b"	:	{
		
			[
			
				"vehicleTextures\goshawk\nl_goshawk_01_co.paa"
			
			]
		
		};
		
		case	"RHSGREF_A29B_HIDF"	:	{
		
			[
			
					"rhsgref\addons\rhsgref_a29\tex\st_fuselage_usaf_co.paa",
					"rhsgref\addons\rhsgref_a29\tex\st_wingsandstabs_usaf_co.paa",
					"rhsgref\addons\rhsgref_a29\tex\st_everythingelse_usaf_co.paa",
					"rhsgref\addons\rhsgref_a29\tex\jst_prop_blur.paa"
			
			]
		
		};
		
		case	"RHS_UH60M"	:	{
		
			[
			
					"vehicleTextures\uh-60\mh60s_fuselage_co.paa",
					"vehicleTextures\uh-60\mh60s_engine_co.paa",
					"vehicleTextures\uh-60\default_co.paa"
			
			]
		
		};
		
		case	"I_Plane_Fighter_03_AA_F"	:	{
		
			[
			
					"vehicleTextures\ALCA\l159_body_1_co.paa",
					"vehicleTextures\ALCA\l159_body_2_co.paa"
			
			]
		
		};
		
		case	"I_Plane_Fighter_03_CAS_F"	:	{
		
			[
			
					"vehicleTextures\ALCA\l159_body_1_co.paa",
					"vehicleTextures\ALCA\l159_body_2_co.paa"
			]
		
		};
		
		
		case	"I_Plane_Fighter_03_dynamicLoadout_F"	:	{
		
			[
			
					"vehicleTextures\ALCA\l159_body_1_co.paa",
					"vehicleTextures\ALCA\l159_body_2_co.paa"
			
			]
		
		};
		
		
		case	"RHS_AN2"	:	{
		
			[
			
				"rhsgref\addons\rhsgref_air\an2\data\an2_1_co.paa",
				"rhsgref\addons\rhsgref_air\an2\data\an2_2_co.paa",
				"rhsgref\addons\rhsgref_air\an2\data\an2_wings_co.paa",
				"rhsafrf\addons\rhs_decals\data\numbers\aviacdf\7_ca.paa",
				"rhsafrf\addons\rhs_decals\data\numbers\aviacdf\5_ca.paa",
				"rhsafrf\addons\rhs_decals\data\labels\aviation\star_old_ca.paa",
				"rhsafrf\addons\rhs_decals\data\labels\aviation\star_old_ca.paa"
			
			]
		
		};
		
		
		case	"Cha_Des1_LAV25A2"	:	{
		
			[
			
				"vehicleTextures\lav\lavbody_co.paa",
				"vehicleTextures\lav\lavbody2_co.paa"
			
			]
		
		};
		
		
		case	"RHS_T50_vvs_generic_ext"	:	{
		
			[

				'rhsafrf\addons\rhs_air\t50\data\pakfa_greycamo_co.paa',
				'rhsafrf\addons\rhs_decals\data\labels\aviation\no_ca.paa',
				'rhsafrf\addons\rhs_decals\data\numbers\aviablue\5_ca.paa',
				'rhsafrf\addons\rhs_decals\data\numbers\aviablue\1_ca.paa',
				'rhsafrf\addons\rhs_decals\data\labels\aviation\no_ca.paa',
				'rhsafrf\addons\rhs_decals\data\labels\aviation\no_ca.paa',
				'rhsafrf\addons\rhs_decals\data\labels\aviation\no_ca.paa',
				'rhsafrf\addons\rhs_decals\data\labels\aviationcompanies\sukhoi_ca.paa',
				'rhsafrf\addons\rhs_decals\data\labels\aviation\star_new2_ca.paa',
				'rhsafrf\addons\rhs_c_air\scripts\data\altis_co.paa',
				'rhsafrf\addons\rhs_c_air\scripts\data\wp_move_ca.paa'

			];
		
		};
		
		
		case	"rhs_mig29sm_vvs"	:	{
		
			[

				'rhsafrf\addons\rhs_mig29\data\rhs_mig29_01_gray_co.paa',
				'rhsafrf\addons\rhs_mig29\data\rhs_mig29_02_gray_co.paa',
				'rhsafrf\addons\rhs_mig29\data\rhs_mig29_03_gray_co.paa',
				'rhsafrf\addons\rhs_decals\data\numbers\aviared\4_ca.paa',
				'rhsafrf\addons\rhs_decals\data\numbers\aviared\3_ca.paa',
				'rhsafrf\addons\rhs_decals\data\labels\aviation\star_old_ca.paa',
				'',
				'',
				'rhsafrf\addons\rhs_decals\data\numbers\aviawhite\4_ca.paa',
				'rhsafrf\addons\rhs_decals\data\numbers\aviawhite\3_ca.paa',
				'',
				'',
				'',
				'',
				'',
				'',
				'',
				'',
				'rhsafrf\addons\rhs_decals\data\labels\mig29tailsign\rhs_vvs_ca.paa',
				'',
				''
			];
		
		};
		
		
		case	"rhs_mig29sm_vvs"	:	{
	
			[

				'rhsafrf\addons\rhs_mig29\data\rhs_mig29_01_gray_co.paa',
				'rhsafrf\addons\rhs_mig29\data\rhs_mig29_02_gray_co.paa',
				'rhsafrf\addons\rhs_mig29\data\rhs_mig29_03_gray_co.paa',
				'rhsafrf\addons\rhs_decals\data\numbers\aviared\4_ca.paa',
				'rhsafrf\addons\rhs_decals\data\numbers\aviared\3_ca.paa',
				'rhsafrf\addons\rhs_decals\data\labels\aviation\star_old_ca.paa',
				'',
				'',
				'rhsafrf\addons\rhs_decals\data\numbers\aviawhite\4_ca.paa',
				'rhsafrf\addons\rhs_decals\data\numbers\aviawhite\3_ca.paa',
				'',
				'',
				'',
				'',
				'',
				'',
				'',
				'',
				'rhsafrf\addons\rhs_decals\data\labels\mig29tailsign\rhs_vvs_ca.paa',
				'',
				''
			];
			
		};
			
			
		case	"EC135Unarmedlu"	:	{
	
			[
				
				'luke_ecx\skin\noir\body1.paa',
				'luke_ecx\skin\noir\body2.paa',
				'luke_ecx\skin\noir\body3.paa',
				'luke_ecx\skin\noir\body4.paa',
				'luke_ecx\skin\noir\body5.paa',
				''
	
			];
			
		};
			
			
		case	"EC135Armedlu"	:	{
	
			[
				
				'luke_ecx\skin\noir\body1.paa',
				'luke_ecx\skin\noir\body2.paa',
				'luke_ecx\skin\noir\body3.paa',
				'luke_ecx\skin\noir\body4.paa',
				'luke_ecx\skin\noir\body5.paa',
				''
				
			];
		
		};
		
		
		case	"FIR_FA18F"	:	{
	
			[
		
				'flan_ea18g\skin\raaf\nose_co.paa',
				'flan_ea18g\skin\raaf\body_co.paa',
				'flan_ea18g\skin\raaf\fuse_co.paa',
				'flan_ea18g\skin\raaf\leftwing_co.paa',
				'flan_ea18g\skin\raaf\rightwing_co.paa'
		
			];
		
		};
		
		
		case	"FIR_F18C_Blank"	:	{
	
			[
		
				'fir_fa18\skin\rcaf\body_co.paa',
				'fir_fa18\skin\rcaf\wing_co.paa',
				'fir_fa18\skin\rcaf\buno_ca.paa'
		
			];
		
		};
		
		
		case	"bwi_a3_pc9a_nta_1"	:	{
	
			[
				
				'bwi_a3_t6\skins\canada\t6_1_t.paa',
				'bwi_a3_t6\skins\canada\t6_2_t.paa',
				'bwi_a3_t6\skins\canada\t6_3_t.paa',
				'bwi_a3_t6\skins\canada\t6_4_t.paa'
		
			];
		
		};
		
		
		case	"bwi_a3_t6a_10"	:	{
	
			[
				
				'VehicleTextures\Texan\RAF\t6_1_t.paa',
				'VehicleTextures\Texan\RAF\t6_2_t.paa',
				'VehicleTextures\Texan\RAF\t6_3_t.paa',
				'VehicleTextures\Texan\RAF\t6_4_t.paa'
		
			];
		
		};
		
		
		case	"bwi_a3_t6a_nta_2"	:	{
	
			[
				
				'VehicleTextures\Texan\RAF\t6_1_t.paa',
				'VehicleTextures\Texan\RAF\t6_2_t.paa',
				'VehicleTextures\Texan\RAF\t6_3_t.paa',
				'VehicleTextures\Texan\RAF\t6_4_t.paa'
		
			];
		
		};
		
		
		case	"EAWS_EF2000_Genericblu_CAP"	:	{
	
			[
				
				'eaws_ef2000\data\top_ger.paa',
				'',
				'eaws_ef2000\data\su35_engine_empty_ca.paa',
				'eaws_ef2000\data\su35_engine_empty_ca.paa',
				'eaws_ef2000\data\top_ger.paa',
				'eaws_ef2000\data\top_ger.paa'
		
			];
		
		};

	
		default {[]};
	
	};
	
};


if (count _textureList > 0) then {

	for "_i" from 0 to (count _textureList - 1) do {

		_veh setObjectTexture [_i, _textureList select _i];

	};
	
	_texturesApplied = true;

}else{

	_texturesApplied = false;

};


_texturesApplied
