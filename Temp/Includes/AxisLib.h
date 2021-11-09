/* Automation Studio generated header file */
/* Do not edit ! */
/* AxisLib 1.10.6 */

#ifndef _AXISLIB_
#define _AXISLIB_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _AxisLib_VERSION
#define _AxisLib_VERSION 1.10.6
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "AsBrStr.h"
		#include "NcGlobal.h"
		#include "Acp10_MC.h"
#endif
#ifdef _SG4
		#include "AsBrStr.h"
		#include "NcGlobal.h"
		#include "Acp10_MC.h"
#endif
#ifdef _SGC
		#include "AsBrStr.h"
		#include "NcGlobal.h"
		#include "Acp10_MC.h"
#endif


/* Constants */
#ifdef _REPLACE_CONST
 #define ret 0U
#else
 _GLOBAL_CONST unsigned long ret;
#endif




/* Datatypes and datatypes of function blocks */
typedef enum AxisStateStep_Enum
{	AXISSTATE_WAIT = 0,
	AXISSTATE_POWER_ON = 1,
	AXISSTATE_READY = 2,
	AXISSTATE_HOME = 3,
	AXISSTATE_HALT = 4,
	AXISSTATE_STOP = 5,
	AXISSTATE_MOVE_ABSOLUTE = 6,
	AXISSTATE_MOVE_ADDITIVE = 7,
	AXISSTATE_MOVE_VELOCITY = 8,
	AXISSTATE_MOVE_JOGPOS = 9,
	AXISSTATE_MOVE_TORQUE_CONTROL = 10,
	AXISSTATE_MOVE_JOGNEG = 11,
	AXISSTATE_ERROR_AXIS = 14,
	AXISSTATE_ERROR = 15,
	AXISSTATE_ERROR_RESET = 16,
	AXISSTATE_MOVE_VELOCITY_CONTROL = 20
} AxisStateStep_Enum;

typedef enum AxisStateInitStep_Enum
{	STATE_INIT = 0,
	STATE_WATCH = 1,
	STATE_SWITCHON = 2,
	STATE_HOME = 3,
	STATE_ERROR_HANDLE = 4
} AxisStateInitStep_Enum;

typedef struct AxisCommand_type
{	plcbit power;
	plcbit home;
	plcbit moveAbsolute;
	plcbit moveVelocity;
	plcbit moveAdditive;
	plcbit moveTorqueControl;
	plcbit moveVelocityControl;
	plcbit moveJogPos;
	plcbit moveJogNeg;
	plcbit halt;
	plcbit stop;
	plcbit errorAck;
	plcbit autoInicialization;
} AxisCommand_type;

typedef struct AxisParameterVelocityCtrl_type
{	float cyclicVelocity;
	float cyclicVelocityCorrection;
	float cyclicTorque;
	unsigned char TorqueMode;
	float sCtrlKv;
	float sCtrlTn;
	plcbit initSctrl;
} AxisParameterVelocityCtrl_type;

typedef struct AxisParameter_type
{	float acc;
	float dec;
	unsigned long axis;
	float position;
	float distance;
	float velocity;
	unsigned char direction;
	float torque;
	float torqueRamp;
	float homePos;
	unsigned char homeMode;
	plcbit blockMoveVelocity;
	struct AxisParameterVelocityCtrl_type velocityControl;
	float velocityJog;
} AxisParameter_type;

typedef struct AxisStatus_type
{	float ActTorque;
	float ActPosition;
	float ActVelocity;
	struct MC_DRIVESTATUS_TYP DriveStatus;
} AxisStatus_type;

typedef struct AxisState_type
{	plcbit Disabled;
	plcbit StandStill;
	plcbit Homing;
	plcbit Stopping;
	plcbit DiscreteMotion;
	plcbit ContinuousMotion;
	plcbit SynchronizedMotion;
	plcbit ErrorStop;
} AxisState_type;

typedef struct AxisError_type
{	unsigned short AxisErrorCount;
	unsigned short AxisWarningCount;
	unsigned short FunctionBlockErrorCount;
	struct MC_ERRORRECORD_REF ErrorRecord;
	plcstring ErrorText[4][80];
	unsigned long ErrorID;
	unsigned char ErrorStatus;
} AxisError_type;

