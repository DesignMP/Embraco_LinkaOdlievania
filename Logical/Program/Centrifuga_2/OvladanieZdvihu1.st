
ACTION OvladanieZdvihu1: 

	//Prepocet zdvihu centrifugy//
	KonstantaZdvih1_MM:= 10;//10mm
	KonstantaZdvih1_Servo:= 1000; //poèet jednotiek na zdvih 10 mm
	
	IF Centrifuga2_Manual THEN
		Centrifuga2_Zdvih1_RychlJog_MM_s:= TP_Centrifuga2_RychlostZdvihJogg;
	END_IF	
	Centrifuga2_Zdvih1_RychlPol_MM_s:= TP_Centrifuga2_Zdvih_RychlZdvihu;
	Centrifuga2_Zdvih1_RychlMom_MM_s:= TP_Centrifuga2_Zdvih_RychlPritl;
	Centrifuga2_Zdvih1_MomentPritlak:= TP_Centrifuga2_Zdvih_MomentPritl;
	Centrifuga2_Zdvih1_RychlPolohov:= (Centrifuga2_Zdvih1_RychlPol_MM_s / KonstantaZdvih1_MM) * KonstantaZdvih1_Servo;
	Centrifuga2_Zdvih1_RychlJogg:= (Centrifuga2_Zdvih1_RychlJog_MM_s / KonstantaZdvih1_MM) * KonstantaZdvih1_Servo;
	Centrifuga2_Zdvih1_RychlMoment:= (Centrifuga2_Zdvih1_RychlMom_MM_s / KonstantaZdvih1_MM) * KonstantaZdvih1_Servo;
	
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_OvlZdvihuVR1);
	
	Centrifuga2_VR1_NamVyskaBalika;
	Centrifuga2_VR2_NamVyskaBalika;
	
	
	CASE SC_OvlZdvihuVR1.Step OF
		
		0:
			SC_OvlZdvihuVR1.StepName:= '0 - Nulovanie';
			ZdvihVR1_JoggHORE:= FALSE;
			ZdvihVR1_JoggDOLE:= FALSE;
			ZdvihVR1_Polohuj:= FALSE;
			Centrifuga2_Zdvih1_HOME:= FALSE;
			ZdvihVR1_MoveMoment:= FALSE;
			ZdvihVR1_Stop:= FALSE;
			Motion[6].cmd.home:= FALSE;
			Motion[6].cmd.moveAbsolute:= FALSE;
			Motion[6].cmd.moveJogNeg:= FALSE;
			Motion[6].cmd.moveJogPos:= FALSE;
			Motion[6].cmd.moveVelocity:= FALSE;
			Motion[6].cmd.moveTorqueControl:= FALSE;
			Centrifuga2_Zdvih1_PrebHoming:= FALSE;
			IF NOT SC_OvlZdvihuVR1.Switch1 AND Motion[6].status.DriveStatus.HomingOk THEN
				Motion[6].cmd.halt:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
			IF SC_Centrifuga2.Step <> 0 THEN
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
			ELSIF Centrifuga2_Zdvih1_HOME THEN
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
			
			Motion[6].par.velocityJog:= Centrifuga2_Zdvih1_RychlJogg;
			Motion[6].par.acc := (Centrifuga2_Zdvih1_RychlJogg*2); //0,5s
			Motion[6].par.dec := (Centrifuga2_Zdvih1_RychlJogg*10); //0,5s
			
		
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[6].cmd.moveJogPos:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
		
			IF NOT ZdvihVR1_JoggHORE OR Centrifuga2_Zdvih1_AktualPozMM >= 165 THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
			END_IF
		
		
		20:
			SC_OvlZdvihuVR1.StepName:= '20 - Jogging DOLE';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
			
			Motion[6].par.velocityJog:= Centrifuga2_Zdvih1_RychlJogg;
			Motion[6].par.acc := (Centrifuga2_Zdvih1_RychlJogg*2); //0,5s
			Motion[6].par.dec := (Centrifuga2_Zdvih1_RychlJogg*10); //0,5s
			
		
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[6].cmd.moveJogNeg:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
		
			IF NOT ZdvihVR1_JoggDOLE OR Centrifuga2_Zdvih1_AktualPozMM <= 2 THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
			END_IF
		
		
		
		30:
			SC_OvlZdvihuVR1.StepName:= '30 - Start polohovania zdvihu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			Motion[6].par.velocity:= Centrifuga2_Zdvih1_RychlPolohov;
			Motion[6].par.acc := (Centrifuga2_Zdvih1_RychlPolohov *5); //1s
			Motion[6].par.dec := (Centrifuga2_Zdvih1_RychlPolohov *5); //1s
			Motion[6].par.position:= (Centrifuga2_Zdvih1_ZadanaPozMM * 100);
		
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[6].cmd.moveAbsolute:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
		
			IF Motion[6].state.DiscreteMotion OR (Centrifuga2_Zdvih1_AktualPozMM = Centrifuga2_Zdvih1_ZadanaPozMM) THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 31;
			END_IF
		
		31:
			
			SC_OvlZdvihuVR1.StepName:= '31 - Ukoncenie polohovanie zdvihu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			IF (Centrifuga2_Zdvih1_AktualPozMM = Centrifuga2_Zdvih1_ZadanaPozMM) AND Motion[6].state.StandStill THEN
				Centrifuga2_Zdvih1_VPOZICI:= TRUE;
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
			END_IF
		
	
	
		
		40:
			SC_OvlZdvihuVR1.StepName:= '40 - Start homingu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[6].cmd.home:= TRUE;
				Centrifuga2_Zdvih1_PrebHoming:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
		
			IF Motion[6].state.Homing THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 41;
			END_IF
		
		41:
			SC_OvlZdvihuVR1.StepName:= '41 - Ukoncenie homingu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			IF Motion[6].status.DriveStatus.HomingOk THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
			END_IF
		
		
		50:
			SC_OvlZdvihuVR1.StepName:= '50 - Spustenie moment pohybu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			Motion[6].par.velocity:= Centrifuga2_Zdvih1_RychlPolohov;
			Motion[6].par.acc := (Centrifuga2_Zdvih1_RychlPolohov *15); //1s
			Motion[6].par.dec := (Centrifuga2_Zdvih1_RychlPolohov *20); //1s
			Motion[6].par.direction:= 0;   //0 - v smere; 1 - v protismere  
			
			
					
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[6].cmd.moveVelocity:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
			
			
			IF Centrifuga2_Zdvih1_AktualPozMM >= 60 THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 51;
			END_IF
	
		
		51:
			SC_OvlZdvihuVR1.StepName:= '51 - Spomalenie moment pohybu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			Motion[6].par.velocity:= Centrifuga2_Zdvih1_RychlMoment;
			Motion[6].par.acc := (Centrifuga2_Zdvih1_RychlMoment *20); //1s
			Motion[6].par.dec := (Centrifuga2_Zdvih1_RychlMoment *10); //1s
			Motion[6].par.direction:= 0;   //0 - v smere; 1 - v protismere  
			Motion[6].par.torque:= Centrifuga2_Zdvih1_MomentPritlak;
			
					
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[6].cmd.moveTorqueControl:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
			
			
			IF Motion[6].status.ActTorque >= Centrifuga2_Zdvih1_MomentPritlak THEN
				Motion[6].cmd.halt:= TRUE;
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 52;
			ELSIF Centrifuga2_Zdvih1_AktualPozMM >= 179 THEN
				Motion[6].cmd.halt:= TRUE;
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 52;	
			END_IF
		
		
		
		
		
		52:
			SC_OvlZdvihuVR1.StepName:= '52 - Ukoncenie moment pohybu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#3s;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			IF Motion[6].state.StandStill THEN
				Centrifuga2_Zdvih1_VPOZICI:= TRUE;
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
			END_IF	
		
		
		
		
		60:
			SC_OvlZdvihuVR1.StepName:= '60 - Zastavenie pohybu';
			SC_OvlZdvihuVR1.IdleTime.PT:= T#500ms;
			SC_OvlZdvihuVR1.AlarmTime.PT:= T#3s;
		
			IF NOT SC_OvlZdvihuVR1.Switch1 THEN
				Motion[6].cmd.halt:= TRUE;
				SC_OvlZdvihuVR1.IdleTime.IN:= TRUE;
				SC_OvlZdvihuVR1.Switch1:= TRUE;
			END_IF
		
			IF Motion[6].state.StandStill AND SC_OvlZdvihuVR1.IdleTime.Q THEN
				SC_OvlZdvihuVR1.ResetStep:= TRUE;
				SC_OvlZdvihuVR1.Step:= 0;
			END_IF
		
	
	
	END_CASE
	
	
	
	
	
	
END_ACTION
