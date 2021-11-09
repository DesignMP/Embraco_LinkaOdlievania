
ACTION PrepocetTenzometrov: 

	NastavenieAnalogu3:= 48;   //Bin·rne 0 011 0000 tzn. 0000 - 2,5 refresh time  2,5x za sekundu, 011 - rozlÌöenie 2mV/V 
	NastavenieAnalogu4:= 48;   //Bin·rne 0 011 0000 tzn. 0000 - 2,5 refresh time  2,5x za sekundu, 011 - rozlÌöenie 2mV/V
	
	
	//PrepoËet analÛgov//
	
//	//*****************************************Centrifuga 2 - Tenzometer zdvih 1******************************************************************//
	AnalogInput_3.ENABLE:= TRUE;
	AnalogInput_3.IN:= aiCentrifuga2_Tenzomet_Vreteno1;                  //Hodnota analÛgovÈho snÌmaËa  DINT//
	AnalogInput_3.IN_LO_LIM:= 0;     //Vstupn· spodn· hranica - DINT//
	AnalogInput_3.IN_HI_HIM:= 100;      //Vstupn· horn· hranica - DINT//
	AnalogInput_3.PHYS_LO_LIM:= 0.0;  //V˝stupn· spodn· hranica - REAL//
	AnalogInput_3.PHYS_HI_LIM:= 100.0;   //V˝stupna horn· hranica - REAL//
	AnalogInput_3.PRECISION:= 1.0;              //MusÌ biù zadan· 1 inak porucha - REAL//
	Skalovanie3_READY:= AnalogInput_3.Active;                  //Stav ök·lovacej funkcie - BOOL//
	Skalovanie3_ERROR:= AnalogInput_3.Error;                   //Porucha ök·lovacej funkcie - BOOL//
	Centrifuga2_Vreteno1_Tlak_Kg:= AnalogInput_3.Out;                //V˝stupn· hodnota - REAL//
	AnalogInput_3();
//	
//	
//	
//	
//	//*****************************************Centrifuga 2 - Tenzometer zdvih 2******************************************************************//
	AnalogInput_4.ENABLE:= TRUE;
	AnalogInput_4.IN:= aiCentrifuga2_Tenzomet_Vreteno2;                  //Hodnota analÛgovÈho snÌmaËa  DINT//
	AnalogInput_4.IN_LO_LIM:= 543550;     //Vstupn· spodn· hranica - DINT//
	AnalogInput_4.IN_HI_HIM:= 2167472;      //Vstupn· horn· hranica - DINT//
	AnalogInput_4.PHYS_LO_LIM:= 0.0;  //V˝stupn· spodn· hranica - REAL//
	AnalogInput_4.PHYS_HI_LIM:= 100.0;   //V˝stupna horn· hranica - REAL//
	AnalogInput_4.PRECISION:= 1.0;              //MusÌ biù zadan· 1 inak porucha - REAL//
	Skalovanie4_READY:= AnalogInput_4.Active;                  //Stav ök·lovacej funkcie - BOOL//
	Skalovanie4_ERROR:= AnalogInput_4.Error;                   //Porucha ök·lovacej funkcie - BOOL//
	Centrifuga2_Vreteno2_Tlak_Kg:= AnalogInput_4.Out;      //V˝stupn· hodnota - REAL//
	AnalogInput_4();
	
	
		

	
	
END_ACTION
