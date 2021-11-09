
ACTION OvladanieZdvihu2: 

	
	//Prepocet zdvihu centrifugy//
	KonstantaZdvih2_MM:= 10;//10mm
	KonstantaZdvih2_Servo:= 1000; //poèet jednotiek na zdvih 10 mm
	
	IF Centrifuga1_Manual THEN
		Centrifuga1_Zdvih2_RychlJog_MM_s:= TP_Centrifuga1_RychlostZdvihJogg;
	END_IF	
	Centrifuga1_Zdvih2_RychlPol_MM_s:= TP_Centrifuga1_Zdvih_RychlZdvihu;
	Centrifuga1_Zdvih2_RychlMom_MM_s:= TP_Centrifuga1_Zdvih_RychlPritl;
	Centrifuga1_Zdvih2_MomentPritlak:= TP_Centrifuga1_Zdvih_MomentPritl;
	Centrifuga1_Zdvih2_RychlPolohov:= (Centrifuga1_Zdvih2_RychlPol_MM_s / KonstantaZdvih2_MM) * KonstantaZdvih2_Servo;
	Centrifuga1_Zdvih2_RychlJogg:= (Centrifuga1_Zdvih2_RychlJog_MM_s / KonstantaZdvih2_MM) * KonstantaZdvih2_Servo;
	Centrifuga1_Zdvih2_RychlMoment:= (Centrifuga1_Zdvih2_RychlMom_MM_s / KonstantaZdvih2_MM) * KonstantaZdvih2_Servo;
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_OvlZdvihuVR2);
	
	
	CASE SC_OvlZdvihuVR2.Step OF
		
		0:
			SC_OvlZdvihuVR2.StepName:= '0 - Nulovanie';
			ZdvihVR2_JoggHORE:= FALSE;
			ZdvihVR2_JoggDOLE:= FALSE;
			ZdvihVR2_Polohuj:= FALSE;
			Centrifuga1_Zdvih2_HOME:= FALSE;
			ZdvihVR2_MoveMoment:= FALSE;
			ZdvihVR2_Stop:= FALSE;
			Motion[4].cmd.home:= FALSE;
			Motion[4].cmd.moveAbsolute:= FALSE;
			Motion[4].cmd.moveVelocity:= FALSE;
			Motion[4].cmd.moveJogNeg:= FALSE;
			Motion[4].cmd.moveJogPos:= FALSE;
			Motion[4].cmd.moveTorqueControl:= FALSE;
			Centrifuga1_Zdvih2_PrebHoming:= FALSE;
			IF NOT SC_OvlZdvihuVR2.Switch1 AND Motion[4].status.DriveStatus.HomingOk THEN
				Motion[4].cmd.halt:= TRUE;
				SC_OvlZdvihuVR2.Switch1:= TRUE;
			END_IF
			IF SC_Centrifuga1.Step <> 0 THEN
				SC_OvlZdvihuVR2.ResetStep:= TRUE;
				SC_OvlZdvihuVR2.Step:= 1;
			END_IF	
	
	
		1:
			SC_OvlZdvihuVR2.StepName:= '1 - Rozhodnutie o cinnosti';
			IF ZdvihVR2_JoggHORE THEN
				SC_OvlZdvihuVR2.Step:= 10;
			ELSIF ZdvihVR2_JoggDOLE THEN
				SC_OvlZdvihuVR2.Step:= 20;
			ELSIF ZdvihVR2_Polohuj THEN
				SC_OvlZdvihuVR2.Step:= 30;
			ELSIF Centrifuga1_Zdvih2_HOME THEN
				SC_OvlZdvihuVR2.Step:= 40;
			ELSIF ZdvihVR2_MoveMoment THEN
				SC_OvlZdvihuVR2.Step:= 50;
			ELSIF ZdvihVR2_Stop THEN
				SC_OvlZdvihuVR2.Step:= 60;
			END_IF
		
		
		10:
			SC_OvlZdvihuVR2.StepName:= '10 - Jogging HORE';
			SC_OvlZdvihuVR2.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR2.AlarmTime.PT:= T#3s;
			
			Motion[4].par.velocityJog:= Centrifuga1_Zdvih2_RychlJogg;
			Motion[4].par.acc := (Centrifuga1_Zdvih2_RychlJogg *2); //0,5s
			Motion[4].par.dec := (Centrifuga1_Zdvih2_RychlJogg *10); //0,5s
			
		
			IF NOT SC_OvlZdvihuVR2.Switch1 THEN
				Motion[4].cmd.moveJogPos:= TRUE;
				SC_OvlZdvihuVR2.Switch1:= TRUE;
			END_IF
		
			IF NOT ZdvihVR2_JoggHORE OR Centrifuga1_Zdvih2_AktualPozMM >= 165 THEN
				SC_OvlZdvihuVR2.ResetStep:= TRUE;
				SC_OvlZdvihuVR2.Step:= 0;
			END_IF
		
		
		20:
			SC_OvlZdvihuVR2.StepName:= '20 - Jogging DOLE';
			SC_OvlZdvihuVR2.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR2.AlarmTime.PT:= T#3s;
			
			Motion[4].par.velocityJog:= Centrifuga1_Zdvih2_RychlJogg;
			Motion[4].par.acc := (Centrifuga1_Zdvih2_RychlJogg *2); //0,5s
			Motion[4].par.dec := (Centrifuga1_Zdvih2_RychlJogg *10); //0,5s
			
		
			IF NOT SC_OvlZdvihuVR2.Switch1 THEN
				Motion[4].cmd.moveJogNeg:= TRUE;
				SC_OvlZdvihuVR2.Switch1:= TRUE;
			END_IF
		
			IF NOT ZdvihVR2_JoggDOLE OR Centrifuga1_Zdvih2_AktualPozMM <= 2 THEN
				SC_OvlZdvihuVR2.ResetStep:= TRUE;
				SC_OvlZdvihuVR2.Step:= 0;
			END_IF
		
		
		
		30:
			SC_OvlZdvihuVR2.StepName:= '30 - Start polohovania zdvihu';
			SC_OvlZdvihuVR2.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR2.AlarmTime.PT:= T#3s;
		
			Motion[4].par.velocity:= Centrifuga1_Zdvih2_RychlPolohov;
			Motion[4].par.acc := (Centrifuga1_Zdvih2_RychlPolohov *5); //1s
			Motion[4].par.dec := (Centrifuga1_Zdvih2_RychlPolohov *5); //1s
			Motion[4].par.position:= (Centrifuga1_Zdvih2_ZadanaPozMM * 100);
		
			IF NOT SC_OvlZdvihuVR2.Switch1 THEN
				Motion[4].cmd.moveAbsolute:= TRUE;
				SC_OvlZdvihuVR2.Switch1:= TRUE;
			END_IF
		
			IF Motion[4].state.DiscreteMotion OR (Centrifuga1_Zdvih2_AktualPozMM = Centrifuga1_Zdvih2_ZadanaPozMM) THEN
				SC_OvlZdvihuVR2.ResetStep:= TRUE;
				SC_OvlZdvihuVR2.Step:= 31;
			END_IF
		
		31:
			
			SC_OvlZdvihuVR2.StepName:= '31 - Ukoncenie polohovanie zdvihu';
			SC_OvlZdvihuVR2.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR2.AlarmTime.PT:= T#3s;
		
			IF (Centrifuga1_Zdvih2_AktualPozMM = Centrifuga1_Zdvih2_ZadanaPozMM) AND  Motion[4].state.StandStill THEN
				Centrifuga1_Zdvih2_VPOZICI:= TRUE;
				SC_OvlZdvihuVR2.ResetStep:= TRUE;
				SC_OvlZdvihuVR2.Step:= 0;
			END_IF
		
	
	
		
		40:
			SC_OvlZdvihuVR2.StepName:= '40 - Start homingu';
			SC_OvlZdvihuVR2.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR2.AlarmTime.PT:= T#3s;
		
			IF NOT SC_OvlZdvihuVR2.Switch1 THEN
				Motion[4].cmd.home:= TRUE;
				Centrifuga1_Zdvih2_PrebHoming:= TRUE;
				SC_OvlZdvihuVR2.Switch1:= TRUE;
			END_IF
		
			IF Motion[4].state.Homing THEN
				SC_OvlZdvihuVR2.ResetStep:= TRUE;
				SC_OvlZdvihuVR2.Step:= 41;
			END_IF
		
		41:
			SC_OvlZdvihuVR2.StepName:= '41 - Ukoncenie homingu';
			SC_OvlZdvihuVR2.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR2.AlarmTime.PT:= T#3s;
		
			IF Motion[4].status.DriveStatus.HomingOk THEN
				SC_OvlZdvihuVR2.ResetStep:= TRUE;
				SC_OvlZdvihuVR2.Step:= 0;
			END_IF
		
		
		
		50:
			SC_OvlZdvihuVR2.StepName:= '50 - Spustenie moment pohybu';
			SC_OvlZdvihuVR2.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR2.AlarmTime.PT:= T#3s;
		
			Motion[4].par.velocity:= Centrifuga1_Zdvih2_RychlPolohov;
			Motion[4].par.acc := (Centrifuga1_Zdvih2_RychlPolohov *15); //1s
			Motion[4].par.dec := (Centrifuga1_Zdvih2_RychlPolohov *20); //1s
			Motion[4].par.direction:= 0;   //0 - v smere; 1 - v protismere  
			
			
					
			IF NOT SC_OvlZdvihuVR2.Switch1 THEN
				Motion[4].cmd.moveVelocity:= TRUE;
				SC_OvlZdvihuVR2.Switch1:= TRUE;
			END_IF
			
			
			IF Centrifuga1_Zdvih2_AktualPozMM >= 60 THEN
				SC_OvlZdvihuVR2.ResetStep:= TRUE;
				SC_OvlZdvihuVR2.Step:= 51;
			END_IF
		
		
		51:
			SC_OvlZdvihuVR2.StepName:= '51 - Spomalenie moment pohybu';
			SC_OvlZdvihuVR2.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR2.AlarmTime.PT:= T#3s;
		
			Motion[4].par.velocity:= Centrifuga1_Zdvih2_RychlMoment;
			Motion[4].par.acc := (Centrifuga1_Zdvih2_RychlMoment *20); //1s
			Motion[4].par.dec := (Centrifuga1_Zdvih2_RychlMoment *10); //1s
			Motion[4].par.direction:= 0;   //0 - v smere; 1 - v protismere  
			Motion[4].par.torque:= Centrifuga1_Zdvih2_MomentPritlak;
			
					
			IF NOT SC_OvlZdvihuVR2.Switch1 THEN
				Motion[4].cmd.moveTorqueControl:= TRUE;
				SC_OvlZdvihuVR2.Switch1:= TRUE;
			END_IF
			
			
			IF Motion[4].status.ActTorque >= Centrifuga1_Zdvih2_MomentPritlak THEN
				Motion[4].cmd.halt:= TRUE;
				SC_OvlZdvihuVR2.ResetStep:= TRUE;
				SC_OvlZdvihuVR2.Step:= 52;
			ELSIF Centrifuga1_Zdvih2_AktualPozMM >= 179 THEN
				Motion[4].cmd.halt:= TRUE;
				SC_OvlZdvihuVR2.ResetStep:= TRUE;
				SC_OvlZdvihuVR2.Step:= 52;
			END_IF
		
		
		52:
			SC_OvlZdvihuVR2.StepName:= '52 - Ukoncenie moment pohybu';
			SC_OvlZdvihuVR2.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR2.AlarmTime.PT:= T#3s;
		
			IF Motion[4].state.StandStill THEN
				Centrifuga1_Zdvih2_VPOZICI:= TRUE;
				SC_OvlZdvihuVR2.ResetStep:= TRUE;
				SC_OvlZdvihuVR2.Step:= 0;
			END_IF
		
		
		
		
		
		60:
			SC_OvlZdvihuVR2.StepName:= '60 - Zastavenie pohybu';
			SC_OvlZdvihuVR2.IdleTime.PT:= T#500ms;
			SC_OvlZdvihuVR2.AlarmTime.PT:= T#3s;
		
			IF NOT SC_OvlZdvihuVR2.Switch1 THEN
				Motion[4].cmd.halt:= TRUE;
				SC_OvlZdvihuVR2.IdleTime.IN:= TRUE;
				SC_OvlZdvihuVR2.Switch1:= TRUE;
			END_IF
		
			IF Motion[4].state.StandStill AND SC_OvlZdvihuVR2.IdleTime.Q THEN
				SC_OvlZdvihuVR2.ResetStep:= TRUE;
				SC_OvlZdvihuVR2.Step:= 0;
			END_IF
		
	
	
	END_CASE
	
	
	
	
	
END_ACTION
