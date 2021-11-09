
ACTION OvladanieVstupOdsuvaca: 

	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_OvlVstupnehoOdsuvaca);
	
	
	CASE SC_OvlVstupnehoOdsuvaca.Step OF
		
		0:
			SC_OvlVstupnehoOdsuvaca.StepName:= '0 - Nulovanie';
			VstupnyOdsuvac_VYSUN:= FALSE;
			VstupnyOdsuvac_ZASUN:= FALSE;
			doTunel_VstupLista_VysunVPRED:= FALSE;
			doTunel_VstupLista_ZasunVZAD:= FALSE;
			IF SC_Tunel.Step <> 0 THEN
				SC_OvlVstupnehoOdsuvaca.ResetStep:= TRUE;
				SC_OvlVstupnehoOdsuvaca.Step:= 1;
			END_IF	
	
		
		1:
			SC_OvlVstupnehoOdsuvaca.StepName:= '1 - Rozhodnutie o cinnosti';
			IF VstupnyOdsuvac_VYSUN THEN
				SC_OvlVstupnehoOdsuvaca.Step:= 10;
			ELSIF VstupnyOdsuvac_ZASUN THEN
				SC_OvlVstupnehoOdsuvaca.Step:= 20;
			END_IF
		
		
		
		10:
			SC_OvlVstupnehoOdsuvaca.StepName:= '10 - Vysunutie odsuvaca vpred';
			SC_OvlVstupnehoOdsuvaca.IdleTime.PT:= T#15s;
			SC_OvlVstupnehoOdsuvaca.AlarmTime.PT:= T#10s;
			
			IF Tunel_Manual THEN
				SC_OvlVstupnehoOdsuvaca.IdleTime.IN:= TRUE;
			ELSE	
				SC_OvlVstupnehoOdsuvaca.AlarmTime.IN:= TRUE;
			END_IF
		
			IF NOT SC_OvlVstupnehoOdsuvaca.Switch1 THEN
				doTunel_VstupLista_VysunVPRED:= TRUE;
				SC_OvlVstupnehoOdsuvaca.Switch1:= TRUE;
			END_IF
		
			IF SC_OvlVstupnehoOdsuvaca.AlarmTime.Q THEN
				Alarmy[62]:= TRUE;
				PoruchaVstupuChladiacehoTunela:= TRUE;
			END_IF
		
			IF diTunel_VstupLista_VysunutaVPRED OR SC_OvlVstupnehoOdsuvaca.IdleTime.Q THEN
				SC_OvlVstupnehoOdsuvaca.ResetStep:= TRUE;
				SC_OvlVstupnehoOdsuvaca.Step:= 0;
			END_IF
		
		
		20:
			SC_OvlVstupnehoOdsuvaca.StepName:= '20 - Zasunutie odsuvaca vzad';
			SC_OvlVstupnehoOdsuvaca.IdleTime.PT:= T#7s;
			SC_OvlVstupnehoOdsuvaca.AlarmTime.PT:= T#10s;
			
			IF Tunel_Manual THEN
				SC_OvlVstupnehoOdsuvaca.IdleTime.IN:= TRUE;
			ELSE	
				SC_OvlVstupnehoOdsuvaca.AlarmTime.IN:= TRUE;
			END_IF
		
			IF NOT SC_OvlVstupnehoOdsuvaca.Switch1 THEN
				doTunel_VstupLista_ZasunVZAD:= TRUE;
				SC_OvlVstupnehoOdsuvaca.Switch1:= TRUE;
			END_IF
		
			IF SC_OvlVstupnehoOdsuvaca.AlarmTime.Q THEN
				Alarmy[63]:= TRUE;
				PoruchaVstupuChladiacehoTunela:= TRUE;
			END_IF
		
			IF diTunel_VstupLista_ZasunutaVZAD OR SC_OvlVstupnehoOdsuvaca.IdleTime.Q THEN
				SC_OvlVstupnehoOdsuvaca.ResetStep:= TRUE;
				SC_OvlVstupnehoOdsuvaca.Step:= 0;
			END_IF
		
		
		
			
	END_CASE		
	
	
	
	
END_ACTION
