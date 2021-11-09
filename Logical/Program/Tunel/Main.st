
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	diTunel_VstupLista_Naplnena;
	diTunel_ZaplnenieVystupnejTrate;
	doStol_OhrevSTART;
	
	//Blokacia pohybu dopravnika//
	IF diTunel_VstupLista_ZasunutaVZAD AND diTunel_VystLista_VysunutaVPRED THEN
		Tunel_BlokaciaDopravnika:= FALSE;
	ELSE	
		Tunel_BlokaciaDopravnika:= TRUE;
	END_IF	
	
	
		
	//Vypnutie ventilátorov tunela po urèitom èase//
	IF NOT Tunel_Automat AND NOT Tunel_Manual AND (doTunel_ChodVentilatora1 OR doTunel_ChodVentilatora2 OR doTunel_ChodVentilatora3) THEN
		CasVypnutiaVentilatorov.IN:= TRUE;
	ELSE
		CasVypnutiaVentilatorov.IN:= FALSE;
	END_IF	
	
	IF CasVypnutiaVentilatorov.Q  THEN
		doTunel_ChodVentilatora1:= FALSE;
		doTunel_ChodVentilatora2:= FALSE;
		doTunel_ChodVentilatora3:= FALSE;
		CasVypnutiaVentilatorov.IN:= FALSE;
	END_IF	
	
	
	CasVypnutiaVentilatorov.PT:= T#10m;
	CasVypnutiaVentilatorov();
	
	//Stav výstupná tra za tunelom je plna//
	IF diTunel_ZaplnenieVystupnejTrate THEN
		CasZisteniaZaplneniaTrate.IN:= TRUE;
	ELSE	
		CasZisteniaZaplneniaTrate.IN:= FALSE;
	END_IF	
	
	IF CasZisteniaZaplneniaTrate.Q THEN
		Tunel_Stav_VystupnaTratPlna:= TRUE;
		TP_ZobrazPopUp_TratZaTunelomPlna:= 0;
	END_IF
	
	IF NOT diTunel_ZaplnenieVystupnejTrate THEN
		CasZisteniaUvolneniaTrate.IN:= TRUE;
	ELSE	
		CasZisteniaUvolneniaTrate.IN:= FALSE;
	END_IF	
	
		
	IF CasZisteniaUvolneniaTrate.Q THEN
		Tunel_Stav_VystupnaTratPlna:= FALSE;
		TP_ZobrazPopUp_TratZaTunelomPlna:= 1;
	END_IF	
	

		
	
	CasZisteniaZaplneniaTrate.PT:= T#2s;
	CasZisteniaZaplneniaTrate();
	
	CasZisteniaUvolneniaTrate.PT:= T#2s;
	CasZisteniaUvolneniaTrate();
	
	
		
	//Volanie podprogramov//
	OvladanieDopravnika;
	OvladanieVystupOdsuvaca;
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_Tunel);
	
	
	//Reset sekcie //
	IF Tunel_Reset OR NOT BezpOkruhOplotenia_Aktivovany OR PoruchaChladiacehoTunela THEN
		SC_Tunel.Step:= 0;
	END_IF
	
	
	CASE SC_Tunel.Step OF 
	
	
		0:
			SC_Tunel.StepName:='0 - Nulovanie';
			SC_OvlDopravnika.Step:= 0;
			SC_OvlVystupnehoOdsuvaca.Step:= 0;
			Tunel_Automat:= FALSE;
			Tunel_KoniecVyroby:= FALSE;
			Tunel_KoniecCyklu:= FALSE;
			Tunel_Manual:= FALSE;
			Tunel_PoINIT:= FALSE;
			Tunel_Reset:= FALSE;
			Tunel_DopravnikSaPOSUNUL:= FALSE;
			RotoryNaVystupeTunela:= FALSE;
			Tunel_READY:= FALSE;
			PocetKusovVtuneli:= 0;
			PocetPrazdnychPozicii:= 0;
			PocetPoziciiPriZmene:= 0;
			Tunel_Vyprazdnenie:= FALSE;
			IF BezpOkruhOplotenia_Aktivovany AND NOT PoruchaChladiacehoTunela THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 1;
			END_IF
	
	
		1:
			SC_Tunel.StepName:='1 - Rozhodnutie o cinnosti';
			IF Tunel_Automat THEN
				SC_Tunel.Step:= 2;
			ELSIF Tunel_Vyprazdnenie THEN
				TunelVstup_Vyprazdnenie:= TRUE;
				SC_Tunel.Step:= 2;
			ELSIF Tunel_Manual THEN
				SC_Tunel.Step:= 700;
			END_IF
		
		
			//********************************************************Inicializácia****************************************************************************//
	
		2:
			SC_Tunel.StepName:='2 - Inicializacia - cakanie na spustenie';
			SC_Tunel.IdleTime.PT:= T#500ms;
			SC_Tunel.AlarmTime.PT:= T#5s;
			SC_Tunel.IdleTime.IN:= TRUE;
			Tunel_Automat:= TRUE;	
			
			IF SC_Tunel.IdleTime.Q THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 3;
			END_IF
	
		
		3:
			SC_Tunel.StepName:='3 - Inicializacia - presun vystupneho odsuvaca do vychodiskovej polohy, zapnutie ventilatorov';
			SC_Tunel.IdleTime.PT:= T#500ms;
			SC_Tunel.AlarmTime.PT:= T#5s;
			(*doTunel_ChodVentilatora1:= TRUE;*)
			doTunel_ChodVentilatora2:= TRUE;
			doTunel_ChodVentilatora3:= TRUE;
			
			IF NOT SC_Tunel.Switch1 THEN
				VystupnyOdsuvac_VYSUN:= TRUE;
				SC_Tunel.Switch1:= TRUE;
			END_IF
			
			IF diTunel_VystLista_VysunutaVPRED  THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 4;
			END_IF
		
		4:
			SC_Tunel.StepName:='4 - Inicializacia - presun dopravika vzad';
			SC_Tunel.IdleTime.PT:= T#500ms;
			SC_Tunel.AlarmTime.PT:= T#5s;
		
			Tunel_Dopravnik_RychlJogginguHz:= 10;  //V Hz
			
			IF NOT SC_Tunel.Switch1 AND NOT Tunel_BlokaciaDopravnika AND diTunel_VstupLista_ZasunutaVZAD THEN
				Dopravnik_JoggVZAD:= TRUE;
				SC_Tunel.Switch1:= TRUE;
			END_IF	
			
			IF NOT diTunel_PolohaDopravnika THEN
				Dopravnik_JoggVZAD:= FALSE;
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 5;
			END_IF
		
		
		5:
			SC_Tunel.StepName:='5 - Inicializacia - presun dopravika na snimac';
			SC_Tunel.IdleTime.PT:= T#500ms;
			SC_Tunel.AlarmTime.PT:= T#5s;
			SC_Tunel.IdleTime.IN:= TRUE;
			
			Tunel_Dopravnik_RychlPolohovHz:= TP_Tunel_RychlostDopravnika;  //50 Hz
		
			IF NOT SC_Tunel.Switch1 AND SC_OvlDopravnika.Step = 1 AND SC_Tunel.IdleTime.Q AND diTunel_VstupLista_ZasunutaVZAD THEN
				Dopravnik_ChodVPRED:= TRUE;
				SC_Tunel.Switch1:= TRUE;
			END_IF	
		
			IF Tunel_DopravnikSaPOSUNUL THEN
				Tunel_DopravnikSaPOSUNUL:= FALSE;
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 6;
			END_IF
		
		6:
			SC_Tunel.StepName:='6 - Inicializacia - vysunutie rotorov na vystupe tunela';
			SC_Tunel.IdleTime.PT:= T#200ms;
			SC_Tunel.AlarmTime.PT:= T#5s;
			
			
			IF NOT diTunel_ZaplnenieVystupnejTrate THEN
				SC_Tunel.IdleTime.IN:= TRUE;
			ELSE	
				SC_Tunel.IdleTime.IN:= FALSE;
			END_IF	
			
			IF NOT SC_Tunel.Switch1 AND NOT diTunel_ZaplnenieVystupnejTrate AND SC_Tunel.IdleTime.Q THEN
				VystupnyOdsuvac_ZASUN:= TRUE;
				SC_Tunel.Switch1:= TRUE;
			END_IF
		
			IF diTunel_VystLista_ZasunutaVZAD THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 7;
			END_IF
		
		
		7:
			SC_Tunel.StepName:='7 - Inicializacia - presun vystupneho odsuvaca do vychodiskovej polohy';
			SC_Tunel.IdleTime.PT:= T#500ms;
			SC_Tunel.AlarmTime.PT:= T#5s;
		
			IF NOT SC_Tunel.Switch1 AND SC_OvlVystupnehoOdsuvaca.Step = 1  THEN
				VystupnyOdsuvac_VYSUN:= TRUE;
				SC_Tunel.Switch1:= TRUE;
			END_IF
			
			IF diTunel_VystLista_VysunutaVPRED THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 8;
			END_IF
			
			
		8:
			SC_Tunel.StepName:='8 - Inicializacia - posunutie dopravnika vpred';
			SC_Tunel.IdleTime.PT:= T#500ms;
			SC_Tunel.AlarmTime.PT:= T#5s;
			
			Tunel_Dopravnik_RychlPolohovHz:= TP_Tunel_RychlostDopravnika;  //V Hz
		
			
			
			IF NOT SC_Tunel.Switch1 AND diTunel_VstupLista_ZasunutaVZAD THEN
				IF diTunel_VystupLista_PoziciaPred THEN
					RotoryNaVystupeTunela:= TRUE;
				ELSE	
					RotoryNaVystupeTunela:= FALSE;
				END_IF	
				Dopravnik_ChodVPRED:= TRUE;
				SC_Tunel.Switch1:= TRUE;
			END_IF	
		
			IF Tunel_DopravnikSaPOSUNUL THEN
				Tunel_DopravnikSaPOSUNUL:= FALSE;
				Tunel_READY:= TRUE;
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 9;
			END_IF
			
		9:
			SC_Tunel.StepName:='9 - Inicializacia - vysunutie rotorov na vystupe tunela';
			SC_Tunel.IdleTime.PT:= T#500ms;
			SC_Tunel.AlarmTime.PT:= T#5s;
			SC_Tunel.IdleTime.IN:= TRUE;
			
					
			IF NOT SC_Tunel.Switch1 AND NOT diTunel_ZaplnenieVystupnejTrate AND RotoryNaVystupeTunela THEN
				VystupnyOdsuvac_ZASUN:= TRUE;
				SC_Tunel.Switch1:= TRUE;
			END_IF
			
			IF (diTunel_VystLista_ZasunutaVZAD OR NOT RotoryNaVystupeTunela) THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 10;
			END_IF
		
		10:
			SC_Tunel.StepName:='10 - Inicializacia - presun vystupneho odsuvaca do vychodiskovej polohy,ukoncenie';
			SC_Tunel.IdleTime.PT:= T#500ms;
			SC_Tunel.AlarmTime.PT:= T#5s;
		
			IF NOT SC_Tunel.Switch1 AND SC_OvlVystupnehoOdsuvaca.Step = 1 THEN
				VystupnyOdsuvac_VYSUN:= TRUE;
				SC_Tunel.Switch1:= TRUE;
			END_IF
			
			IF diTunel_VystLista_VysunutaVPRED THEN
				Tunel_PoINIT:= TRUE;
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 100;
			END_IF
		
		
		
		
		
		
			//********************************************************Automatický režim****************************************************************************//
		100:
			SC_Tunel.StepName:='100 - Automaticky rezim - cakanie na vysunutie rotorov na vstup tunela';
			SC_Tunel.IdleTime.PT:= T#3s;
			SC_Tunel.AlarmTime.PT:= T#5s;
			SC_Tunel.IdleTime.IN:= TRUE;
			
			IF NOT SC_Tunel.Switch1 THEN
				Tunel_READY:= TRUE;
				SC_Tunel.Switch1:= TRUE;
			END_IF
			
			IF diTunel_VstupLista_Naplnena AND diTunel_VstupLista_ZasunutaVZAD THEN
				PocetKusovVtuneli:= 0;
				Tunel_READY:= FALSE;
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 110;
			ELSIF PocetKusovVtuneli >= Tunel_PocetKusovNaListe AND diTunel_VstupLista_ZasunutaVZAD THEN
				PocetKusovVtuneli:= 0;
				Tunel_READY:= FALSE;
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 110;
			ELSIF Tunel_Vyprazdnenie AND PocetPrazdnychPozicii < 10 AND SC_Tunel.IdleTime.Q AND NOT Tunel_Stav_VystupnaTratPlna THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 110;
			ELSIF Tunel_Vyprazdnenie AND (PocetPrazdnychPozicii >= 10 OR Tunel_Stav_VystupnaTratPlna) THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 0;	
			END_IF	
			
			IF Tunel_KoniecCyklu AND RobotMan_Stav_Odparkovany AND NOT TunelVstup_Automat THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 0;
			END_IF	
			
			
			IF Tunel_KoniecVyroby AND NOT Zariadenie_UkoncenieModelu AND RobotMan_Stav_Odparkovany AND NOT TunelVstup_Automat THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 0;
			ELSIF Tunel_KoniecVyroby AND Zariadenie_UkoncenieModelu AND RobotMan_Stav_Odparkovany AND NOT TunelVstup_Automat AND PocetPoziciiPriZmene >= 3 THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 0;
			ELSIF Tunel_KoniecVyroby AND Zariadenie_UkoncenieModelu AND RobotMan_Stav_Odparkovany AND NOT TunelVstup_Automat AND PocetPoziciiPriZmene < 3 THEN	
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 110;
			END_IF
			
		
				
					
		110:
			SC_Tunel.StepName:='110 - Automaticky rezim - posunutie dopravnika vpred';
			SC_Tunel.IdleTime.PT:= T#500ms;
			SC_Tunel.AlarmTime.PT:= T#5s;
		
			Tunel_Dopravnik_RychlPolohovHz:= TP_Tunel_RychlostDopravnika;  //50 Hz
		
			IF NOT SC_Tunel.Switch1 AND diTunel_VstupLista_ZasunutaVZAD THEN
				IF diTunel_VystupLista_PoziciaPred THEN
					PocetPrazdnychPozicii:= 0;
					RotoryNaVystupeTunela:= TRUE;
				ELSE	
					RotoryNaVystupeTunela:= FALSE;
					PocetPrazdnychPozicii:= PocetPrazdnychPozicii + 1;
				END_IF	
				Dopravnik_ChodVPRED:= TRUE;
				SC_Tunel.Switch1:= TRUE;
			END_IF	
		
			IF Tunel_DopravnikSaPOSUNUL THEN
				Tunel_DopravnikSaPOSUNUL:= FALSE;
				IF Tunel_KoniecVyroby AND RobotMan_Stav_Odparkovany AND NOT TunelVstup_Automat THEN
					PocetPoziciiPriZmene:= PocetPoziciiPriZmene + 1;
				END_IF	
				Tunel_READY:= TRUE;
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 111;
			END_IF
				
		111:
			SC_Tunel.StepName:='111 - Automaticky rezim - vysunutie rotorov na vystupe tunela';
			SC_Tunel.IdleTime.PT:= T#500ms;
			SC_Tunel.AlarmTime.PT:= T#5s;
			
			IF NOT diTunel_ZaplnenieVystupnejTrate THEN
				SC_Tunel.IdleTime.IN:= TRUE;
			ELSE	
				SC_Tunel.IdleTime.IN:= FALSE;
			END_IF	
						
			IF NOT SC_Tunel.Switch1 AND NOT diTunel_ZaplnenieVystupnejTrate AND SC_Tunel.IdleTime.Q AND RotoryNaVystupeTunela THEN
				VystupnyOdsuvac_ZASUN:= TRUE;
				SC_Tunel.Switch1:= TRUE;
			ELSIF Tunel_KoniecCyklu AND RobotMan_Stav_Odparkovany AND NOT TunelVstup_Automat THEN	
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 0;
			END_IF	
				
						
			IF diTunel_VystLista_ZasunutaVZAD OR NOT RotoryNaVystupeTunela THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 112;
			END_IF
		
		
		112:
			SC_Tunel.StepName:='106 - Automaticky rezim - presun vystupneho odsuvaca do vychodiskovej polohy';
			SC_Tunel.IdleTime.PT:= T#500ms;
			SC_Tunel.AlarmTime.PT:= T#5s;
		
			IF NOT SC_Tunel.Switch1 AND SC_OvlVystupnehoOdsuvaca.Step = 1 THEN
				VystupnyOdsuvac_VYSUN:= TRUE;
				SC_Tunel.Switch1:= TRUE;
			END_IF
			
			IF diTunel_VystLista_VysunutaVPRED THEN
				SC_Tunel.ResetStep:= TRUE;
				SC_Tunel.Step:= 100;
			END_IF
		
		
		
			//********************************************************Ruèný režim***********************************************************************************//
		700:
			SC_Tunel.StepName:='700 - Rucny rezim';
		
		
		
		
		
	END_CASE
	
	
	
	
	
	 
				END_PROGRAM

PROGRAM _EXIT
				(* Insert code here *)
	 
				END_PROGRAM

