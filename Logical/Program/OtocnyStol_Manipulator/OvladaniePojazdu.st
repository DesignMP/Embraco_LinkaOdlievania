
ACTION OvladaniePojazdu: 

	//Prepoèet rýchlosti pojazdu manipulátora//
	KonstantaPojazd_MM:= 8;  //8mm
	KonstantaPojazd_Servo:= 800; //poèet jednotiek za 8mm
	
	Stol_Manipulator_RychlJog_MM_s:= TP_Manipul_RychlostJogg;
	Stol_Manipulator_RychlostPolohov:= (Stol_Manipulator_Rychlost_MM_s / KonstantaPojazd_MM) * KonstantaPojazd_Servo;
	Stol_Manipulator_RychlJoggingu:= (Stol_Manipulator_RychlJog_MM_s / KonstantaPojazd_MM) * KonstantaPojazd_Servo;
	
	
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_OvlServoPojazdu);
	
	
	CASE SC_OvlServoPojazdu.Step OF
		
		0:
			SC_OvlServoPojazdu.StepName:= '0 - Nulovanie';
			ServoPojazd_JoggVPRED:= FALSE;
			ServoPojazd_JoggVZAD:= FALSE;
			ServoPojazd_Polohuj:= FALSE;
			Stol_Manipulator_HOME:= FALSE;
			Motion[1].cmd.home:= FALSE;
			Motion[1].cmd.moveAbsolute:= FALSE;
			Motion[1].cmd.moveJogNeg:= FALSE;
			Motion[1].cmd.moveJogPos:= FALSE;
			Stol_Manipulator_PrebiehaHoming:= FALSE;
			IF NOT SC_OvlServoPojazdu.Switch1 AND Motion[1].status.DriveStatus.HomingOk THEN
				Motion[1].cmd.halt:= TRUE;
				SC_OvlServoPojazdu.Switch1:= TRUE;
			END_IF	
			IF SC_Stol_Manipulator.Step <> 0 THEN
				SC_OvlServoPojazdu.ResetStep:= TRUE;
				SC_OvlServoPojazdu.Step:= 1;
			END_IF	
	
	
		1:
			SC_OvlServoPojazdu.StepName:= '1 - Rozhodnutie o cinnosti';
			IF ServoPojazd_JoggVPRED THEN
				SC_OvlServoPojazdu.Step:= 10;
			ELSIF ServoPojazd_JoggVZAD THEN
				SC_OvlServoPojazdu.Step:= 20;
			ELSIF ServoPojazd_Polohuj THEN
				SC_OvlServoPojazdu.Step:= 30;
			ELSIF Stol_Manipulator_HOME THEN
				SC_OvlServoPojazdu.Step:= 40;
			END_IF
		
		
		10:
			SC_OvlServoPojazdu.StepName:= '10 - Jogging VPRED';
			SC_OvlServoPojazdu.IdleTime.PT:= T#3s;
			SC_OvlServoPojazdu.AlarmTime.PT:= T#3s;
			
			Motion[1].par.velocityJog:= Stol_Manipulator_RychlJoggingu;
			Motion[1].par.acc := (Stol_Manipulator_RychlJoggingu * 10); //0,5s
			Motion[1].par.dec := (Stol_Manipulator_RychlJoggingu * 10); //0,5s
			
		
			IF NOT SC_OvlServoPojazdu.Switch1 THEN
				Motion[1].cmd.moveJogPos:= TRUE;
				SC_OvlServoPojazdu.Switch1:= TRUE;
			END_IF
		
			IF NOT ServoPojazd_JoggVPRED OR diVstupManipul_PrednyLimit OR Stol_Manipulator_AktualPozMM >= 360 OR NOT diVstupManipul_ZasunutyHORE THEN
				SC_OvlServoPojazdu.ResetStep:= TRUE;
				SC_OvlServoPojazdu.Step:= 0;
			END_IF
		
		
		20:
			SC_OvlServoPojazdu.StepName:= '10 - Jogging VZAD';
			SC_OvlServoPojazdu.IdleTime.PT:= T#3s;
			SC_OvlServoPojazdu.AlarmTime.PT:= T#3s;
			
			Motion[1].par.velocityJog:= Stol_Manipulator_RychlJoggingu;
			Motion[1].par.acc := (Stol_Manipulator_RychlJoggingu * 10); //0,5s
			Motion[1].par.dec := (Stol_Manipulator_RychlJoggingu * 10); //0,5s
			
		
	
			IF NOT SC_OvlServoPojazdu.Switch1 THEN
				Motion[1].cmd.moveJogNeg:= TRUE;
				SC_OvlServoPojazdu.Switch1:= TRUE;
			END_IF
		
			IF NOT ServoPojazd_JoggVZAD OR diVstupManipul_ZadnyLimit OR Stol_Manipulator_AktualPozMM <= 5 OR NOT diVstupManipul_ZasunutyHORE THEN
				SC_OvlServoPojazdu.ResetStep:= TRUE;
				SC_OvlServoPojazdu.Step:= 0;
			END_IF
		
		
		30:
			SC_OvlServoPojazdu.StepName:= '30 - Start polohovanie pojazdu';
			SC_OvlServoPojazdu.IdleTime.PT:= T#100ms;
			SC_OvlServoPojazdu.AlarmTime.PT:= T#3s;
			SC_OvlServoPojazdu.IdleTime.IN:= TRUE;	
		
			Motion[1].par.velocity:= Stol_Manipulator_RychlostPolohov;
			Motion[1].par.acc := (Stol_Manipulator_RychlostPolohov * 10); //0,5s
			Motion[1].par.dec := (Stol_Manipulator_RychlostPolohov * 10); //0,5s
			Motion[1].par.position:= (Stol_Manipulator_ZadanaPozMM * 100);
		
			IF NOT SC_OvlServoPojazdu.Switch1 AND SC_OvlServoPojazdu.IdleTime.Q THEN
				Motion[1].cmd.moveAbsolute:= TRUE;
				SC_OvlServoPojazdu.Switch1:= TRUE;
			END_IF
		
			IF NOT Motion[1].state.StandStill THEN
				SC_OvlServoPojazdu.ResetStep:= TRUE;
				SC_OvlServoPojazdu.Step:= 31;
			ELSIF Motion[1].status.ActPosition = Motion[1].par.position THEN
				SC_OvlServoPojazdu.ResetStep:= TRUE;
				SC_OvlServoPojazdu.Step:= 31;
			END_IF
		
		31:
			
			SC_OvlServoPojazdu.StepName:= '31 - Ukoncenie polohovanie pojazdu';
			SC_OvlServoPojazdu.IdleTime.PT:= T#3s;
			SC_OvlServoPojazdu.AlarmTime.PT:= T#3s;
		
			IF Motion[1].state.StandStill AND (Motion[1].status.ActPosition = Motion[1].par.position) THEN
				Stol_Manipulator_PojazdVPOZICI:= TRUE;
				SC_OvlServoPojazdu.ResetStep:= TRUE;
				SC_OvlServoPojazdu.Step:= 0;
			END_IF
		
			IF diVstupManipul_PrednyLimit OR diVstupManipul_ZadnyLimit THEN
				Alarmy[26]:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			END_IF
		
		40:
			SC_OvlServoPojazdu.StepName:= '40 - Homing,zdvihnutie gripra';
			SC_OvlServoPojazdu.IdleTime.PT:= T#3s;
			SC_OvlServoPojazdu.AlarmTime.PT:= T#3s;	
		
			IF NOT SC_OvlServoPojazdu.Switch1 THEN
				Zdvih_Manipulatora:= TRUE;
				SC_OvlServoPojazdu.Switch1:= TRUE;
			END_IF
			
			IF diVstupManipul_ZasunutyHORE THEN
				SC_OvlServoPojazdu.ResetStep:= TRUE;
				SC_OvlServoPojazdu.Step:= 41;
			END_IF
		
		
		
		
		41:
			SC_OvlServoPojazdu.StepName:= '41 - Homing,spustenie';
			SC_OvlServoPojazdu.IdleTime.PT:= T#3s;
			SC_OvlServoPojazdu.AlarmTime.PT:= T#3s;
		
			IF NOT SC_OvlServoPojazdu.Switch1 THEN
				Motion[1].cmd.home:= TRUE;
				Stol_Manipulator_PrebiehaHoming:= TRUE;
				SC_OvlServoPojazdu.Switch1:= TRUE;
			END_IF
		
			IF Motion[1].state.Homing THEN
				SC_OvlServoPojazdu.ResetStep:= TRUE;
				SC_OvlServoPojazdu.Step:= 42;
			END_IF
		
		42:
			SC_OvlServoPojazdu.StepName:= '42 - Homing,ukoncenie';
			SC_OvlServoPojazdu.IdleTime.PT:= T#500ms;
			SC_OvlServoPojazdu.AlarmTime.PT:= T#3s;
		
			IF Motion[1].status.DriveStatus.HomingOk THEN
				SC_OvlServoPojazdu.ResetStep:= TRUE;
				SC_OvlServoPojazdu.Step:= 0;
			END_IF
			
		
		
		
		
	
	END_CASE
	
	
	
END_ACTION
