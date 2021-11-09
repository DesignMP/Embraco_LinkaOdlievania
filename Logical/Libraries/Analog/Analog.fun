(*********************************************************************
* COPYRIGHT -- Bernecker + Rainer
********************************************************************
* Author: Ing. Milan Jun
* Created: June 1, 2015
*********************************************************************)

{REDUND_UNREPLICABLE} FUNCTION_BLOCK Analog (*Conver analog input to physcal value *) (*$GROUP=User*)
	VAR_INPUT
		ENABLE : {REDUND_UNREPLICABLE} BOOL;
		IN : {REDUND_UNREPLICABLE} DINT;
		IN_LO_LIM : {REDUND_UNREPLICABLE} DINT;
		IN_HI_HIM : {REDUND_UNREPLICABLE} DINT;
		PHYS_LO_LIM : {REDUND_UNREPLICABLE} REAL;
		PHYS_HI_LIM : {REDUND_UNREPLICABLE} REAL;
		CALIBRATON_CONST : {REDUND_UNREPLICABLE} REAL;
		PRECISION : {REDUND_UNREPLICABLE} REAL;
	END_VAR
	VAR_OUTPUT
		Active : {REDUND_UNREPLICABLE} BOOL;
		Error : {REDUND_UNREPLICABLE} BOOL;
		Out : {REDUND_UNREPLICABLE} REAL;
		OutCalibred : {REDUND_UNREPLICABLE} REAL;
	END_VAR
	VAR
		Internal : {REDUND_UNREPLICABLE} Analog_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK AnalogOut
	VAR_INPUT
		ENABLE : BOOL;
		IN : REAL;
		IN_LO_LIM : INT;
		IN_HI_HIM : INT;
		PHYS_LO_LIM : REAL;
		PHYS_HI_LIM : REAL;
		CALIBRATON_CONST : INT;
	END_VAR
	VAR_OUTPUT
		Out : INT;
		OutCalibred : INT;
	END_VAR
	VAR
		Internal : Analog_Internal_typ;
	END_VAR
END_FUNCTION_BLOCK
