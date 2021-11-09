
ACTION OvladanieOtacania: 

	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_OvlStola);
	
	
	
	
	CASE SC_OvlStola.Step OF
		
		0:
			SC_OvlStola.StepName:= '0 - Nulovanie';
			Otacaj_VPRED:= FALSE;
			Otacaj_VZAD:= FALSE;
			doStol_ODBRZDI:= FALSE;
			doStol_OtacanieVPRED:= FALSE;
			doStol_OtacanieVZAD:= FALSE;
	
			IF SC_OtocnyStol.Step <> 0 THEN
				SC_OvlStola.ResetStep:= TRUE;
				SC_OvlStola.Step:= 1;
			END_IF
	
	
		1:
			SC_OvlStola.StepName:= '1 - Rozhodnutie o cinnosti';
			IF Otacaj_VPRED THEN
				SC_OvlStola.Step:= 10;
			ELSIF Otacaj_VZAD THEN
				SC_OvlStola.Step:= 20;
			END_IF	
	
		10:
			SC_OvlStola.StepName:= '10 - Spustenie otacania stola vpred';
			SC_OvlStola.IdleTime.PT:= T#7s;
			SC_OvlStola.AlarmTime.PT:= T#7s;
			
			
			IF NOT SC_OvlStola.Switch1 AND NOT Stol_BlokaciaOtacania THEN
				doStol_ODBRZDI:= TRUE;
				doStol_OtacanieVPRED:= TRUE;
				SC_OvlStola.Switch1:= TRUE;
			END_IF
		
			IF Stol_BlokaciaOtacania THEN
				Alarmy[33]:= TRUE;
				PoruchaOtocnyStol:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			END_IF
			
			
			IF doStol_OtacanieVPRED AND NOT diStol_PoziciaStola THEN
				SC_OvlStola.ResetStep:= TRUE;
				SC_OvlStola.Step:= 11;
			END_IF
			
		11:
			SC_OvlStola.StepName:= '11 - Zastavenie otacania stola vpred';
			SC_OvlStola.IdleTime.PT:= T#7s;
			SC_OvlStola.AlarmTime.PT:= T#7s;	
//			IF Stol_Manual THEN
//				SC_OvlStola.IdleTime.IN:= TRUE;
//			ELSE	
//				SC_OvlStola.AlarmTime.IN:= TRUE;
//			END_IF
			
			
			IF EDGEPOS (diStol_PoziciaStola = TRUE) THEN
				Stol_PrebehloOtocenie:= TRUE;
				SC_OvlStola.ResetStep:= TRUE;
				SC_OvlStola.Step:= 0;
			ELSIF SC_OvlStola.IdleTime.Q THEN
				SC_OvlStola.ResetStep:= TRUE;
				SC_OvlStola.Step:= 0;
			END_IF
			
			IF SC_OvlStola.AlarmTime.Q THEN
				Alarmy[31]:= TRUE;
				PoruchaOtocnyStol:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			END_IF
	
		20:
			SC_OvlStola.StepName:= '20 - Spustenie otacania stola vzad';
			SC_OvlStola.IdleTime.PT:= T#7s;
			SC_OvlStola.AlarmTime.PT:= T#7s;
			
			
			IF NOT SC_OvlStola.Switch1 AND NOT Stol_BlokaciaOtacania THEN
				doStol_ODBRZDI:= TRUE;
				doStol_OtacanieVZAD:= TRUE;
				SC_OvlStola.Switch1:= TRUE;
			END_IF
		
			IF Stol_BlokaciaOtacania THEN
				Alarmy[33]:= TRUE;
				PoruchaOtocnyStol:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			END_IF
			
			
			IF doStol_OtacanieVZAD AND NOT diStol_PoziciaStola THEN
				SC_OvlStola.ResetStep:= TRUE;
				SC_OvlStola.Step:= 21;
			END_IF
		
		21:
			SC_OvlStola.StepName:= '21 - Zastavenie otacania stola vzad';
			SC_OvlStola.IdleTime.PT:= T#7s;
			SC_OvlStola.AlarmTime.PT:= T#7s;	
//			IF Stol_Manual THEN
//				SC_OvlStola.IdleTime.IN:= TRUE;
//			ELSE	
//				SC_OvlStola.AlarmTime.IN:= TRUE;
//			END_IF
			
			
			IF EDGEPOS (diStol_PoziciaStola = TRUE) THEN
				Stol_PrebehloOtocenie:= TRUE;
				SC_OvlStola.ResetStep:= TRUE;
				SC_OvlStola.Step:= 0;
			ELSIF SC_OvlStola.IdleTime.Q THEN
				SC_OvlStola.ResetStep:= TRUE;
				SC_OvlStola.Step:= 0;
			END_IF
			
			IF SC_OvlStola.AlarmTime.Q THEN
				Alarmy[31]:= TRUE;
				PoruchaOtocnyStol:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			END_IF
		
		
	
	END_CASE
	
	
	
	
	
	
	
	
END_ACTION
