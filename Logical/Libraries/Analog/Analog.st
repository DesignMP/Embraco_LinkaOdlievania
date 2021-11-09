
(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Author: Ing. Milan Jun
 * Created: June 1, 2015
 ********************************************************************)

FUNCTION_BLOCK Analog
	
 IF ENABLE=0 THEN

  Active := FALSE;
  Out := 0.0;
  OutCalibred := 0.0;
  Error := FALSE;
  Internal.RangeIN := 0;
  Internal.RangePHYS := 0;
  
 ELSIF ENABLE=1 AND (PRECISION = 0.0 (*OR (IN < 6553 OR IN > 32767)*)) THEN

  Active := TRUE;
  Out := 0.0;
  OutCalibred := 0.0;
  Error := TRUE;

 ELSE
  
  Active := TRUE;
  Internal.RangeIN := IN_HI_HIM - IN_LO_LIM;
		Internal.RangePHYS := PHYS_HI_LIM - PHYS_LO_LIM;
		
		Out :=  ((PHYS_LO_LIM + (( Internal.RangePHYS * (DINT_TO_REAL(IN) - DINT_TO_REAL(IN_LO_LIM))) / DINT_TO_REAL(Internal.RangeIN)))/PRECISION) ;
		OutCalibred := Out - CALIBRATON_CONST;
  Error := FALSE;
  
 END_IF;

END_FUNCTION_BLOCK