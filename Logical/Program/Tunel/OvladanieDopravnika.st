
ACTION OvladanieDopravnika: 

	IF Tunel_Manual THEN
		Tunel_Dopravnik_RychlJogginguHz:= TP_Tunel_RychlostDopravnikaJogg;
	END_IF
	
	//Prepoèet dobehovej rampy tunela//
	
	DobehovaRampaDopravnika:= REAL_TO_UINT(TP_Tunel_ZastavenieDopravnika*10);
	
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_OvlDopravnika);
	
	
	CASE SC_OvlDopravnika.Step OF
		
		0:
			SC_OvlDopravnika.StepName:= '0 - Nulovanie';
			FM_Menic[1].Input.Command.RunForward:= FALSE;
			FM_Menic[1].Input.Command.RunBackward:= FALSE;
			Dopravnik_ChodVPRED:= FALSE;
			Dopravnik_JoggVPRED:= FALSE;
			Dopravnik_JoggVZAD:= FALSE;
			IF SC_Tunel.Step <> 0 THEN
				SC_OvlDopravnika.ResetStep:= TRUE;
				SC_OvlDopravnika.Step:= 1;
			END_IF
	
	
		1:
			SC_OvlDopravnika.StepName:= '1 - Rozhodnutie o cinnosti';
			IF Dopravnik_ChodVPRED THEN
				SC_OvlDopravnika.Step:= 10;
			ELSIF Dopravnik_JoggVPRED THEN
				SC_OvlDopravnika.Step:= 20;
			ELSIF Dopravnik_JoggVZAD THEN
				SC_OvlDopravnika.Step:= 30;
			END_IF	
	
		10:
			SC_OvlDopravnika.StepName:= '10 - Spustenie polohovania dopravnika vpred';
			SC_OvlDopravnika.IdleTime.PT:= T#7s;
			SC_OvlDopravnika.AlarmTime.PT:= T#7s;
			FM_Menic[1].Input.HighSpeed:= (Tunel_Dopravnik_RychlPolohovHz * 10); //v Hz
			FM_Menic[1].Input.AccTime:= 1;  //0.1s
			FM_Menic[1].Input.DecTime:= DobehovaRampaDopravnika;  //0.1s
			
			IF Tunel_Manual THEN
				SC_OvlDopravnika.IdleTime.IN:= TRUE;
			ELSE	
				SC_OvlDopravnika.AlarmTime.IN:= TRUE;
			END_IF
			
			IF NOT SC_OvlDopravnika.Switch1 AND NOT Tunel_BlokaciaDopravnika AND diTunel_KoliziaNaVystupeDoprav THEN
				FM_Menic[1].Input.Command.RunForward:= TRUE;
				SC_OvlDopravnika.Switch1:= TRUE;
			END_IF
		
			IF NOT diTunel_PolohaDopravnika THEN
				SC_OvlDopravnika.ResetStep:= TRUE;
				SC_OvlDopravnika.Step:= 11;
			END_IF
			
			IF Tunel_BlokaciaDopravnika THEN
				Alarmy[67]:= TRUE;
				PoruchaChladiacehoTunela:= TRUE;
			END_IF
		
			IF NOT diTunel_KoliziaNaVystupeDoprav THEN
				Alarmy[69]:= TRUE;
				PoruchaChladiacehoTunela:= TRUE;
			END_IF
		
		11:
			SC_OvlDopravnika.StepName:= '11 - Zastavenie polohovania dopravnika vpred';
			SC_OvlDopravnika.IdleTime.PT:= T#7s;
			SC_OvlDopravnika.AlarmTime.PT:= T#7s;	
			
			
			IF EDGEPOS (diTunel_PolohaDopravnika = TRUE) THEN
				Tunel_DopravnikSaPOSUNUL:= TRUE;
				SC_OvlDopravnika.ResetStep:= TRUE;
				SC_OvlDopravnika.Step:= 0;
			ELSIF SC_OvlDopravnika.IdleTime.Q THEN
				SC_OvlDopravnika.ResetStep:= TRUE;
				SC_OvlDopravnika.Step:= 0;
			END_IF
			
			IF SC_OvlDopravnika.AlarmTime.Q THEN
				Alarmy[66]:= TRUE;
				PoruchaChladiacehoTunela:= TRUE;
			END_IF
		
			IF NOT diTunel_KoliziaNaVystupeDoprav THEN
				Alarmy[69]:= TRUE;
				PoruchaChladiacehoTunela:= TRUE;
			END_IF
			
	
		20:
			SC_OvlDopravnika.StepName:= '20 - Jogging dopravnika VPRED';
			SC_OvlDopravnika.IdleTime.PT:= T#7s;
			SC_OvlDopravnika.AlarmTime.PT:= T#7s;
			FM_Menic[1].Input.HighSpeed:= (Tunel_Dopravnik_RychlJogginguHz * 10); //v Hz
			FM_Menic[1].Input.AccTime:= 1;  //0.1s
			FM_Menic[1].Input.DecTime:= 1;  //0.1s
						
			IF NOT SC_OvlDopravnika.Switch1 AND NOT Tunel_BlokaciaDopravnika AND diTunel_KoliziaNaVystupeDoprav THEN
				FM_Menic[1].Input.Command.RunForward:= TRUE;
				SC_OvlDopravnika.Switch1:= TRUE;
			END_IF
		
			IF NOT diTunel_KoliziaNaVystupeDoprav THEN
				Alarmy[69]:= TRUE;
				PoruchaChladiacehoTunela:= TRUE;
			END_IF
			
			IF NOT Dopravnik_JoggVPRED OR Tunel_BlokaciaDopravnika OR NOT diTunel_KoliziaNaVystupeDoprav THEN
				SC_OvlDopravnika.ResetStep:= TRUE;
				SC_OvlDopravnika.Step:= 0;
			END_IF
		
		30:
			SC_OvlDopravnika.StepName:= '30 - Jogging dopravnika VZAD';
			SC_OvlDopravnika.IdleTime.PT:= T#7s;
			SC_OvlDopravnika.AlarmTime.PT:= T#7s;
			FM_Menic[1].Input.HighSpeed:= (Tunel_Dopravnik_RychlJogginguHz * 10); //v Hz
			FM_Menic[1].Input.AccTime:= 1;  //0.1s
			FM_Menic[1].Input.DecTime:= 1;  //0.1s
						
			IF NOT SC_OvlDopravnika.Switch1 AND NOT Tunel_BlokaciaDopravnika THEN
				FM_Menic[1].Input.Command.RunBackward:= TRUE;
				SC_OvlDopravnika.Switch1:= TRUE;
			END_IF
		
		
			
			
			IF NOT Dopravnik_JoggVZAD OR Tunel_BlokaciaDopravnika THEN
				SC_OvlDopravnika.ResetStep:= TRUE;
				SC_OvlDopravnika.Step:= 0;
			END_IF
		
	
	END_CASE
	
	
END_ACTION
