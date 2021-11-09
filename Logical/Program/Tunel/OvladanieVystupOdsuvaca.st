
ACTION OvladanieVystupOdsuvaca: 

	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_OvlVystupnehoOdsuvaca);
	
	
	CASE SC_OvlVystupnehoOdsuvaca.Step OF
		
		0:
			SC_OvlVystupnehoOdsuvaca.StepName:= '0 - Nulovanie';
			VystupnyOdsuvac_VYSUN:= FALSE;
			VystupnyOdsuvac_ZASUN:= FALSE;
			doTunel_VystupLista_VysunVPRED:= FALSE;
			doTunel_VystupLista_ZasunVZAD:= FALSE;
			IF SC_Tunel.Step <> 0 THEN
				SC_OvlVystupnehoOdsuvaca.ResetStep:= TRUE;
				SC_OvlVystupnehoOdsuvaca.Step:= 1;
			END_IF	
	
		
		1:
			SC_OvlVystupnehoOdsuvaca.StepName:= '1 - Rozhodnutie o cinnosti';
			IF VystupnyOdsuvac_VYSUN THEN
				SC_OvlVystupnehoOdsuvaca.Step:= 10;
			ELSIF VystupnyOdsuvac_ZASUN THEN
				SC_OvlVystupnehoOdsuvaca.Step:= 20;
			END_IF
		
		
		
		10:
			SC_OvlVystupnehoOdsuvaca.StepName:= '10 - Vysunutie odsuvaca vpred';
			SC_OvlVystupnehoOdsuvaca.IdleTime.PT:= T#5s;
			SC_OvlVystupnehoOdsuvaca.AlarmTime.PT:= T#20s;
			
			IF Tunel_Manual THEN
				SC_OvlVystupnehoOdsuvaca.IdleTime.IN:= TRUE;
			ELSE	
				SC_OvlVystupnehoOdsuvaca.AlarmTime.IN:= TRUE;
			END_IF
		
			IF NOT SC_OvlVystupnehoOdsuvaca.Switch1 THEN
				doTunel_VystupLista_VysunVPRED:= TRUE;
				SC_OvlVystupnehoOdsuvaca.Switch1:= TRUE;
			END_IF
		
			IF SC_OvlVystupnehoOdsuvaca.AlarmTime.Q THEN
				Alarmy[64]:= TRUE;
				PoruchaChladiacehoTunela:= TRUE;
			END_IF
		
			IF diTunel_VystLista_VysunutaVPRED OR SC_OvlVystupnehoOdsuvaca.IdleTime.Q THEN
				SC_OvlVystupnehoOdsuvaca.ResetStep:= TRUE;
				SC_OvlVystupnehoOdsuvaca.Step:= 0;
			END_IF
		
		
		20:
			SC_OvlVystupnehoOdsuvaca.StepName:= '20 - Zasunutie odsuvaca vzad';
			SC_OvlVystupnehoOdsuvaca.IdleTime.PT:= T#5s;
			SC_OvlVystupnehoOdsuvaca.AlarmTime.PT:= T#20s;
			
			IF Tunel_Manual THEN
				SC_OvlVystupnehoOdsuvaca.IdleTime.IN:= TRUE;
			ELSE	
				SC_OvlVystupnehoOdsuvaca.AlarmTime.IN:= TRUE;
			END_IF
		
			IF NOT SC_OvlVystupnehoOdsuvaca.Switch1 THEN
				doTunel_VystupLista_ZasunVZAD:= TRUE;
				SC_OvlVystupnehoOdsuvaca.Switch1:= TRUE;
			END_IF
		
			IF SC_OvlVystupnehoOdsuvaca.AlarmTime.Q THEN
				Alarmy[65]:= TRUE;
				PoruchaChladiacehoTunela:= TRUE;
			END_IF
		
			IF diTunel_VystLista_ZasunutaVZAD OR SC_OvlVystupnehoOdsuvaca.IdleTime.Q THEN
				SC_OvlVystupnehoOdsuvaca.ResetStep:= TRUE;
				SC_OvlVystupnehoOdsuvaca.Step:= 0;
			END_IF
		
		
		
			
	END_CASE		
	
	
END_ACTION
