
(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Author: Ing. Milan Jun
 * Created: June 1, 2015
 ********************************************************************)

FUNCTION_BLOCK AnalogOut
	
	IF ENABLE THEN
	
		Internal.RangeIN := IN_HI_HIM - IN_LO_LIM;
		Internal.RangePHYS := PHYS_HI_LIM - PHYS_LO_LIM;
		
		Out :=  (IN_LO_LIM + REAL_TO_INT(( Internal.RangeIN * (IN - PHYS_LO_LIM)) / (Internal.RangePHYS))) ;
		OutCalibred := Out - CALIBRATON_CONST;
		
		
	(* Function block is disabled *)	
	ELSE
		
		(* Reset output *)
		Out := 0;
		OutCalibred := 0;
	
	END_IF;
	
END_FUNCTION_BLOCK