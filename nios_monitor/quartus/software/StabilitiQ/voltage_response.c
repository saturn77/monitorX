
#include "voltage_response.h"


//void volt_Response(input_t *gInput, cmd_t *gCommand){
//
//	input_t sampled_data;
//	sampled_data = *gInput;
//	cmd_t cmd_value;
//	cmd_value = *gCommand;
//
//	sampled_data.rms = sampled_data.rms * RECIP_SQRT_3  ;
//
//	if (gMode == Volt_Watt || gMode == Volt_Watt_Var){
//		if ( sampled_data.rms > V_W2  ) {
//			cmd_value.active_power = VW_MIN_POWER;
//		}
//		else if (sampled_data.rms > V_W1 ){
//			cmd_value.active_power = WATTS_RATED - (K_watt*sampled_data.rms);
//		}
//		else {
//			cmd_value.active_power = 1000;
//		}
//		if (gMode == Volt_Watt_Var) {
//			if ( sampled_data.rms < V_V1  ) {
//				cmd_value.reactive_power = VV_MAX_VAR_ABSORB;
//			}
//			else if ( (sampled_data.rms > V_V1) && (sampled_data.rms < V_V2) ){
//				cmd_value.reactive_power = VV_MAX_VAR_ABSORB - (K_var_absorb*sampled_data.rms);
//			}
//			else if  ( (sampled_data.rms > V_V2) && (sampled_data.rms < V_V3) ){
//				cmd_value.reactive_power = 0;
//			}
//			else if ( (sampled_data.rms > V_V3) && (sampled_data.rms < V_V4) ){
//				cmd_value.reactive_power = 0 - (K_var_deliver*sampled_data.rms);
//			}
//			else {
//				cmd_value.reactive_power = VV_MAX_VAR_DELIVER;
//			}
//		}
//	}
//
//	// Volt-Watt multi-mode has charging characteristics
//	if (gMode == Volt_Watt_Multimode) {
//			if ( sampled_data.rms < V_W1_CH  ) {
//				cmd_value.active_power = VW_MIN_POWER_MULTI;
//			}
//			else if ( (sampled_data.rms > V_W1_CH) && (sampled_data.rms < V_W2_CH) ){
//				cmd_value.active_power = VW_MIN_POWER_MULTI + ( K_watt_multi*sampled_data.rms );
//			}
//			else {
//				cmd_value.active_power = WATTS_RATED;
//			}
//	}
//
//	*gInput = sampled_data;
//	*gCommand = cmd_value;
//}
