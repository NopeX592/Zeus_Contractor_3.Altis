
	_veh = _this select 0;
	

	// Define Vehicle Data

		_allVehiclePylonData = [

			["FIR_A10C", [

				"FIR_ECMPod_P_1rnd_M",
				"FIR_Hydra_M229_P_19rnd_M",
				"FIR_AGM65D_P_1rnd_M",
				"FIR_EGBU12_P_3rnd_M",
				"",
				"",
				"FIR_EGBU12_P_3rnd_M",
				"FIR_AGM65D_P_1rnd_M",
				"FIR_Hydra_M229_P_19rnd_M",
				"FIR_AIM9X_P_2rnd_M"

			]],


			["FIR_FA18F", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AGM65F_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_ATFLIR_2_P_1rnd_M",
				"FIR_GBU24B_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AGM65F_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M"

			]],
			
			
			["FIR_FA18F_VFA106", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AGM65F_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_ATFLIR_2_P_1rnd_M",
				"FIR_GBU24B_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AGM65F_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M"

			]],
			
			
			["FIR_FA18F_Blank", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AGM65F_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_ATFLIR_2_P_1rnd_M",
				"FIR_GBU24B_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AGM65F_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M"

			]],


			["Tornado_AWS_camo_uk", [

				"Tornado_AWS_ECMpod_1rnd_M",
				"FIR_AIM132_P_1rnd_M_Tornado_AWS",
				"FIR_AGM65D_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_AGM65D_P_1rnd_M_Tornado_AWS",
				"FIR_AIM132_P_1rnd_M_Tornado_AWS",
				"Tornado_AWS_AIRCMpod_1rnd_M"

			]],
			
			
			["Tornado_AWS_GER", [

				"Tornado_AWS_ECMpod_1rnd_M",
				"FIR_AIM132_P_1rnd_M_Tornado_AWS",
				"FIR_AGM65D_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_AGM65D_P_1rnd_M_Tornado_AWS",
				"FIR_AIM132_P_1rnd_M_Tornado_AWS",
				"Tornado_AWS_AIRCMpod_1rnd_M"

			]],
			
			
			["Tornado_AWS_ADV_ita", [

				"Tornado_AWS_ECMpod_1rnd_M",
				"FIR_AIM132_P_1rnd_M_Tornado_AWS",
				"FIR_AGM65D_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_GBU12_P_1rnd_M_Tornado_AWS",
				"FIR_AGM65D_P_1rnd_M_Tornado_AWS",
				"FIR_AIM132_P_1rnd_M_Tornado_AWS",
				"Tornado_AWS_AIRCMpod_1rnd_M"

			]],


			["FIR_F35B_RAF01", [

				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_Gunpod_Nomodel_P_1rnd_M"

			]],


			["FIR_F35B_Standard", [

				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"",
				"FIR_Gunpod_Nomodel_P_1rnd_M"

			]],
			
			
			["FIR_F35B_Blank1", [

				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"",
				"FIR_Gunpod_Nomodel_P_1rnd_M"

			]],
			
			
			["FIR_F35B_MFG2", [

				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"",
				"FIR_Gunpod_Nomodel_P_1rnd_M"

			]],
			
			
			["FMX_F35B_SP_B", [

				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"",
				"FIR_Gunpod_Nomodel_P_1rnd_M"

			]],
			
			
			["FMX_F35B_IT_B", [

				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"",
				"FIR_Gunpod_Nomodel_P_1rnd_M"

			]],


			["FIR_F22", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_Empty_P_1rnd_M"

			]],


			["FIR_F15E_SJ", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M",
				"",
				"FIR_Empty_P_1rnd_M",
				"",
				"",
				"FIR_EGBU12_P_1rnd_M",
				"",
				"",
				"",
				"",
				"",
				"FIR_EGBU12_P_1rnd_M",
				"",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_GBU24A_P_1rnd_M",
				"FIR_SniperXR_2_Tigereye_P_1rnd_M"

			]],
			
			
			["FIR_FA18E", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AIM120_LAU115_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"",
				"FIR_GBU24B_P_1rnd_M",
				"",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_LAU115_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M"

			]],
			
			
			["FIR_EA18G_Blank", [

				"FIR_AGM88_P_1rnd_M",
				"FIR_ALQ99_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_ALQ99Hi_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_ALQ99_P_1rnd_M",
				"FIR_AGM88_P_1rnd_M"
				
			]],
			
			
			["EA18G_RAAF", [

				"FIR_AGM88_P_1rnd_M",
				"FIR_ALQ99_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_ALQ99Hi_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_ALQ99_P_1rnd_M",
				"FIR_AGM88_P_1rnd_M"
				
			]],


			["EAWS_EF2000_rafhist_CAP", [

				"FIR_AIM132_P_1rnd_M_eaws",
				"FIR_AIM120_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"",
				"",
				"",
				"",
				"",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_AIM120_P_1rnd_M_eaws",
				"FIR_AIM132_P_1rnd_M_eaws"

			]],
			
			
			["EAWS_EF2000_ITA51_CAP", [

				"FIR_AIM132_P_1rnd_M_eaws",
				"FIR_AIM120_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"",
				"",
				"",
				"",
				"",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_AIM120_P_1rnd_M_eaws",
				"FIR_AIM132_P_1rnd_M_eaws"

			]],
			
			["EAWS_EF2000_Spa_CAP", [

				"FIR_AIM132_P_1rnd_M_eaws",
				"FIR_AIM120_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"",
				"",
				"",
				"",
				"",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_AIM120_P_1rnd_M_eaws",
				"FIR_AIM132_P_1rnd_M_eaws"

			]],
			
			
			["EAWS_EF2000_GER_CAP", [

				"FIR_AIM132_P_1rnd_M_eaws",
				"FIR_AIM120_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"",
				"",
				"",
				"",
				"",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_AIM120_P_1rnd_M_eaws",
				"FIR_AIM132_P_1rnd_M_eaws"

			]],
			
			
			["EAWS_EF2000_Genericblu_CAP", [

				"FIR_AIM132_P_1rnd_M_eaws",
				"FIR_AIM120_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"",
				"",
				"",
				"",
				"",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_EGBU12_P_1rnd_M_eaws",
				"FIR_AIM120_P_1rnd_M_eaws",
				"FIR_AIM132_P_1rnd_M_eaws"

			]],


			["FIR_AV8B_GR7A_Lucy", [

				"FIR_AIM9M_LAU115_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_AIM9M_LAU115_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_AIM9M_LAU115_P_1rnd_M",
				"FIR_AIM9M_LAU115_P_1rnd_M"
				
			]],
			
			
			["ffaa_ar_harrier", [

				"FIR_AIM9M_LAU115_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_AIM9M_LAU115_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_AIM9M_LAU115_P_1rnd_M",
				"FIR_AIM9M_LAU115_P_1rnd_M"
				
			]],
			
			
			["ASZ_AV8B_MM_GBU", [

				"FIR_AIM9M_LAU115_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_AIM9M_LAU115_P_1rnd_M",
				"FIR_Empty_P_1rnd_M",
				"FIR_AIM9M_LAU115_P_1rnd_M",
				"FIR_AIM9M_LAU115_P_1rnd_M"
				
			]],
			
			
			["FIR_F18C_SPAF", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AGM65F_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_GBU24B_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AGM65F_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M"

			]],


			["FIR_F18C", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"",
				"FIR_AIM120_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M"
				
			]],
			
			
			["FIR_F18C_Blank", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"",
				"FIR_AIM120_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M"
				
			]],
			
			
			["FIR_F18C_RNZAF", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"",
				"FIR_AIM120_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M"
				
			]],
			
			
			["FIR_F18C_VFA15", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"",
				"FIR_AIM120_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M"
				
			]],
			
			
			["FIR_F18C_RAAF", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"",
				"FIR_AIM120_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM9X_LAU115_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M"
				
			]],
			
			["FIR_F18C_RCAF", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_GBU24A_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M"
				
			]],


			["FIR_F16C", [

				"FIR_AIM9X_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_EGBU12_P_1rnd_M",
				"",
				"",
				"FIR_EGBU12_P_1rnd_M",
				"FIR_AIM120_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M",
				"FIR_AIM9X_P_1rnd_M"
				
			]],


			["ncs_nzdf_t6c_1", [

				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M"

			]],
			
			
			["bwi_a3_t6a_nta_2", [

				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M"

			]],
			
			
			["bwi_a3_pc9a_nta_1", [

				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M"

			]],
			
			
			["bwi_a3_pc9a_nta", [

				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M"

			]],
			
			
			["bwi_a3_t6c_raf_nta_1", [

				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M"

			]],


			["bwi_a3_at6b", [

				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M"
				
			]],
			
			
			["bwi_a3_at6b_raf_1", [

				"FIR_Hydra_M229_P_7rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Mk82_GP_P_1rnd_M",
				"FIR_Hydra_M229_P_7rnd_M"
				
			]],
			
			
			["RHS_Su25SM_vvs", [

				"rhs_mag_kh29D",
				"rhs_mag_kh29D",
				"rhs_mag_kh25MTP",
				"rhs_mag_kh25MTP",
				"rhs_mag_kh25MTP",
				"rhs_mag_kh25MTP",
				"rhs_mag_R73M",
				"rhs_mag_R73M",
				"rhs_mag_R60M",
				"rhs_mag_R60M",
				"rhs_ASO2_CMFlare_Chaff_Magazine_x4"

			]],


			["rhs_mig29sm_vvs", [

				"rhs_mag_kh25MTP_apu68_mig29",
				"rhs_mag_kh25MTP_apu68_mig29",
				"rhs_mag_R73M_APU73",
				"rhs_mag_R73M_APU73",
				"rhs_mag_R73M_APU73",
				"rhs_mag_R73M_APU73",
				"rhs_mag_ptb1500",
				"rhs_BVP3026_CMFlare_Chaff_Magazine_x2"

			]],


			["RHS_T50_vvs_generic_ext", [

				"rhs_mag_R77M",
				"rhs_mag_R77M",
				"rhs_mag_R77M",
				"rhs_mag_R77M",
				"rhs_mag_R74M2_int",
				"rhs_mag_R74M2_int",
				"rhs_mag_R74",
				"rhs_mag_R74",
				"rhs_mag_R74",
				"rhs_mag_R74",
				"rhs_mag_R77M_AKU170",
				"rhs_mag_R77M_AKU170"

			]],


			["O_Plane_CAS_02_dynamicLoadout_F", [

				"PylonRack_1Rnd_Missile_AA_03_F",
				"PylonRack_1Rnd_Missile_AGM_01_F",
				"PylonRack_1Rnd_Missile_AGM_01_F",
				"PylonRack_1Rnd_Missile_AGM_01_F",
				"PylonRack_1Rnd_Missile_AGM_01_F",
				"PylonRack_1Rnd_Missile_AGM_01_F",
				"PylonRack_1Rnd_Missile_AGM_01_F",
				"PylonRack_1Rnd_Missile_AGM_01_F",
				"PylonRack_1Rnd_Missile_AGM_01_F",
				"PylonRack_1Rnd_Missile_AA_03_F"

			]],


			["O_Plane_Fighter_02_F", [

				"PylonMissile_Missile_AA_R73_x1",
				"PylonMissile_Missile_AA_R73_x1",
				"PylonMissile_Missile_AA_R77_x1",
				"PylonMissile_Missile_AA_R77_x1",
				"PylonRack_1Rnd_Missile_AGM_01_F",
				"PylonRack_1Rnd_Missile_AGM_01_F",
				"PylonMissile_Missile_AA_R73_x1",
				"PylonMissile_Missile_AA_R73_x1",
				"PylonMissile_Missile_AA_R77_x1",
				"PylonMissile_Missile_AA_R77_x1",
				"PylonMissile_Missile_AA_R77_INT_x1",
				"PylonMissile_Missile_AA_R77_INT_x1",
				"PylonRack_1Rnd_Missile_AGM_01_F"

			]],
			
			
			["B_UAV_05_F", [
			
				"PylonMissile_Bomb_GBU12_x1",
				"PylonMissile_Missile_AGM_02_x2"
			
			]],


			["B_UAV_02_dynamicLoadout_F", [
			
				"PylonMissile_1Rnd_Bomb_04_F",
				"PylonRack_3Rnd_LG_scalpel"
			
			]],


			["B_T_UAV_03_dynamicLoadout_F", [
			
				"PylonRack_12Rnd_missiles",
				"PylonWeapon_2000Rnd_65x39_belt",
				"PylonRack_3Rnd_LG_scalpel",
				"PylonRack_12Rnd_missiles"
			
			]],
			
			
			["I_Plane_Fighter_03_dynamicLoadout_F" ,[
			
				"PylonMissile_1Rnd_Mk82_F",
				"PylonRack_7Rnd_Rocket_04_HE_F",
				"PylonMissile_1Rnd_GAA_missiles",
				"PylonWeapon_300Rnd_20mm_shells",
				"PylonMissile_1Rnd_GAA_missiles",
				"PylonRack_7Rnd_Rocket_04_HE_F",
				"PylonMissile_1Rnd_Mk82_F"

			]],

			
			["I_Plane_Fighter_03_AA_F" ,[

				"PylonMissile_1Rnd_GAA_missiles",
				"PylonMissile_1Rnd_GAA_missiles",
				"PylonMissile_1Rnd_AAA_missiles",
				"PylonWeapon_300Rnd_20mm_shells",
				"PylonMissile_1Rnd_AAA_missiles",
				"PylonMissile_1Rnd_GAA_missiles",
				"PylonMissile_1Rnd_GAA_missiles"

			]],
			
			
			["I_Plane_Fighter_03_CAS_F" ,[

				"PylonMissile_1Rnd_GAA_missiles",
				"PylonMissile_1Rnd_Bomb_04_F",
				"PylonMissile_1Rnd_Bomb_04_F",
				"PylonWeapon_300Rnd_20mm_shells",
				"PylonMissile_1Rnd_Bomb_04_F",
				"PylonMissile_1Rnd_Bomb_04_F",
				"PylonMissile_1Rnd_GAA_missiles"

			]],


			["B_Plane_Fighter_01_Stealth_F" ,[

				"",
				"",
				"",
				"",
				"PylonMissile_Missile_BIM9X_x1",
				"PylonMissile_Missile_BIM9X_x1",
				"PylonMissile_Missile_AMRAAM_D_INT_x1",
				"PylonMissile_Missile_AMRAAM_D_INT_x1",
				"PylonMissile_Missile_AMRAAM_D_INT_x1",
				"PylonMissile_Missile_AMRAAM_D_INT_x1",
				"PylonMissile_Bomb_GBU12_x1",
				"PylonMissile_Bomb_GBU12_x1"

			]],


			["B_Plane_Fighter_01_F" ,[

				"PylonMissile_Bomb_GBU12_x1",
				"PylonMissile_Bomb_GBU12_x1",
				"PylonMissile_Bomb_GBU12_x1",
				"PylonMissile_Bomb_GBU12_x1",
				"PylonMissile_Missile_BIM9X_x1",
				"PylonMissile_Missile_BIM9X_x1",
				"PylonMissile_Missile_AMRAAM_D_INT_x1",
				"PylonMissile_Missile_AMRAAM_D_INT_x1",
				"",
				"",
				"PylonMissile_Bomb_GBU12_x1",
				""

			]],


			["B_Plane_Fighter_01_Cluster_F" ,[

				"PylonMissile_1Rnd_BombCluster_03_F",
				"PylonMissile_1Rnd_BombCluster_03_F",
				"PylonRack_Missile_HARM_x1",
				"PylonRack_Missile_HARM_x1",
				"PylonMissile_Missile_BIM9X_x1",
				"PylonMissile_Missile_BIM9X_x1",
				"PylonMissile_Missile_AMRAAM_D_INT_x1",
				"PylonMissile_Missile_AMRAAM_D_INT_x1",
				"PylonRack_Bomb_SDB_x4",
				"PylonRack_Bomb_SDB_x4",
				"",
				""

			]],


			["B_Plane_CAS_01_dynamicLoadout_F" ,[

				"PylonMissile_1Rnd_GAA_missiles",
				"PylonRack_7Rnd_Rocket_04_HE_F",
				"PylonRack_1Rnd_Missile_AGM_02_F",
				"PylonMissile_1Rnd_Bomb_04_F",
				"PylonMissile_1Rnd_Bomb_04_F",
				"PylonMissile_1Rnd_Bomb_04_F",
				"PylonMissile_1Rnd_Bomb_04_F",
				"PylonRack_1Rnd_Missile_AGM_02_F",
				"PylonRack_7Rnd_Rocket_04_HE_F",
				"PylonMissile_1Rnd_GAA_missiles"

			]],
			
			
			["I_Plane_Fighter_04_F" ,[
			
				"PylonMissile_Missile_BIM9X_x1",
				"PylonMissile_Missile_BIM9X_x1",
				"PylonRack_Missile_AMRAAM_C_x1",
				"PylonRack_Missile_AMRAAM_C_x1",
				"PylonMissile_Bomb_GBU12_x1",
				"PylonMissile_Bomb_GBU12_x1"
			
			]],
			
			
			["rhs_l159_cdf_b_CDF", [

				"rhs_mag_Sidewinder",
				"rhs_mag_aim120d",
				"rhs_mag_gbu12",
				"rhs_mag_zpl20_hei",
				"rhs_mag_gbu12",
				"rhs_mag_aim120d",
				"rhs_mag_Sidewinder",
				"rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2"

			]],


			["RHS_A10", [

				"rhs_mag_ANALQ131",
				"rhs_mag_gbu12",
				"rhs_mag_agm65d",
				"rhs_mag_gbu12",
				"rhs_mag_gbu12",
				"",
				"rhs_mag_gbu12",
				"rhs_mag_gbu12",
				"rhs_mag_agm65d",
				"rhs_mag_gbu12",
				"rhs_mag_aim9m_2",
				"rhsusf_ANALE40_CMFlare_Chaff_Magazine_x16"

			]],


			["rhsusf_f22", [

				"rhs_mag_Sidewinder_int",
				"rhs_mag_aim120d_int",
				"rhs_mag_gbu32",
				"rhs_mag_gbu32",
				"rhs_mag_aim120d_int",
				"rhs_mag_Sidewinder_int",
				"rhsusf_ANALE52_CMFlare_Chaff_Magazine_x4"

			]],


			["RHSGREF_A29B_HIDF", [

				"rhs_mag_M151_7_USAF_LAU131",
				"rhs_mag_mk82",
				"rhs_mag_mk82",
				"rhs_mag_mk82",
				"rhs_mag_M151_7_USAF_LAU131",
				"rhsusf_ANALE40_CMFlare_Magazine_x2"

			]],
			
			
			["AMF_RAFALE_M_01_F", [

				"PylonMissile_Missile_MICAIR_x1",
				"PylonMissile_Missile_MICAIR_x1",
				"",
				"",
				"PylonRack_Bomb_GBU12_x2",
				"PylonRack_Bomb_GBU12_x2",
				"",
				"",
				"PylonRack_Missile_METEOR_INT_x1",
				"PylonRack_Missile_METEOR_INT_x1",
				"PylonRack_1Rnd_SCALP_x1"

			]],


			["B_FR_Rafale_M_01", [

				"PylonMissile_Missile_MICAIR_x1",
				"PylonMissile_Missile_MICAIR_x1",
				"",
				"",
				"PylonRack_Bomb_GBU12_x2",
				"PylonRack_Bomb_GBU12_x2",
				"",
				"",
				"PylonRack_Missile_AGM_02_x1",
				"PylonRack_Missile_AGM_02_x1",
				"PylonRack_2Rnd_BombCluster_03_F"

			]],


			["B_FR_Mirage_2000_5F_01", [

				"PylonMissile_Missile_AA_R73_x1",
				"PylonMissile_Missile_AA_R77_x1",
				"PylonMissile_Bomb_GBU12_x1",
				"PylonMissile_Bomb_GBU12_x1",
				"PylonMissile_Missile_AA_R77_x1",
				"PylonMissile_Missile_AA_R73_x1",
				"PylonMissile_Bomb_GBU12_x1",
				"PylonMissile_Bomb_GBU12_x1"
				
			]],


			["B_AMF_PLANE_FIGHTER_02_F", [

				"PylonMissile_Missile_AA_R73_x1",
				"PylonMissile_Missile_AA_R77_x1",
				"PylonMissile_Bomb_GBU12_x1",
				"PylonMissile_Bomb_GBU12_x1",
				"PylonMissile_Missile_AA_R77_x1",
				"PylonMissile_Missile_AA_R73_x1",
				"PylonMissile_Missile_AA_R73_x1",
				"PylonMissile_Missile_AA_R73_x1"
				
			]],
			
			
			["sfp_jas39_gbu39", [

				'sfp_1x_rb98',
				'sfp_1x_rb98',
				'sfp_1x_rb99',
				'sfp_1x_rb99',
				'sfp_4rnd_gbu39',
				'sfp_4rnd_gbu39',
				'sfp_4rnd_gbu39'
				
			]],

			
			["sfp_jas39_bk90", [

				'sfp_1x_rb98',
				'sfp_1x_rb98',
				'sfp_1x_rb75',
				'sfp_1x_rb75',
				'FIR_EGBU12_P_2rnd_M',
				'FIR_EGBU12_P_2rnd_M',
				'sfp_1rnd_bk90'
				
			]],
			
			
			["sfp_jas39", [

				'sfp_1x_rb98',
				'sfp_1x_rb98',
				'sfp_1x_rb99',
				'sfp_1x_rb99',
				'FIR_EGBU12_P_2rnd_M',
				'FIR_EGBU12_P_2rnd_M',
				''
				
			]],
			
			
			["sfp_jas39_cap", [

				'sfp_1x_rb98',
				'sfp_1x_rb98',
				'sfp_1x_rb99',
				'sfp_1x_rb99',
				'FIR_EGBU12_P_2rnd_M',
				'FIR_EGBU12_P_2rnd_M',
				''
				
			]],
			
			
			["M346K_germania", [

				'FIR_AIM9L_P_1rnd_M_a346',
				'',
				'',
				'PylonMissile_1Rnd_Mk82_F',
				'PylonMissile_1Rnd_Mk82_F',
				'PylonMissile_1Rnd_Mk82_F',
				'PylonMissile_1Rnd_Mk82_F',
				'',
				'',
				'FIR_AIM9L_P_1rnd_M_a346'
				
			]],
			
			
			["M346K_itacap", [

				'FIR_AIM9L_P_1rnd_M_a346',
				'',
				'',
				'PylonMissile_1Rnd_Mk82_F',
				'PylonMissile_1Rnd_Mk82_F',
				'PylonMissile_1Rnd_Mk82_F',
				'PylonMissile_1Rnd_Mk82_F',
				'',
				'',
				'FIR_AIM9L_P_1rnd_M_a346'
				
			]],
			
			
			["M346K_spa", [

				'FIR_AIM9L_P_1rnd_M_a346',
				'',
				'',
				'PylonMissile_1Rnd_Mk82_F',
				'PylonMissile_1Rnd_Mk82_F',
				'PylonMissile_1Rnd_Mk82_F',
				'PylonMissile_1Rnd_Mk82_F',
				'',
				'',
				'FIR_AIM9L_P_1rnd_M_a346'
				
			]]
			
			
			
			
			
		];


{

	_vehiclePylonData = _x;

		
	// Set Loadout
	
		private ["_turret"];

		if (typeOf _veh == _vehiclePylonData select 0) then {

			_pylonLoadout = _vehiclePylonData select 1;
			
				if ((_veh isKindOf "UAV") or (_veh isKindOf "UAV_03_base_F")) then {
				
					for "_i" from 1 to (count _pylonLoadout) do {  

						_arrayPosition = _i - 1;
						_veh setPylonLoadout [_i, _pylonLoadout select _arrayPosition, true, [0]];  

					}; 
					
				}else{
					
					for "_i" from 1 to (count _pylonLoadout) do {  

						_arrayPosition = _i - 1;
						_veh setPylonLoadout [_i, _pylonLoadout select _arrayPosition, true];  

					}; 
				
				};

			
			
		};

} forEach _allVehiclePylonData;



		

	