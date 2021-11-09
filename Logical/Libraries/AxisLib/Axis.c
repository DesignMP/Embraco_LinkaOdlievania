 /********************************************************************
  * COPYRIGHT -- Bernecker + Rainer
  ********************************************************************
  * Author: Milan Jun
  * Created: May 28, 2014
  ********************************************************************/

#include <bur/plctypes.h>
#ifdef __cplusplus
	extern "C"
	{
#endif

#include "AxisLib.h"

#ifdef __cplusplus
	};
#endif

#define TRUE	1      /* Allways true */
#define FALSE 	0      /* Allways false */
#define DELAY   100    /* Delay time, it is dependence on cycle time */

/* Disabled all commands and executes */
void AxisDisableCmd (struct Axis* inst)
{
 
	/* RESET ALL FB EXECUTE/ENABLE INPUT */ 
	inst->internal.MC_Power_0.Enable = FALSE;
	inst->internal.MC_Home_0.Execute = FALSE;
	inst->internal.MC_Halt_0.Execute = FALSE;
	inst->internal.MC_Stop_0.Execute = FALSE;
	inst->internal.MC_MoveAbsolute_0.Execute = FALSE;
	inst->internal.MC_MoveAdditive_0.Execute = FALSE;
	inst->internal.MC_MoveVelocity_0.Execute = FALSE;
	inst->internal.MC_TorqueControl_0.Execute = FALSE;
	inst->internal.MC_BR_VelocityControl_0.Enable = FALSE;
 
	/* RESET USER COMMANDS */ 		
	inst->cmd.home = FALSE;
	inst->cmd.halt = FALSE;
	inst->cmd.stop = FALSE;
	inst->cmd.moveAbsolute = FALSE;
	inst->cmd.moveAdditive = FALSE;
	inst->cmd.moveVelocity = FALSE;
	inst->cmd.moveVelocityControl = FALSE; 
	inst->cmd.moveTorqueControl = FALSE;
	inst->cmd.moveJogPos = FALSE;
	inst->cmd.moveJogNeg = FALSE;	
	inst->cmd.moveTorqueControl = FALSE;
	// inst->cmd.autoInicialization = FALSE;
	inst->errorID = FALSE;	
 
}

/* Disabled all commands and executes */
void AxisAutoInicialization (struct Axis* inst)
{
 /* *************************************************************** * 
 * ************** AUTO INICIALIZATION ENABLED ******************** *
 * *************************************************************** */
	switch (inst->internal.InitStep)
	{
  
		/* Init state */
		case STATE_INIT:
			inst->cmd.errorAck = FALSE;
			inst->internal.switch1 = FALSE;
			inst->internal.switch2 = FALSE;
			inst->internal.TimeCheck = 0;
			inst->internal.InitStep = STATE_WATCH;	
			break;
		
		/* Wait for action, homing, power, error acknowledge */
		case STATE_WATCH:
			
			//   if ( (inst->status.DriveStatus.NetworkInit == TRUE) && 
			//   (inst->status.DriveStatus.HomingOk == FALSE) && 
			//   (inst->status.DriveStatus.ControllerStatus == TRUE) && 
			//   (inst->state.ErrorStop == FALSE) && 
			//			(inst->status.DriveStatus.AxisError == FALSE)	)
			//   {   
			//    inst->internal.InitStep = STATE_HOME;
			//   }
			
			if ((inst->status.DriveStatus.NetworkInit == TRUE) && 
				(inst->status.DriveStatus.ControllerReady == TRUE) && 
				(inst->status.DriveStatus.ControllerStatus == FALSE) && 
				(inst->state.ErrorStop == FALSE) && 
				(inst->status.DriveStatus.AxisError == FALSE)	)
			{
				inst->internal.InitStep = STATE_SWITCHON;
			}
			
			if ((inst->status.DriveStatus.NetworkInit == TRUE) && ((inst->state.ErrorStop == TRUE) || (inst->status.DriveStatus.AxisError == TRUE) || (inst->errorID!=0)))
			{
				inst->internal.InitStep = STATE_ERROR_HANDLE;
			}
			break;
		
		/* State: homing */
		case STATE_HOME:
			
			if (inst->internal.switch1 == FALSE)
			{
				inst->cmd.home = TRUE;
				inst->internal.switch1 = TRUE;
			}
    
			if (inst->status.DriveStatus.HomingOk == TRUE)
			{
			inst->internal.InitStep = STATE_INIT;
			}
    
			inst->internal.TimeCheck = inst->internal.TimeCheck + 1;
     
			if (inst->internal.TimeCheck == DELAY) 
			{
				inst->internal.InitStep = STATE_INIT;
				inst->internal.TimeCheck = 0;
			}
			break;
		
		/* State: switching on */
		case STATE_SWITCHON:
			
			if (inst->internal.switch1 == FALSE)
			{
				inst->cmd.power = TRUE;
				inst->internal.switch1 = TRUE;
			}
			
			if (inst->status.DriveStatus.ControllerStatus == TRUE)
			{
			inst->internal.InitStep = STATE_INIT;
			}	

			inst->internal.TimeCheck = inst->internal.TimeCheck + 1;
     
			if (inst->internal.TimeCheck == DELAY)
			{
				inst->internal.InitStep = STATE_INIT;
				inst->internal.TimeCheck = 0;
			}
			break;
		
		/* State: automatic error acknowledge */
		case STATE_ERROR_HANDLE:
			
			inst->internal.errorOld = inst->errorID;
			
			if (inst->internal.switch1 == FALSE)
			{
			//inst->cmd.power = FALSE;
			inst->internal.switch1 = TRUE;
			}

			if ((inst->internal.switch1 == TRUE) && (inst->internal.switch2 == FALSE))
			{
			inst->cmd.errorAck = TRUE;
			inst->internal.switch2 = TRUE;
			}
  	
			if (inst->internal.errorOld != inst->errorID)
			{
				inst->internal.errorOld = FALSE;
				inst->cmd.errorAck = FALSE;
				inst->internal.InitStep = STATE_INIT;
			}
    
			inst->internal.TimeCheck = inst->internal.TimeCheck + 1;
     
			if (inst->internal.TimeCheck == DELAY)
			{
				inst->internal.InitStep = STATE_INIT;
				inst->internal.TimeCheck = 0;
			}
			break;
   
	} /* END AutoInicialization enabled */
   
} /* END AutoInicialization disabled */


