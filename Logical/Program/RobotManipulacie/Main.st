
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_RobotManipulacie);
	
	
	//Preposielanie výšky balíka do robota//
	RobotMan_VyskaBalika:= REAL_TO_UDINT(ZvolenaVyskaBalika);
	
	
	
	//Reset sekcie //
	IF RobotManipulacie_Reset OR NOT BezpOkruhOplotenia_Aktivovany OR PoruchaRobotManipulacie THEN
		SC_RobotManipulacie.Step:= 0;
	END_IF
	
	
	CASE SC_RobotManipulacie.Step OF 
	
	
		0:
			SC_RobotManipulacie.StepName:='0 - Nulovanie';
			RobotManipulacie_Automat:= FALSE;
			RobotManipulacie_KoniecVyroby:= FALSE;
			RobotManipulacie_KoniecCyklu:= FALSE;
			RobotManipulacie_Manual:= FALSE;
			RobotManipulacie_PoINIT:= FALSE;
			RobotManipulacie_Reset:= FALSE;
			RobotMan_PP_na_Main:= FALSE;
			RobotMan_ResetCS:= FALSE;
			RobotMan_StartProgramu:= FALSE;
			RobotMan_StartProgramuMain:= FALSE;
			RobotMan_ChodDoServisPozicie:= FALSE;
			IF RobotMan_Stav_ProgramRUN AND RobotMan_Stav_RezimAUTOMAT THEN
				RobotMan_StopProgramu:= TRUE;
			ELSE	
				RobotMan_StopProgramu:= FALSE;
			END_IF	
			RobotMan_UkonciVyrobu:= FALSE;
			RobotMan_VypniMotory:= FALSE;
			RobotMan_ZapniMotory:= FALSE;
			RobotManipulacie_Odparkovanie:= FALSE;
		
			IF BezpOkruhOplotenia_Aktivovany AND NOT RobotMan_Stav_ProgramRUN AND NOT PoruchaRobotManipulacie THEN
				RobotMan_StopProgramu:= FALSE;
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 1;
			END_IF
	
	
		1:
			SC_RobotManipulacie.StepName:='1 - Rozhodnutie o cinnosti';
			IF RobotManipulacie_Automat THEN
				SC_RobotManipulacie.Step:= 2;
			ELSIF RobotManipulacie_Odparkovanie THEN
				SC_RobotManipulacie.Step:= 2;
			ELSIF RobotMan_ChodDoServisPozicie THEN
				SC_RobotManipulacie.Step:= 2;
			ELSIF RobotManipulacie_Manual THEN
				SC_RobotManipulacie.Step:= 700;
			END_IF
		
		
			//********************************************************Inicializácia****************************************************************************//
	
		2:
			SC_RobotManipulacie.StepName:='2 - Inicializacia - cakanie na spustenie';
			SC_RobotManipulacie.IdleTime.PT:= T#500ms;
			SC_RobotManipulacie.AlarmTime.PT:= T#5s;
			RobotManipulacie_Automat:= TRUE;
			
			IF RobotMan_Stav_RezimAUTOMAT THEN
				SC_RobotManipulacie.IdleTime.IN:= TRUE;
			ELSE
				SC_RobotManipulacie.IdleTime.IN:= FALSE;
			END_IF	
				
			IF SC_RobotManipulacie.IdleTime.Q THEN
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 3;
			END_IF
		
		3:
			SC_RobotManipulacie.StepName:='3 - Inicializacia - kontrola central stopu';
			SC_RobotManipulacie.IdleTime.PT:= T#500ms;
			SC_RobotManipulacie.AlarmTime.PT:= T#5s;
	
			IF RobotMan_Stav_RobotCS THEN
				RobotMan_ResetCS:= TRUE;
			END_IF
		
			IF NOT RobotMan_Stav_RobotCS THEN
				RobotMan_ResetCS:= FALSE;
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 4;
			END_IF
		
		
		4:
			SC_RobotManipulacie.StepName:='4 - Inicializacia - zapnutie motorov robota';
			SC_RobotManipulacie.IdleTime.PT:= T#500ms;
			SC_RobotManipulacie.AlarmTime.PT:= T#5s;			
		
			IF NOT RobotMan_Stav_MotoryON THEN
				RobotMan_ZapniMotory:= TRUE;
			END_IF	
		
			IF RobotMan_Stav_MotoryON THEN
				RobotMan_ZapniMotory:= FALSE;
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 5;
			END_IF
		
	
		5:
			SC_RobotManipulacie.StepName:='5 - Inicializacia - spustenie programu od zaciatku';
			SC_RobotManipulacie.IdleTime.PT:= T#500ms;
			SC_RobotManipulacie.AlarmTime.PT:= T#5s;	
		
			IF NOT SC_RobotManipulacie.Switch1 THEN
				RobotMan_StartProgramuMain:= TRUE;
				SC_RobotManipulacie.Switch1:= TRUE;
			END_IF	
		
			IF RobotMan_Stav_ProgramRUN AND RobotManipulacie_Odparkovanie THEN
				RobotMan_StartProgramuMain:= FALSE;
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 100;
			ELSIF RobotMan_Stav_ProgramRUN AND RobotMan_ChodDoServisPozicie THEN
				RobotMan_StartProgramuMain:= FALSE;
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 100;
			ELSIF RobotMan_Stav_ProgramRUN AND (Stol_Automat OR Centrifuga1_Automat OR Centrifuga2_Automat OR Tunel_Automat)THEN
				RobotMan_StartProgramuMain:= FALSE;
				RobotManipulacie_PoINIT:= TRUE;
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 100;
			ELSIF RobotMan_Stav_ProgramRUN AND NOT Stol_Automat AND NOT Centrifuga1_Automat AND NOT Centrifuga2_Automat AND NOT Tunel_Automat THEN
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 0;
			END_IF
		
		
			//********************************************************Automatický režim****************************************************************************//
		100:
			SC_RobotManipulacie.StepName:='100 - Automaticky rezim - cakanie na ukoncenie vyroby';
			SC_RobotManipulacie.IdleTime.PT:= T#500ms;
			SC_RobotManipulacie.AlarmTime.PT:= T#5s;	
		
			IF RobotMan_ChodDoServisPozicie THEN
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 110;
			ELSIF (RobotManipulacie_KoniecVyroby AND NOT Stol_Automat AND (SC_Centrifuga1.Step = 100 OR NOT Centrifuga1_Automat) AND (SC_Centrifuga2.Step = 100 OR NOT Centrifuga2_Automat) AND Tunel_Automat) OR RobotManipulacie_Odparkovanie THEN
				RobotMan_UkonciVyrobu:= TRUE;
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 101;
			ELSIF RobotManipulacie_KoniecCyklu AND NOT Stol_Automat AND (SC_Centrifuga1.Step = 100 OR NOT Centrifuga1_Automat) AND (SC_Centrifuga2.Step = 100 OR NOT Centrifuga2_Automat) AND NOT diRobotManip_Rotor_v_GripriLS AND NOT diRobotManip_Rotor_v_GripriPS THEN
				RobotMan_UkonciVyrobu:= TRUE;
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 101;
			END_IF
		
		101:
			SC_RobotManipulacie.StepName:='101 - Automaticky rezim - cakanie na odparkovanie robota';
			SC_RobotManipulacie.IdleTime.PT:= T#500ms;
			SC_RobotManipulacie.AlarmTime.PT:= T#5s;	
		
			IF RobotMan_Stav_Odparkovany AND NOT RobotMan_Stav_ProgramRUN THEN
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 0;
			END_IF
		
		110:
			SC_RobotManipulacie.StepName:='110 - Automaticky rezim - presun robota do servisnej pozicie';
			SC_RobotManipulacie.IdleTime.PT:= T#500ms;
			SC_RobotManipulacie.AlarmTime.PT:= T#5s;
			
			IF RobotMan_Stav_ServisnaPozicia THEN
				SC_RobotManipulacie.ResetStep:= TRUE;
				SC_RobotManipulacie.Step:= 0;
			END_IF
		
			//********************************************************Ruèný režim***********************************************************************************//
		700:
			SC_RobotManipulacie.StepName:='700 - Rucny rezim';
		
			RobotManipulacie_GriperOtvoreny:= diRobotManip_GriperOTVORENY_LS AND diRobotManip_GriperOTVORENY_PS;
			RobotManipulacie_GriperZatvoreny:= diRobotManip_GriperZATVORENY_LS AND diRobotManip_GriperZATVORENY_PS;
		
	END_CASE
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

