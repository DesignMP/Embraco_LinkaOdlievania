
ACTION MeranieVyskyBalika: 

	//****************************************Centrifuga 2 - VR1 kalibrácia******************************************************************//
	IF Centrifuga2_VR1_30_ZapisHodnotu THEN
		Centrifuga2_VR1_30_NamerVyska:= Centrifuga2_Zdvih1_AktualPozMM;
		Centrifuga2_VR1_30_ZapisHodnotu:= FALSE;
	END_IF	
	
	IF Centrifuga2_VR1_70_ZapisHodnotu THEN
		Centrifuga2_VR1_70_NamerVyska:= Centrifuga2_Zdvih1_AktualPozMM;
		Centrifuga2_VR1_70_ZapisHodnotu:= FALSE;
	END_IF	
	
	//****************************************Centrifuga 2 - VR2 kalibrácia******************************************************************//
	IF Centrifuga2_VR2_30_ZapisHodnotu THEN
		Centrifuga2_VR2_30_NamerVyska:= Centrifuga2_Zdvih2_AktualPozMM;
		Centrifuga2_VR2_30_ZapisHodnotu:= FALSE;
	END_IF	
	
	IF Centrifuga2_VR2_70_ZapisHodnotu THEN
		Centrifuga2_VR2_70_NamerVyska:= Centrifuga2_Zdvih2_AktualPozMM;
		Centrifuga2_VR2_70_ZapisHodnotu:= FALSE;
	END_IF	
	
	
	
	
	//*****************************************Centrifuga 2 - VR1 meranie výšky balíka******************************************************************//
	IF Motion[6].status.DriveStatus.HomingOk THEN
		Skalovanie_Centrifuga2_VR1.x:= Centrifuga2_Zdvih1_AktualPozMM;
		Skalovanie_Centrifuga2_VR1.x1:= Centrifuga2_VR1_70_NamerVyska;//145.3
		Skalovanie_Centrifuga2_VR1.x2:= Centrifuga2_VR1_30_NamerVyska;//180.14
		Skalovanie_Centrifuga2_VR1.y1:= 70.0;
		Skalovanie_Centrifuga2_VR1.y2:= 30.0;
		Centrifuga2_VR1_NamVyskaBalika:= Skalovanie_Centrifuga2_VR1.y;
		Skalovanie_Centrifuga2_VR1();
	END_IF
	
	
	//*****************************************Centrifuga 2 - VR2 meranie výšky balíka******************************************************************//
	IF Motion[7].status.DriveStatus.HomingOk THEN
		Skalovanie_Centrifuga2_VR2.x:= Centrifuga2_Zdvih2_AktualPozMM;
		Skalovanie_Centrifuga2_VR2.x1:= Centrifuga2_VR2_70_NamerVyska;//143.8
		Skalovanie_Centrifuga2_VR2.x2:= Centrifuga2_VR2_30_NamerVyska;//178.76
		Skalovanie_Centrifuga2_VR2.y1:= 70.0;
		Skalovanie_Centrifuga2_VR2.y2:= 30.0;
		Centrifuga2_VR2_NamVyskaBalika:= Skalovanie_Centrifuga2_VR2.y;
		Skalovanie_Centrifuga2_VR2();
	END_IF
	
	
		
	
	IF Centrifuga2_VR1_NamVyskaBalika >= ZvolenaSpodnaToleranciaBalika AND Centrifuga2_VR1_NamVyskaBalika <= ZvolenaHornaToleranciaBalika THEN 
		VyskaBalikaVR1_OK:= TRUE;
	ELSE	
		VyskaBalikaVR1_OK:= FALSE;
	END_IF
	
	IF Centrifuga2_VR2_NamVyskaBalika >= ZvolenaSpodnaToleranciaBalika AND Centrifuga2_VR2_NamVyskaBalika <= ZvolenaHornaToleranciaBalika THEN 
		VyskaBalikaVR2_OK:= TRUE;
	ELSE	
		VyskaBalikaVR2_OK:= FALSE;
	END_IF
	
	
	
	
	
	
	
END_ACTION
