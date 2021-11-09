(* ********************************************************************
  * COPYRIGHT -- Bernecker + Rainer
  ********************************************************************
  * Author: Milan Jun
  * Created: May 28, 2014
  *********************************************************************)
(**)
(*Axes structures*)

TYPE
	AxisCommand_type : 	STRUCT  (*Command structure for single axis.*)
		power : BOOL; (*Switch on the controller.*)
		home : BOOL; (*Reference axis.*)
		moveAbsolute : BOOL; (*Move to a defined position.*)
		moveVelocity : BOOL; (*Move with a defined speed.*)
		moveAdditive : BOOL; (*Move a defined distance.*)
		moveTorqueControl : BOOL; (*Move torque control.*)
		moveVelocityControl : BOOL; (*Move cyclic velocity*)
		moveJogPos : BOOL; (*Move jog positive.*)
		moveJogNeg : BOOL; (*Move jog negative.*)
		halt : BOOL; (*Stop every active movement on the axis.*)
		stop : BOOL; (*Stop every active movement on the axis as long as is set.*)
		errorAck : BOOL; (*Error acknowledge.*)
		autoInicialization : BOOL; (*Automatic inicialization ( power-home-ack error ).*)
	END_STRUCT;
	AxisParameterVelocityCtrl_type : 	STRUCT  (*Specific structure for velocity control fb*)
		cyclicVelocity : REAL; (*Velocity for MoveVelocity-Command.*)
		cyclicVelocityCorrection : REAL;
		cyclicTorque : REAL; (*Velocity for MoveVelocity-Command.*)
		TorqueMode : USINT; (*VelocityControl torque mode*)
		sCtrlKv : REAL; (*VelocityControl proporcional part*)
		sCtrlTn : REAL; (*VelocityControl integration part*)
		initSctrl : BOOL;
	END_STRUCT;
	AxisParameter_type : 	STRUCT  (*Parameter structure.*)
		acc : REAL; (*Acceleration for commanded movements.*)
		dec : REAL; (*Deceleration for commanded movements.*)
		axis : UDINT; (*Axis reference.*)
		position : REAL; (*Target position for MoveAbsolute-Command.*)
		distance : REAL; (*Distance for MoveAdditive-Command.*)
		velocity : REAL; (*Velocity for MoveVelocity-Command.*)
		direction : USINT; (*Direction for commanded movements.*)
		torque : REAL;
		torqueRamp : REAL;
		homePos : REAL; (*Target position for referencing the axis.*)
		homeMode : USINT; (*Homing mode.*)
		blockMoveVelocity : BOOL; (*Block in move velocity step*)
		velocityControl : AxisParameterVelocityCtrl_type;
		velocityJog : REAL; (*Velocity joggingu*)
	END_STRUCT;
	AxisStatus_type : 	STRUCT  (*Status structure.*)
		ActTorque : REAL; (*Actual position of the axis.*)
		ActPosition : REAL; (*Actual position of the axis.*)
		ActVelocity : REAL; (*Actual velocity of the axis.*)
		DriveStatus : MC_DRIVESTATUS_TYP; (*Actual status of the axis.*)
	END_STRUCT;
	AxisState_type : 	STRUCT  (*Axis state structure.*)
		Disabled : BOOL; (*If set, axis is in state Disabled.*)
		StandStill : BOOL; (*If set, axis is in state StandsStill.*)
		Homing : BOOL; (*if set, axis is in state Homing.*)
		Stopping : BOOL; (*If set, axis is in state Stopping.*)
		DiscreteMotion : BOOL; (*If set, axis is in state DiscreteMotion.*)
		ContinuousMotion : BOOL; (*If set, axis is in state ContinuousMotion.*)
		SynchronizedMotion : BOOL; (*If set, axis is in state SynchronizedMotion.*)
		ErrorStop : BOOL; (*If set, axis is in state ErrorStop.*)
	END_STRUCT;
	AxisError_type : 	STRUCT  (*Error structure.*)
		AxisErrorCount : UINT; (*Number of active axis errors.*)
		AxisWarningCount : UINT; (*Number of active axis warinings.*)
		FunctionBlockErrorCount : UINT; (*Number of active function block errors.*)
		ErrorRecord : MC_ERRORRECORD_REF; (*Error record information.*)
		ErrorText : ARRAY[0..3]OF STRING[79]; (*Description of first active error or warning.*)
		ErrorID : UDINT;
		ErrorStatus : USINT;
	END_STRUCT;
	AxisInternal_type : 	STRUCT  (*Axis internal type, all used function blocks and internal variables*)
		MC_BR_ReadDriveStatus_0 : MC_BR_ReadDriveStatus;
		MC_ReadStatus_0 : MC_ReadStatus;
		MC_ReadActualPosition_0 : MC_ReadActualPosition;
		MC_ReadActualTorque_0 : MC_ReadActualTorque;
		MC_ReadActualVelocity_0 : MC_ReadActualVelocity;
		MC_ReadAxisError_0 : MC_ReadAxisError;
		MC_Reset_0 : MC_Reset;
		MC_Power_0 : MC_Power;
		MC_Home_0 : MC_Home;
		MC_Halt_0 : MC_Halt;
		MC_Stop_0 : MC_Stop;
		MC_MoveAdditive_0 : MC_MoveAdditive;
		MC_MoveAbsolute_0 : MC_MoveAbsolute;
		MC_MoveVelocity_0 : MC_MoveVelocity;
		MC_BR_VelocityControl_0 : MC_BR_VelocityControl;
		MC_TorqueControl_0 : MC_TorqueControl;
		MC_BR_BrakeOperation_0 : MC_BR_BrakeOperation;
		MC_BR_ReadParID_0 : MC_BR_ReadParID;
		MC_BR_WriteParID_0 : MC_BR_WriteParID;
		AxisReadStep : USINT;
		AxisStep : AxisStateStep_Enum;
		InitStep : AxisStateInitStep_Enum;
		errorOld : UDINT;
		TimeCheck : UINT;
		switch2 : BOOL;
		switch1 : BOOL;
		brakeMode : BOOL;
	END_STRUCT;
