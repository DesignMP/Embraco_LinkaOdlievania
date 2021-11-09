
ACTION OvladanieGripra: 

	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_OvlGripra);
	
	CASE SC_OvlGripra.Step OF
		
		0:
			SC_OvlGripra.StepName:= '0 - Nulovanie';
			Otvor_Griper:= FALSE;
			Zatvor_Griper:= FALSE;
			doVstupManipul_GriperOTVOR:= FALSE;
			doVstupManipul_GriperZATVOR:= FALSE;
			IF SC_Stol_Manipulator.Step <> 0 THEN
				SC_OvlGripra.ResetStep:= TRUE;
				SC_OvlGripra.Step:= 1;
			END_IF	
	
		1:
			SC_OvlGripra.StepName:= '1 - Rozhodnutie o cinnosti';
			IF Otvor_Griper THEN
				SC_OvlGripra.Step:= 10;
			ELSIF Zatvor_Griper THEN
				SC_OvlGripra.Step:= 20;
			END_IF
			
		10:
			SC_OvlGripra.StepName:= '10 - Otvorenie gripra';
			SC_OvlGripra.IdleTime.PT:= T#3s;
			SC_OvlGripra.AlarmTime.PT:= T#3s;
			
			IF Stol_Manipulator_Manual THEN
				SC_OvlGripra.IdleTime.IN:= TRUE;
			ELSE	
				SC_OvlGripra.AlarmTime.IN:= TRUE;
			END_IF
		
			IF NOT SC_OvlGripra.Switch1 THEN
				doVstupManipul_GriperOTVOR:= TRUE;
				SC_OvlGripra.Switch1:= TRUE;
			END_IF
			
			IF SC_OvlGripra.AlarmTime.Q THEN
				Alarmy[21]:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			END_IF
		
			IF diVstupManipul_GriperOtvoreny OR SC_OvlGripra.IdleTime.Q THEN
				SC_OvlGripra.ResetStep:= TRUE;
				SC_OvlGripra.Step:= 0;
			END_IF
			
		20:
			SC_OvlGripra.StepName:= '20 - Zatvorenie gripra';
			SC_OvlGripra.IdleTime.PT:= T#1s;
			SC_OvlGripra.AlarmTime.PT:= T#3s;
			SC_OvlGripra.IdleTime.IN:= TRUE;
			
			IF Stol_Manipulator_Manual THEN
				SC_OvlGripra.IdleTime.IN:= TRUE;
			ELSE	
				SC_OvlGripra.AlarmTime.IN:= TRUE;
			END_IF
			
			
			IF NOT SC_OvlGripra.Switch1 THEN
				doVstupManipul_GriperZATVOR:= TRUE;
				SC_OvlGripra.Switch1:= TRUE;
			END_IF
			
			IF SC_OvlGripra.AlarmTime.Q THEN
				Alarmy[20]:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			END_IF
			
			IF diVstupManipul_GriperZatvoreny OR SC_OvlGripra.IdleTime.Q THEN
				SC_OvlGripra.ResetStep:= TRUE;
				SC_OvlGripra.Step:= 0;
			END_IF
			
	END_CASE	
	
	
	
	
END_ACTION
