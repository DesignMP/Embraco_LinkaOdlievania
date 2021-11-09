
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	//**********************************Vystavenie signálu pre preplach lyžíc************************************************************//
	
	IF TP_RobotOdliev_CasDoPreplachu > 0 AND RobotOdliev_RobotCaka AND RobotOdlievania_PoINIT AND NOT RobotOdlievania_KoniecVyroby AND NOT RobotOdlievania_KoniecCyklu AND NOT RobotOdlievanie_StavPreplachnuty THEN
		CasPredAutomatPreplachom.IN:= TRUE;
	ELSE
		CasPredAutomatPreplachom.IN:= FALSE;
	END_IF	
	
	IF CasPredAutomatPreplachom.Q THEN
		RobotOdlievanie_AutomatPreplach:= TRUE;
	ELSE
		RobotOdlievanie_AutomatPreplach:= FALSE;
	END_IF	
	
		
	
	//Prepoèet èasu do preplachu lyžíc//
	RobotOdlievanie_CasDoPreplachu:= REAL_TO_TIME(TP_RobotOdliev_CasDoPreplachu *1000);
	CasPredAutomatPreplachom.PT:= RobotOdlievanie_CasDoPreplachu;
	CasPredAutomatPreplachom();
	
	
	
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_RobotOdlievania);
	
	
	
	//Reset sekcie //
	IF RobotOdlievania_Reset OR NOT BezpOkruhOplotenia_Aktivovany OR PoruchaRobotOdlievania THEN
		SC_RobotOdlievania.Step:= 0;
	END_IF
	
	
	CASE SC_RobotOdlievania.Step OF 
	
	
		0:
			SC_RobotOdlievania.StepName:='0 - Nulovanie';
			RobotOdlievania_Automat:= FALSE;
			RobotOdlievania_KoniecVyroby:= FALSE;
			RobotOdlievania_KoniecCyklu:= FALSE;
			RobotOdlievania_Manual:= FALSE;
			RobotOdlievania_PoINIT:= FALSE;
			RobotOdlievania_Reset:= FALSE;
			RobotOdliev_PP_na_Main:= FALSE;
			RobotOdliev_ResetCS:= FALSE;
			RobotOdliev_StartProgramu:= FALSE;
			RobotOdliev_StartProgramuMain:= FALSE;
			IF RobotOdliev_Stav_ProgramRUN AND RobotOdliev_Stav_RezimAUTOMAT THEN
				RobotOdliev_StopProgramu:= TRUE;
			ELSE
				RobotOdliev_StopProgramu:= FALSE;
			END_IF	
			RobotOdliev_UkonciVyrobu:= FALSE;
			RobotOdliev_VypniMotory:= FALSE;
			RobotOdliev_ZapniMotory:= FALSE;
			RobotOdlievania_Odparkovanie:= FALSE;
			RobotOdlievanie_Servis:= FALSE;
			RobotOdlievanie_NahriatieLyzic:= FALSE;
			RobotOdlievanie_PreplachniLyzice:= FALSE;
			RobotOdlievanie_AutomatPreplach:= FALSE;
			RobotOdliev_VylejHlinikCentr1:= FALSE;
			RobotOdliev_VylejHlinikCentr2:= FALSE;
			RobotOdliev_ChodDoServisPozicie:= FALSE;
			RobotOdliev_ChodDoNahriatiaLyzic:= FALSE;
			RobotOdliev_ChodDoPreplachuLyzic:= FALSE;
			RobotOdliev_ChodNadCentrifugy:= FALSE;
			PocetKusovDoPreplachu:= 0;
			Stav_PrebiehaOdlievanie:= FALSE;
			RobotOdlievanie_StavPreplachnuty:= FALSE;
			RobotOdlievanie_NadCentrifugamy:= FALSE;
			IF BezpOkruhOplotenia_Aktivovany AND NOT RobotOdliev_Stav_ProgramRUN AND NOT PoruchaRobotOdlievania THEN
				RobotOdliev_StopProgramu:= FALSE;
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 1;
			END_IF
	
	
		1:
			SC_RobotOdlievania.StepName:='1 - Rozhodnutie o cinnosti';
			IF RobotOdlievania_Automat THEN
				SC_RobotOdlievania.Step:= 2;
			ELSIF RobotOdlievania_Odparkovanie THEN
				SC_RobotOdlievania.Step:= 2;
			ELSIF RobotOdlievanie_Servis THEN
				SC_RobotOdlievania.Step:= 2;
			ELSIF RobotOdlievanie_NahriatieLyzic THEN
				SC_RobotOdlievania.Step:= 2;
			ELSIF RobotOdlievanie_PreplachniLyzice THEN
				SC_RobotOdlievania.Step:= 2;
			ELSIF RobotOdlievania_Manual THEN
				SC_RobotOdlievania.Step:= 700;
			END_IF
		
		
		//********************************************************Inicializácia****************************************************************************//
	
		2:
			SC_RobotOdlievania.StepName:='2 - Inicializacia - cakanie na spustenie';
			SC_RobotOdlievania.IdleTime.PT:= T#500ms;
			SC_RobotOdlievania.AlarmTime.PT:= T#5s;
			RobotOdlievania_Automat:= TRUE;
			
			IF RobotOdliev_Stav_RezimAUTOMAT THEN
				SC_RobotOdlievania.IdleTime.IN:= TRUE;
			ELSE
				SC_RobotOdlievania.IdleTime.IN:= FALSE;
			END_IF	
				
			IF SC_RobotOdlievania.IdleTime.Q THEN
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 3;
			END_IF
		
		3:
			SC_RobotOdlievania.StepName:='3 - Inicializacia - kontrola central stopu';
			SC_RobotOdlievania.IdleTime.PT:= T#500ms;
			SC_RobotOdlievania.AlarmTime.PT:= T#5s;
	
			IF RobotOdliev_Stav_RobotCS THEN
				RobotOdliev_ResetCS:= TRUE;
			END_IF
		
			IF NOT RobotOdliev_Stav_RobotCS THEN
				RobotOdliev_ResetCS:= FALSE;
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 4;
			END_IF
		
		
		4:
			SC_RobotOdlievania.StepName:='4 - Inicializacia - zapnutie motorov robota';
			SC_RobotOdlievania.IdleTime.PT:= T#500ms;
			SC_RobotOdlievania.AlarmTime.PT:= T#5s;			
		
			IF NOT RobotOdliev_Stav_MotoryON THEN
				RobotOdliev_ZapniMotory:= TRUE;
			END_IF	
		
			IF RobotOdliev_Stav_MotoryON THEN
				RobotOdliev_ZapniMotory:= FALSE;
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 5;
			END_IF
		
	
		5:
			SC_RobotOdlievania.StepName:='5 - Inicializacia - spustenie programu od zaciatku';
			SC_RobotOdlievania.IdleTime.PT:= T#500ms;
			SC_RobotOdlievania.AlarmTime.PT:= T#5s;	
		
			RobotOdliev_StartProgramuMain:= TRUE;
		
			IF RobotOdliev_Stav_ProgramRUN THEN
				RobotOdliev_StartProgramuMain:= FALSE;
				RobotOdlievania_PoINIT:= TRUE;
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 100;
			END_IF
		
			
		
		
		//********************************************************Automatický režim****************************************************************************//
		100:
			SC_RobotOdlievania.StepName:='100 - Automaticky rezim - cakanie na ukoncenie vyroby ';
			SC_RobotOdlievania.IdleTime.PT:= T#60s;
			SC_RobotOdlievania.AlarmTime.PT:= T#13s;	
		
			IF RobotOdliev_Centri1_NaberHlinik OR RobotOdliev_Centri1_NalejHlinik OR RobotOdliev_Centri2_NaberHlinik OR RobotOdliev_Centri2_NalejHlinik OR RobotOdliev_VylejHlinikCentr1 OR RobotOdliev_VylejHlinikCentr2 OR RobotOdliev_ChodDoServisPozicie OR RobotOdliev_ChodDoPreplachuLyzic OR RobotOdliev_ChodDoNahriatiaLyzic  THEN
				RobotOdlievanie_NadCentrifugamy:= FALSE;
			END_IF
			
			IF NOT RobotOdliev_Centri1_NaberHlinik AND NOT RobotOdliev_Centri1_NalejHlinik AND NOT RobotOdliev_Centri2_NaberHlinik AND NOT RobotOdliev_Centri2_NalejHlinik AND NOT RobotOdliev_VylejHlinikCentr1 AND NOT RobotOdliev_VylejHlinikCentr2 AND NOT RobotOdliev_ChodDoServisPozicie AND NOT RobotOdliev_ChodDoPreplachuLyzic AND NOT RobotOdliev_ChodDoNahriatiaLyzic AND NOT RobotOdlievanie_NadCentrifugamy THEN
				SC_RobotOdlievania.IdleTime.IN:= TRUE;
			ELSE	
				SC_RobotOdlievania.IdleTime.IN:= FALSE;
			END_IF	
				
			IF RobotOdlievania_KoniecVyroby AND RobotMan_Stav_Odparkovany THEN
				RobotOdliev_UkonciVyrobu:= TRUE;
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 101;
			ELSIF RobotOdlievania_Odparkovanie THEN
				RobotOdliev_UkonciVyrobu:= TRUE;
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 101;
			ELSIF RobotOdlievanie_Servis THEN
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 110;
			ELSIF RobotOdlievanie_NahriatieLyzic THEN
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 120;
			ELSIF RobotOdlievanie_PreplachniLyzice THEN
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 130;
			ELSIF RobotOdlievanie_AutomatPreplach THEN
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 150;
			ELSIF RobotOdlievania_KoniecCyklu AND RobotMan_Stav_Odparkovany THEN	
				RobotOdliev_UkonciVyrobu:= TRUE;
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 101;
//			ELSIF SC_RobotOdlievania.IdleTime.Q THEN
//				RobotOdliev_ChodNadCentrifugy:= TRUE;
//				SC_RobotOdlievania.ResetStep:= TRUE;
//				SC_RobotOdlievania.Step:= 140;
			END_IF
		
					
		
		101:
			SC_RobotOdlievania.StepName:='101 - Automaticky rezim - cakanie na odparkovanie robota';
			SC_RobotOdlievania.IdleTime.PT:= T#500ms;
			SC_RobotOdlievania.AlarmTime.PT:= T#5s;	
		
			IF RobotOdliev_Stav_Odparkovany AND NOT RobotOdliev_Stav_ProgramRUN THEN
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 0;
			END_IF
		
		110:
			SC_RobotOdlievania.StepName:='110 - Automaticky rezim - odparkovanie robota manipulacie';
			SC_RobotOdlievania.IdleTime.PT:= T#500ms;
			SC_RobotOdlievania.AlarmTime.PT:= T#5s;	
		
			IF NOT SC_RobotOdlievania.Switch1 THEN
				RobotManipulacie_Odparkovanie:= TRUE;
				SC_RobotOdlievania.Switch1:= TRUE;
			END_IF
			
			IF RobotMan_Stav_Odparkovany AND NOT RobotMan_Stav_ProgramRUN THEN
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 111;
			END_IF	
		
		111:
			SC_RobotOdlievania.StepName:='111 - Automaticky rezim - presun do servisnej polohy';
			SC_RobotOdlievania.IdleTime.PT:= T#500ms;
			SC_RobotOdlievania.AlarmTime.PT:= T#5s;	
		
			IF NOT SC_RobotOdlievania.Switch1 THEN
				RobotOdliev_ChodDoServisPozicie:= TRUE;
				SC_RobotOdlievania.Switch1:= TRUE;
			END_IF
			
			IF RobotOdliev_Stav_ServisnaPozicia AND NOT RobotOdliev_Stav_ProgramRUN THEN
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 0;
			END_IF		
			
			
		120:
			SC_RobotOdlievania.StepName:='120 - Automaticky rezim - presun do nahrievania lyzic';
			SC_RobotOdlievania.IdleTime.PT:= T#500ms;
			SC_RobotOdlievania.AlarmTime.PT:= T#5s;	
			
			IF NOT SC_RobotOdlievania.Switch1 THEN
				RobotOdliev_ChodDoNahriatiaLyzic:= TRUE;
				SC_RobotOdlievania.Switch1:= TRUE;
			END_IF
			
			IF NOT RobotOdliev_Stav_ProgramRUN THEN
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 0;
			END_IF	
			
		130:
			SC_RobotOdlievania.StepName:='130 - Automaticky rezim - preplachnutie lyzic, start sekvencie';
			SC_RobotOdlievania.IdleTime.PT:= T#500ms;
			SC_RobotOdlievania.AlarmTime.PT:= T#5s;	
		
			IF NOT SC_RobotOdlievania.Switch1 THEN
				RobotOdliev_ChodDoPreplachuLyzic:= TRUE;
				SC_RobotOdlievania.Switch1:= TRUE;
			END_IF
			
			IF RobotOdliev_Stav_Preplachnuty THEN
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 131;
			END_IF	
			
		131:
			SC_RobotOdlievania.StepName:='130 - Automaticky rezim - preplachnutie lyzic, ukoncenie sekvencie';
			SC_RobotOdlievania.IdleTime.PT:= T#500ms;
			SC_RobotOdlievania.AlarmTime.PT:= T#5s;	
			
			IF NOT SC_RobotOdlievania.Switch1 THEN
				RobotOdliev_UkonciVyrobu:= TRUE;
				SC_RobotOdlievania.Switch1:= TRUE;
			END_IF
			
			IF RobotOdliev_Stav_Odparkovany AND NOT RobotOdliev_Stav_ProgramRUN THEN
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 0;
			END_IF	
			
		
		140:
			SC_RobotOdlievania.StepName:='140 - Automaticky rezim - presun robota nad centrifugy';
			SC_RobotOdlievania.IdleTime.PT:= T#500ms;
			SC_RobotOdlievania.AlarmTime.PT:= T#5s;	
			