END_TYPE

(**)
(*Axes enumeration*)

TYPE
	AxisStateStep_Enum : 
		(
		AXISSTATE_WAIT := 0,
		AXISSTATE_POWER_ON := 1,
		AXISSTATE_READY := 2,
		AXISSTATE_HOME := 3,
		AXISSTATE_HALT := 4,
		AXISSTATE_STOP := 5,
		AXISSTATE_MOVE_ABSOLUTE := 6,
		AXISSTATE_MOVE_ADDITIVE := 7,
		AXISSTATE_MOVE_VELOCITY := 8,
		AXISSTATE_MOVE_JOGPOS := 9,
		AXISSTATE_MOVE_TORQUE_CONTROL := 10,
		AXISSTATE_MOVE_JOGNEG := 11,
		AXISSTATE_ERROR_AXIS := 14,
		AXISSTATE_ERROR := 15,
		AXISSTATE_ERROR_RESET := 16,
		AXISSTATE_MOVE_VELOCITY_CONTROL := 20
		);
	AxisStateInitStep_Enum : 
		(
		STATE_INIT := 0,
		STATE_WATCH := 1,
		STATE_SWITCHON := 2,
		STATE_HOME := 3,
		STATE_ERROR_HANDLE := 4
		);
END_TYPE

(**)
(*Axis extension*)

TYPE
	AxisExtensionCommand_type : 	STRUCT 
		cmdRstEncoder : BOOL;
		cmdReadTemp : BOOL;
		cmdReadCurrent : BOOL;
		cmdReadLagError : BOOL;
		cmdBrakeToggle : BOOL;
		cmdBrake : BOOL;
		cmdUnbrake : BOOL;
		cmdGetHwInfo : BOOL;
	END_STRUCT;
	AxisExtensionParameter_type : 	STRUCT 
		axis : UDINT; (*Axis reference.*)
	END_STRUCT;
	AxisExtensionStatus_type : 	STRUCT 
		ActMotorTemp : REAL; (*Actual motor temperature*)
		ActMotorCurrent : REAL; (*Actual motor current*)
		ActLagError : REAL;
		HardwareInfo : MC_HARDWARE_INFO_REF;
	END_STRUCT;
	AxisExtensionInternal_type : 	STRUCT 
		MC_BR_ReadParID_0 : MC_BR_ReadParID;
		MC_BR_WriteParID_0 : MC_BR_WriteParID;
		MC_BR_BrakeOperation_0 : MC_BR_BrakeOperation;
		MC_BR_GetHardwareInfo_0 : MC_BR_GetHardwareInfo;
		brakeMode : BOOL;
		AxisReadStep : USINT;
	END_STRUCT;
END_TYPE
