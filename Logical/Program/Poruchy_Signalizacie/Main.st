
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	//0 - Porucha tlaku vzduchu//
	//1 - Bolo stlacene tlacitko CS linky !!!//
	//2 - Bolo stlacene tlacitko CS servisnych dveri robota manipulácie !!!//
	//3 - Bolo stlacene tlacitko CS servisnych dveri robota odlievania !!!//
	//4 - Bolo stlacene tlacitko CS dokoncovacej stanice//
	//5 - Bolo stlacene tlacitko CS robota manipulacie//
	//6 - Bolo stlacene tlacitko CS robota odlievania//
	//7 - Teplota hlinika v peci je mimo pracovny rozsah//
	
	//10 - Oddelovac - porucha prepnutia //
	//11 - Oddelovac - porucha vyvezenia rotora //
	//12 - Oddelovac - porucha snimacov preklopenia//
	
	//20 - Vstupny manipulator - porucha zatvorenia gripra//
	//21 - Vstupny manipulator - porucha otvorenia gripra//
	//22 - Vstupny manipulátor - porucha zdvihu//
	//23 - Vstupny manipulator - porucha zostupu//
	//24 - Vstupny manipulator - porucha serva pojazdu//
	//25 - Vstupny manipulator - pretazenie serva pojazdu//
	//26 - Vstupny manipulator - dosiahnuta limitna pozicia pojazdu//
	//27 - Vstupny manipulator - porucha komunikacie s IO modulom//
	
	//30 - Otocny stol - porucha motora//
	//31 - Otocny stol - porucha otocenia stola//
	//32 - Otocny stol - vysoka teplota motora//
	//33 - Otocny stol - blokovanie otacania stola aktivne//
	//34 - Otocny stol - porucha indukcneho ohrevu//
	
	//40 - Centrifuga 1 - porucha otacania vretien//
	//41 - Centrifuga 1 - porucha zdvihu vretena 1//
	//42 - Centrifuga 1 - porucha zdvihu vretena 2//
	//43 - Centrifuga 1 - porucha natocenia vretien//
	//44 - Centrifuga 1 - pretazenie serva otacania vretien//
	//45 - Centrifuga 1 - pretazenie serva zdvihu vretena 1//
	//46 - Centrifuga 1 - pretazenie serva zdvihu vretena 2//
	//47 - Centrifuga 1 - porucha komunikacie s IO modulom//
	//48 - Centrifuga 1 - vretena niesu spravne natocene//
	//49 - Centrifuga 1 - porucha pritlacenia rotora//
	
	
	//50 - Centrifuga 2 - porucha otacania vretien//
	//51 - Centrifuga 2 - porucha zdvihu vretena 1//
	//52 - Centrifuga 2 - porucha zdvihu vretena 2//
	//53 - Centrifuga 2 - porucha natocenia vretien//
	//54 - Centrifuga 2 - pretazenie serva otacania vretien//
	//55 - Centrifuga 2 - pretazenie serva zdvihu vretena 1//
	//56 - Centrifuga 2 - pretazenie serva zdvihu vretena 2//
	//57 - Centrifuga 2 - porucha komunikacie s IO modulom//
	//58 - Centrifuga 2 - vretena niesu spravne natocene//
	//59 - Centrifuga 2 - porucha pritlacenia rotora//
	
	//60 - Tunel - porucha motora dopravnika//
	//61 - Tunel - porucha motora ventilatora//
	//62 - Tunel - porucha vysunutia vstupneho odsuvaca //
	//63 - Tunel - porucha zasunutia vstupneho odsuvaca //
	//64 - Tunel - porucha vysunutia vystupneho odsuvaca//
	//65 - Tunel - porucha zasunutia vystupneho odsuvaca//
	//66 - Tunel - porucha snimaca zastavenia dopravnika//
	//67 - Tunel - odsuvace niesu v krajnych polohach//
	//68 - Tunel - porucha komunikacie s IO modulom//
	//69 - Tunel - kolizia na vystupe dopravnika//
	//70 - Tunel - kolizia na vstupe dopravnika//
	
	//90 - Robot Manipulacie - porucha robota//
	//91 - Robot Odlievania - porucha robota//
	//92 - Robot Manipulacie - vypadnutie kusov z gripra//
	
	
	
		
		
	//*********************************Zistenie alarmu************************************************************//	
	FOR i:=0 TO 100 BY 1 DO
		Alarmy[i];
		IF Alarmy[i] = TRUE THEN
			NastalaPorucha:= TRUE;
		END_IF	
	END_FOR
	
	
	//*********************************Blikanie symbolu poruchy na OP*****************************************//
	IF NastalaPorucha THEN
		ZobrazSymbolAlarmu:= Blikac500ms;
	ELSE
		ZobrazSymbolAlarmu:= FALSE;
	END_IF
	
	//*********************************Ovládanie kontrolky poruchy********************************************//
	IF NastalaPorucha THEN
		doKontrolkaPORUCHA:= Blikac500ms;
	ELSE
		doKontrolkaPORUCHA:= FALSE;
	END_IF	
	
	
	//*********************************Zelené svetlo majáka****************************************************//
	IF Zariadenie_StavAutomat AND Zariadenie_StavPoINIT THEN
		doMajak_ZeleneSvetlo:= TRUE;
	ELSIF Zariadenie_StavAutomat AND NOT Zariadenie_StavPoINIT THEN
		doMajak_ZeleneSvetlo:= Blikac500ms;
	ELSE
		doMajak_ZeleneSvetlo:=FALSE;
	END_IF	
	
	
	//**********************************Žlté svetlo majáka*****************************************************//
	IF TP_ZobrazPopUp_TeplotaHlinikaNG = 0 THEN
		doMajak_ZlteSvetlo:= Blikac500ms;
	ELSIF TP_ZobrazPopUp_KontrolaKrytuPece = 0 THEN
		doMajak_ZlteSvetlo:= Blikac500ms;
	ELSIF TP_ZobrazPopUp_KontrolaCentrifug = 0 THEN
		doMajak_ZlteSvetlo:= Blikac500ms;
	ELSIF TP_ZobrazPopUp_DoplnHlinik = 0 THEN
		doMajak_ZlteSvetlo:= Blikac500ms;
	ELSE
		doMajak_ZlteSvetlo:= FALSE;
	END_IF
	
	
	//**********************************Èervené svetlo majáka***************************************************//
	IF NastalaPorucha THEN
		doMajak_CerveneSvetlo:= Blikac500ms;
	ELSE	
		doMajak_CerveneSvetlo:= FALSE;
	END_IF
	
	//***********************************Zvuková signalizácia majáka*********************************************//
	IF EDGEPOS(NastalaPorucha = TRUE) THEN
		ZapniHukacku:= TRUE;
	END_IF
	
	IF ZapniHukacku THEN
		doMajak_Hukacka:= Blikac500ms;
	ELSE
		doMajak_Hukacka:= FALSE;
	END_IF	
	
	IF NOT NastalaPorucha THEN
		ZapniHukacku:= FALSE;
	ELSIF VypnutieHukacky THEN
		ZapniHukacku:= FALSE;
	END_IF	
	
	//*********************************Potvrdenie alarmu**********************************************************//
	IF PotvrdenieAlarmov THEN
		Motion[1].cmd.autoInicialization:= TRUE;
		Motion[2].cmd.autoInicialization:= TRUE;
		Motion[3].cmd.autoInicialization:= TRUE;
		Motion[4].cmd.autoInicialization:= TRUE;
		Motion[5].cmd.autoInicialization:= TRUE;
		Motion[6].cmd.autoInicialization:= TRUE;
		Motion[7].cmd.autoInicialization:= TRUE;
		FM_Menic[1].Input.Command.Acknowledge:= TRUE;
		doStol_ResetPoruchy:= TRUE;
		doStol_OhrevResetPoruchy:= TRUE;
		brsmemset(ADR(Alarmy),0,SIZEOF(Alarmy));
		NastalaPorucha:= FALSE;
		CasPotvrdeniaAlarmu.IN:= TRUE;
		PoruchaOddelovaca:= FALSE;
		PoruchaOtocnyStol:= FALSE;
		PoruchaCentrifugy1:= FALSE;
		PoruchaCentrifugy2:= FALSE;
		PoruchaChladiacehoTunela:= FALSE;
		PoruchaVstupuChladiacehoTunela:= FALSE;
		PoruchaIndukcnehoOhrevu:= FALSE;
		PoruchaVstupManipulator:= FALSE;
		PoruchaPeceNaHlinik:= FALSE;
		PoruchaRobotManipulacie:= FALSE;
		PoruchaRobotOdlievania:= FALSE;
		VypnutieHukacky:= TRUE;
		PotvrdenieAlarmov:= FALSE;
	END_IF
	
	IF CasPotvrdeniaAlarmu.Q AND Motion[1].errorID = 0 AND Motion[2].errorID = 0 AND Motion[3].errorID = 0 AND Motion[4].errorID = 0 AND Motion[5].errorID = 0 AND Motion[6].errorID = 0 AND Motion[7].errorID = 0 THEN
		Motion[1].cmd.autoInicialization:= FALSE;
		Motion[2].cmd.autoInicialization:= FALSE;
		Motion[3].cmd.autoInicialization:= FALSE;
		Motion[4].cmd.autoInicialization:= FALSE;
		Motion[5].cmd.autoInicialization:= FALSE;
		Motion[6].cmd.autoInicialization:= FALSE;
		Motion[7].cmd.autoInicialization:= FALSE;
		FM_Menic[1].Input.Command.Acknowledge:= FALSE;
		doStol_ResetPoruchy:= FALSE;
		doStol_OhrevResetPoruchy:= FALSE;
		VypnutieHukacky:= FALSE;
		CasPotvrdeniaAlarmu.IN:= FALSE;
	END_IF
	
	CasPotvrdeniaAlarmu.PT:= T#2s;
	CasPotvrdeniaAlarmu();
	
	
	//******************************Porucha tlaku vzduchu*********************************************************//
	IF (Zariadenie_StavAutomat OR Zariadenie_StavManual) AND NOT diHlavnyPrivodVzduchu_TlakOK THEN
		Alarmy[0]:= TRUE;
	END_IF	
	
	
	//******************************Bolo stlaèené tlaèítko CS linky*****************************************************//
	IF EDGENEG (Stav_CS_Linky_Odblokovane = TRUE) THEN
		Alarmy[1]:= TRUE;
	END_IF
	
	//******************************Bolo stlaèené tlaèítko CS servisnych dveri 1*****************************************************//
	IF EDGENEG (Stav_CS_BZ1_Odblokovany = TRUE) THEN
		Alarmy[2]:= TRUE;
	END_IF
	
	//******************************Bolo stlaèené tlaèítko CS servisnych dveri 2*****************************************************//
	IF EDGENEG (Stav_CS_BZ2_Odblokovany = TRUE) THEN
		Alarmy[3]:= TRUE;
	END_IF
	
	
	
	//******************************Bolo stlaèené tlaèítko CS dokoncovacej stanice*****************************************************//
	IF EDGENEG (Stav_CS_DokonStanica_Odblokovane = TRUE) THEN
		Alarmy[4]:= TRUE;
	END_IF
	
	
	//******************************Bolo stlaèené tlaèítko CS robota manipulacie*****************************************************//
	IF EDGENEG (Stav_CS_RoboManipul_Odblokovane = TRUE) THEN
		Alarmy[5]:= TRUE;
	END_IF
	
	//******************************Bolo stlaèené tlaèítko CS robota odlievania*****************************************************//
	IF EDGENEG (Stav_CS_RoboManipul_Odblokovane = TRUE) THEN
		Alarmy[6]:= TRUE;
	END_IF
	
	
	//*******************************Vstupný manipulátor - Porucha serva pojazdu**********************************************************************//
	IF (Stol_Manipulator_Automat OR Stol_Manipulator_Manual) AND (Motion[1].error OR Motion[1].errorID <> 0) THEN 
		Motion[1].cmd.halt:= TRUE;
		Alarmy[24]:= TRUE;
		PoruchaVstupManipulator:= TRUE;
	END_IF
	
	//*******************************Vstupný manipulátor - Porucha komunikácie s IO modulom*************************************************************//
	IF (Stol_Manipulator_Automat OR Stol_Manipulator_Manual) AND NOT Stol_KomunikaciaOK THEN 
		Motion[1].cmd.halt:= TRUE;
		Alarmy[27]:= TRUE;
		PoruchaVstupManipulator:= TRUE;
	END_IF
	
	
	//*******************************Centrifuga 1 - Porucha serva otacania vretien**********************************************************************//
	IF (Centrifuga1_Automat OR Centrifuga1_Manual) AND (Motion[2].error OR Motion[2].errorID <> 0) THEN 
		Motion[2].cmd.halt:= TRUE;
		Alarmy[40]:= TRUE;
		PoruchaCentrifugy1:= TRUE;
	END_IF
	
	
	//*******************************Centrifuga 1 - Porucha serva zdvihu vretena 1**********************************************************************//
	IF (Centrifuga1_Automat OR Centrifuga1_Manual) AND (Motion[3].error OR Motion[3].errorID <> 0) THEN 
		Motion[3].cmd.halt:= TRUE;
		Alarmy[41]:= TRUE;
		PoruchaCentrifugy1:= TRUE;
	END_IF
	
	
	//*******************************Centrifuga 1 - Porucha serva zdvihu vretena 2**********************************************************************//
	IF (Centrifuga1_Automat OR Centrifuga1_Manual) AND (Motion[4].error OR Motion[4].errorID <> 0) THEN 
		Motion[4].cmd.halt:= TRUE;
		Alarmy[42]:= TRUE;
		PoruchaCentrifugy1:= TRUE;
	END_IF
	
	//******************************Centrifuga 1 - Porucha komunikácie s IO modulom***********************************************************************************//
	IF (Centrifuga1_Automat OR Centrifuga1_Manual) AND NOT Centrifuga1_KomunikaciaOK THEN
		Motion[2].cmd.halt:= TRUE;
		Motion[3].cmd.halt:= TRUE;
		Motion[4].cmd.halt:= TRUE;
		Alarmy[47]:= TRUE;
		PoruchaCentrifugy1:= TRUE;
	END_IF
	
	
	//*******************************Centrifuga 2 - Porucha serva otacania vretien**********************************************************************//
	IF (Centrifuga2_Automat OR Centrifuga2_Manual) AND (Motion[5].error OR Motion[5].errorID <> 0) THEN 
		Motion[5].cmd.halt:= TRUE;
		Alarmy[50]:= TRUE;
		PoruchaCentrifugy2:= TRUE;
	END_IF
	
	
	//*******************************Centrifuga 2 - Porucha serva zdvihu vretena 1**********************************************************************//
	IF (Centrifuga2_Automat OR Centrifuga2_Manual) AND (Motion[6].error OR Motion[6].errorID <> 0) THEN 
		Motion[6].cmd.halt:= TRUE;
		Alarmy[51]:= TRUE;
		PoruchaCentrifugy2:= TRUE;
	END_IF
	
	
	//*******************************Centrifuga 2 - Porucha serva zdvihu vretena 2**********************************************************************//
	IF (Centrifuga2_Automat OR Centrifuga2_Manual) AND (Motion[7].error OR Motion[7].errorID <> 0) THEN 
		Motion[7].cmd.halt:= TRUE;
		Alarmy[52]:= TRUE;
		PoruchaCentrifugy2:= TRUE;
	END_IF
	
	//******************************Centrifuga 2 - Porucha komunikácie s IO modulom***********************************************************************************//
	IF (Centrifuga2_Automat OR Centrifuga2_Manual) AND NOT Centrifuga2_KomunikaciaOK THEN
		Motion[5].cmd.halt:= TRUE;
		Motion[6].cmd.halt:= TRUE;
		Motion[7].cmd.halt:= TRUE;
		Alarmy[57]:= TRUE;
		PoruchaCentrifugy2:= TRUE;
	END_IF
	
	
	
	//**********************************Tunel - Porucha menièa *********************************************************************//
	IF (Tunel_Automat OR Tunel_Manual) AND (FM_Menic[1].Output.Status.Error OR NOT diTunel_PoruchaMotora) THEN
		Alarmy[60]:= TRUE;
		PoruchaChladiacehoTunela:= TRUE;
	END_IF
	
	
	//**********************************Tunel - Porucha ventilatorov *********************************************************************//
	IF (Tunel_Automat OR Tunel_Manual) AND (NOT diTunel_PoruchaVentilatora1 OR NOT diTunel_PoruchaVentilatora2 OR NOT diTunel_PoruchaVentilatora3) THEN
		Alarmy[61]:= TRUE;
		PoruchaChladiacehoTunela:= TRUE;
	END_IF
	

	//**********************************Tunel - Porucha komunikacie s IO modulom************************************************************//
	IF (Tunel_Automat OR Tunel_Manual) AND NOT Tunel_KomunikaciaOK THEN
		Alarmy[68]:= TRUE;
		PoruchaChladiacehoTunela:= TRUE;
	END_IF
	
	
	
	
	//************************************Vstupný manipulátor - Pretazenie serva pojazdu************************************************************************//
	IF (Stol_Manipulator_Automat OR Stol_Manipulator_Manual) AND Motion[1].status.ActTorque > 2.0 THEN
		Motion[1].cmd.halt:= TRUE;
		Alarmy[25]:= TRUE;
		PoruchaVstupManipulator:= TRUE;
	END_IF
	
	//************************************Centrifuga 1 - Pretazenie serva otáèania vretien************************************************************************//
		IF (Centrifuga1_Automat OR Centrifuga1_Manual) AND Motion[2].status.ActTorque > 25.0 THEN
			Motion[2].cmd.halt:= TRUE;
			Alarmy[44]:= TRUE;
			PoruchaCentrifugy1:= TRUE;
		END_IF
	
	//************************************Centrifuga 1 - Pretazenie serva zdvihu vretena 1************************************************************************//
	//	IF (Centrifuga1_Automat OR Centrifuga1_Manual)AND NOT Centrifuga1_PrebiehaPritlak AND Motion[3].status.ActTorque > 5.0 THEN
	//		Motion[3].cmd.halt:= TRUE;
	//		Alarmy[45]:= TRUE;
	//		PoruchaCentrifugy1:= TRUE;
	//	END_IF
	
	
	//************************************Centrifuga 1 - Pretazenie serva zdvihu vretena 2************************************************************************//
	//	IF (Centrifuga1_Automat OR Centrifuga1_Manual)AND NOT Centrifuga1_PrebiehaPritlak AND Motion[4].status.ActTorque > 5.0 THEN
	//		Motion[4].cmd.halt:= TRUE;
	//		Alarmy[46]:= TRUE;
	//		PoruchaCentrifugy1:= TRUE;
	//	END_IF
	
	
	//************************************Centrifuga 2 - Pretazenie serva otáèania vretien************************************************************************//
		IF (Centrifuga2_Automat OR Centrifuga2_Manual) AND Motion[5].status.ActTorque > 25.0 THEN
			Motion[5].cmd.halt:= TRUE;
			Alarmy[54]:= TRUE;
			PoruchaCentrifugy2:= TRUE;
		END_IF
	
	//************************************Centrifuga 2 - Pretazenie serva zdvihu vretena 1************************************************************************//
	//	IF (Centrifuga2_Automat OR Centrifuga2_Manual)AND NOT Centrifuga2_PrebiehaPritlak AND Motion[6].status.ActTorque > 5.0 THEN
	//		Motion[6].cmd.halt:= TRUE;
	//		Alarmy[55]:= TRUE;
	//		PoruchaCentrifugy2:= TRUE;
	//	END_IF
	
	
	//************************************Centrifuga 2 - Pretazenie serva zdvihu vretena 2************************************************************************//
	//	IF (Centrifuga2_Automat OR Centrifuga2_Manual)AND NOT Centrifuga2_PrebiehaPritlak AND Motion[7].status.ActTorque > 5.0 THEN
	//		Motion[7].cmd.halt:= TRUE;
	//		Alarmy[56]:= TRUE;
	//		PoruchaCentrifugy2:= TRUE;
	//	END_IF
	
		
	
	
	//****************************************Otoèný stol - porucha motora*****************************************************************************************//
	IF (Stol_Automat OR Stol_Manual) AND NOT diStol_PoruchaMotora THEN
		Alarmy[30]:= TRUE;
		PoruchaOtocnyStol:= TRUE;
	END_IF
	
	//***************************************Otoèný stol - vysoka teplota motora****************************************************************************************//
	IF (Stol_Automat OR Stol_Manual) AND diStol_TepelnaOchranaMotora THEN
		Alarmy[32]:= TRUE;
		PoruchaOtocnyStol:= TRUE;
	END_IF
	

		
	
	//*****************************************Robot manipulácie - porucha robota***************************************************************************************//
	IF (RobotManipulacie_Automat OR RobotManipulacie_Manual) AND RobotMan_Stav_Porucha THEN
		Alarmy[90]:= TRUE;
		PoruchaRobotManipulacie:= TRUE;
	END_IF	
	
	
	//******************************************Robot odlievania - porucha robota****************************************************************************************//
