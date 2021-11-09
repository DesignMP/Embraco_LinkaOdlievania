(*********************************************************************
* COPYRIGHT -- Bernecker + Rainer
********************************************************************
* Author: Ing. Milan Jun
* Created: June 1, 2015
*********************************************************************)

TYPE
	Analog_Internal_typ : {REDUND_UNREPLICABLE} 	STRUCT 
		RangeIN : {REDUND_UNREPLICABLE} DINT;
		RangePHYS : {REDUND_UNREPLICABLE} REAL;
	END_STRUCT;
END_TYPE
