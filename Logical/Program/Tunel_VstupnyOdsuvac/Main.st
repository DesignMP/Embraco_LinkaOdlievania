
PROGRAM _INIT
	Tunel_PocetKusovNaListe:= 8;
	
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	//Signál pre robota manipulácie výška naliatkov na vstupe tunela je OK//
	IF diTunel_MeranieVyskyBalikovPS AND diTunel_MeranieVyskyBalikovLS THEN
		RobotManipulacie_NaliatkyOK:= TRUE;
	ELSE	
		RobotManipulacie_NaliatkyOK:= FALSE;
	END_IF	
	
	//Volba poètu kusov na vstupnej lište tunela//
	IF Tunel_PocetKusovNaListe = 8 THEN
		Tunel_PocetKusovNaListe_8:= TRUE;
		Tunel_PocetKusovNaListe_10:= FALSE;
	ELSIF Tunel_PocetKusovNaListe = 10 THEN
		Tunel_PocetKusovNaListe_10:= TRUE;
		Tunel_PocetKusovNaListe_8:= FALSE;
	END_IF
	
	
	
	
	//Volanie podprogramov//
	OvladanieVstupOdsuvaca;
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_TunelVstup);
	
	
	//Reset sekcie //
	IF TunelVstup_Reset OR NOT BezpOkruhOplotenia_Aktivovany OR PoruchaVstupuChladiacehoTunela THEN
		SC_TunelVstup.Step:= 0;
	END_IF
	
	
	CASE SC_TunelVstup.Step OF 
	
	
		0:
			SC_TunelVstup.StepName:='0 - Nulovanie';
			SC_OvlVstupnehoOdsuvaca.Step:= 0;
			TunelVstup_Automat:= FALSE;
			TunelVstup_KoniecVyroby:= FALSE;
			TunelVstup_KoniecCyklu:= FALSE;
			TunelVstup_Manual:= FALSE;
			TunelVstup_PoINIT:= FALSE;
			TunelVstup_Reset:= FALSE;
			TunelVstup_Vyprazdnenie:= FALSE;
			RobotMan_Tunel_VlozKusy:= FALSE;
			CasTaktTime1.IN:= FALSE;
			CasTaktTime2.IN:= FALSE;
			TunelVstup_KontrolaNaliatkovON:= FALSE;
			TunelVstup_PocetMerNaliatkovOFF:= 0;
			IF BezpOkruhOplotenia_Aktivovany AND NOT PoruchaVstupuChladiacehoTunela THEN
				SC_TunelVstup.ResetStep:= TRUE;
				SC_TunelVstup.Step:= 1;
			END_IF
	
	 
		1:
			SC_TunelVstup.StepName:='1 - Rozhodnutie o cinnosti';
			IF TunelVstup_Automat THEN
				SC_TunelVstup.Step:= 2;
			ELSIF TunelVstup_Vyprazdnenie THEN
				SC_TunelVstup.Step:= 2;
			ELSIF TunelVstup_Manual THEN
				SC_TunelVstup.Step:= 700;
			END_IF
		
		
		//********************************************************Inicializácia****************************************************************************//
	
		2:
			SC_TunelVstup.StepName:='2 - Inicializacia - cakanie na spustenie';
			SC_TunelVstup.IdleTime.PT:= T#500ms;
			SC_TunelVstup.AlarmTime.PT:= T#5s;
			SC_TunelVstup.IdleTime.IN:= TRUE;
				
			
			IF SC_TunelVstup.IdleTime.Q THEN
				SC_TunelVstup.ResetStep:= TRUE;
				SC_TunelVstup.Step:= 3;
			END_IF	
			
		3:
			SC_TunelVstup.StepName:='3 - Inicializacia - zasunutie odsuvaca do vychodiskovej polohy';
			SC_TunelVstup.IdleTime.PT:= T#500ms;
			SC_TunelVstup.AlarmTime.PT:= T#5s;
		
			IF NOT SC_TunelVstup.Switch1 AND RobotMan_Tunel_BezpVzdialenost THEN
				VstupnyOdsuvac_ZASUN:= TRUE;
				SC_TunelVstup.Switch1:= TRUE;
			END_IF
			
			IF diTunel_VstupLista_ZasunutaVZAD AND NOT TunelVstup_Vyprazdnenie THEN
				SC_TunelVstup.ResetStep:= TRUE;
				SC_TunelVstup.Step:= 4;
			ELSIF diTunel_VstupLista_ZasunutaVZAD AND TunelVstup_Vyprazdnenie THEN
				SC_TunelVstup.ResetStep:= TRUE;
				SC_TunelVstup.Step:= 0;	
			END_IF	
			
		4:
			SC_TunelVstup.StepName:='4 - Inicializacia - vysunutie rotorov na dopravnik tunela';
			SC_TunelVstup.IdleTime.PT:= T#500ms;
			SC_TunelVstup.AlarmTime.PT:= T#5s;
			
			IF NOT SC_TunelVstup.Switch1 AND SC_OvlVstupnehoOdsuvaca.Step = 1 AND Tunel_READY AND RobotMan_Tunel_BezpVzdialenost AND NOT diTunel_VstupLista_Naplnena AND PocetKusovVtuneli < Tunel_PocetKusovNaListe THEN
				VstupnyOdsuvac_VYSUN:= TRUE;
				SC_TunelVstup.Switch1:= TRUE;
			END_IF
			
			IF diTunel_VstupLista_VysunutaVPRED THEN
				PocetKusovVtuneli:= 10;
				SC_TunelVstup.ResetStep:= TRUE;
				SC_TunelVstup.Step:= 5;
			END_IF
			
		5:
			SC_TunelVstup.StepName:='5 - Inicializacia - zasunutie odsuvaca do vychodiskovej polohy';
			SC_TunelVstup.IdleTime.PT:= T#500ms;
			SC_TunelVstup.AlarmTime.PT:= T#5s;
		
			IF NOT SC_TunelVstup.Switch1 AND SC_OvlVstupnehoOdsuvaca.Step = 1 AND RobotMan_Tunel_BezpVzdialenost THEN
				VstupnyOdsuvac_ZASUN:= TRUE;
				SC_TunelVstup.Switch1:= TRUE;
			END_IF
			
			IF diTunel_VstupLista_ZasunutaVZAD AND NOT RobotMan_Tunel_KusyVlozene AND NOT RobotMan_Tunel_KusyNGVlozene THEN
				TunelVstup_PoINIT:= TRUE;
				SC_TunelVstup.ResetStep:= TRUE;
				SC_TunelVstup.Step:= 100;
			END_IF	
			
						
		
		//********************************************************Automatický režim****************************************************************************//
		100:
			SC_TunelVstup.StepName:='100 - Automaticky rezim - cakanie na polozenie kusov';
			SC_TunelVstup.IdleTime.PT:= T#500ms;
			SC_TunelVstup.AlarmTime.PT:= T#5s;	
			
			
			IF NOT SC_TunelVstup.Switch1 THEN
				RobotMan_Tunel_VlozKusy:= TRUE;
				SC_TunelVstup.Switch1:= TRUE;
			END_IF
			
	//************Rátanie kusov a meranie taktime**********************//		
			IF RobotMan_Tunel_KusyVlozene THEN
				IF NOT CasTaktTime1.IN AND NOT CasTaktTime2.IN THEN 
					CasTaktTime1.IN:= TRUE;
				ELSIF CasTaktTime1.IN AND NOT CasTaktTime2.IN THEN 
					TaktTime_Pole[TaktTime_Index]:= CasTaktTime1.ET;
					TaktTime_Cyklu:= CasTaktTime1.ET;
					TaktTime_Cyklu_REAL:= TIME_TO_REAL(TaktTime_Cyklu);
					TP_TaktTimeCyklu:= (TaktTime_Cyklu_REAL/1000);
					TaktTime_Index:= TaktTime_Index + 1;
					IF TaktTime_RataniePriemeru_ON THEN
						TaktTime_VyratajPriemer:= TRUE;
					END_IF	
					IF TaktTime_Index > 25 THEN
						TaktTime_RataniePriemeru_ON:= TRUE;
						TaktTime_Index:= 0;
					END_IF	
					CasTaktTime2.IN:= TRUE;
					CasTaktTime1.IN:= FALSE;
				ELSIF NOT CasTaktTime1.IN AND CasTaktTime2.IN THEN 	
					TaktTime_Pole[TaktTime_Index]:= CasTaktTime2.ET;
					TaktTime_Cyklu:= CasTaktTime2.ET;
					TaktTime_Cyklu_REAL:= TIME_TO_REAL(TaktTime_Cyklu);
					TP_TaktTimeCyklu:= (TaktTime_Cyklu_REAL/1000);
					TaktTime_Index:= TaktTime_Index + 1;
					IF TaktTime_RataniePriemeru_ON THEN
						TaktTime_VyratajPriemer:= TRUE;
					END_IF	
					IF TaktTime_Index > 25 THEN
						TaktTime_RataniePriemeru_ON:= TRUE;
						TaktTime_Index:= 0;
					END_IF	
					CasTaktTime1.IN:= TRUE;
					CasTaktTime2.IN:= FALSE;
				END_IF	
				PocetVyrobenychKusov_Model:= PocetVyrobenychKusov_Model + 2;
				PocetVyrobenychKusov_Smena:= PocetVyrobenychKusov_Smena + 2;
				RobotMan_Tunel_VlozKusy:= FALSE;
				SC_TunelVstup.ResetStep:= TRUE;
				SC_TunelVstup.Step:= 101;
			ELSIF RobotMan_Tunel_KusyNGVlozene THEN
				RobotMan_Tunel_VlozKusy:= FALSE;
				SC_TunelVstup.ResetStep:= TRUE;
				SC_TunelVstup.Step:= 101;
			END_IF
		
			
			
			
			
			
			IF TunelVstup_KoniecCyklu AND RobotMan_Stav_Odparkovany THEN
				SC_TunelVstup.ResetStep:= TRUE;
				SC_TunelVstup.Step:= 0;
			END_IF
			
			IF TunelVstup_KoniecVyroby AND RobotMan_Stav_Odparkovany THEN
				SC_TunelVstup.ResetStep:= TRUE;
				SC_TunelVstup.Step:= 0;
			END_IF
			
		
		101:
			SC_TunelVstup.StepName:='101 - Automaticky rezim - cakanie na vysunutie kusov na dopravnik tunela';
			SC_TunelVstup.IdleTime.PT:= T#500ms;
			SC_TunelVstup.AlarmTime.PT:= T#5s;	
			
			IF NOT SC_TunelVstup.Switch1 AND SC_OvlVstupnehoOdsuvaca.Step = 1 AND Tunel_READY AND NOT diTunel_VstupLista_Naplnena AND PocetKusovVtuneli < Tunel_PocetKusovNaListe AND RobotMan_Tunel_BezpVzdialenost THEN
				VstupnyOdsuvac_VYSUN:= TRUE;
				SC_TunelVstup.Switch1:= TRUE;
			END_IF
			
			IF diTunel_VstupLista_VysunutaVPRED THEN
				PocetKusovVtuneli:= PocetKusovVtuneli + 2;
				IF NOT TunelVstup_KontrolaNaliatkovON THEN
					TunelVstup_PocetMerNaliatkovOFF:= TunelVstup_PocetMerNaliatkovOFF + 1;
				END_IF
				IF TunelVstup_PocetMerNaliatkovOFF >= 3 THEN
					TunelVstup_KontrolaNaliatkovON:= TRUE;
				END_IF	
				SC_TunelVstup.ResetStep:= TRUE;
				SC_TunelVstup.Step:= 102;
			END_IF 
			
		102:
			SC_TunelVstup.StepName:='102 - Automaticky rezim - zasunutie odsuvaca do vychodiskovej polohy';
			SC_TunelVstup.IdleTime.PT:= T#500ms;
			SC_TunelVstup.AlarmTime.PT:= T#5s;	
		
			IF NOT SC_TunelVstup.Switch1 AND SC_OvlVstupnehoOdsuvaca.Step = 1 AND RobotMan_Tunel_BezpVzdialenost THEN
				VstupnyOdsuvac_ZASUN:= TRUE;
				SC_TunelVstup.Switch1:= TRUE;
			END_IF
			
			IF diTunel_VstupLista_ZasunutaVZAD AND NOT RobotMan_Tunel_KusyVlozene AND NOT RobotMan_Tunel_KusyNGVlozene THEN
				SC_TunelVstup.ResetStep:= TRUE;
				SC_TunelVstup.Step:= 100;
			END_IF	
			
	
		
		
		//********************************************************Ruèný režim***********************************************************************************//
		700:
			SC_TunelVstup.StepName:='700 - Rucny rezim';
		
		
		
		
	END_CASE	
			
	
	
	
	CasTaktTime1.PT:= T#10m;
	CasTaktTime1();
	CasTaktTime2.PT:= T#10m;
	CasTaktTime2();
	
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

