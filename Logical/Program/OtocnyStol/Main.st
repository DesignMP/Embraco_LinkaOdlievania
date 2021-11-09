
PROGRAM _INIT
	
	 
END_PROGRAM

PROGRAM _CYCLIC

	
	
	//Blokovanie otáèania stola//
	IF (diVstupManipul_ZasunutyHORE OR Stol_Manipulator_AktualPozMM < 150.0) THEN
		Stol_BlokaciaOtacania:= FALSE;
	ELSE	
		Stol_BlokaciaOtacania:= TRUE;
	END_IF	
	
		
		
	
	
	//Volanie podprogramov//
	OvladanieOtacania;
	PrepocetSnimacovTeploty;
	OvladanieIndukcnehoOhrevu;
	
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_OtocnyStol);
	
	
	//Kontrola teploty na výstupe stola//
	IF Stol_TS_VnutorOkruhAktualStupne >= TP_Stol_SpodnaHranicaTeplotyOK AND Stol_TS_VnutorOkruhAktualStupne <= TP_Stol_HornaHranicaTeplotyOK AND diStol_Rotor_Vystup_VnutornOkruh THEN
		Stol_VnutorOkruh_TeplotaRotoraOK:= TRUE;
	ELSE	
		Stol_VnutorOkruh_TeplotaRotoraOK:= FALSE;
	END_IF
			
	IF Stol_TS_VonkajOkruhAktualStupne >= TP_Stol_SpodnaHranicaTeplotyOK AND Stol_TS_VonkajOkruhAktualStupne <= TP_Stol_HornaHranicaTeplotyOK AND diStol_Rotor_Vystup_VonkajOkruh THEN
		Stol_VonkajOkruh_TeplotaRotoraOK:= TRUE;
	ELSE	
		Stol_VonkajOkruh_TeplotaRotoraOK:= FALSE;
	END_IF	
			
	//Zrušenie signálu príprava na stol//
	IF RobotMan_Stav_PripravenyStol THEN
		RobotMan_PripravaNaStol:= FALSE;
	END_IF	
	
	
	
	//Reset sekcie //
	IF Stol_Reset OR NOT BezpOkruhOplotenia_Aktivovany OR PoruchaOtocnyStol THEN
		SC_OtocnyStol.Step:= 0;
	END_IF
	
	
	CASE SC_OtocnyStol.Step OF 
	
	
		0:
			SC_OtocnyStol.StepName:='0 - Nulovanie';
			SC_OvlStola.Step:= 0;
			Stol_Automat:= FALSE;
			Stol_KoniecVyroby:= FALSE;
			Stol_KoniecCyklu:= FALSE;
			Stol_Manual:= FALSE;
			Stol_PoINIT:= FALSE;
			Stol_Reset:= FALSE;
			Stol_PrebehloOtocenie:= FALSE;
			RobotMan_Stol_OdoberKusy:= FALSE;
			RobotMan_Stol_OdoberKusyNG:= FALSE;
			Stol_PocetOtoceni:= 0;
			Stol_PocetOtoceniNaprazdno:= 0; 
			IndukcnyOhrevStart:= FALSE;
			CasTaktuOFF:= FALSE;
			RobotMan_PripravaNaStol:= FALSE;
			IF NOT Stol_Manipulator_VyrobaPrebieha THEN
				Stol_Manipulator_StartVyroby:= TRUE;
				Stol_Manipulator_VlozeneKusy:= 0;
			END_IF	
			IF BezpOkruhOplotenia_Aktivovany AND NOT PoruchaOtocnyStol THEN
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 1;
			END_IF
	
		1:
			SC_OtocnyStol.StepName:='1 - Rozhodnutie o cinnosti';
			IF Stol_Automat THEN
				SC_OtocnyStol.Step:= 2;
			ELSIF Stol_Manual THEN
				SC_OtocnyStol.Step:= 700;
			END_IF
		
		
		//********************************************************Inicializácia****************************************************************************//
	
		2:
			SC_OtocnyStol.StepName:='2 - Inicializacia - cakanie na spustenie';
			SC_OtocnyStol.IdleTime.PT:= T#500ms;
			SC_OtocnyStol.AlarmTime.PT:= T#5s;
			SC_OtocnyStol.IdleTime.IN:= TRUE;
				
			
			IF SC_OtocnyStol.IdleTime.Q THEN
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 3;
			END_IF
	
		3:
			SC_OtocnyStol.StepName:='2 - Inicializacia - rozhodnutie o otoceni stola';
			SC_OtocnyStol.IdleTime.PT:= T#500ms;
			SC_OtocnyStol.AlarmTime.PT:= T#5s;
		
			IF diStol_PoziciaStola THEN
				IndukcnyOhrevStart:= TRUE;
				Stol_PoINIT:= TRUE;
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 100;
			ELSIF NOT diStol_PoziciaStola THEN
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 4;
			END_IF
		
		4:
			SC_OtocnyStol.StepName:='4 - Inicializacia - otocenie stola vpred';
			SC_OtocnyStol.IdleTime.PT:= T#500ms;
			SC_OtocnyStol.AlarmTime.PT:= T#5s;
				
			IF NOT SC_OtocnyStol.Switch1 AND SC_OvlStola.Step = 1 AND NOT Stol_BlokaciaOtacania AND RobotMan_Stol_BezpVzdialenost THEN
				Otacaj_VPRED:= TRUE;
				SC_OtocnyStol.Switch1:= TRUE;
			END_IF
		
			IF diStol_PoziciaStola AND Stol_PrebehloOtocenie THEN
				Stol_PrebehloOtocenie:= FALSE;
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 3;
			END_IF	
		
				
			
		
		//********************************************************Automatický režim****************************************************************************//
				
		100:
			SC_OtocnyStol.StepName:='100 - Automaticky rezim - cakanie na vlozenie kusov';
			SC_OtocnyStol.IdleTime.PT:= T#10s;
			SC_OtocnyStol.AlarmTime.PT:= T#20s;
			SC_OtocnyStol.IdleTime.IN:= TRUE;
			
			IF Stol_PocetOtoceniNaprazdno >= 3 THEN
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 0;
			ELSIF Stol_KoniecVyroby AND NOT diStol_Rotor_Vystup_VnutornOkruh AND NOT diStol_Rotor_Vystup_VonkajOkruh THEN
				Stol_PocetOtoceniNaprazdno:= Stol_PocetOtoceniNaprazdno + 1;
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 120;
			ELSIF Stol_KoniecVyroby AND diStol_Rotor_Vystup_VnutornOkruh OR diStol_Rotor_Vystup_VonkajOkruh THEN
				Stol_PocetOtoceniNaprazdno:= 0;
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 110;	
			ELSIF diStol_Rotor_Vystup_VnutornOkruh OR diStol_Rotor_Vystup_VonkajOkruh THEN
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 110;
			ELSIF NOT diStol_Rotor_Vystup_VnutornOkruh AND NOT diStol_Rotor_Vystup_VonkajOkruh THEN
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 120;
			END_IF	
			
					
		110:
			SC_OtocnyStol.StepName:='110 - Automaticky rezim - kontrola kusov na vystupe stola';
			SC_OtocnyStol.IdleTime.PT:= T#11s500ms;
			SC_OtocnyStol.AlarmTime.PT:= T#500ms;
			SC_OtocnyStol.AlarmTime.IN:= TRUE;
			SC_OtocnyStol.IdleTime.IN:= TRUE;
			
						
			IF SC_OtocnyStol.AlarmTime.Q THEN
				IF Stol_KoniecCyklu THEN
					RobotMan_Stol_OdoberKusy:= FALSE;
					RobotMan_Stol_OdoberKusyNG:= FALSE;
					SC_OtocnyStol.ResetStep:= TRUE;
					SC_OtocnyStol.Step:= 0;
				ELSIF diStol_Rotor_Vystup_VnutornOkruh AND diStol_Rotor_Vystup_VonkajOkruh AND (Stol_VnutorOkruh_TeplotaRotoraOK OR Stol_VonkajOkruh_TeplotaRotoraOK) THEN
					RobotMan_Stol_OdoberKusyNG:= FALSE;
					RobotMan_Stol_OdoberKusy:= TRUE;
				ELSIF diStol_Rotor_Vystup_VnutornOkruh AND diStol_Rotor_Vystup_VonkajOkruh AND (NOT Stol_VnutorOkruh_TeplotaRotoraOK AND NOT Stol_VonkajOkruh_TeplotaRotoraOK) THEN
					RobotMan_Stol_OdoberKusy:= FALSE;
					RobotMan_Stol_OdoberKusyNG:= TRUE;
				ELSIF diStol_Rotor_Vystup_VnutornOkruh AND NOT diStol_Rotor_Vystup_VonkajOkruh THEN
					RobotMan_Stol_OdoberKusy:= FALSE;
					RobotMan_Stol_OdoberKusyNG:= TRUE;
				ELSIF NOT diStol_Rotor_Vystup_VnutornOkruh AND diStol_Rotor_Vystup_VonkajOkruh THEN
					RobotMan_Stol_OdoberKusy:= FALSE;
					RobotMan_Stol_OdoberKusyNG:= TRUE;
				ELSIF NOT diStol_Rotor_Vystup_VnutornOkruh AND NOT diStol_Rotor_Vystup_VonkajOkruh AND Stol_Manipulator_CakaNaOtocenie AND SC_OtocnyStol.IdleTime.Q AND RobotMan_Stol_BezpVzdialenost THEN		
					RobotMan_Stol_OdoberKusy:= FALSE;
					RobotMan_Stol_OdoberKusyNG:= FALSE;
					SC_OtocnyStol.ResetStep:= TRUE;
					SC_OtocnyStol.Step:= 150;
				ELSIF NOT diStol_Rotor_Vystup_VnutornOkruh AND NOT diStol_Rotor_Vystup_VonkajOkruh AND SC_OtocnyStol.IdleTime.Q AND RobotMan_Stol_BezpVzdialenost AND Stol_KoniecCyklu THEN	
					RobotMan_Stol_OdoberKusy:= FALSE;
					RobotMan_Stol_OdoberKusyNG:= FALSE;
					SC_OtocnyStol.ResetStep:= TRUE;
					SC_OtocnyStol.Step:= 0;
				END_IF
			END_IF	
				
			IF NOT diStol_Rotor_Vystup_VnutornOkruh AND NOT diStol_Rotor_Vystup_VonkajOkruh THEN
				RobotMan_Stol_OdoberKusy:= FALSE;
				RobotMan_Stol_OdoberKusyNG:= FALSE;
			END_IF	
			
	
		120:
			SC_OtocnyStol.StepName:='120 - Automaticky rezim - cakanie na nalozenie kusov na vstupe stola';
			SC_OtocnyStol.IdleTime.PT:= T#11s500ms;
			SC_OtocnyStol.AlarmTime.PT:= T#200ms;
			SC_OtocnyStol.IdleTime.IN:= TRUE;
			
			IF Stol_KoniecCyklu THEN
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 0;
			ELSIF Stol_Manipulator_CakaNaOtocenie AND SC_OtocnyStol.IdleTime.Q THEN
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 150;
			END_IF
			
			
		
		
		150:
			SC_OtocnyStol.StepName:='150 - Automaticky rezim - otocenie stola vpred';
			SC_OtocnyStol.IdleTime.PT:= T#500ms;
			SC_OtocnyStol.AlarmTime.PT:= T#5s;
		
					
			IF NOT SC_OtocnyStol.Switch1 AND NOT Stol_BlokaciaOtacania AND RobotMan_Stol_BezpVzdialenost THEN
				Otacaj_VPRED:= TRUE;
				SC_OtocnyStol.Switch1:= TRUE;	
			END_IF		
						
					
			IF diStol_PoziciaStola AND Stol_PrebehloOtocenie THEN
				Stol_Manipulator_CakaNaOtocenie:= FALSE;
				Stol_PrebehloOtocenie:= FALSE;
				SC_OtocnyStol.ResetStep:= TRUE;
				SC_OtocnyStol.Step:= 100;
			END_IF
		
				
		
			//********************************************************Ruèný režim***********************************************************************************//
		700:
			SC_OtocnyStol.StepName:='700 - Rucny rezim';
	
	
	
	
	
	END_CASE
	 
				END_PROGRAM

PROGRAM _EXIT
				(* Insert code here *)
	 
				END_PROGRAM

