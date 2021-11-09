
#include <bur/plctypes.h>
#ifdef __cplusplus
	extern "C"
	{
#endif
	#include "AxisLib.h"
#ifdef __cplusplus
	};
#endif

#define TRUE		  1      /* Allways true */
#define FALSE 		0      /* Allways false */
#define DELAY   100    /* Delay time, it is dependence on cycle time */

void AxisExtension(struct AxisExtension* inst)
{
 
   /* *************************************************************** * 
   * ******************* READ / WRITE PARID ************************ *
   * *************************************************************** */

 unsigned long int encoderResetValue = 1;
 unsigned short int brakeMode = 0;
 
 if (inst->enable == FALSE)
 {
  inst->internal.AxisReadStep = 0;
		inst->active = FALSE;
 }
  
 else
		inst->active = TRUE;
 {
  switch (inst->internal.AxisReadStep)
  {
   
   /* Wait for command */
   case 0:
    
    /* 719: Encoder1: Encoder command */
    if (inst->cmd.cmdRstEncoder == TRUE)
    {
     inst->cmd.cmdRstEncoder = FALSE;
     inst->internal.AxisReadStep = 1;
    }
    /* Command unbrake */
    else if ( inst->cmd.cmdUnbrake == TRUE )
    {
     inst->internal.AxisReadStep = 2;
     inst->cmd.cmdUnbrake = FALSE;
    }
    /* Command brake */ 
    else if ( inst->cmd.cmdBrake == TRUE )
    {
     inst->internal.AxisReadStep = 3;
     inst->cmd.cmdBrake = FALSE;	
    }
    /* Command toggle brake/unbrake */
    else if ( inst->cmd.cmdBrakeToggle == TRUE )
    {
     inst->internal.AxisReadStep = 4;
     inst->cmd.cmdBrakeToggle = FALSE;	
    }
					/* Command for reading hardware info */
				else if ( inst->cmd.cmdGetHwInfo == TRUE )
				{
					inst->internal.AxisReadStep = 5;
					inst->cmd.cmdGetHwInfo = FALSE;	
				}
				/* Continue with reading parid */
				else {
					inst->internal.AxisReadStep = 10;					
				}
    break;
    
   /* Reset encoder */
   case 1:
     
    inst->internal.MC_BR_WriteParID_0.Execute = 1;
    inst->internal.MC_BR_WriteParID_0.Axis = inst->par.axis;
    inst->internal.MC_BR_WriteParID_0.ParID = 719; 
    inst->internal.MC_BR_WriteParID_0.DataAddress = (UDINT)&(encoderResetValue);
    inst->internal.MC_BR_WriteParID_0.DataType = ncPAR_TYP_UDINT;
    
    if (inst->internal.MC_BR_WriteParID_0.Done == TRUE)
    {
     inst->internal.MC_BR_WriteParID_0.Execute = FALSE;
     inst->internal.AxisReadStep = 0;
    }
    else if (inst->internal.MC_BR_WriteParID_0.Busy == TRUE)
    {
     /* busy */
    }    
    if (inst->internal.MC_BR_WriteParID_0.Error == TRUE)
    {
     inst->internal.MC_BR_WriteParID_0.Execute = FALSE;
     inst->internal.AxisReadStep = 0; 
    }
    break;
    
   /* Brake operation */
   case 2:
    inst->internal.MC_BR_BrakeOperation_0.Execute = TRUE;
    inst->internal.MC_BR_BrakeOperation_0.Axis = inst->par.axis;
    inst->internal.MC_BR_BrakeOperation_0.BrakeCommand = 1;
    
    if (inst->internal.MC_BR_BrakeOperation_0.Done == TRUE)
    {
     inst->internal.MC_BR_BrakeOperation_0.Execute = FALSE;
     inst->internal.AxisReadStep = 0;
    }
    else if (inst->internal.MC_BR_BrakeOperation_0.Busy == TRUE) 
    {
     /* busy */
    }
    
    /* Check a error, then go to error state */
    if (inst->internal.MC_BR_BrakeOperation_0.Error == TRUE)
    {
     inst->internal.MC_BR_BrakeOperation_0.Execute = FALSE;
     inst->errorID = inst->internal.MC_BR_BrakeOperation_0.ErrorID;
     inst->internal.AxisReadStep = 0;
    }
    break;

   /* unBrake operation */
   case 3:
    inst->internal.MC_BR_BrakeOperation_0.Execute = TRUE;
    inst->internal.MC_BR_BrakeOperation_0.Axis = inst->par.axis;
    inst->internal.MC_BR_BrakeOperation_0.BrakeCommand = 0;
    
    if (inst->internal.MC_BR_BrakeOperation_0.Done == TRUE)
    {
     inst->internal.MC_BR_BrakeOperation_0.Execute = FALSE;
     inst->internal.AxisReadStep = 0;
    }
    else if (inst->internal.MC_BR_BrakeOperation_0.Busy == TRUE) 
    {
     /* busy */
    }
    
    /* Check a error, then go to error state */
    if (inst->internal.MC_BR_BrakeOperation_0.Error == TRUE)
    {
     inst->internal.MC_BR_BrakeOperation_0.Execute = FALSE;
     inst->errorID = inst->internal.MC_BR_BrakeOperation_0.ErrorID;
     inst->internal.AxisReadStep = 0;
    }
    break;

   /* unBrake operation */
   case 4:
    inst->internal.MC_BR_BrakeOperation_0.Execute = TRUE;
    inst->internal.MC_BR_BrakeOperation_0.Axis = inst->par.axis;
    inst->internal.MC_BR_BrakeOperation_0.BrakeCommand = inst->internal.brakeMode;
    
    if (inst->internal.MC_BR_BrakeOperation_0.Done == TRUE)
    {
     inst->internal.brakeMode = !inst->internal.brakeMode;
     inst->internal.MC_BR_BrakeOperation_0.Execute = FALSE;
     inst->internal.AxisReadStep = 0;
    }
    else if (inst->internal.MC_BR_BrakeOperation_0.Busy == TRUE) 
    {
     /* busy */
    }
    
    /* Check a error, then go to error state */
    if (inst->internal.MC_BR_BrakeOperation_0.Error == TRUE)
    {
     inst->internal.MC_BR_BrakeOperation_0.Execute = FALSE;
     inst->errorID = inst->internal.MC_BR_BrakeOperation_0.ErrorID;
     inst->internal.AxisReadStep = 0;
    }
    break;
			
			/* Get hardware information */
			case 5:
				inst->internal.MC_BR_GetHardwareInfo_0.Execute = TRUE;
				inst->internal.MC_BR_GetHardwareInfo_0.Axis = inst->par.axis;
	  
				brsmemset( &(inst->internal.MC_BR_GetHardwareInfo_0.HardwareInfo),0,sizeof(inst->internal.MC_BR_GetHardwareInfo_0.HardwareInfo));
				
				if (inst->internal.MC_BR_GetHardwareInfo_0.Done == TRUE)
				{
					inst->internal.MC_BR_GetHardwareInfo_0.Execute = FALSE;
				 inst->status.HardwareInfo = inst->internal.MC_BR_GetHardwareInfo_0.HardwareInfo;
					
				 brsmemcpy( &(inst->internal.MC_BR_GetHardwareInfo_0.HardwareInfo), &(inst->internal.MC_BR_GetHardwareInfo_0.HardwareInfo),sizeof(inst->internal.MC_BR_GetHardwareInfo_0.HardwareInfo));

					inst->internal.AxisReadStep = 0;
				}
				else if (inst->internal.MC_BR_GetHardwareInfo_0.Busy == TRUE) 
				{
					/* busy */
				}
    
				/* Check a error, then go to error state */
				if (inst->internal.MC_BR_GetHardwareInfo_0.Error == TRUE)
				{
					inst->internal.MC_BR_GetHardwareInfo_0.Execute = FALSE;
					inst->errorID = inst->internal.MC_BR_GetHardwareInfo_0.ErrorID;
					inst->internal.AxisReadStep = 0;
				}
				break;
				
   /* Continue with reading temperature */ 
   case 10:
				if ( inst->cmd.cmdReadTemp == TRUE ){
				
					inst->internal.MC_BR_ReadParID_0.Execute = 1;
					inst->internal.MC_BR_ReadParID_0.Axis = inst->par.axis;
					inst->internal.MC_BR_ReadParID_0.ParID = 381; /* 381: Temperature sensor: Temperature | TEMP_MOTOR | RD | °C | REAL */
					inst->internal.MC_BR_ReadParID_0.DataAddress = (UDINT)&(inst->status.ActMotorTemp);
					inst->internal.MC_BR_ReadParID_0.DataType = ncPAR_TYP_REAL;
    
					if (inst->internal.MC_BR_ReadParID_0.Done == TRUE)
					{
						inst->internal.MC_BR_ReadParID_0.Execute = FALSE;
						inst->internal.AxisReadStep++;
					}
					else if (inst->internal.MC_BR_ReadParID_0.Busy == TRUE) { }    
					
				 /* If mc_br_readparid error */
					if (inst->internal.MC_BR_ReadParID_0.Error == TRUE)
					{
						inst->internal.MC_BR_ReadParID_0.Execute = FALSE;
						inst->internal.AxisReadStep = 0; 
					}
				}
				else {
					inst->internal.AxisReadStep++; 
					inst->status.ActMotorTemp = 0;
				}
    break;

			/* Continue with reading current */
   case 11:
				if ( inst->cmd.cmdReadCurrent == TRUE ) {
					inst->internal.MC_BR_ReadParID_0.Execute = 1;
					inst->internal.MC_BR_ReadParID_0.Axis = inst->par.axis;
					inst->internal.MC_BR_ReadParID_0.ParID = 214; /* 214: CTRL Current controller: Actual stator current quadrature component | ICTRL_ISQ_ACT | RD | A | REAL */
					inst->internal.MC_BR_ReadParID_0.DataAddress = (UDINT)&(inst->status.ActMotorCurrent);
					inst->internal.MC_BR_ReadParID_0.DataType = ncPAR_TYP_REAL ;
    
					if (inst->internal.MC_BR_ReadParID_0.Done == TRUE)
					{
						inst->internal.MC_BR_ReadParID_0.Execute = FALSE;
						inst->internal.AxisReadStep++;
					}
					else if (inst->internal.MC_BR_ReadParID_0.Busy == TRUE){ }
					
				 /* If mc_br_readparid error */
					if (inst->internal.MC_BR_ReadParID_0.Error == TRUE)
					{
						inst->internal.MC_BR_ReadParID_0.Execute = FALSE;
						inst->internal.AxisReadStep = 0; 
					}
				}
				else {
					inst->internal.AxisReadStep++;
					inst->status.ActMotorCurrent = 0;
				}
    break;
 
			/* Continue with reading lag error */ 
   case 12:
				if ( inst->cmd.cmdReadLagError == TRUE ) {
					inst->internal.MC_BR_ReadParID_0.Execute = 1;
					inst->internal.MC_BR_ReadParID_0.Axis = inst->par.axis;
					inst->internal.MC_BR_ReadParID_0.ParID = 112; /* 112: CTRL Position controller: Lag error */
					inst->internal.MC_BR_ReadParID_0.DataAddress = (UDINT)&(inst->status.ActLagError);
					inst->internal.MC_BR_ReadParID_0.DataType = ncPAR_TYP_REAL ;
    
					if (inst->internal.MC_BR_ReadParID_0.Done == TRUE)
					{
						inst->internal.MC_BR_ReadParID_0.Execute = FALSE;
						inst->internal.AxisReadStep = 0;
					}
					else if (inst->internal.MC_BR_ReadParID_0.Busy == TRUE) { }
				 
				/* If mc_br_readparid error */
					if (inst->internal.MC_BR_ReadParID_0.Error == TRUE)
					{
						inst->internal.MC_BR_ReadParID_0.Execute = FALSE;
						inst->internal.AxisReadStep = 0; 
					}
				inst->internal.AxisReadStep = 0;
				}
				else {
					inst->internal.AxisReadStep = 0;
					inst->status.ActLagError = 0;
				}
    break;
  }
			
  MC_BR_BrakeOperation(&inst->internal.MC_BR_BrakeOperation_0);
  MC_BR_ReadParID(&inst->internal.MC_BR_ReadParID_0);
  MC_BR_WriteParID(&inst->internal.MC_BR_WriteParID_0); 
		MC_BR_GetHardwareInfo(&inst->internal.MC_BR_GetHardwareInfo_0);
 }    
}
