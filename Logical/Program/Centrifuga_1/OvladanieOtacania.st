
ACTION OvladanieOtacania: 

	//Prepoèet otáèok centrifugy//
	OtacanieKonstOtMin:= 800;
	OtacanieKonstServo:=48000;
	
	Centrifuga1_Otacanie_RychlJogg:= TP_Centrifuga1_RychlOtacaniaJogg;
	Centrifuga1_Otac_PracovRychlost:= ZvolRychlostOtacaniaPriOdlievani;
	Centrifuga1_Otac_StartRychlost:= TP_Centrifuga1_OtackyNalievania;
		
	OtacanieRychlostServoJogg:= (Centrifuga1_Otacanie_RychlJogg / OtacanieKonstOtMin) * OtacanieKonstServo;
	Centrifuga1_Otac_AktualneOtacMin:= (Motion[2].status.ActVelocity/OtacanieKonstServo) * OtacanieKonstOtMin;
	
	

	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_OvlOtacania);
	
	
	CASE SC_OvlOtacania.Step OF
		
		0:
			SC_OvlOtacania.StepName:= '0 - Nulovanie';
			Otacania_JoggVPRED:= FALSE;
			Otacanie_JoggVZAD:= FALSE;
			Otacanie_Polohuj:= FALSE;
			Centrifuga1_Otacanie_HOME_Senzor:= FALSE;
			Centrifuga1_Otacanie_HOME_Direct:= FALSE;
			Otacanie_MoveVelocity:= FALSE;
			Otacanie_Stop:= FALSE;
			Motion[2].cmd.home:= FALSE;
			Motion[2].cmd.moveAbsolute:= FALSE;
			Motion[2].cmd.moveJogNeg:= FALSE;
			Motion[2].cmd.moveJogPos:= FALSE;
			Motion[2].cmd.moveVelocity:= FALSE;
			Centrifuga1_Otacanie_PrebHoming:= FALSE;
			IF NOT SC_OvlOtacania.Switch1 AND Motion[2].status.DriveStatus.HomingOk THEN
				Motion[2].cmd.halt:= TRUE;
				SC_OvlOtacania.Switch1:= TRUE;
			END_IF
			IF SC_Centrifuga1.Step <> 0 THEN
				SC_OvlOtacania.ResetStep:= TRUE;
				SC_OvlOtacania.Step:= 1;
			END_IF	
	
		1:
			SC_OvlOtacania.StepName:= '1 - Rozhodnutie o cinnosti';
			IF Otacania_JoggVPRED THEN
				SC_OvlOtacania.Step:= 10;
			ELSIF Otacanie_JoggVZAD THEN
				SC_OvlOtacania.Step:= 20;
			ELSIF Otacanie_Polohuj THEN
				SC_OvlOtacania.Step:= 30;
			ELSIF Centrifuga1_Otacanie_HOME_Senzor THEN
				SC_OvlOtacania.Step:= 40;
			ELSIF Centrifuga1_Otacanie_HOME_Direct THEN
				SC_OvlOtacania.Step:= 50;
			ELSIF Otacanie_MoveVelocity THEN
				SC_OvlOtacania.Step:= 60;
			ELSIF Otacanie_Stop THEN
				SC_OvlOtacania.Step:= 70;
			END_IF
		
		
		10:
			SC_OvlOtacania.StepName:= '10 - Jogging VPRED';
			SC_OvlOtacania.IdleTime.PT:= T#3s;
			SC_OvlOtacania.AlarmTime.PT:= T#3s;
			
			Motion[2].par.velocityJog:= OtacanieRychlostServoJogg;
			Motion[2].par.acc := (OtacanieRychlostServoJogg*1); //1s
			Motion[2].par.dec := (OtacanieRychlostServoJogg*10); //1s
			
		
			IF NOT SC_OvlOtacania.Switch1 THEN
				Motion[2].cmd.moveJogPos:= TRUE;
				SC_OvlOtacania.Switch1:= TRUE;
			END_IF
		
			IF NOT Otacania_JoggVPRED THEN
				SC_OvlOtacania.ResetStep:= TRUE;
				SC_OvlOtacania.Step:= 0;
			END_IF
		
		20:
			SC_OvlOtacania.StepName:= '20 - Jogging VZAD';
			SC_OvlOtacania.IdleTime.PT:= T#3s;
			SC_OvlOtacania.AlarmTime.PT:= T#3s;
			
			Motion[2].par.velocityJog:= OtacanieRychlostServoJogg;
			Motion[2].par.acc := (OtacanieRychlostServoJogg*1); //1s
			Motion[2].par.dec := (OtacanieRychlostServoJogg*10); //1s
			
		
			IF NOT SC_OvlOtacania.Switch1 THEN
				Motion[2].cmd.moveJogNeg:= TRUE;
				SC_OvlOtacania.Switch1:= TRUE;
			END_IF
		
			IF NOT Otacanie_JoggVZAD THEN
				SC_OvlOtacania.ResetStep:= TRUE;
				SC_OvlOtacania.Step:= 0;
			END_IF
		
		30:
			SC_OvlOtacania.StepName:= '30 - Start polohovania otacania';
			SC_OvlOtacania.IdleTime.PT:= T#3s;
			SC_OvlOtacania.AlarmTime.PT:= T#3s;
		
			OtacanieRychlostServo:= (Centrifuga1_Otac_PracovRychlost / OtacanieKonstOtMin) * OtacanieKonstServo;
			Motion[2].par.velocity:= OtacanieRychlostServo;
			Motion[2].par.acc := (OtacanieRychlostServo /3);  //3s
			Motion[2].par.dec := (OtacanieRychlostServo /3);  //3s
			Motion[2].par.position:= (Centrifuga1_Otacanie_PocetOtacok * 3600);
		
			IF NOT SC_OvlOtacania.Switch1 THEN
				Motion[2].cmd.moveAbsolute:= TRUE;
				SC_OvlOtacania.Switch1:= TRUE;
			END_IF
		
			IF Motion[2].state.DiscreteMotion OR (Motion[2].status.ActPosition = Motion[2].par.position) THEN
				SC_OvlOtacania.ResetStep:= TRUE;
				SC_OvlOtacania.Step:= 31;
			END_IF
		
		31:
			
			SC_OvlOtacania.StepName:= '31 - Ukoncenie polohovanie otacania';
			SC_OvlOtacania.IdleTime.PT:= T#3s;
			SC_OvlOtacania.AlarmTime.PT:= T#3s;
		
			IF (Motion[2].status.ActPosition = Motion[2].par.position) AND Motion[2].state.StandStill THEN
				Centrifuga1_OtacanieVPOZICI:= TRUE;
				SC_OvlOtacania.ResetStep:= TRUE;
				SC_OvlOtacania.Step:= 0;
			END_IF
		
		40:
			SC_OvlOtacania.StepName:= '40 - Start homingu na snimac';
			SC_OvlOtacania.IdleTime.PT:= T#3s;
			SC_OvlOtacania.AlarmTime.PT:= T#3s;
			Motion[2].par.homeMode:= 0; //Homing na snímaè
		
			IF NOT SC_OvlOtacania.Switch1 AND RobotMan_Centrifug1_BezpVzdialen THEN
				Motion[2].cmd.home:= TRUE;
				Centrifuga1_Otacanie_PrebHoming:= TRUE;
				SC_OvlOtacania.Switch1:= TRUE;
			END_IF
		
			IF Motion[2].state.Homing THEN
				SC_OvlOtacania.ResetStep:= TRUE;
				SC_OvlOtacania.Step:= 41;
			END_IF
		
		41:
			SC_OvlOtacania.StepName:= '41 - Ukoncenie homingu';
			SC_OvlOtacania.IdleTime.PT:= T#3s;
			SC_OvlOtacania.AlarmTime.PT:= T#3s;
		
			IF Motion[2].status.DriveStatus.HomingOk THEN
				SC_OvlOtacania.ResetStep:= TRUE;
				SC_OvlOtacania.Step:= 0;
			END_IF
		
		
		
		50:
			SC_OvlOtacania.StepName:= '50 - Start homingu direct';
			SC_OvlOtacania.IdleTime.PT:= T#3s;
			SC_OvlOtacania.AlarmTime.PT:= T#3s;
			Motion[2].par.homeMode:= 1; //Homing direkt
		
			IF NOT SC_OvlOtacania.Switch1 THEN
				Motion[2].cmd.home:= TRUE;
				SC_OvlOtacania.Switch1:= TRUE;
			END_IF
			
			IF Motion[2].status.ActPosition = 0 AND Motion[2].status.DriveStatus.HomingOk THEN
				SC_OvlOtacania.ResetStep:= TRUE;
				SC_OvlOtacania.Step:= 0;
			END_IF
		
		
		
		
		60:
			SC_OvlOtacania.StepName:= '60 - Spustenie velocity pohybu';
			SC_OvlOtacania.IdleTime.PT:= T#3s;
			SC_OvlOtacania.AlarmTime.PT:= T#3s;
		
			Motion[2].par.velocity:= OtacanieRychlostServo;
			IF Centrifuga1_Manual THEN
				Motion[2].par.acc := (OtacanieRychlostServo / 2)  ; //2s
				Motion[2].par.dec := (OtacanieRychlostServo / 2); //2s
			END_IF	
			Motion[2].par.direction:= 0;   //0 - v smere; 1 - v protismere  
			
					
			IF NOT SC_OvlOtacania.Switch1 THEN
				Motion[2].cmd.moveVelocity:= TRUE;
				SC_OvlOtacania.Switch1:= TRUE;
			END_IF
		
			IF NOT Otacanie_MoveVelocity THEN
				SC_OvlOtacania.ResetStep:= TRUE;
				SC_OvlOtacania.Step:= 61;
			END_IF
		
		61:
			SC_OvlOtacania.StepName:= '61 - Zastavenie velocity pohybu';
			SC_OvlOtacania.IdleTime.PT:= T#3s;
			SC_OvlOtacania.AlarmTime.PT:= T#3s;
		
			
			Motion[2].par.velocity:= 0;
			
			IF NOT SC_OvlOtacania.Switch1 THEN
				Motion[2].cmd.moveVelocity:= TRUE;
				SC_OvlOtacania.Switch1:= TRUE;
			END_IF
				
			IF EDGEPOS (Motion[2].status.ActVelocity = 0.0) THEN
				Motion[2].cmd.halt:= TRUE;
			END_IF
		
			IF Motion[2].state.StandStill THEN
				SC_OvlOtacania.ResetStep:= TRUE;
				SC_OvlOtacania.Step:= 0;
			END_IF
				
		70:
			SC_OvlOtacania.StepName:= '70 - Zastavenie pohybu';
			SC_OvlOtacania.IdleTime.PT:= T#500ms;
			SC_OvlOtacania.AlarmTime.PT:= T#3s;
		
			IF NOT SC_OvlOtacania.Switch1 THEN
				Motion[2].cmd.halt:= TRUE;
				SC_OvlOtacania.IdleTime.IN:= TRUE;
				SC_OvlOtacania.Switch1:= TRUE;
			END_IF
		
			IF Motion[2].state.StandStill AND SC_OvlOtacania.IdleTime.Q THEN
				SC_OvlOtacania.ResetStep:= TRUE;
				SC_OvlOtacania.Step:= 0;
			END_IF
		
	
	END_CASE
	
	
END_ACTION