//	IF (RobotOdlievania_Automat OR RobotOdlievania_Manual) AND RobotOdliev_Stav_Porucha THEN
//		Alarmy[91]:= TRUE;
//		PoruchaRobotOdlievania:= TRUE;
//	END_IF	
	
	
	//******************************************Robot odlievania - kritická hladina hliníka******************************************************************************//
	IF RobotOdlievania_Automat AND RobotOdliev_Stav_KritickaHladina THEN
		TP_ZobrazPopUp_KritickaHladina:= 0;
		Alarmy[91]:= TRUE;
		PoruchaRobotOdlievania:= TRUE;
	END_IF
	 
	
	//******************************************Robot manipulácie vypadli kusy z gripra************************************************************************************//
	IF EDGEPOS(RobotMan_Stav_VypadliKusy = TRUE) AND RobotManipulacie_Automat THEN
		Alarmy[92]:= TRUE;
		PoruchaRobotManipulacie:= TRUE;
	END_IF
	
	//******************************************Teplota hliníka v peci je mimo rozsah***************************************************************************************//
	IF Zariadenie_StavAutomat AND TeplotaHlinika_MimoRozsah THEN
		Alarmy[7]:= TRUE;
		Zariadenie_KoniecCyklu:= TRUE;
	END_IF	
	
	
	//********************************************Porucha indukèného ohrevu**************************************************************************************************//
	IF Zariadenie_StavAutomat AND NOT diStol_OhrevStavREADY THEN
		Alarmy[34]:= TRUE;
		PoruchaOtocnyStol:= TRUE;
	END_IF
	
	
	
	
	
		END_PROGRAM

PROGRAM _EXIT
		(* Insert code here *)
	 
		END_PROGRAM

