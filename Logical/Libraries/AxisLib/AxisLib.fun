(* ********************************************************************
  * COPYRIGHT -- Bernecker + Rainer
  ********************************************************************
  * Author: Milan Jun
  * Created: May 28, 2014
  *********************************************************************)

FUNCTION_BLOCK Axis (*Axis motion*) (*$GROUP=User*)
	VAR_INPUT
		enable : BOOL; (*Enables/Disables the function block.*)
		cmd : AxisCommand_type; (*Axis commands.*)
		par : AxisParameter_type; (*Axis parameters.*)
	END_VAR
	VAR_OUTPUT
		active : BOOL; (*Function block is active.*)
		busy : BOOL; (*Function block is busy.*)
		error : BOOL; (*Function block is an error.*)
		errorCount : UDINT; (*Error counter.*)
		errorID : UDINT; (*Error id.*)
		errorText : ARRAY[0..3] OF STRING[79]; (*Error text.*)
		status : AxisStatus_type;
		state : AxisState_type;
	END_VAR
	VAR
		internal : AxisInternal_type;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK AxisExtension (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		enable : BOOL;
		cmd : AxisExtensionCommand_type;
		par : AxisExtensionParameter_type;
	END_VAR
	VAR_OUTPUT
		active : BOOL;
		status : AxisExtensionStatus_type;
		errorID : UDINT; (*Error id.*)
	END_VAR
	VAR
		internal : AxisExtensionInternal_type;
	END_VAR
END_FUNCTION_BLOCK
