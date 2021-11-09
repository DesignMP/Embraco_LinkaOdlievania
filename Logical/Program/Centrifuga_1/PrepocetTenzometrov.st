
ACTION PrepocetTenzometrov: 

	NastavenieAnalogu1:= 48;   //Bin·rne 0 011 0000 tzn. 0000 - 2,5 refresh time  2,5x za sekundu, 011 - rozlÌöenie 2mV/V 
	NastavenieAnalogu2:= 48;   //Bin·rne 0 011 0000 tzn. 0000 - 2,5 refresh time  2,5x za sekundu, 011 - rozlÌöenie 2mV/V
	
		
	//PrepoËet analÛgov//
	
	//*****************************************Centrifuga 1 - Tenzometer zdvih 1******************************************************************//
	AnalogInput_1.ENABLE:= TRUE;
	AnalogInput_1.IN:= aiCentrifuga1_Tenzomet_Vreteno1;                  //Hodnota analÛgovÈho snÌmaËa  DINT//
	AnalogInput_1.IN_LO_LIM:= 649180;     //Vstupn· spodn· hranica - DINT//
	AnalogInput_1.IN_HI_HIM:= 2165940;      //Vstupn· horn· hranica - DINT//
	AnalogInput_1.PHYS_LO_LIM:= 0.0;  //V˝stupn· spodn· hranica - REAL//
	AnalogInput_1.PHYS_HI_LIM:= 100.0;   //V˝stupna horn· hranica - REAL//
	AnalogInput_1.PRECISION:= 1.0;              //MusÌ biù zadan· 1 inak porucha - REAL//
	Skalovanie1_READY:= AnalogInput_1.Active;                  //Stav ök·lovacej funkcie - BOOL//
	Skalovanie1_ERROR:= AnalogInput_1.Error;                   //Porucha ök·lovacej funkcie - BOOL//
	Centrifuga1_Vreteno1_Tlak_Kg:= AnalogInput_1.Out;                //V˝stupn· hodnota - REAL//
	AnalogInput_1();
	
	
	
	
	
	
	
	//*****************************************Centrifuga 1 - Tenzometer zdvih 2******************************************************************//
	AnalogInput_2.ENABLE:= TRUE;
	AnalogInput_2.IN:= aiCentrifuga1_Tenzomet_Vreteno2;                  //Hodnota analÛgovÈho snÌmaËa  DINT//
	AnalogInput_2.IN_LO_LIM:= 674280;     //Vstupn· spodn· hranica - DINT//
	AnalogInput_2.IN_HI_HIM:= 2285400;      //Vstupn· horn· hranica - DINT//
	AnalogInput_2.PHYS_LO_LIM:= 0.0;  //V˝stupn· spodn· hranica - REAL//
	AnalogInput_2.PHYS_HI_LIM:= 100.0;   //V˝stupna horn· hranica - REAL//
	AnalogInput_2.PRECISION:= 1.0;              //MusÌ biù zadan· 1 inak porucha - REAL//
	Skalovanie2_READY:= AnalogInput_2.Active;                  //Stav ök·lovacej funkcie - BOOL//
	Skalovanie2_ERROR:= AnalogInput_2.Error;                   //Porucha ök·lovacej funkcie - BOOL//
	Centrifuga1_Vreteno2_Tlak_Kg:= AnalogInput_2.Out;                //V˝stupn· hodnota - REAL//
	AnalogInput_2();
	
	

	
	
	
	
	
END_ACTION
