
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	
	//Otoèný stol - Pojazd manipulátora//
	Servo1_PriradenieSnimacov.Axis:= ADR(gAxis01);
	Servo1_PriradenieSnimacov.Enable:= TRUE;
	Servo1_PriradenieSnimacov.PosHWSwitch:= diVstupManipul_PrednyLimit;
	Servo1_PriradenieSnimacov.NegHWSwitch:= diVstupManipul_ZadnyLimit;
	Servo1_PriradenieSnimacov();
	
	//Centrifuga 1 - otáèanie//
	Servo2_PriradenieSnimacov.Axis:= ADR(gAxis02);
	Servo2_PriradenieSnimacov.Enable:= TRUE;
	Servo2_PriradenieSnimacov.HomeSwitch:= diCentrifuga1_SnimNatocVreteno1;
	Servo2_PriradenieSnimacov();

	//Centrifuga 1 - zdvih 1//
	Servo3_PriradenieSnimacov.Axis:= ADR(gAxis03);
	Servo3_PriradenieSnimacov.Enable:= TRUE;
	Servo3_PriradenieSnimacov.NegHWSwitch:= diCentrifuga1_ReferSnimacZdvihu1;
	Servo3_PriradenieSnimacov();
	
	//Centrifuga 1 - zdvih 2//
	Servo4_PriradenieSnimacov.Axis:= ADR(gAxis04);
	Servo4_PriradenieSnimacov.Enable:= TRUE;
	Servo4_PriradenieSnimacov.NegHWSwitch:= diCentrifuga1_ReferSnimacZdvihu2;
	Servo4_PriradenieSnimacov();	
	
	
	//Centrifuga 2 - otáèanie//
	Servo5_PriradenieSnimacov.Axis:= ADR(gAxis05);
	Servo5_PriradenieSnimacov.Enable:= TRUE;
	Servo5_PriradenieSnimacov.HomeSwitch:= diCentrifuga2_SnimNatocVreteno1;
	Servo5_PriradenieSnimacov();

	//Centrifuga 2 - zdvih 1//
	Servo6_PriradenieSnimacov.Axis:= ADR(gAxis06);
	Servo6_PriradenieSnimacov.Enable:= TRUE;
	Servo6_PriradenieSnimacov.NegHWSwitch:= diCentrifuga2_ReferSnimacZdvihu1;
	Servo6_PriradenieSnimacov();
	
	//Centrifuga 2 - zdvih 2//
	Servo7_PriradenieSnimacov.Axis:= ADR(gAxis07);
	Servo7_PriradenieSnimacov.Enable:= TRUE;
	Servo7_PriradenieSnimacov.NegHWSwitch:= diCentrifuga2_ReferSnimacZdvihu2;
	Servo7_PriradenieSnimacov();	
	
	
	
	
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

