#ifndef VOLTAGE_RESPONSE_H_
#define VOLTAGE_RESPONSE_H_
#include "data_structures.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <math.h>
#include "system_parameters.h"



//--------------------------------------------------------------
// Defines for Volt-Watt response modes
// These defines could be translated to a struct (likely will be)
//--------------------------------------------------------------
#define WATTS_RATED 30000                   // Rated Maximum Real Power of Unit
#define VW_MIN_POWER 0.2*WATTS_RATED        // Minimum output real power full derated
#define V_W1 253.0                            // volt watt 1 - lower limit
#define V_W2 260.0                            // volt watt 2 - upper limit
#define K_watt (double) (0.8*WATTS_RATED / (V_W2 - V_W1))  // derating slope in volt watt mode

//--------------------------------------------------------------
// Defines for Volt-Var response modes
// These defines could be translated to a struct (likely will be)
//--------------------------------------------------------------
#define KVA_RATED 30000
#define VV_MAX_VAR_ABSORB 0.60*KVA_RATED    // max (VAR / KVA) in absorbing mode
#define VV_MAX_VAR_DELIVER 0.45*KVA_RATED   // max (VAR / KVA) in delivery mode
#define V_V1 207                            // volt var 1 - lower limit voltage, delivering
#define V_V2 220                            // volt var 2 - upper limit voltage, delivering
#define V_V3 240                            // volt var 3 - lower limit voltage, absorbing
#define V_V4 258                            // volt var 4 - lower limit voltage, absorbing
#define K_var_deliver (double) VV_MAX_VAR_DELIVER / (V_V2 - V_V1)   // derating slope in delivering mode
#define K_var_absorb (double) VV_MAX_VAR_ABSORB / (V_V4 - V_V3)  // derating slope in absorbing mode

#define V_W1_CH 207                         // volt watt 1 charge - lower limit
#define V_W2_CH 215                         // volt watt 2 charge - upper limit 
#define VW_MIN_POWER_MULTI VW_MIN_POWER     // Minimum power absorbed in multi-mode 
#define K_watt_multi (WATTS_RATED - VW_MIN_POWER_MULTI) / (V_W2_CH - V_W1_CH) // derating slope multi mode




///=======================================================
///  \brief    Process the sampled data
///  \detailed Operate on the intput_t* gInput data structure,
///            where rms is computed and compared to thresholds.
///            The return type is void, as the function
///            works on a structure pointer.
///
///            Relative AS4777 specifications are
///            1) Table 3.6 Volt-Watt response default set point values
///            2) Table 3.7 Volt-Var response set point values
///            3) Table 3.8 Volt-Watt response multi-mode inverters
///
///            Also, the derating factors are:
///            1. K_wwatt - derating constant for volt-watt
///            2. K_var_absorb  - derating volt-var absorbing
///            3. K_var_deliver - derating volt-var delivery
///            3. K_V - derating constant for volt-watt-var mode
///=======================================================
//void volt_Response(input_t *gInput, cmd_t *gCommand);




#endif
