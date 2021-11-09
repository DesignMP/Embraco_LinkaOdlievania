
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	
	diCentrifuga1_SnimNatocVreteno2;
	
	//Volanie podprogramov//
	OvladanieOtacania;
	OvladanieZdvihu1;
	OvladanieZdvihu2;
	PrepocetTenzometrov;
	MeraniaVyskyBalika;
	
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_Centrifuga1);
	
	
	//Reset sekcie //
	IF Centrifuga1_Reset OR NOT BezpOkruhOplotenia_Aktivovany OR PoruchaCentrifugy1 THEN
		SC_Centrifuga1.Step:= 0;
	END_IF
	
		
	//Prepoèet èasu otáèania centrifugy//
	Centrifuga1_CasOtacaniaTIME:= REAL_TO_TIME(ZvolCasOtacaniaPriOdlievani *1000);
	
	//Zrušenie signálu prípravrava na centrifugu 1//
	
	IF RobotMan_Stav_PripravenyCentrif1 AND RobotMan_PripravaNaCentrifugu1 THEN
		RobotMan_PripravaNaCentrifugu1:= FALSE;
	END_IF	
	
	
	//Riadenie chladenia vretena//
	doCentrifuga1_ChladenieVretena;
	
	
	
	CASE SC_Centrifuga1.Step OF 
	
	
		0:
			SC_Centrifuga1.StepName:='0 - Nulovanie';
			SC_OvlOtacania.Step:= 0;
			SC_OvlZdvihuVR1.Step:= 0;
			SC_OvlZdvihuVR2.Step:= 0;
			Centrifuga1_Automat:= FALSE;
			Centrifuga1_KoniecVyroby:= FALSE;
			Centrifuga1_KoniecCyklu:= FALSE;
			Centrifuga1_Manual:= FALSE;
			Centrifuga1_PoINIT:= FALSE;
			Centrifuga1_Reset:= FALSE;
			Centrifuga1_OtacanieVPOZICI:= FALSE;
			Centrifuga1_Zdvih1_VPOZICI:= FALSE;
			Centrifuga1_Zdvih2_VPOZICI:= FALSE;
			RobotMan_Centrifug1_OdoberKusy:= FALSE;
			RobotMan_Centrifug1_VlozKusy:= FALSE;
			RobotOdliev_Centri1_NaberHlinik:= FALSE;
			RobotOdliev_Centri1_NalejHlinik:= FALSE;
			Centrifuga1_PrebiehaPritlak:= FALSE;
			Centrifuga1_Kusy_v_Centrifuge:= FALSE;
			Centrifuga1_StavPrazdna:= FALSE;
			RobotMan_PripravaNaCentrifugu1:= FALSE;
			RobotMan_Centrifug1_DoCentrifugy:= FALSE;
			TP_OtvorCentrifugu_1:= FALSE;
			StavPrebiehaOtvorenieCentrif_1:= FALSE;
			RR_PoziciaOdoberaniaVR1:= FALSE;
			RR_PoziciaVyrazaniaVR1:= FALSE;
			RR_PoziciaVymenaFormyVR1:= FALSE;
			RR_PoziciaOdoberaniaVR2:= FALSE;
			RR_PoziciaVyrazaniaVR2:= FALSE;
			RR_PoziciaVymenaFormyVR2:= FALSE;
			doCentrifuga1_ChladenieVretena:= FALSE;
			Rychlost_2:= FALSE;
			IF BezpOkruhOplotenia_Aktivovany AND NOT PoruchaCentrifugy1 THEN
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 1;
			END_IF
	
	
		1:
			SC_Centrifuga1.StepName:='1 - Rozhodnutie o cinnosti';
			IF Centrifuga1_Automat THEN
				SC_Centrifuga1.Step:= 2;
			ELSIF TP_OtvorCentrifugu_1 THEN
				StavPrebiehaOtvorenieCentrif_1:= TRUE;
				SC_Centrifuga1.Step:= 2;
			ELSIF Centrifuga1_Manual THEN
				SC_Centrifuga1.Step:= 700;
			END_IF
		
		
		//********************************************************Inicializácia****************************************************************************//
	
		2:
			SC_Centrifuga1.StepName:='2 - Inicializacia - cakanie na spustenie';
			SC_Centrifuga1.IdleTime.PT:= T#500ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
			SC_Centrifuga1.IdleTime.IN:= TRUE;
				
			
			IF SC_Centrifuga1.IdleTime.Q THEN
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 4;
			END_IF
	
		
		4:
			SC_Centrifuga1.StepName:='4 - Inicializacia - homing serva otacania centrifugy';
			SC_Centrifuga1.IdleTime.PT:= T#500ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
		
			IF NOT SC_Centrifuga1.Switch1 AND RobotMan_Centrifug1_BezpVzdialen THEN
				Centrifuga1_Otacanie_HOME_Senzor:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
			
			IF EDGEPOS (Motion[2].status.DriveStatus.HomingOk = TRUE) THEN
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 5;
			END_IF
		
		5:
			SC_Centrifuga1.StepName:='5 - Inicializacia - otocenie vretien do 0';
			SC_Centrifuga1.IdleTime.PT:= T#500ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;	
		
			Centrifuga1_Otacanie_PocetOtacok:= 0;
			
			IF NOT SC_Centrifuga1.Switch1 AND RobotMan_Centrifug1_BezpVzdialen THEN
				Otacanie_Polohuj:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
			
			IF Centrifuga1_OtacanieVPOZICI AND (diCentrifuga1_SnimNatocVreteno1 OR diCentrifuga1_SnimNatocVreteno2) THEN
				Centrifuga1_OtacanieVPOZICI:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 6;
			END_IF
			
			IF Centrifuga1_OtacanieVPOZICI AND NOT diCentrifuga1_SnimNatocVreteno1 AND NOT diCentrifuga1_SnimNatocVreteno2 THEN
				Alarmy[48]:= TRUE;
				PoruchaCentrifugy1:= TRUE;
			END_IF	
		
		
		
		6:
			SC_Centrifuga1.StepName:='6 - Inicializacia - kontrola home zdvihu vretien';
			SC_Centrifuga1.IdleTime.PT:= T#500ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
		
			IF NOT Motion[3].status.DriveStatus.HomingOk AND NOT Motion[4].status.DriveStatus.HomingOk THEN
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 10;
			ELSIF NOT Motion[3].status.DriveStatus.HomingOk AND Motion[4].status.DriveStatus.HomingOk THEN
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 11;	
			ELSIF Motion[3].status.DriveStatus.HomingOk AND NOT Motion[4].status.DriveStatus.HomingOk THEN
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 12;
			ELSIF Motion[3].status.DriveStatus.HomingOk AND Motion[4].status.DriveStatus.HomingOk THEN
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 13;
			END_IF
		
		10:
			SC_Centrifuga1.StepName:='10 - Inicializacia - homing serv zdvihu vretien';
			SC_Centrifuga1.IdleTime.PT:= T#200ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
			SC_Centrifuga1.IdleTime.IN:= TRUE;
			
			IF NOT SC_Centrifuga1.Switch1 THEN
				Centrifuga1_Zdvih1_HOME:= TRUE;
				Centrifuga1_Zdvih2_HOME:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
			
			IF Motion[3].status.DriveStatus.HomingOk AND Motion[4].status.DriveStatus.HomingOk AND SC_Centrifuga1.IdleTime.Q THEN
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 13;
			END_IF
		
		
		11:
			SC_Centrifuga1.StepName:='11 - Inicializacia - homing serva zdvihu vretena 1, vreteno 2 chod do odoberacej pozicie';
			SC_Centrifuga1.IdleTime.PT:= T#200ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
			SC_Centrifuga1.IdleTime.IN:= TRUE;
			
			Centrifuga1_Zdvih2_ZadanaPozMM:= 4.0;
		
			IF NOT SC_Centrifuga1.Switch1 THEN
				Centrifuga1_Zdvih1_HOME:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
		
			IF Motion[3].status.DriveStatus.HomingOk AND Centrifuga1_Zdvih2_VPOZICI AND SC_Centrifuga1.IdleTime.Q THEN
				Centrifuga1_Zdvih2_VPOZICI:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 13;
			END_IF
		
		
		
		
		12:
			SC_Centrifuga1.StepName:='12 - Inicializacia - homing serva zdvihu vretena 2, vreteno 1 chod do odoberacej pozicie';
			SC_Centrifuga1.IdleTime.PT:= T#200ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
			SC_Centrifuga1.IdleTime.IN:= TRUE;
			
			Centrifuga1_Zdvih1_ZadanaPozMM:= 4.0;	
		
			IF NOT SC_Centrifuga1.Switch1 THEN
				Centrifuga1_Zdvih2_HOME:= TRUE;
				ZdvihVR1_Polohuj:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
		
			IF Motion[4].status.DriveStatus.HomingOk AND Centrifuga1_Zdvih1_VPOZICI AND SC_Centrifuga1.IdleTime.Q THEN
				Centrifuga1_Zdvih1_VPOZICI:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 13;
			END_IF
		
		
		
		13:
			SC_Centrifuga1.StepName:='13 - Inicializacia - vreteno 1 a vreteno 2 chod do odoberacej pozicie';
			SC_Centrifuga1.IdleTime.PT:= T#500ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
		
			Centrifuga1_Zdvih1_ZadanaPozMM:= 4.0;
			Centrifuga1_Zdvih2_ZadanaPozMM:= 4.0;
		
		
			IF NOT SC_Centrifuga1.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND RobotMan_Centrifug1_BezpVzdialen THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
		
			IF Centrifuga1_Zdvih1_VPOZICI AND Centrifuga1_Zdvih2_VPOZICI AND NOT RobotMan_Centrifug1_KusyOdobrate THEN
				Centrifuga1_Zdvih1_VPOZICI:= FALSE;
				Centrifuga1_Zdvih2_VPOZICI:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				IF TP_OtvorCentrifugu_1 THEN
					SC_Centrifuga1.Step:= 0;
				ELSE	
					SC_Centrifuga1.Step:= 16;
				END_IF	
			END_IF
		
			
				
		16:
			SC_Centrifuga1.StepName:='16 - Inicializacia - zistovanie kusov v centrifuge,chod vretien do pozicie pritlaku';
			SC_Centrifuga1.IdleTime.PT:= T#200ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
			SC_Centrifuga1.IdleTime.IN:= TRUE;
					
			IF NOT SC_Centrifuga1.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND SC_Centrifuga1.IdleTime.Q THEN
				ZdvihVR1_MoveMoment:= TRUE;
				ZdvihVR2_MoveMoment:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
		
			IF Centrifuga1_Zdvih1_VPOZICI OR Centrifuga1_Zdvih2_VPOZICI THEN
				Centrifuga1_Zdvih1_VPOZICI:= FALSE;
				Centrifuga1_Zdvih2_VPOZICI:= FALSE;
				Centrifuga1_Kusy_v_Centrifuge:= TRUE;
				Motion[3].cmd.halt:= TRUE;
				Motion[4].cmd.halt:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
				SC_OvlZdvihuVR2.Step:= 0;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 17;
			END_IF 
			
			
			
			IF Centrifuga1_Zdvih1_AktualPozMM >= 177 OR Centrifuga1_Zdvih2_AktualPozMM >= 177 THEN
				Motion[3].cmd.halt:= TRUE;
				Motion[4].cmd.halt:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
				SC_OvlZdvihuVR2.Step:= 0;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 18;
			END_IF
			
			
		
			
						
		
		17:
			SC_Centrifuga1.StepName:='17 - Inicializacia - chod vretien do vyrazacej pozicie';
			SC_Centrifuga1.IdleTime.PT:= T#200ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;	
			SC_Centrifuga1.IdleTime.IN:= TRUE;
			
			Centrifuga1_Zdvih1_ZadanaPozMM:= 1.0;
			Centrifuga1_Zdvih2_ZadanaPozMM:= 1.0;
			
			
			IF NOT SC_Centrifuga1.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND SC_Centrifuga1.IdleTime.Q THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
			
			IF Centrifuga1_Zdvih1_VPOZICI AND Centrifuga1_Zdvih2_VPOZICI THEN
				Centrifuga1_Zdvih1_VPOZICI:= FALSE;
				Centrifuga1_Zdvih2_VPOZICI:= FALSE;
				IF Centrifuga1_Kusy_v_Centrifuge AND NOT RobotMan_Centrifug1_KusyOdobrate THEN
					Centrifuga1_PoINIT:= TRUE;
					SC_Centrifuga1.ResetStep:= TRUE;
					SC_Centrifuga1.Step:= 109;
				ELSIF NOT Centrifuga1_Kusy_v_Centrifuge AND NOT RobotMan_Centrifug1_KusyVlozene AND NOT RobotMan_Stav_VkladamDoCentrif1 THEN
					SC_Centrifuga1.ResetStep:= TRUE;
					SC_Centrifuga1.Step:= 18;
				END_IF	
			END_IF
				
		18:
			SC_Centrifuga1.StepName:='18 - Inicializacia - chod vretien do odoberacej a vkladacej pozicie';
			SC_Centrifuga1.IdleTime.PT:= T#200ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;	
			SC_Centrifuga1.IdleTime.IN:= TRUE;
		
			Centrifuga1_Zdvih1_ZadanaPozMM:= 4.0;
			Centrifuga1_Zdvih2_ZadanaPozMM:= 4.0;
			
			
			IF NOT SC_Centrifuga1.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND SC_Centrifuga1.IdleTime.Q THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
			
			IF Centrifuga1_Zdvih1_VPOZICI AND Centrifuga1_Zdvih2_VPOZICI THEN
				Centrifuga1_Zdvih1_VPOZICI:= FALSE;
				Centrifuga1_Zdvih2_VPOZICI:= FALSE;
				Centrifuga1_PoINIT:= TRUE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 100;
			END_IF
		
		
		
		//********************************************************Automatický režim****************************************************************************//
		100:
			SC_Centrifuga1.StepName:='100 - Automaticky rezim - cakanie na vlozenie kusov';
			SC_Centrifuga1.IdleTime.PT:= T#14s;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
			Centrifuga1_StavPrazdna:= FALSE;
			RobotOdliev_Centri1_NaberHlinik:= FALSE;
			RobotOdliev_Centri1_NalejHlinik:= FALSE;
			RobotOdliev_VylejHlinikCentr1:= FALSE;
			SC_Centrifuga1.IdleTime.IN:= TRUE;
			
					
			IF NOT SC_Centrifuga1.Switch1 THEN
				RobotMan_Centrifug1_VlozKusy:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
		
			IF RobotMan_Stav_VkladamDoCentrif1 THEN
				RobotOdliev_Centri1_NaberHlinik:= TRUE;
				RobotOdlievanie_StavPreplachnuty:= FALSE;
			END_IF	
			
			IF RobotMan_Centrifug1_KusyVlozene AND RobotOdliev_Stav_ProgramRUN THEN
				RobotMan_Centrifug1_VlozKusy:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 102;
			END_IF
		
			IF Centrifuga1_KoniecCyklu AND RobotMan_Stav_Odparkovany THEN
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 120;
			END_IF
			
			IF Centrifuga1_KoniecVyroby AND RobotMan_Stav_Odparkovany THEN
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 120;
			END_IF
		
		102:
			SC_Centrifuga1.StepName:='102 - Automaticky rezim - chod vretien do pozicie pritlaku';
			SC_Centrifuga1.IdleTime.PT:= T#500ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
		
				
			IF NOT SC_Centrifuga1.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND RobotMan_Centrifug1_BezpVzdialen THEN
				ZdvihVR1_MoveMoment:= TRUE;
				ZdvihVR2_MoveMoment:= TRUE;
				Centrifuga1_PrebiehaPritlak:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
		
			IF Centrifuga1_Zdvih1_VPOZICI AND Centrifuga1_Zdvih2_VPOZICI AND NOT RobotOdliev_Stav_NalievamCentr1 AND RobotOdliev_Stav_PripNaliatCent1 THEN
				Centrifuga1_Zdvih1_VPOZICI:= FALSE;
				Centrifuga1_Zdvih2_VPOZICI:= FALSE;
				PoslednaVyskaBalikaVR1:= Centrifuga1_VR1_NamVyskaBalika;
				PoslednaVyskaBalikaVR2:= Centrifuga1_VR2_NamVyskaBalika;
				Centrifuga1_PrebiehaPritlak:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 103;
			ELSIF Centrifuga1_Zdvih1_VPOZICI AND Centrifuga1_Zdvih2_VPOZICI AND NOT RobotOdliev_Stav_ProgramRUN THEN
				Centrifuga1_Zdvih1_VPOZICI:= FALSE;
				Centrifuga1_Zdvih2_VPOZICI:= FALSE;
				PoslednaVyskaBalikaVR1:= Centrifuga1_VR1_NamVyskaBalika;
				PoslednaVyskaBalikaVR2:= Centrifuga1_VR2_NamVyskaBalika;
				RobotOdliev_Centri1_NalejHlinik:= FALSE;
				RobotOdliev_Centri1_NaberHlinik:= FALSE;
				Centrifuga1_PrebiehaPritlak:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 104;
			END_IF 
		
		103:
			SC_Centrifuga1.StepName:='103 - Automaticky rezim - kontrola vysky balika';
			SC_Centrifuga1.IdleTime.PT:= T#200ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
			SC_Centrifuga1.IdleTime.IN:= TRUE;
			
			IF SC_Centrifuga1.IdleTime.Q THEN
				IF VyskaBalikaVR1_OK AND VyskaBalikaVR2_OK THEN
					doCentrifuga1_ChladenieVretena:= FALSE;
					SC_Centrifuga1.ResetStep:= TRUE;
					SC_Centrifuga1.Step:= 105;
				ELSE
					RobotOdliev_VylejHlinikCentr1:= TRUE;
					RobotOdliev_Centri1_NalejHlinik:= FALSE;
					RobotOdliev_Centri1_NaberHlinik:= FALSE;
					TP_ZobrazHlasVyskaBalikaCentrif1:= 0;
					RobotMan_PripravaNaCentrifugu1:= TRUE;
					SC_Centrifuga1.ResetStep:= TRUE;
					SC_Centrifuga1.Step:= 104;
				END_IF
			END_IF
		
			
		104:
			SC_Centrifuga1.StepName:='104 - Automaticky rezim - zasunutie vretien do vyrazacej pozicie';
			SC_Centrifuga1.IdleTime.PT:= T#200ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
			
			Centrifuga1_Zdvih1_ZadanaPozMM:= 1.0;
			Centrifuga1_Zdvih2_ZadanaPozMM:= 1.0;
			
			IF NOT SC_Centrifuga1.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND RobotMan_Centrifug1_BezpVzdialen THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				RobotMan_PripravaNaCentrifugu1:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
		
				
			IF Centrifuga1_Zdvih1_VPOZICI AND Centrifuga1_Zdvih2_VPOZICI AND (diCentrifuga1_SnimNatocVreteno1 OR diCentrifuga1_SnimNatocVreteno2) THEN
				Centrifuga1_Zdvih1_VPOZICI:= FALSE;
				Centrifuga1_Zdvih2_VPOZICI:= FALSE;
				Centrifuga1_OtacanieVPOZICI:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 109;
			ELSIF Centrifuga1_Zdvih1_VPOZICI AND Centrifuga1_Zdvih2_VPOZICI AND NOT diCentrifuga1_SnimNatocVreteno1 AND NOT diCentrifuga1_SnimNatocVreteno2 THEN	
				Alarmy[48]:= TRUE;
				PoruchaCentrifugy1:= TRUE;
			END_IF
			
		
		105:
			SC_Centrifuga1.StepName:='105 - Automaticky rezim - roztocenie centrifugy na zadany cas';
			SC_Centrifuga1.IdleTime.PT:= Centrifuga1_CasOtacaniaTIME;
			SC_Centrifuga1.AlarmTime.PT:= T#60s;
			
			
			
			
								
			IF NOT SC_Centrifuga1.Switch1 AND RobotMan_Centrifug1_BezpVzdialen THEN
			 	OtacanieRychlostServo:= (Centrifuga1_Otac_StartRychlost / OtacanieKonstOtMin) * OtacanieKonstServo;
				Motion[2].par.acc := (OtacanieRychlostServo / 2);
				Motion[2].par.dec := (OtacanieRychlostServo / 2);
				Otacanie_MoveVelocity:= TRUE;
				RobotOdliev_Centri1_NalejHlinik:= TRUE;
				SC_Centrifuga1.AlarmTime.IN:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
			
			IF NOT SC_Centrifuga1.Switch2 AND RobotOdliev_Stav_NalievamCentr1 THEN
				OtacanieRychlostServo:= (Centrifuga1_Otac_PracovRychlost / OtacanieKonstOtMin) * OtacanieKonstServo;
				Motion[2].par.acc := (TP_Centrifuga1_AccRampOtacania * 1440);
				Motion[2].cmd.moveVelocity:= TRUE;
				Rychlost_2:= TRUE;
				SC_Centrifuga1.Switch2:= TRUE;
			END_IF	
			
			IF Rychlost_2 THEN
				IF (Motion[2].status.ActVelocity + 1.0) >= OtacanieRychlostServo THEN
					SC_Centrifuga1.IdleTime.IN:= TRUE;
				END_IF
			END_IF	
			
			
			
			
			IF SC_Centrifuga1.AlarmTime.Q AND NOT RobotOdliev_Stav_NalievamCentr1 THEN
				RobotOdliev_VylejHlinikCentr1:= TRUE;
				RobotOdliev_Centri1_NaberHlinik:= FALSE;
				RobotOdliev_Centri1_NalejHlinik:= FALSE;
				Otacanie_MoveVelocity:= FALSE;
				Rychlost_2:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 106;
			END_IF
			
			
			
			IF EDGENEG (RobotOdliev_Stav_NalievamCentr1 = TRUE) THEN
				SC_Centrifuga1.AlarmTime.IN:= FALSE;
				RobotOdliev_Centri1_NaberHlinik:= FALSE;
				RobotOdliev_Centri1_NalejHlinik:= FALSE;
			END_IF
			
					
			IF SC_Centrifuga1.IdleTime.Q THEN
				Otacanie_MoveVelocity:= FALSE;
				Rychlost_2:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 106;
			END_IF
		
			
		106:
			SC_Centrifuga1.StepName:='106 - Automaticky rezim - cakanie na zastavenie otacania, vyratanie poctu otacok';
			SC_Centrifuga1.IdleTime.PT:= T#500ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
			
			IF Motion[2].state.StandStill THEN
				AktualnyPocetOtacok:= (Motion[2].status.ActPosition / 3600); 
				PocetOtacokINT:= TRUNC(AktualnyPocetOtacok);
				Centrifuga1_VyratanyPocetOtacok:= INT_TO_REAL(PocetOtacokINT);
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 107;
			END_IF
			
				
		107:
			SC_Centrifuga1.StepName:='107 - Automaticky rezim - zasunutie vretien do vyrazacej pozicie, otocenie do odoberacej polohy';
			SC_Centrifuga1.IdleTime.PT:= T#200ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
		
			Centrifuga1_Zdvih1_ZadanaPozMM:= 1.0;
			Centrifuga1_Zdvih2_ZadanaPozMM:= 1.0;
			Centrifuga1_Otacanie_PocetOtacok:= Centrifuga1_VyratanyPocetOtacok;
					
			IF NOT SC_Centrifuga1.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND RobotMan_Centrifug1_BezpVzdialen THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				Otacanie_Polohuj:= TRUE;
				doCentrifuga1_ChladenieVretena:= TRUE;
				RobotMan_PripravaNaCentrifugu1:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
		
				
			IF Centrifuga1_Zdvih1_VPOZICI AND Centrifuga1_Zdvih2_VPOZICI AND Centrifuga1_OtacanieVPOZICI AND (diCentrifuga1_SnimNatocVreteno1 OR diCentrifuga1_SnimNatocVreteno2) THEN
				Centrifuga1_Zdvih1_VPOZICI:= FALSE;
				Centrifuga1_Zdvih2_VPOZICI:= FALSE;
				Centrifuga1_OtacanieVPOZICI:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 108;
			END_IF
		
			
			
			IF Centrifuga1_OtacanieVPOZICI AND NOT diCentrifuga1_SnimNatocVreteno1 AND NOT diCentrifuga1_SnimNatocVreteno2 THEN
				Alarmy[48]:= TRUE;
				PoruchaCentrifugy1:= TRUE;
			END_IF	
		
		108:
			SC_Centrifuga1.StepName:='108 - Automaticky rezim - zreferovanie otáèania centrifugy';
			SC_Centrifuga1.IdleTime.PT:= T#500ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
						
			IF NOT SC_Centrifuga1.Switch1 AND SC_OvlOtacania.Step = 1 THEN
				Centrifuga1_Otacanie_HOME_Direct:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
		
			IF (Motion[2].status.ActPosition = 0.0) AND Motion[2].status.DriveStatus.HomingOk THEN
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 109;
			END_IF
	
			
			
		109:
			SC_Centrifuga1.StepName:='109 - Automaticky rezim - cakanie na odobratie kusov';
			SC_Centrifuga1.IdleTime.PT:= T#500ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
		
			IF NOT SC_Centrifuga1.Switch1 THEN
				RobotMan_Centrifug1_DoCentrifugy:= TRUE;
				RobotMan_Centrifug1_OdoberKusy:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
		
			IF RobotMan_Centrifug1_KusyOdobrate  THEN
				RobotMan_Centrifug1_DoCentrifugy:= FALSE;
				RobotMan_Centrifug1_OdoberKusy:= FALSE;
				RobotMan_PripravaNaCentrifugu1:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 110;
			END_IF
			
				
		
		110:
			SC_Centrifuga1.StepName:='110 - Automaticky rezim - zdvihnutie vretien do odoberacej a vkladacej pozicie';
			SC_Centrifuga1.IdleTime.PT:= T#200ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
			SC_Centrifuga1.IdleTime.IN:= TRUE;
			
			Centrifuga1_Zdvih1_ZadanaPozMM:= 4.0;
			Centrifuga1_Zdvih2_ZadanaPozMM:= 4.0;
		
			IF NOT SC_Centrifuga1.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND SC_Centrifuga1.IdleTime.Q THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
		
			IF Centrifuga1_Zdvih1_VPOZICI AND Centrifuga1_Zdvih2_VPOZICI AND NOT RobotMan_Centrifug1_KusyVlozene THEN
				Centrifuga1_Zdvih1_VPOZICI:= FALSE;
				Centrifuga1_Zdvih2_VPOZICI:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 100;
			END_IF
		
			
		
		
		120:
			SC_Centrifuga1.StepName:='120 - Automaticky rezim - zatvorenie centrifugy';
			SC_Centrifuga1.IdleTime.PT:= T#500ms;
			SC_Centrifuga1.AlarmTime.PT:= T#5s;
		
			Centrifuga1_Zdvih1_ZadanaPozMM:= 160.0;
			Centrifuga1_Zdvih2_ZadanaPozMM:= 160.0;
			
			
			IF NOT SC_Centrifuga1.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				SC_Centrifuga1.Switch1:= TRUE;
			END_IF
			
			IF Centrifuga1_Zdvih1_VPOZICI AND Centrifuga1_Zdvih2_VPOZICI THEN
				Centrifuga1_Zdvih1_VPOZICI:= FALSE;
				Centrifuga1_Zdvih2_VPOZICI:= FALSE;
				SC_Centrifuga1.ResetStep:= TRUE;
				SC_Centrifuga1.Step:= 0;
			END_IF		
			
			
			
		
		//********************************************************Ruèný režim***********************************************************************************//
		700:
			SC_Centrifuga1.StepName:='700 - Rucny rezim';
		
			//Polohovanie vretena 1//
			IF RR_PoziciaOdoberaniaVR1 AND SC_OvlZdvihuVR1.Step = 1 THEN
				Centrifuga1_Zdvih1_ZadanaPozMM:= 4.0;	
				ZdvihVR1_Polohuj:= TRUE;
			ELSIF RR_PoziciaVyrazaniaVR1 AND SC_OvlZdvihuVR1.Step = 1 THEN
				Centrifuga1_Zdvih1_ZadanaPozMM:= 1.0;	
				ZdvihVR1_Polohuj:= TRUE;
			ELSIF RR_PoziciaVymenaFormyVR1 AND SC_OvlZdvihuVR1.Step = 1 THEN
				Centrifuga1_Zdvih1_ZadanaPozMM:= 15;	
				ZdvihVR1_Polohuj:= TRUE;
			END_IF
		
		
		
		
		
			//Polohovanie vretena 2//
			IF RR_PoziciaOdoberaniaVR2 AND SC_OvlZdvihuVR2.Step = 1 THEN
				Centrifuga1_Zdvih2_ZadanaPozMM:= 4.0;	
				ZdvihVR2_Polohuj:= TRUE;
			ELSIF RR_PoziciaVyrazaniaVR2 AND SC_OvlZdvihuVR2.Step = 1 THEN
				Centrifuga1_Zdvih2_ZadanaPozMM:= 1.0;	
				ZdvihVR2_Polohuj:= TRUE;
			ELSIF RR_PoziciaVymenaFormyVR2 AND SC_OvlZdvihuVR2.Step = 1 THEN
				Centrifuga1_Zdvih2_ZadanaPozMM:= 15;	
				ZdvihVR2_Polohuj:= TRUE;
			END_IF
		
		
		
			
		
		
	END_CASE
	 
END_PROGRAM

PROGRAM _EXIT
				
	 
END_PROGRAM

