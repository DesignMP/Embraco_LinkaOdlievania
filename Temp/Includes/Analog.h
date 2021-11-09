/* Automation Studio generated header file */
/* Do not edit ! */
/* Analog 1.00.3 */

#ifndef _ANALOG_
#define _ANALOG_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _Analog_VERSION
#define _Analog_VERSION 1.00.3
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct Analog_Internal_typ
{	signed long RangeIN;
	float RangePHYS;
} Analog_Internal_typ;

typedef struct Analog
{
	/* VAR_INPUT (analog) */
	signed long IN;
	signed long IN_LO_LIM;
	signed long IN_HI_HIM;
	float PHYS_LO_LIM;
	float PHYS_HI_LIM;
	float CALIBRATON_CONST;
	float PRECISION;
	/* VAR_OUTPUT (analog) */
	float Out;
	float OutCalibred;
	/* VAR (analog) */
	struct Analog_Internal_typ Internal;
	/* VAR_INPUT (digital) */
	plcbit ENABLE;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit Error;
} Analog_typ;

typedef struct AnalogOut
{
	/* VAR_INPUT (analog) */
	float IN;
	signed short IN_LO_LIM;
	signed short IN_HI_HIM;
	float PHYS_LO_LIM;
	float PHYS_HI_LIM;
	signed short CALIBRATON_CONST;
	/* VAR_OUTPUT (analog) */
	signed short Out;
	signed short OutCalibred;
	/* VAR (analog) */
	struct Analog_Internal_typ Internal;
	/* VAR_INPUT (digital) */
	plcbit ENABLE;
} AnalogOut_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void Analog(struct Analog* inst);
_BUR_PUBLIC void AnalogOut(struct AnalogOut* inst);


#ifdef __cplusplus
};
#endif
#endif /* _ANALOG_ */

