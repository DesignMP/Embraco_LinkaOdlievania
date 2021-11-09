
ACTION OvladanieZdvihu1: 

	//Prepocet zdvihu centrifugy//
	KonstantaZdvih1_MM:= 10;//10mm
	KonstantaZdvih1_Servo:= 1000; //poèet jednotiek na zdvih 10 mm
	
	IF Centrifuga1_Manual THEN
		Centrifuga1_Zdvih1_RychlJog_MM_s:= TP_Centrifuga1_RychlostZdvihJogg;
	END_IF	
	Centrifuga1_Zdvih1_RychlPol_MM_s:= TP_Centrifuga1_Zdvih_RychlZdvihu;
	Centrifuga1_Zdvih1_RychlMom_MM_s:= TP_Centrifuga1_Zdvih_RychlPritl;
	Centrifuga1_Zdvih1_MomentPritlak:= TP_Centrifuga1_Zdvih_MomentPritl;
	Centrifuga1_Zdvih1_RychlPolohov:= (Centrifuga1_Zdvih1_RychlPol_MM_s / KonstantaZdvih1_MM) * KonstantaZdvih1_Servo;
	Centrifuga1_Zdvih1_RychlJogg:= (Centrifuga1_Zdvih1_RychlJog_MM_s / KonstantaZdvih1_MM) * KonstantaZdvih1_Servo;
	Centrifuga1_Zdvih1_RychlMoment:= (Centrifuga1_Zdvih1_RychlMom_MM_s / KonstantaZdvih1_MM) * KonstantaZdvih1_Servo;
	
	
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_OvlZdvihuVR1);
	
	
	CASE SC_OvlZdvihuVR1.Step OF
		
		0:
			SC_OvlZdvihuVR1.StepName:= '0 - Nulovanie';
			ZdvihVR1_JoggHORE:= FALSE;
			ZdvihVR1_JoggDOLE:= FALSE;
			ZdvihVR1_Polohuj:= FALSE;
			Centrifuga1_Zdvih1_HOME:= FALSE;
			ZdvihVR1_MoveMoment:= FALSE;
			ZdvihVR1_Stop:= FALSE;
			Motion[3].cmd.home:= FALSE;
			Motion[3].cmd.moveAbsolute:= FALSE;
			Motion[3].cmd.moveVelocity:= FALSE;
			Motion[3].cmd.moveJogNeg:= FALSE;
			Motion[3].cmd.moveJogPos:= FALSE;
			Motion[3].cmd.moveTorqueControl:= FALSE;
			Centrifuga1_Zdvih1_PrebHoming:= FALSE;
			IF NOT SC_OvlZdvihuVR1.Switch1 AND Motion[3].status.DriveStatus.HomingOk THEN
				Motion[3].cmd.halt:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
			IF SC_Centrifuga1.Step <> 0 THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 1;
			END_IF	
	
	
		1:
			SC_OvlZdvihuVR1.StepName:= '1 - Rozhodnutie o cinnosti';
			IF ZdvihVR1_JoggHORE THEN
				SC_OvlZdvihuVR1.Step:= 10;
			ELSIF ZdvihVR1_JoggDOLE THEN
				SC_OvlZdvihuVR1.Step:= 20;
			ELSIF ZdvihVR1_Polohuj THEN
				SC_OvlZdvihuVR1.Step:= 30;
			ELSIF Centrifuga1_Zdvih1_HOME THEN
				SC_OvlZdvihuVR1.Step:= 40;
			ELSIF ZdvihVR1_MoveMoment THEN
				SC_OvlZdvihuVR1.Step:= 50;
			ELSIF ZdvihVR1_Stop THEN
				SC_OvlZdvihuVR1.Step:= 60;
			END_IF
		
		
		10:
			SC_OvlZdvihuVR1.StepName:= '10 - Jogging HORE';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
			
			Motion[3].par.velocityJog:= Centrifuga1_Zdvih1_RychlJogg;
			Motion[3].par.acc := (Centrifuga1_Zdvih1_RychlJogg*2); //0,5s
			Motion[3].par.dec := (Centrifuga1_Zdvih1_RychlJogg*10); //0,5s
			
		
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[3].cmd.moveJogPos:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
		
			IF NOT ZdvihVR1_JoggHORE OR Centrifuga1_Zdvih1_AktualPozMM >= 165 THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
			END_IF
		
		
		20:
			SC_OvlZdvihuVR1.StepName:= '20 - Jogging DOLE';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
			
			Motion[3].par.velocityJog:= Centrifuga1_Zdvih1_RychlJogg;
			Motion[3].par.acc := (Centrifuga1_Zdvih1_RychlJogg*2); //0,5s
			Motion[3].par.dec := (Centrifuga1_Zdvih1_RychlJogg*10); //0,5s
			
		
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[3].cmd.moveJogNeg:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
		
			IF NOT ZdvihVR1_JoggDOLE OR Centrifuga1_Zdvih1_AktualPozMM <= 2 THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
			END_IF
		
		
		
		30:
			SC_OvlZdvihuVR1.StepName:= '30 - Start polohovania zdvihu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			Motion[3].par.velocity:= Centrifuga1_Zdvih1_RychlPolohov;
			Motion[3].par.acc := (Centrifuga1_Zdvih1_RychlPolohov *5); //1s
			Motion[3].par.dec := (Centrifuga1_Zdvih1_RychlPolohov *5); //1s
			Motion[3].par.position:= (Centrifuga1_Zdvih1_ZadanaPozMM * 100);
		
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[3].cmd.moveAbsolute:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
		
			IF Motion[3].state.DiscreteMotion OR (Centrifuga1_Zdvih1_AktualPozMM = Centrifuga1_Zdvih1_ZadanaPozMM) THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 31;
			END_IF
		
		31:
			
			SC_OvlZdvihuVR1.StepName:= '31 - Ukoncenie polohovanie zdvihu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			IF (Centrifuga1_Zdvih1_AktualPozMM = Centrifuga1_Zdvih1_ZadanaPozMM) AND Motion[3].state.StandStill THEN
				Centrifuga1_Zdvih1_VPOZICI:= TRUE;
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
			END_IF
		
	
	
		
		40:
			SC_OvlZdvihuVR1.StepName:= '40 - Start homingu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[3].cmd.home:= TRUE;
				Centrifuga1_Zdvih1_PrebHoming:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
		
			IF Motion[3].state.Homing THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 41;
			END_IF
		
		41:
			SC_OvlZdvihuVR1.StepName:= '41 - Ukoncenie homingu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			IF Motion[3].status.DriveStatus.HomingOk THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
			END_IF
		
		
		50:
			SC_OvlZdvihuVR1.StepName:= '50 - Spustenie moment pohybu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			Motion[3].par.velocity:= Centrifuga1_Zdvih1_RychlPolohov;
			Motion[3].par.acc := (Centrifuga1_Zdvih1_RychlPolohov *15); //1s
			Motion[3].par.dec := (Centrifuga1_Zdvih1_RychlPolohov *20); //1s
			Motion[3].par.direction:= 0;   //0 - v smere; 1 - v protismere  
			
			
					
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[3].cmd.moveVelocity:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
			
			
			IF Centrifuga1_Zdvih1_AktualPozMM >= 60 THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 51;
			END_IF
		
		
		51:
			SC_OvlZdvihuVR1.StepName:= '51 - Spomalenie moment pohybu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			Motion[3].par.velocity:= Centrifuga1_Zdvih1_RychlMoment;
			Motion[3].par.acc := (Centrifuga1_Zdvih1_RychlMoment *20); //1s
			Motion[3].par.dec := (Centrifuga1_Zdvih1_RychlMoment *10); //1s
			Motion[3].par.direction:= 0;   //0 - v smere; 1 - v protismere  
			Motion[3].par.torque:= Centrifuga1_Zdvih1_MomentPritlak;
			
					
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[3].cmd.moveTorqueControl:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
			
			
			IF Motion[3].status.ActTorque >= Centrifuga1_Zdvih1_MomentPritlak THEN
				Motion[3].cmd.halt:= TRUE;
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 52;
			ELSIF Centrifuga1_Zdvih1_AktualPozMM >= 179 THEN
				Motion[3].cmd.halt:= TRUE;
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 52;
			END_IF
		
		
		
		
		
		
		52:
			SC_OvlZdvihuVR1.StepName:= '52 - Ukoncenie moment pohybu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			IF Motion[3].state.StandStill THEN
				Centrifuga1_Zdvih1_VPOZICI:= TRUE;
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
			END_IF
			
		
		
		
		
		60:
			SC_OvlZdvihuVR1.StepName:= '60 - Zastavenie pohybu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#500ms;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[3].cmd.halt:= TRUE;
				SC_OvlZdvihuVR1.IdleTime.IN:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
		
			IF Motion[3].state.StandStill AND SC_OvlZdvihuVR1.IdleTime.Q THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
			END_IF
		
	
	
	END_CASE
	
	
END_ACTION