//			IF RobotOdliev_Stav_PozNadCentrifug THEN
//				RobotOdliev_ChodNadCentrifugy:=FALSE;
//			END_IF
			
			IF NOT RobotOdliev_ChodNadCentrifugy AND NOT RobotOdliev_Stav_PozNadCentrifug THEN
				RobotOdlievanie_NadCentrifugamy:= TRUE;
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 100;
			END_IF	
		
			
		150:
			SC_RobotOdlievania.StepName:='150 - Automaticky rezim - automaticke preplachnutie lyzic';
			SC_RobotOdlievania.IdleTime.PT:= T#500ms;
			SC_RobotOdlievania.AlarmTime.PT:= T#5s;	
		
			IF NOT SC_RobotOdlievania.Switch1 THEN
				RobotOdliev_ChodDoPreplachuLyzic:= TRUE;
				SC_RobotOdlievania.Switch1:= TRUE;
			END_IF
			
			IF RobotOdliev_Stav_Preplachnuty THEN
				RobotOdliev_ChodDoPreplachuLyzic:= FALSE;
				RobotOdlievanie_AutomatPreplach:= FALSE;
				RobotOdlievanie_StavPreplachnuty:= TRUE;
				SC_RobotOdlievania.ResetStep:= TRUE;
				SC_RobotOdlievania.Step:= 100;
			END_IF		
			
			
			
			
			
			
			
			
		//********************************************************Ruèný režim***********************************************************************************//
		700:
			SC_RobotOdlievania.StepName:='700 - Rucny rezim';
		
		
		
		
		
		
		
		
		
		
	END_CASE
	
	
	
END_PROGRAM

PROGRAM _EXIT
				(* Insert code here *)
	 
				END_PROGRAM

