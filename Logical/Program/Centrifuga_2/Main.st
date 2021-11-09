
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	diCentrifuga2_SnimNatocVreteno2;
	
	
	//Volanie podprogramov//
	OvladanieOtacania;
	OvladanieZdvihu1;
	OvladanieZdvihu2;
	PrepocetTenzometrov;
	MeranieVyskyBalika;
	
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_Centrifuga2);
	
	
	//Reset sekcie //
	IF Centrifuga2_Reset OR NOT BezpOkruhOplotenia_Aktivovany OR PoruchaCentrifugy2 THEN
		SC_Centrifuga2.Step:= 0;
	END_IF
	
	//Prepoèet èasu otáèania centrifugy//
	Centrifuga2_CasOtacaniaTIME:= REAL_TO_TIME(ZvolCasOtacaniaPriOdlievani *1000);
	
	//Zrušenie signálu prípravrava na centrifugu 2//
	IF RobotMan_Stav_PripravenyCentrif2 AND RobotMan_PripravaNaCentrifugu2 THEN
		RobotMan_PripravaNaCentrifugu2:= FALSE;
	END_IF	
	
	//Riadenie chladenia vretena//
	doCentrifuga2_ChladenieVretena;
	
	
	
	CASE SC_Centrifuga2.Step OF 
	
	
		0:
			SC_Centrifuga2.StepName:='0 - Nulovanie';
			SC_OvlOtacania.Step:= 0;
			SC_OvlZdvihuVR1.Step:= 0;
			SC_OvlZdvihuVR2.Step:= 0;
			Centrifuga2_Automat:= FALSE;
			Centrifuga2_KoniecVyroby:= FALSE;
			Centrifuga2_KoniecCyklu:= FALSE;
			Centrifuga2_Manual:= FALSE;
			Centrifuga2_PoINIT:= FALSE;
			Centrifuga2_Reset:= FALSE;
			Centrifuga2_OtacanieVPOZICI:= FALSE;
			Centrifuga2_Zdvih1_VPOZICI:= FALSE;
			Centrifuga2_Zdvih2_VPOZICI:= FALSE;
			RobotMan_Centrifug2_OdoberKusy:= FALSE;
			RobotMan_Centrifug2_VlozKusy:= FALSE;
			RobotOdliev_Centri2_NaberHlinik:= FALSE;
			RobotOdliev_Centri2_NalejHlinik:= FALSE;
			Centrifuga2_Kusy_v_Centrifuge:= FALSE;
			Centrifuga2_StavPrazdna:= FALSE;
			RobotMan_PripravaNaCentrifugu2:= FALSE;
			RobotMan_Centrifug2_DoCentrifugy:= FALSE;
			TP_OtvorCentrifugu_2:= FALSE;
			StavPrebiehaOtvorenieCentrif_2:= FALSE;
			RR_PoziciaOdoberaniaVR1:= FALSE;
			RR_PoziciaVyrazaniaVR1:= FALSE;
			RR_PoziciaVymenaFormyVR1:= FALSE;
			RR_PoziciaOdoberaniaVR2:= FALSE;
			RR_PoziciaVyrazaniaVR2:= FALSE;
			RR_PoziciaVymenaFormyVR2:= FALSE;
			doCentrifuga2_ChladenieVretena:= FALSE;
			Rychlost_2:= FALSE;
			IF BezpOkruhOplotenia_Aktivovany AND NOT PoruchaCentrifugy2 THEN
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 1;
			END_IF
	
	
		1:
			SC_Centrifuga2.StepName:='1 - Rozhodnutie o cinnosti';
			IF Centrifuga2_Automat THEN
				SC_Centrifuga2.Step:= 2;
			ELSIF TP_OtvorCentrifugu_2 THEN
				StavPrebiehaOtvorenieCentrif_2:= TRUE;
				SC_Centrifuga2.Step:= 2;	
			ELSIF Centrifuga2_Manual THEN
				SC_Centrifuga2.Step:= 700;
			END_IF
		
		
			//********************************************************Inicializácia****************************************************************************//
	
		2:
			SC_Centrifuga2.StepName:='2 - Inicializacia - cakanie na spustenie';
			SC_Centrifuga2.IdleTime.PT:= T#500ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
			SC_Centrifuga2.IdleTime.IN:= TRUE;
				
			
			IF SC_Centrifuga2.IdleTime.Q THEN
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 4;
			END_IF
	
		
			
		4:
			SC_Centrifuga2.StepName:='4 - Inicializacia - homing serva otacania centrifugy';
			SC_Centrifuga2.IdleTime.PT:= T#500ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
		
			IF NOT SC_Centrifuga2.Switch1 AND RobotMan_Centrifug2_BezpVzdialen THEN
				Centrifuga2_Otacanie_HOME_Senzor:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
			
			IF EDGEPOS(Motion[5].status.DriveStatus.HomingOk = TRUE) THEN
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 5;
			END_IF
		
		5:
			SC_Centrifuga2.StepName:='5 - Inicializacia - otocenie vretien do 0';
			SC_Centrifuga2.IdleTime.PT:= T#500ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;	
		
			Centrifuga2_Otacanie_PocetOtacok:= 0;
			
			IF NOT SC_Centrifuga2.Switch1 AND RobotMan_Centrifug2_BezpVzdialen THEN
				Otacanie_Polohuj:= TRUE;
				SC_Centrifuga1.Switch2:= TRUE;
			END_IF
			
			IF Centrifuga2_OtacanieVPOZICI AND (diCentrifuga2_SnimNatocVreteno1 OR diCentrifuga2_SnimNatocVreteno2) THEN
				Centrifuga2_OtacanieVPOZICI:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 6;
			END_IF
			
			IF Centrifuga2_OtacanieVPOZICI AND NOT diCentrifuga2_SnimNatocVreteno1 AND NOT diCentrifuga2_SnimNatocVreteno2 THEN
				Alarmy[58]:= TRUE;
				PoruchaCentrifugy2:= TRUE;
			END_IF	
		
		
		
		6:
			SC_Centrifuga2.StepName:='6 - Inicializacia - kontrola home zdvihu vretien';
			SC_Centrifuga2.IdleTime.PT:= T#500ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
		
			IF NOT Motion[6].status.DriveStatus.HomingOk AND NOT Motion[7].status.DriveStatus.HomingOk THEN
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 10;
			ELSIF NOT Motion[6].status.DriveStatus.HomingOk AND Motion[7].status.DriveStatus.HomingOk THEN
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 11;	
			ELSIF Motion[6].status.DriveStatus.HomingOk AND NOT Motion[7].status.DriveStatus.HomingOk THEN
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 12;
			ELSIF Motion[6].status.DriveStatus.HomingOk AND Motion[7].status.DriveStatus.HomingOk THEN
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 13;
			END_IF
		
		10:
			SC_Centrifuga2.StepName:='10 - Inicializacia - homing serv zdvihu vretien';
			SC_Centrifuga2.IdleTime.PT:= T#200ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
			SC_Centrifuga2.IdleTime.IN:= TRUE;
			
			IF NOT SC_Centrifuga2.Switch1 THEN
				Centrifuga2_Zdvih1_HOME:= TRUE;
				Centrifuga2_Zdvih2_HOME:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
			
			IF Motion[6].status.DriveStatus.HomingOk AND Motion[7].status.DriveStatus.HomingOk AND SC_Centrifuga2.IdleTime.Q THEN
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 13;
			END_IF
		
		
		11:
			SC_Centrifuga2.StepName:='11 - Inicializacia - homing serva zdvihu vretena 1, vreteno 2 chod do vkladacej pozicie';
			SC_Centrifuga2.IdleTime.PT:= T#200ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
			SC_Centrifuga2.IdleTime.IN:= TRUE;
			
			Centrifuga2_Zdvih2_ZadanaPozMM:= 4;
		
			IF NOT SC_Centrifuga2.Switch1 THEN
				Centrifuga2_Zdvih1_HOME:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
		
			IF Motion[6].status.DriveStatus.HomingOk AND Centrifuga2_Zdvih2_VPOZICI AND SC_Centrifuga2.IdleTime.Q THEN
				Centrifuga2_Zdvih2_VPOZICI:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 13;
			END_IF
		
		
		
		
		12:
			SC_Centrifuga2.StepName:='12 - Inicializacia - homing serva zdvihu vretena 2, vreteno 1 chod do vkladacej pozicie';
			SC_Centrifuga2.IdleTime.PT:= T#200ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
			SC_Centrifuga2.IdleTime.IN:= TRUE;
			
			Centrifuga2_Zdvih1_ZadanaPozMM:= 4;	
		
			IF NOT SC_Centrifuga2.Switch1 THEN
				Centrifuga2_Zdvih2_HOME:= TRUE;
				ZdvihVR1_Polohuj:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
		
			IF Motion[7].status.DriveStatus.HomingOk AND Centrifuga2_Zdvih1_VPOZICI AND SC_Centrifuga2.IdleTime.Q THEN
				Centrifuga2_Zdvih1_VPOZICI:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 13;
			END_IF
		
		
		
		13:
			SC_Centrifuga2.StepName:='13 - Inicializacia - vreteno 1 chod do 5,vreteno 2 chod do vkladacej pozicie';
			SC_Centrifuga2.IdleTime.PT:= T#500ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
		
			Centrifuga2_Zdvih1_ZadanaPozMM:= 4;
			Centrifuga2_Zdvih2_ZadanaPozMM:= 4;
		
		
			IF NOT SC_Centrifuga2.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND RobotMan_Centrifug2_BezpVzdialen THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
		
			IF Centrifuga2_Zdvih1_VPOZICI AND Centrifuga2_Zdvih2_VPOZICI AND NOT RobotMan_Centrifug2_KusyOdobrate THEN
				Centrifuga2_Zdvih1_VPOZICI:= FALSE;
				Centrifuga2_Zdvih2_VPOZICI:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				IF TP_OtvorCentrifugu_2 THEN
					SC_Centrifuga2.Step:= 0;
				ELSE	
					SC_Centrifuga2.Step:= 16;
				END_IF	
			END_IF
		
				
		16:
			SC_Centrifuga2.StepName:='16 - Inicializacia - zistovanie kusov v centrifuge,chod vretien do pozicie pritlaku';
			SC_Centrifuga2.IdleTime.PT:= T#200ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
			SC_Centrifuga2.IdleTime.IN:= TRUE;
					
			IF NOT SC_Centrifuga2.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND SC_Centrifuga2.IdleTime.Q THEN
				ZdvihVR1_MoveMoment:= TRUE;
				ZdvihVR2_MoveMoment:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
		
			IF Centrifuga2_Zdvih1_VPOZICI OR Centrifuga2_Zdvih2_VPOZICI THEN
				Centrifuga2_Zdvih1_VPOZICI:= FALSE;
				Centrifuga2_Zdvih2_VPOZICI:= FALSE;
				Centrifuga2_Kusy_v_Centrifuge:= TRUE;
				Motion[6].cmd.halt:= TRUE;
				Motion[7].cmd.halt:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
				SC_OvlZdvihuVR2.Step:= 0;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 17;
			END_IF 
			
			
			IF Centrifuga2_Zdvih1_AktualPozMM >= 177 OR Centrifuga2_Zdvih2_AktualPozMM >= 177 THEN
				Motion[6].cmd.halt:= TRUE;
				Motion[7].cmd.halt:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
				SC_OvlZdvihuVR2.Step:= 0;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 18;
			END_IF
		
			
							
		
		17:
			SC_Centrifuga2.StepName:='17 - Inicializacia - chod vretien do vyrazacej pozicie';
			SC_Centrifuga2.IdleTime.PT:= T#200ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;	
			SC_Centrifuga2.IdleTime.IN:= TRUE;
			
			Centrifuga2_Zdvih1_ZadanaPozMM:= 0.8;
			Centrifuga2_Zdvih2_ZadanaPozMM:= 1.0;
			
			
			IF NOT SC_Centrifuga2.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND SC_Centrifuga2.IdleTime.Q THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
			
			
			IF Centrifuga2_Zdvih1_VPOZICI AND Centrifuga2_Zdvih2_VPOZICI THEN
				Centrifuga2_Zdvih1_VPOZICI:= FALSE;
				Centrifuga2_Zdvih2_VPOZICI:= FALSE;
				IF Centrifuga2_Kusy_v_Centrifuge AND NOT RobotMan_Centrifug2_KusyOdobrate THEN
					Centrifuga2_PoINIT:= TRUE;
					SC_Centrifuga2.ResetStep:= TRUE;
					SC_Centrifuga2.Step:= 109;
				ELSIF NOT Centrifuga2_Kusy_v_Centrifuge AND NOT RobotMan_Centrifug2_KusyVlozene AND NOT RobotMan_Stav_VkladamDoCentrif2 THEN
					SC_Centrifuga2.ResetStep:= TRUE;
					SC_Centrifuga2.Step:= 18;
				END_IF	
			END_IF
			
								
		
		18:
			SC_Centrifuga2.StepName:='18 - Inicializacia - chod vretien do odoberacej a vkladacej pozicie';
			SC_Centrifuga2.IdleTime.PT:= T#200ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;	
			SC_Centrifuga2.IdleTime.IN:= TRUE;
			
			Centrifuga2_Zdvih1_ZadanaPozMM:= 4;
			Centrifuga2_Zdvih2_ZadanaPozMM:= 4;
			
			
			IF NOT SC_Centrifuga2.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND SC_Centrifuga2.IdleTime.Q THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
			
					
			IF Centrifuga2_Zdvih1_VPOZICI AND Centrifuga2_Zdvih2_VPOZICI THEN
				Centrifuga2_Zdvih1_VPOZICI:= FALSE;
				Centrifuga2_Zdvih2_VPOZICI:= FALSE;
				Centrifuga2_PoINIT:= TRUE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 100;
			END_IF
		
		
		
		
		
			//********************************************************Automatický režim****************************************************************************//
		100:
			SC_Centrifuga2.StepName:='100 - Automaticky rezim - cakanie na vlozenie kusov';
			SC_Centrifuga2.IdleTime.PT:= T#14s;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
			Centrifuga2_StavPrazdna:= FALSE;
			RobotOdliev_Centri2_NaberHlinik:= FALSE;
			RobotOdliev_Centri2_NalejHlinik:= FALSE;
			RobotOdliev_VylejHlinikCentr2:= FALSE;
			SC_Centrifuga2.IdleTime.IN:= TRUE;
			
					
			
			IF NOT SC_Centrifuga2.Switch1 THEN
				RobotMan_Centrifug2_VlozKusy:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
		
			IF RobotMan_Stav_VkladamDoCentrif2 THEN
				RobotOdliev_Centri2_NaberHlinik:= TRUE;
				RobotOdlievanie_StavPreplachnuty:= FALSE;
			END_IF	
			
			
			IF RobotMan_Centrifug2_KusyVlozene AND RobotOdliev_Stav_ProgramRUN THEN
				RobotMan_Centrifug2_VlozKusy:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 102;
			END_IF
		
			IF Centrifuga2_KoniecCyklu AND RobotMan_Stav_Odparkovany THEN
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 120;
			END_IF
			
			IF Centrifuga2_KoniecVyroby AND RobotMan_Stav_Odparkovany THEN
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 120;
			END_IF
		
		102:
			SC_Centrifuga2.StepName:='102 - Automaticky rezim - chod vretien do pozicie pritlaku';
			SC_Centrifuga2.IdleTime.PT:= T#500ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
		
					
			IF NOT SC_Centrifuga2.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND RobotMan_Centrifug2_BezpVzdialen THEN
				ZdvihVR1_MoveMoment:= TRUE;
				ZdvihVR2_MoveMoment:= TRUE;
				Centrifuga2_PrebiehaPritlak:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
		
			IF Centrifuga2_Zdvih1_VPOZICI AND Centrifuga2_Zdvih2_VPOZICI AND NOT RobotOdliev_Stav_NalievamCentr2 AND RobotOdliev_Stav_PripNaliatCent2 THEN
				Centrifuga2_Zdvih1_VPOZICI:= FALSE;
				Centrifuga2_Zdvih2_VPOZICI:= FALSE;
				PoslednaVyskaBalikaVR1:= Centrifuga2_VR1_NamVyskaBalika;
				PoslednaVyskaBalikaVR2:= Centrifuga2_VR2_NamVyskaBalika;
				Centrifuga2_PrebiehaPritlak:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 103;
			ELSIF Centrifuga2_Zdvih1_VPOZICI AND Centrifuga2_Zdvih2_VPOZICI AND NOT RobotOdliev_Stav_ProgramRUN THEN
				Centrifuga2_Zdvih1_VPOZICI:= FALSE;
				Centrifuga2_Zdvih2_VPOZICI:= FALSE;
				PoslednaVyskaBalikaVR1:= Centrifuga2_VR1_NamVyskaBalika;
				PoslednaVyskaBalikaVR2:= Centrifuga2_VR2_NamVyskaBalika;
				RobotOdliev_Centri2_NalejHlinik:= FALSE;
				RobotOdliev_Centri2_NaberHlinik:= FALSE;
				Centrifuga2_PrebiehaPritlak:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 104;	
			END_IF 
		
					
		103:
			SC_Centrifuga2.StepName:='103 - Automaticky rezim - kontrola vysky balika';
			SC_Centrifuga2.IdleTime.PT:= T#200ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
			SC_Centrifuga2.IdleTime.IN:= TRUE;
			
			IF SC_Centrifuga2.IdleTime.Q THEN
				IF VyskaBalikaVR1_OK AND VyskaBalikaVR2_OK THEN
					doCentrifuga2_ChladenieVretena:= FALSE;
					SC_Centrifuga2.ResetStep:= TRUE;
					SC_Centrifuga2.Step:= 105;
				ELSE
					RobotOdliev_VylejHlinikCentr2:= TRUE;
					RobotOdliev_Centri2_NalejHlinik:= FALSE;
					RobotOdliev_Centri2_NaberHlinik:= FALSE;
					TP_ZobrazHlasVyskaBalikaCentrif2:= 0;
					RobotMan_PripravaNaCentrifugu2:= TRUE;
					SC_Centrifuga2.ResetStep:= TRUE;
					SC_Centrifuga2.Step:= 104;
				END_IF
			END_IF
		
			
		104:
			SC_Centrifuga2.StepName:='104 - Automaticky rezim - zasunutie vretien do vyrazacej pozicie';
			SC_Centrifuga2.IdleTime.PT:= T#200ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
			
			Centrifuga2_Zdvih1_ZadanaPozMM:= 0.8;
			Centrifuga2_Zdvih2_ZadanaPozMM:= 1.0;
			
			IF NOT SC_Centrifuga2.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND RobotMan_Centrifug2_BezpVzdialen THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				RobotMan_PripravaNaCentrifugu2:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
		
				
			IF Centrifuga2_Zdvih1_VPOZICI AND Centrifuga2_Zdvih2_VPOZICI AND (diCentrifuga2_SnimNatocVreteno1 OR diCentrifuga2_SnimNatocVreteno2) THEN
				Centrifuga2_Zdvih1_VPOZICI:= FALSE;
				Centrifuga2_Zdvih2_VPOZICI:= FALSE;
				Centrifuga2_OtacanieVPOZICI:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 109;
			ELSIF Centrifuga2_Zdvih1_VPOZICI AND Centrifuga2_Zdvih2_VPOZICI AND NOT diCentrifuga2_SnimNatocVreteno1 AND NOT diCentrifuga2_SnimNatocVreteno2 THEN	
				Alarmy[58]:= TRUE;
				PoruchaCentrifugy2:= TRUE;	
			END_IF	
			
			
			
			
		105:
			SC_Centrifuga2.StepName:='105 - Automaticky rezim - roztocenie centrifugy na zadany cas';
			SC_Centrifuga2.IdleTime.PT:= Centrifuga2_CasOtacaniaTIME;
			SC_Centrifuga2.AlarmTime.PT:= T#60s;
		
						
			
			IF NOT SC_Centrifuga2.Switch1 AND RobotMan_Centrifug2_BezpVzdialen THEN
				OtacanieRychlostServo:= (Centrifuga2_Otac_StartRychlost / OtacanieKonstOtMin) * OtacanieKonstServo;
				Motion[5].par.acc := (OtacanieRychlostServo / 2);
				Motion[5].par.dec := (OtacanieRychlostServo / 2);
				Otacanie_MoveVelocity:= TRUE;
				RobotOdliev_Centri2_NalejHlinik:= TRUE;
				SC_Centrifuga2.AlarmTime.IN:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
			
			
			IF NOT SC_Centrifuga2.Switch2 AND RobotOdliev_Stav_NalievamCentr2 THEN
				OtacanieRychlostServo:= (Centrifuga2_Otac_PracovRychlost / OtacanieKonstOtMin) * OtacanieKonstServo;
				Motion[5].par.acc := (TP_Centrifuga2_AccRampOtacania * 1440);
				Motion[5].cmd.moveVelocity:= TRUE;
				Rychlost_2:= TRUE;
				SC_Centrifuga2.Switch2:= TRUE;
			END_IF	
			
			IF Rychlost_2 THEN
				IF (Motion[5].status.ActVelocity + 1.0) >= OtacanieRychlostServo THEN
					SC_Centrifuga2.IdleTime.IN:= TRUE;
				END_IF
			END_IF	
		
						
			
			
			IF SC_Centrifuga2.AlarmTime.Q AND NOT RobotOdliev_Stav_NalievamCentr2 THEN
				RobotOdliev_VylejHlinikCentr2:= TRUE;
				RobotOdliev_Centri2_NaberHlinik:= FALSE;
				RobotOdliev_Centri2_NalejHlinik:= FALSE;
				Otacanie_MoveVelocity:= FALSE;
				Rychlost_2:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 106;
			END_IF
			
						
			
			IF EDGENEG (RobotOdliev_Stav_NalievamCentr2 = TRUE) THEN
				SC_Centrifuga2.AlarmTime.IN:= FALSE;
				RobotOdliev_Centri2_NaberHlinik:= FALSE;
				RobotOdliev_Centri2_NalejHlinik:= FALSE;
			END_IF
			
			
			
			IF SC_Centrifuga2.IdleTime.Q THEN
				Otacanie_MoveVelocity:= FALSE;
				Rychlost_2:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 106;
			END_IF
			
				
		106:
			SC_Centrifuga2.StepName:='106 - Automaticky rezim - cakanie na zastavenie otacania, vyratanie poctu otacok';
			SC_Centrifuga2.IdleTime.PT:= T#500ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
			
			IF Motion[5].state.StandStill THEN
				AktualnyPocetOtacok:= (Motion[5].status.ActPosition / 3600); 
				PocetOtacokINT:= TRUNC(AktualnyPocetOtacok);
				Centrifuga2_VyratanyPocetOtacok:= INT_TO_REAL(PocetOtacokINT);
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 107;
			END_IF
		
		
		107:
			SC_Centrifuga2.StepName:='107 - Automaticky rezim - zasunutie vretien do vyrazacej pozicie, otocenie do odoberacej polohy';
			SC_Centrifuga2.IdleTime.PT:= T#500ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
		
			Centrifuga2_Zdvih1_ZadanaPozMM:= 0.8;
			Centrifuga2_Zdvih2_ZadanaPozMM:= 1.0;
			Centrifuga2_Otacanie_PocetOtacok:= Centrifuga2_VyratanyPocetOtacok; 
				
		
			IF NOT SC_Centrifuga2.Switch1 AND RobotMan_Centrifug2_BezpVzdialen THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				Otacanie_Polohuj:= TRUE;
				doCentrifuga2_ChladenieVretena:= TRUE;
				RobotMan_PripravaNaCentrifugu2:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
		
			IF Centrifuga2_Zdvih1_VPOZICI AND Centrifuga2_Zdvih2_VPOZICI AND Centrifuga2_OtacanieVPOZICI AND (diCentrifuga2_SnimNatocVreteno1 OR diCentrifuga2_SnimNatocVreteno2) THEN
				RobotMan_Centrifug2_DoCentrifugy:= TRUE;
				Centrifuga2_Zdvih1_VPOZICI:= FALSE;
				Centrifuga2_Zdvih2_VPOZICI:= FALSE;
				Centrifuga2_OtacanieVPOZICI:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 108;
			END_IF
		
			IF Centrifuga2_OtacanieVPOZICI AND NOT diCentrifuga2_SnimNatocVreteno1 AND NOT diCentrifuga2_SnimNatocVreteno2 THEN
				Alarmy[58]:= TRUE;
				PoruchaCentrifugy2:= TRUE;
			END_IF	
		
	
		
		108:
			SC_Centrifuga2.StepName:='108 - Automaticky rezim - zreferovanie otáèania centrifugy';
			SC_Centrifuga2.IdleTime.PT:= T#500ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
						
			IF NOT SC_Centrifuga2.Switch1 AND SC_OvlOtacania.Step = 1 THEN
				Centrifuga2_Otacanie_HOME_Direct:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
		
			IF (Motion[5].status.ActPosition = 0.0) AND Motion[5].status.DriveStatus.HomingOk THEN
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 109;
			END_IF
		
		
		109:
			SC_Centrifuga2.StepName:='109 - Automaticky rezim - cakanie na odobratie kusov';
			SC_Centrifuga2.IdleTime.PT:= T#500ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
		
			IF NOT SC_Centrifuga2.Switch1 THEN
				RobotMan_Centrifug2_DoCentrifugy:= TRUE;
				RobotMan_Centrifug2_OdoberKusy:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
		
			IF RobotMan_Centrifug2_KusyOdobrate  THEN
				RobotMan_Centrifug2_DoCentrifugy:= FALSE;
				RobotMan_Centrifug2_OdoberKusy:= FALSE;
				RobotMan_PripravaNaCentrifugu2:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 110;
			END_IF	
			
			
		
		110:
			SC_Centrifuga2.StepName:='110 - Automaticky rezim - zasunutie vretien do odoberacej a vkladacej pozicie';
			SC_Centrifuga2.IdleTime.PT:= T#200ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
			SC_Centrifuga2.IdleTime.IN:= TRUE;
			
			
			Centrifuga2_Zdvih1_ZadanaPozMM:= 4;
			Centrifuga2_Zdvih2_ZadanaPozMM:= 4;
		
			IF NOT SC_Centrifuga2.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 AND SC_Centrifuga2.IdleTime.Q THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
		
			
			IF Centrifuga2_Zdvih1_VPOZICI AND Centrifuga2_Zdvih2_VPOZICI AND NOT RobotMan_Centrifug2_KusyVlozene THEN
				Centrifuga2_Zdvih1_VPOZICI:= FALSE;
				Centrifuga2_Zdvih2_VPOZICI:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 100;
			END_IF
			
			
			
		120:
			SC_Centrifuga2.StepName:='120 - Automaticky rezim - zatvorenie centrifugy';
			SC_Centrifuga2.IdleTime.PT:= T#500ms;
			SC_Centrifuga2.AlarmTime.PT:= T#5s;
		
			Centrifuga2_Zdvih1_ZadanaPozMM:= 160.0;
			Centrifuga2_Zdvih2_ZadanaPozMM:= 160.0;
			
			
			IF NOT SC_Centrifuga2.Switch1 AND SC_OvlZdvihuVR1.Step = 1 AND SC_OvlZdvihuVR2.Step = 1 THEN
				ZdvihVR1_Polohuj:= TRUE;
				ZdvihVR2_Polohuj:= TRUE;
				SC_Centrifuga2.Switch1:= TRUE;
			END_IF
			
			IF Centrifuga2_Zdvih1_VPOZICI AND Centrifuga2_Zdvih2_VPOZICI THEN
				Centrifuga2_Zdvih1_VPOZICI:= FALSE;
				Centrifuga2_Zdvih2_VPOZICI:= FALSE;
				SC_Centrifuga2.ResetStep:= TRUE;
				SC_Centrifuga2.Step:= 0;
			END_IF	
			
			
			
	
		
			//********************************************************Ruèný režim***********************************************************************************//
		700:
			SC_Centrifuga2.StepName:='700 - Rucny rezim';
		
			//Polohovanie vretena 1//
			IF RR_PoziciaOdoberaniaVR1 AND SC_OvlZdvihuVR1.Step = 1 THEN
				Centrifuga2_Zdvih1_ZadanaPozMM:= 4.0;	
				ZdvihVR1_Polohuj:= TRUE;
			ELSIF RR_PoziciaVyrazaniaVR1 AND SC_OvlZdvihuVR1.Step = 1 THEN
				Centrifuga2_Zdvih1_ZadanaPozMM:= 0.6;	
				ZdvihVR1_Polohuj:= TRUE;
			ELSIF RR_PoziciaVymenaFormyVR1 AND SC_OvlZdvihuVR1.Step = 1 THEN
				Centrifuga2_Zdvih1_ZadanaPozMM:= 15;	
				ZdvihVR1_Polohuj:= TRUE;
			END_IF
		
		
		
		
		
			//Polohovanie vretena 2//
			IF RR_PoziciaOdoberaniaVR2 AND SC_OvlZdvihuVR2.Step = 1 THEN
				Centrifuga2_Zdvih2_ZadanaPozMM:= 4.0;	
				ZdvihVR2_Polohuj:= TRUE;
			ELSIF RR_PoziciaVyrazaniaVR2 AND SC_OvlZdvihuVR2.Step = 1 THEN
				Centrifuga2_Zdvih2_ZadanaPozMM:= 1.0;	
				ZdvihVR2_Polohuj:= TRUE;
			ELSIF RR_PoziciaVymenaFormyVR2 AND SC_OvlZdvihuVR2.Step = 1 THEN
				Centrifuga2_Zdvih2_ZadanaPozMM:= 15;	
				ZdvihVR2_Polohuj:= TRUE;
			END_IF
		
			
		
	END_CASE
	
	
	
	
	
	
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

