
ACTION MeraniaVyskyBalika: 

	//****************************************Centrifuga 1 - VR1 kalibrácia******************************************************************//
	IF Centrifuga1_VR1_30_ZapisHodnotu THEN
		Centrifuga1_VR1_30_NamerVyska:= Centrifuga1_Zdvih1_AktualPozMM;
		Centrifuga1_VR1_30_ZapisHodnotu:= FALSE;
	END_IF	
	
	IF Centrifuga1_VR1_70_ZapisHodnotu THEN
		Centrifuga1_VR1_70_NamerVyska:= Centrifuga1_Zdvih1_AktualPozMM;
		Centrifuga1_VR1_70_ZapisHodnotu:= FALSE;
	END_IF	
	
	//****************************************Centrifuga 1 - VR2 kalibrácia******************************************************************//
	IF Centrifuga1_VR2_30_ZapisHodnotu THEN
		Centrifuga1_VR2_30_NamerVyska:= Centrifuga1_Zdvih2_AktualPozMM;
		Centrifuga1_VR2_30_ZapisHodnotu:= FALSE;
	END_IF	
	
	IF Centrifuga1_VR2_70_ZapisHodnotu THEN
		Centrifuga1_VR2_70_NamerVyska:= Centrifuga1_Zdvih2_AktualPozMM;
		Centrifuga1_VR2_70_ZapisHodnotu:= FALSE;
	END_IF	
	
	
	
	//*****************************************Centrifuga 1 - VR1 meranie výšky balíka******************************************************************//
	IF Motion[3].status.DriveStatus.HomingOk THEN
		Skalovanie_Centrifuga1_VR1.x:= Centrifuga1_Zdvih1_AktualPozMM;
		Skalovanie_Centrifuga1_VR1.x1:= Centrifuga1_VR1_70_NamerVyska; //142.0
		Skalovanie_Centrifuga1_VR1.x2:= Centrifuga1_VR1_30_NamerVyska; //177.18
		Skalovanie_Centrifuga1_VR1.y1:= 70.0;
		Skalovanie_Centrifuga1_VR1.y2:= 30.0;
		Centrifuga1_VR1_NamVyskaBalika:= Skalovanie_Centrifuga1_VR1.y;
		Skalovanie_Centrifuga1_VR1();
	END_IF
	
	
	
	
	//*****************************************Centrifuga 1 - VR2 meranie výšky balíka******************************************************************//
	IF Motion[4].status.DriveStatus.HomingOk THEN
		Skalovanie_Centrifuga1_VR2.x:= Centrifuga1_Zdvih2_AktualPozMM;
		Skalovanie_Centrifuga1_VR2.x1:= Centrifuga1_VR2_70_NamerVyska; //142.2
		Skalovanie_Centrifuga1_VR2.x2:= Centrifuga1_VR2_30_NamerVyska; //177.2
		Skalovanie_Centrifuga1_VR2.y1:= 70.0;
		Skalovanie_Centrifuga1_VR2.y2:= 30.0;
		Centrifuga1_VR2_NamVyskaBalika:= Skalovanie_Centrifuga1_VR2.y;
		Skalovanie_Centrifuga1_VR2();
	END_IF
	
	
	
	IF Centrifuga1_VR1_NamVyskaBalika >= ZvolenaSpodnaToleranciaBalika AND Centrifuga1_VR1_NamVyskaBalika <= ZvolenaHornaToleranciaBalika THEN 
		VyskaBalikaVR1_OK:= TRUE;
	ELSE	
		VyskaBalikaVR1_OK:= FALSE;
	END_IF
	
	IF Centrifuga1_VR2_NamVyskaBalika >= ZvolenaSpodnaToleranciaBalika AND Centrifuga1_VR2_NamVyskaBalika <= ZvolenaHornaToleranciaBalika THEN 
		VyskaBalikaVR2_OK:= TRUE;
	ELSE	
		VyskaBalikaVR2_OK:= FALSE;
	END_IF
	
	
	
END_ACTION