/* *************************************************************** * 
 * ************************ AXIS CONTROL ************************* *
 * *************************************************************** */
void Axis(struct Axis* inst) 
{
 
	/* Function Block is Enabled */
	if (inst->enable == TRUE){
		
		/* Function block active, when network iniciaization is true */
		if ( inst->status.DriveStatus.NetworkInit == TRUE ) 
		{
			inst->busy = FALSE;
			inst->active = TRUE;
		}
		else 
		{
			inst->busy = TRUE;
			inst->active = FALSE;
		}
  
  /* *************************************************************** * 
   * ************** AUTO INICIALIZATION DISABLED ******************* *
   * *************************************************************** */

		if ( inst->cmd.autoInicialization == FALSE ) 
		{
			inst->internal.switch1 = FALSE;
			inst->internal.TimeCheck = 0;
			inst->internal.InitStep = STATE_INIT;
		}
		else AxisAutoInicialization(inst);  
  
  /* ******************** *
   * MC READ DRIVE STATUS *
   * ******************** */
		inst->internal.MC_BR_ReadDriveStatus_0.Enable = !inst->internal.MC_BR_ReadDriveStatus_0.Error;
		inst->internal.MC_BR_ReadDriveStatus_0.Axis = inst->par.axis;
		inst->internal.MC_BR_ReadDriveStatus_0.AdrDriveStatus = (UDINT)&inst->status.DriveStatus; 
		
  /* ************** *
   * MC READ STATUS 
   * ************** */
		inst->internal.MC_ReadStatus_0.Enable = !inst->internal.MC_ReadStatus_0.Error;
		inst->internal.MC_ReadStatus_0.Axis = inst->par.axis;
  
		/* MC READ ACTUAL POSITION */
		inst->internal.MC_ReadActualPosition_0.Enable = (!inst->internal.MC_ReadActualPosition_0.Error);
		inst->internal.MC_ReadActualPosition_0.Axis = inst->par.axis;
		
		if (inst->internal.MC_ReadActualPosition_0.Valid == TRUE)
		{
			inst->status.ActPosition = inst->internal.MC_ReadActualPosition_0.Position;
		}

		/* MC READ ACTUAL VELOCITY */
		inst->internal.MC_ReadActualVelocity_0.Enable = (!inst->internal.MC_ReadActualVelocity_0.Error);
		inst->internal.MC_ReadActualVelocity_0.Axis = inst->par.axis;
		
		if(inst->internal.MC_ReadActualVelocity_0.Valid == TRUE)
		{
			inst->status.ActVelocity = inst->internal.MC_ReadActualVelocity_0.Velocity;
		}

		/* MC READ ACTUAL TORQUE */
		inst->internal.MC_ReadActualTorque_0.Enable = (!inst->internal.MC_ReadActualTorque_0.Error);
		inst->internal.MC_ReadActualTorque_0.Axis = inst->par.axis;

		if(inst->internal.MC_ReadActualTorque_0.Valid == TRUE)
		{
			inst->status.ActTorque = inst->internal.MC_ReadActualTorque_0.Torque;
		}
		
		/* MC READ AXIS ERROR */
		inst->internal.MC_ReadAxisError_0.Enable = !inst->internal.MC_ReadAxisError_0.Error;
		inst->internal.MC_ReadAxisError_0.Axis = inst->par.axis;
		inst->internal.MC_ReadAxisError_0.DataAddress = (UDINT)&(inst->errorText);
		inst->internal.MC_ReadAxisError_0.DataLength = sizeof(inst->errorText);
		brsstrcpy((void*)&inst->internal.MC_ReadAxisError_0.DataObjectName, "acp10etxen");
		
		/* CHECK FOR GENERAL AXIS ERROR */
		if ((inst->internal.MC_ReadAxisError_0.AxisErrorID != FALSE) && 
			(inst->internal.MC_ReadAxisError_0.Valid == TRUE)) 
		{
			inst->internal.AxisStep = AXISSTATE_ERROR_AXIS;
		}
		
		/* Main Cyclic Part */
			
		if ( inst->cmd.power == FALSE )
		{
			inst->internal.MC_Power_0.Enable = FALSE;
			inst->internal.AxisStep = AXISSTATE_WAIT;
		}
			
		/* State machine for axis */
		switch (inst->internal.AxisStep) 
		{
			/* STATE WAIT FOR POWERON */
			case AXISSTATE_WAIT:
    
				/* WAIT FOR POWERON COMMAND */
				if (inst->cmd.power == TRUE) {
					inst->internal.AxisStep = AXISSTATE_POWER_ON;
				}
				else {
					inst->internal.MC_Power_0.Enable = FALSE;
				}
				
				AxisDisableCmd(inst);
		
				break;
							
   /* *************************************************************** * 
    * ************************ STATE POWER ON *********************** *
    * *************************************************************** */
			case AXISSTATE_POWER_ON:
				inst->internal.MC_Power_0.Axis = inst->par.axis;
				inst->internal.MC_Power_0.Enable = TRUE;
					
				/* Check staus ok */
				if (inst->internal.MC_Power_0.Status == TRUE) {
					inst->internal.AxisStep = AXISSTATE_READY;	 
				}
				/* Check a power error, then go to error state */
				if (inst->internal.MC_Power_0.Error == TRUE) {
					inst->errorID = inst->internal.MC_Power_0.ErrorID;
					inst->internal.AxisStep = AXISSTATE_ERROR;
				}
				break;
			/* ************************************************************** */
   
			/* ************************************************************** * 
			* ************************* STATE READY ************************* *
			* *************************************************************** */
			case AXISSTATE_READY:
				if (inst->cmd.home == TRUE) {
					inst->internal.AxisStep = AXISSTATE_HOME;	 
				}
    
				else if (inst->cmd.stop == TRUE) {
					inst->cmd.stop = FALSE;
					inst->internal.AxisStep = AXISSTATE_STOP;
				}
					else if (inst->cmd.moveAbsolute == TRUE) {
						inst->cmd.moveAbsolute = FALSE;
						inst->internal.AxisStep = AXISSTATE_MOVE_ABSOLUTE;
					}
						else if (inst->cmd.moveAdditive == TRUE) {
							inst->cmd.moveAdditive = FALSE;
							inst->internal.AxisStep = AXISSTATE_MOVE_ADDITIVE;
						}
							else if (inst->cmd.moveVelocity == TRUE && inst->par.blockMoveVelocity == FALSE) {
								inst->cmd.moveVelocity = FALSE;
								inst->internal.AxisStep = AXISSTATE_MOVE_VELOCITY;
							}
								else if (inst->cmd.moveJogPos == TRUE) {
									inst->cmd.moveVelocity = FALSE;
									inst->internal.AxisStep = AXISSTATE_MOVE_JOGPOS;
								}
									else if (inst->cmd.moveJogNeg == TRUE) {
										inst->cmd.moveVelocity = FALSE;
										inst->internal.AxisStep = AXISSTATE_MOVE_JOGNEG;
									}
										else if (inst->cmd.moveTorqueControl == TRUE) {
											inst->cmd.moveTorqueControl = FALSE;
											inst->internal.AxisStep = AXISSTATE_MOVE_TORQUE_CONTROL;
										}  
											else if (inst->cmd.moveVelocityControl == TRUE) {
												inst->cmd.moveVelocityControl = FALSE;
												inst->internal.AxisStep = AXISSTATE_MOVE_VELOCITY_CONTROL;
											}  
												else if (inst->cmd.halt == TRUE) {
													inst->cmd.halt = FALSE;
													inst->internal.AxisStep = AXISSTATE_HALT;
												}
				break;
				
   /* ************************************************************** * 
   * ************************** STATE HOME ************************* *
   * *************************************************************** */
			case AXISSTATE_HOME:
				inst->internal.MC_Home_0.Axis = inst->par.axis;
				inst->internal.MC_Home_0.Position = inst->par.homePos;
				inst->internal.MC_Home_0.HomingMode = inst->par.homeMode;
				inst->internal.MC_Home_0.Execute = TRUE;
				
				/* Check status done */
				if (inst->internal.MC_Home_0.Done == TRUE) {
					inst->cmd.home = FALSE;
					inst->internal.MC_Home_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_READY;
				}		
				
				
				
				/*Check command stop*/
				if (inst->cmd.stop == TRUE) {
					inst->cmd.home = FALSE;
					inst->cmd.stop = FALSE;
					inst->internal.MC_Home_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_STOP;
				}
				
				/* Check command halt */
				if	(inst->cmd.halt == TRUE) {
					inst->cmd.moveAbsolute = FALSE;
					inst->cmd.halt = FALSE;
					inst->internal.MC_MoveAbsolute_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_HALT;
				}			
				
				/* Check a homing error, then go to error state */
				if (inst->internal.MC_Home_0.Error == TRUE) {
					inst->internal.MC_Home_0.Execute = FALSE;
					inst->errorID = inst->internal.MC_Home_0.ErrorID;
					inst->internal.AxisStep = AXISSTATE_ERROR;					 
				}
				break;
				
   /* ************************************************************** * 
   * ************************** STATE HALT ************************* *
   * *************************************************************** */
			case AXISSTATE_HALT:
				inst->internal.MC_Halt_0.Axis = inst->par.axis;
				inst->internal.MC_Halt_0.Deceleration = inst->par.dec;
				inst->internal.MC_Halt_0.Execute = TRUE;
			
				/* Check status done */
				if (inst->internal.MC_Halt_0.Done == TRUE) {
					inst->internal.MC_Halt_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_READY;
				}
				/* Check status command aborted */
				else if (inst->internal.MC_Halt_0.CommandAborted == TRUE) {
					inst->internal.MC_Halt_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_HALT;
				}
				/* Check a halt error, then go to error state */
				if (inst->internal.MC_Halt_0.Error == TRUE) {
					inst->internal.MC_Halt_0.Execute = FALSE;
					inst->errorID = inst->internal.MC_Home_0.ErrorID;
					inst->internal.AxisStep = AXISSTATE_ERROR;
				}
				break;
			
   /* ************************************************************** * 
   * ************************** STATE STOP ************************* *
   * *************************************************************** */
			case AXISSTATE_STOP:
				inst->internal.MC_Stop_0.Axis = inst->par.axis;
				inst->internal.MC_Stop_0.Deceleration = inst->par.dec;
				inst->internal.MC_Stop_0.Execute = TRUE;
				
				/* Check status ok */
				if ((inst->internal.MC_Stop_0.Done == TRUE) && (inst->cmd.stop == FALSE))
				{
					inst->internal.MC_Stop_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_READY;
				}
				/* Check status command aborted */
				else if (inst->internal.MC_Stop_0.CommandAborted == TRUE) {
					inst->internal.MC_Stop_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_STOP;
				}
				/* Check a stop error, then go to error state */
				if (inst->internal.MC_Stop_0.Error == TRUE)
				{
					inst->internal.MC_Stop_0.Execute = FALSE;
					inst->errorID = inst->internal.MC_Stop_0.ErrorID;
					inst->internal.AxisStep = AXISSTATE_ERROR;
				}
				break;

   /* ************************************************************** * 
   * ********************** STATE MOVE ABSOLUTE ******************** *
   * *************************************************************** */
			case AXISSTATE_MOVE_ABSOLUTE:
				inst->internal.MC_MoveAbsolute_0.Axis = inst->par.axis;
				inst->internal.MC_MoveAbsolute_0.Position = inst->par.position;
				inst->internal.MC_MoveAbsolute_0.Velocity = inst->par.velocity;
				inst->internal.MC_MoveAbsolute_0.Acceleration = inst->par.acc;
				inst->internal.MC_MoveAbsolute_0.Deceleration = inst->par.dec;
				inst->internal.MC_MoveAbsolute_0.Direction = inst->par.direction;
				inst->internal.MC_MoveAbsolute_0.Execute = TRUE;
			
				
				/* Check status done */
				if (inst->internal.MC_MoveAbsolute_0.Done == TRUE) {
					inst->internal.MC_MoveAbsolute_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_READY;
				}
				
				/* Check command halt */
				if	(inst->cmd.halt == TRUE) {
					inst->cmd.moveAbsolute = FALSE;
					inst->cmd.halt = FALSE;
					inst->internal.MC_MoveAbsolute_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_HALT;
				}
			
				
				/*Check command stop*/
				if (inst->cmd.stop == TRUE) {
					inst->cmd.moveAbsolute = FALSE;
					inst->cmd.stop = FALSE;
					inst->internal.MC_MoveAbsolute_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_STOP;
				}
				
				
				
				/* Check a halt error, then go to error state */
				if (inst->internal.MC_MoveAbsolute_0.Error == TRUE)
				{
					inst->internal.MC_MoveAbsolute_0.Execute = FALSE;
					inst->errorID = inst->internal.MC_MoveAbsolute_0.ErrorID;
					inst->internal.AxisStep = AXISSTATE_ERROR;
				}
				break;

   /* ************************************************************** * 
   * ********************** STATE MOVE ADDITIVE ******************** *
   * *************************************************************** */
			case AXISSTATE_MOVE_ADDITIVE:
				inst->internal.MC_MoveAdditive_0.Axis = inst->par.axis;
				inst->internal.MC_MoveAdditive_0.Velocity = inst->par.velocity;
				inst->internal.MC_MoveAdditive_0.Distance = inst->par.distance;
				inst->internal.MC_MoveAdditive_0.Acceleration = inst->par.acc;
				inst->internal.MC_MoveAdditive_0.Deceleration = inst->par.dec;
				inst->internal.MC_MoveAdditive_0.Execute = TRUE;
			
				/*Check command stop*/
				if (inst->cmd.stop == TRUE) {
					inst->cmd.moveAdditive = FALSE;
					inst->cmd.stop = FALSE;
					inst->internal.MC_MoveAdditive_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_STOP;
				}
				
				
				
				/* Check status ok */
				if (inst->cmd.halt == TRUE)
				{
					inst->cmd.halt = FALSE;
					inst->internal.MC_MoveAdditive_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_HALT;
				}
				else if (inst->internal.MC_MoveAdditive_0.Done == TRUE)
				{
					inst->internal.MC_MoveAdditive_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_READY;
				}
				/* Check a halt error, then go to error state */
				if (inst->internal.MC_MoveAdditive_0.Error == TRUE)
				{
					inst->internal.MC_MoveAdditive_0.Execute = FALSE;
					inst->errorID = inst->internal.MC_MoveAdditive_0.ErrorID;
					inst->internal.AxisStep = AXISSTATE_ERROR;
				}
				break;

			/* State move velocity */   
			case AXISSTATE_MOVE_VELOCITY:
				inst->internal.MC_MoveVelocity_0.Axis = inst->par.axis;
				inst->internal.MC_MoveVelocity_0.Velocity = inst->par.velocity;
				inst->internal.MC_MoveVelocity_0.Acceleration = inst->par.acc;
				inst->internal.MC_MoveVelocity_0.Deceleration = inst->par.dec;
				inst->internal.MC_MoveVelocity_0.Direction = inst->par.direction;
				inst->internal.MC_MoveVelocity_0.Execute = TRUE;
			
				/*Check command stop*/
				if (inst->cmd.stop == TRUE) {
					inst->cmd.moveVelocity = FALSE;
					inst->cmd.stop = FALSE;
					inst->internal.MC_MoveVelocity_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_STOP;
				}
				
				
				
				
				
				/* check if commanded halt is reached */
				if	(inst->cmd.halt == TRUE)				{
					inst->cmd.halt = FALSE;
					inst->internal.MC_MoveVelocity_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_HALT;
				}
				/* check if commanded invelocity is reached */
				else if (inst->internal.MC_MoveVelocity_0.InVelocity == TRUE)
				{
					inst->internal.MC_MoveVelocity_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_READY;
				}
					else if (inst->par.blockMoveVelocity == TRUE)
					{
						inst->internal.MC_MoveVelocity_0.Execute = FALSE;
						inst->internal.AxisStep = AXISSTATE_HALT;
					}
				
				/* Check a halt error, then go to error state */
				if (inst->internal.MC_MoveVelocity_0.Error == TRUE)
				{
					inst->internal.MC_MoveVelocity_0.Execute = FALSE;
					inst->errorID = inst->internal.MC_MoveVelocity_0.ErrorID;
					inst->internal.AxisStep = AXISSTATE_ERROR;
				}
				break;

			/* State move jog positive */   
			case AXISSTATE_MOVE_JOGPOS:
				inst->internal.MC_MoveVelocity_0.Axis = inst->par.axis;
				inst->internal.MC_MoveVelocity_0.Velocity = inst->par.velocityJog;
				inst->internal.MC_MoveVelocity_0.Acceleration = inst->par.acc;
				inst->internal.MC_MoveVelocity_0.Deceleration = inst->par.dec;
				inst->internal.MC_MoveVelocity_0.Direction = mcPOSITIVE_DIR;
				inst->internal.MC_MoveVelocity_0.Execute = TRUE;
			
				/* check if commanded velocity */
				if	(inst->cmd.moveJogPos == FALSE) {
					inst->internal.MC_MoveVelocity_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_HALT;
				}
				
				/* Check a halt error, then go to error state */
				if (inst->internal.MC_MoveVelocity_0.Error == TRUE) {
					inst->internal.MC_MoveVelocity_0.Execute = FALSE;
					inst->errorID = inst->internal.MC_MoveVelocity_0.ErrorID;
					inst->internal.AxisStep = AXISSTATE_ERROR;
				}
				break;

			/* State move jog negative */  
			case AXISSTATE_MOVE_JOGNEG:
				inst->internal.MC_MoveVelocity_0.Axis = inst->par.axis;
				inst->internal.MC_MoveVelocity_0.Velocity = inst->par.velocityJog;
				inst->internal.MC_MoveVelocity_0.Acceleration = inst->par.acc;
				inst->internal.MC_MoveVelocity_0.Deceleration = inst->par.dec;
				inst->internal.MC_MoveVelocity_0.Direction = mcNEGATIVE_DIR;
				inst->internal.MC_MoveVelocity_0.Execute = TRUE;
			
				/* check if commanded velocity */
				if	(inst->cmd.moveJogNeg == FALSE)
				{
					inst->internal.MC_MoveVelocity_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_HALT;
				}
				
				/* Check a halt error, then go to error state */
				if (inst->internal.MC_MoveVelocity_0.Error == TRUE)
				{
					inst->internal.MC_MoveVelocity_0.Execute = FALSE;
					inst->errorID = inst->internal.MC_MoveVelocity_0.ErrorID;
					inst->internal.AxisStep = AXISSTATE_ERROR;
				}
				break;
   
			/* State move torque control */
			case AXISSTATE_MOVE_TORQUE_CONTROL:
   
				inst->internal.MC_TorqueControl_0.Axis = inst->par.axis;
				inst->internal.MC_TorqueControl_0.Torque = inst->par.torque;
				inst->internal.MC_TorqueControl_0.TorqueRamp = inst->par.torqueRamp;
				inst->internal.MC_TorqueControl_0.Velocity = inst->par.velocity;
				inst->internal.MC_TorqueControl_0.Acceleration = inst->par.acc;
				inst->internal.MC_TorqueControl_0.Execute = TRUE;
				
				/*Check command stop*/
				if (inst->cmd.stop == TRUE) {
					inst->cmd.moveTorqueControl = FALSE;
					inst->cmd.stop = FALSE;
					inst->internal.MC_TorqueControl_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_STOP;
				}
				
				
				
				/* check if commanded halt is reached */
				if	(inst->cmd.halt == TRUE)
				{
					inst->cmd.halt = FALSE;
					inst->internal.MC_TorqueControl_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_HALT;
				}
				
				/* Check a halt error, then go to error state */
				if (inst->internal.MC_TorqueControl_0.Error == TRUE)
				{
					inst->internal.MC_TorqueControl_0.Execute = FALSE;
					inst->errorID = inst->internal.MC_TorqueControl_0.ErrorID;
					inst->internal.AxisStep = AXISSTATE_ERROR;
				}
				break;
   
			case AXISSTATE_MOVE_VELOCITY_CONTROL:
				inst->internal.MC_BR_VelocityControl_0.Axis = inst->par.axis;
				inst->internal.MC_BR_VelocityControl_0.CyclicVelocity = inst->par.velocityControl.cyclicVelocity;
				inst->internal.MC_BR_VelocityControl_0.CyclicVelocityCorrection = inst->par.velocityControl.cyclicVelocityCorrection;
				inst->internal.MC_BR_VelocityControl_0.CyclicTorque = inst->par.velocityControl.cyclicTorque;
				inst->internal.MC_BR_VelocityControl_0.TorqueMode = inst->par.velocityControl.TorqueMode;
				inst->internal.MC_BR_VelocityControl_0.Acceleration = inst->par.acc;
				inst->internal.MC_BR_VelocityControl_0.Deceleration = inst->par.dec;    
				inst->internal.MC_BR_VelocityControl_0.SctrlKv = inst->par.velocityControl.sCtrlKv;
				inst->internal.MC_BR_VelocityControl_0.SctrlTn = inst->par.velocityControl.sCtrlTn;
				inst->internal.MC_BR_VelocityControl_0.InitSctrl = inst->par.velocityControl.initSctrl;
				inst->internal.MC_BR_VelocityControl_0.Enable = TRUE;
				
				/* check if commanded halt */
				if	(inst->cmd.halt == TRUE)
				{
					inst->cmd.halt = FALSE;
					inst->internal.MC_BR_VelocityControl_0.Enable = FALSE;
					inst->internal.AxisStep = AXISSTATE_READY;
				}
				
				
				/*Check command stop*/
				if (inst->cmd.stop == TRUE) {
					inst->cmd.moveVelocityControl = FALSE;
					inst->cmd.stop = FALSE;
					inst->internal.MC_BR_VelocityControl_0.Enable = FALSE;
					inst->internal.AxisStep = AXISSTATE_STOP;
				}
				
				
				
				/* Check a halt error, then go to error state */
				if (inst->internal.MC_BR_VelocityControl_0.Error == TRUE)
				{
					inst->internal.MC_BR_VelocityControl_0.Enable = FALSE;
					inst->errorID = inst->internal.MC_BR_VelocityControl_0.ErrorID;
					inst->internal.AxisStep = AXISSTATE_ERROR;
				}
				break;
   
			/* State axis error */
			case AXISSTATE_ERROR:
				inst->errorCount++;
				inst->error = TRUE;
				/* check if FB indicates an axis error */
				if (inst->internal.MC_ReadAxisError_0.AxisErrorCount != FALSE) {
					inst->internal.AxisStep = AXISSTATE_ERROR_AXIS;
				}
				else {
					if (inst->cmd.errorAck == TRUE) {
						inst->cmd.errorAck = FALSE;
						inst->errorID = 0;
						
						/* reset axis if it is in axis state ErrorStop */
						if ((inst->internal.MC_ReadStatus_0.Errorstop == TRUE) && (inst->internal.MC_ReadStatus_0.Valid == TRUE)) {
							inst->internal.AxisStep = AXISSTATE_ERROR_RESET;
						}
						else {
							inst->error = FALSE;
							inst->internal.AxisStep = AXISSTATE_WAIT;
						}
					}
				}
				break;

			/* State error axis */
			case AXISSTATE_ERROR_AXIS:
				inst->errorID = TRUE;
				if (inst->internal.MC_ReadAxisError_0.Valid == TRUE)
				{
					if (inst->internal.MC_ReadAxisError_0.AxisErrorID != FALSE)
					{
						inst->errorID = inst->internal.MC_ReadAxisError_0.AxisErrorID;
					}
					inst->internal.MC_ReadAxisError_0.Acknowledge = FALSE;
					if (inst->cmd.errorAck == TRUE)
					{
						inst->cmd.errorAck = FALSE;
						/* acknowledge axis error */
						if (inst->internal.MC_ReadAxisError_0.AxisErrorID != FALSE)
						{
							inst->internal.MC_ReadAxisError_0.Acknowledge = TRUE;
						}
					}
					if (inst->internal.MC_ReadAxisError_0.AxisErrorCount == FALSE)
					{
						inst->errorID = FALSE;
						/* reset axis if it is in axis state ErrorStop */
						if ((inst->internal.MC_ReadStatus_0.Errorstop == 1) && (inst->internal.MC_ReadStatus_0.Valid == 1))
						{
							inst->internal.AxisStep = AXISSTATE_ERROR_RESET;
						}
						else 
						{
							inst->error = FALSE;
							inst->internal.AxisStep = AXISSTATE_WAIT;
						}
					}
				}
				break;

			/* State error reset */
			case AXISSTATE_ERROR_RESET:
				
				inst->internal.MC_Reset_0.Axis = inst->par.axis;
				inst->internal.MC_Reset_0.Execute = TRUE;
				
				/* reset MC_Power.Enable if this FB is in Error*/
				if (inst->internal.MC_Power_0.Error == TRUE)
				{
					inst->internal.MC_Power_0.Enable = FALSE;
				}
				if (inst->internal.MC_Reset_0.Done == TRUE)
				{
					inst->internal.MC_Reset_0.Execute = FALSE;
					inst->error = FALSE;
					inst->internal.AxisStep = AXISSTATE_WAIT;
				}
				else if (inst->internal.MC_Reset_0.Error == TRUE)
				{
					inst->internal.MC_Reset_0.Execute = FALSE;
					inst->internal.AxisStep = AXISSTATE_ERROR;   
				}
				break;
		}
  
	} /* Main End */	
  
	/* Function block is Disabled */
	else {
  
		inst->active = FALSE;
		inst->busy = FALSE;	
  
		inst->cmd.power = FALSE;
		AxisDisableCmd(inst);
	}
 
	if (inst->internal.MC_ReadStatus_0.Valid == TRUE) {
		inst->state.Disabled = inst->internal.MC_ReadStatus_0.Disabled;
		inst->state.StandStill = inst->internal.MC_ReadStatus_0.StandStill;
		inst->state.Stopping = inst->internal.MC_ReadStatus_0.Stopping;
		inst->state.Homing = inst->internal.MC_ReadStatus_0.Homing;
		inst->state.DiscreteMotion = inst->internal.MC_ReadStatus_0.DiscreteMotion;
		inst->state.ContinuousMotion = inst->internal.MC_ReadStatus_0.ContinuousMotion;
		inst->state.SynchronizedMotion = inst->internal.MC_ReadStatus_0.SynchronizedMotion;
		inst->state.ErrorStop = inst->internal.MC_ReadStatus_0.Errorstop;
	}
	else {
		inst->state.Disabled = FALSE;
		inst->state.StandStill = FALSE;
		inst->state.Stopping = FALSE;
		inst->state.Homing = FALSE;
		inst->state.DiscreteMotion = FALSE;
		inst->state.ContinuousMotion = FALSE;
		inst->state.SynchronizedMotion = FALSE;
		inst->state.ErrorStop = FALSE;
	}
 
	MC_BR_ReadDriveStatus(&inst->internal.MC_BR_ReadDriveStatus_0);
	MC_ReadStatus(&inst->internal.MC_ReadStatus_0);
	MC_ReadActualPosition(&inst->internal.MC_ReadActualPosition_0);
	MC_ReadActualVelocity(&inst->internal.MC_ReadActualVelocity_0);
	MC_ReadActualTorque(&inst->internal.MC_ReadActualTorque_0);
	MC_ReadAxisError(&inst->internal.MC_ReadAxisError_0);
	MC_Reset(&inst->internal.MC_Reset_0);
	MC_Power(&inst->internal.MC_Power_0);
	MC_Home(&inst->internal.MC_Home_0);
	MC_Halt(&inst->internal.MC_Halt_0);
	MC_Stop(&inst->internal.MC_Stop_0);
	MC_MoveAbsolute(&inst->internal.MC_MoveAbsolute_0);
	MC_MoveAdditive(&inst->internal.MC_MoveAdditive_0);
	MC_MoveVelocity(&inst->internal.MC_MoveVelocity_0);
	MC_TorqueControl(&inst->internal.MC_TorqueControl_0);
	MC_BR_VelocityControl(&inst->internal.MC_BR_VelocityControl_0);
 
}