typedef struct AxisInternal_type
{	struct MC_BR_ReadDriveStatus MC_BR_ReadDriveStatus_0;
	struct MC_ReadStatus MC_ReadStatus_0;
	struct MC_ReadActualPosition MC_ReadActualPosition_0;
	struct MC_ReadActualTorque MC_ReadActualTorque_0;
	struct MC_ReadActualVelocity MC_ReadActualVelocity_0;
	struct MC_ReadAxisError MC_ReadAxisError_0;
	struct MC_Reset MC_Reset_0;
	struct MC_Power MC_Power_0;
	struct MC_Home MC_Home_0;
	struct MC_Halt MC_Halt_0;
	struct MC_Stop MC_Stop_0;
	struct MC_MoveAdditive MC_MoveAdditive_0;
	struct MC_MoveAbsolute MC_MoveAbsolute_0;
	struct MC_MoveVelocity MC_MoveVelocity_0;
	struct MC_BR_VelocityControl MC_BR_VelocityControl_0;
	struct MC_TorqueControl MC_TorqueControl_0;
	struct MC_BR_BrakeOperation MC_BR_BrakeOperation_0;
	struct MC_BR_ReadParID MC_BR_ReadParID_0;
	struct MC_BR_WriteParID MC_BR_WriteParID_0;
	unsigned char AxisReadStep;
	enum AxisStateStep_Enum AxisStep;
	enum AxisStateInitStep_Enum InitStep;
	unsigned long errorOld;
	unsigned short TimeCheck;
	plcbit switch2;
	plcbit switch1;
	plcbit brakeMode;
} AxisInternal_type;

typedef struct AxisExtensionCommand_type
{	plcbit cmdRstEncoder;
	plcbit cmdReadTemp;
	plcbit cmdReadCurrent;
	plcbit cmdReadLagError;
	plcbit cmdBrakeToggle;
	plcbit cmdBrake;
	plcbit cmdUnbrake;
	plcbit cmdGetHwInfo;
} AxisExtensionCommand_type;

typedef struct AxisExtensionParameter_type
{	unsigned long axis;
} AxisExtensionParameter_type;

typedef struct AxisExtensionStatus_type
{	float ActMotorTemp;
	float ActMotorCurrent;
	float ActLagError;
	struct MC_HARDWARE_INFO_REF HardwareInfo;
} AxisExtensionStatus_type;

typedef struct AxisExtensionInternal_type
{	struct MC_BR_ReadParID MC_BR_ReadParID_0;
	struct MC_BR_WriteParID MC_BR_WriteParID_0;
	struct MC_BR_BrakeOperation MC_BR_BrakeOperation_0;
	struct MC_BR_GetHardwareInfo MC_BR_GetHardwareInfo_0;
	plcbit brakeMode;
	unsigned char AxisReadStep;
} AxisExtensionInternal_type;

typedef struct Axis
{
	/* VAR_INPUT (analog) */
	struct AxisCommand_type cmd;
	struct AxisParameter_type par;
	/* VAR_OUTPUT (analog) */
	unsigned long errorCount;
	unsigned long errorID;
	plcstring errorText[4][80];
	struct AxisStatus_type status;
	struct AxisState_type state;
	/* VAR (analog) */
	struct AxisInternal_type internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR_OUTPUT (digital) */
	plcbit active;
	plcbit busy;
	plcbit error;
} Axis_typ;

typedef struct AxisExtension
{
	/* VAR_INPUT (analog) */
	struct AxisExtensionCommand_type cmd;
	struct AxisExtensionParameter_type par;
	/* VAR_OUTPUT (analog) */
	struct AxisExtensionStatus_type status;
	unsigned long errorID;
	/* VAR (analog) */
	struct AxisExtensionInternal_type internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR_OUTPUT (digital) */
	plcbit active;
} AxisExtension_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void Axis(struct Axis* inst);
_BUR_PUBLIC void AxisExtension(struct AxisExtension* inst);


#ifdef __cplusplus
};
#endif
#endif /* _AXISLIB_ */

