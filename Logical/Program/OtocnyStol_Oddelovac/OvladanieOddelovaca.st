
ACTION OvladanieOddelovaca: 

	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_OvlOddelovaca);
	
	CASE SC_OvlOddelovaca.Step OF
		
		0:
			SC_OvlOddelovaca.StepName:= '0 - Nulovanie';
			Oddelovac_NAVAZANIE:= FALSE;
			Oddelovac_VYVAZANIE:= FALSE;
			doOddelovac_PrepniPozNavazania:= FALSE;
			doOddelovac_PrepniPozVyvazania:= FALSE;
			IF SC_Oddelovac.Step <> 0 THEN
				SC_OvlOddelovaca.ResetStep:= TRUE;
				SC_OvlOddelovaca.Step:= 1;
			END_IF
		
		1:
			SC_OvlOddelovaca.StepName:= '1 - Rozhodnutie o cinnosti';
			IF Oddelovac_NAVAZANIE THEN
				SC_OvlOddelovaca.Step:= 10;
			ELSIF Oddelovac_VYVAZANIE THEN
				SC_OvlOddelovaca.Step:= 20;
			END_IF
		
		10:
			SC_OvlOddelovaca.StepName:= '10 - Prepnutie oddelovaca do polohy navazania';
			SC_OvlOddelovaca.IdleTime.PT:= T#3s;
			SC_OvlOddelovaca.AlarmTime.PT:= T#3s;
			IF Oddelovac_Manual THEN
				SC_OvlOddelovaca.IdleTime.IN:= TRUE;
			ELSE	
				SC_OvlOddelovaca.AlarmTime.IN:= TRUE;
			END_IF
		
			IF NOT SC_OvlOddelovaca.Switch1 THEN
				doOddelovac_PrepniPozNavazania:= TRUE;
				SC_OvlOddelovaca.Switch1:= TRUE;
			END_IF
		
			IF SC_OvlOddelovaca.AlarmTime.Q THEN
				Alarmy[10]:= TRUE;
				PoruchaOddelovaca:= TRUE;
			END_IF
		
			IF (diOddelovac_PoziciaNAVAZANIE AND NOT diOddelovac_PoziciaVYVAZANIE) OR SC_OvlOddelovaca.IdleTime.Q THEN
				SC_OvlOddelovaca.ResetStep:= TRUE;
				SC_OvlOddelovaca.Step:= 0;
			END_IF
		
		
		20:
			SC_OvlOddelovaca.StepName:= '20 - Prepnutie oddelovaca do polohy vyvazania';
			SC_OvlOddelovaca.IdleTime.PT:= T#3s;
			SC_OvlOddelovaca.AlarmTime.PT:= T#3s;
			IF Oddelovac_Manual THEN
				SC_OvlOddelovaca.IdleTime.IN:= TRUE;
			ELSE	
				SC_OvlOddelovaca.AlarmTime.IN:= TRUE;
			END_IF
		
		
			IF NOT SC_OvlOddelovaca.Switch1 THEN
				doOddelovac_PrepniPozVyvazania:= TRUE;
				SC_OvlOddelovaca.Switch1:= TRUE;
			END_IF
		
			IF SC_OvlOddelovaca.AlarmTime.Q THEN
				Alarmy[10]:= TRUE;
				PoruchaOddelovaca:= TRUE;
			END_IF
		
			IF (diOddelovac_PoziciaVYVAZANIE AND NOT diOddelovac_PoziciaNAVAZANIE) OR SC_OvlOddelovaca.IdleTime.Q THEN
				SC_OvlOddelovaca.ResetStep:= TRUE;
				SC_OvlOddelovaca.Step:= 0;
			END_IF
		
		
		
		
		
		
	END_CASE
	
	
	
	
	
END_ACTION
