
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	RobotOdliev_Inputs_0;
	RobotOdliev_Inputs_1;
	RobotOdliev_Inputs_2;
	RobotOdliev_Inputs_3;
	RobotOdliev_Outputs_0;
	RobotOdliev_Outputs_1;
	RobotOdliev_Outputs_2;
	RobotOdliev_Outputs_3;
	RobotOdliev_Outputs_4;
	RobotOdliev_Outputs_5;
	
	
	//Signály pre robot//
	RobotOdliev_Outputs_0.0:= diRobotOdliev_SnimacHladiny;
	RobotOdliev_Outputs_0.1:= RobotOdliev_Centri1_NaberHlinik;
	RobotOdliev_Outputs_0.2:= RobotOdliev_Centri1_NalejHlinik;
	RobotOdliev_Outputs_0.3:= RobotOdliev_Centri2_NaberHlinik;
	RobotOdliev_Outputs_0.4:= RobotOdliev_Centri2_NalejHlinik;
	RobotOdliev_Outputs_0.5:= RobotOdliev_TeplotaHlinikaOK;
	RobotOdliev_Outputs_0.13:= RobotOdliev_ZapniMotory;
	RobotOdliev_Outputs_0.14:= RobotOdliev_VypniMotory;
	RobotOdliev_Outputs_0.15:= RobotOdliev_PP_na_Main;
	RobotOdliev_Outputs_0.16:= RobotOdliev_StartProgramu;
	RobotOdliev_Outputs_0.17:= RobotOdliev_StopProgramu;
	RobotOdliev_Outputs_0.18:= RobotOdliev_UkonciVyrobu;
	RobotOdliev_Outputs_0.19:= RobotOdliev_ResetCS;
	RobotOdliev_Outputs_0.20:= RobotOdliev_StartProgramuMain;
	RobotOdliev_Outputs_0.21:= RobotOdliev_VylejHlinikCentr1;
	RobotOdliev_Outputs_0.22:= RobotOdliev_VylejHlinikCentr2;
	RobotOdliev_Outputs_0.23:= RobotOdliev_ChodDoServisPozicie;
	RobotOdliev_Outputs_0.24:= RobotOdliev_ChodDoNahriatiaLyzic;
	RobotOdliev_Outputs_0.25:= RobotOdliev_ChodDoPreplachuLyzic;
	RobotOdliev_Outputs_0.26:= RobotOdliev_ChodNadCentrifugy;
	
	RobotOdliev_Outputs_1:= ZvolenyProgramRobotOdlievania;
	RobotOdliev_Outputs_2:= ZvolUholOdlievRobOdlievCentr1*10;
	RobotOdliev_Outputs_3:= ZvolCasOdlievRobOdlievCentr1*10;
	RobotOdliev_Outputs_4:= ZvolUholOdlievRobOdlievCentr2*10;
	RobotOdliev_Outputs_5:= ZvolCasOdlievRobOdlievCentr2*10;
	
	
	//Signály od robota//
	RobotOdliev_Stav_MotoryON:= RobotOdliev_Inputs_0.13;
	RobotOdliev_Stav_MotoryOFF:= RobotOdliev_Inputs_0.14;
	RobotOdliev_Stav_ProgramRUN:= RobotOdliev_Inputs_0.15;
	RobotOdliev_Stav_RezimAUTOMAT:= RobotOdliev_Inputs_0.16;
	RobotOdliev_Stav_Odparkovany:= RobotOdliev_Inputs_0.17;
	RobotOdliev_Stav_RobotCS:= RobotOdliev_Inputs_0.18;
	RobotOdliev_Stav_Porucha:= RobotOdliev_Inputs_0.19;
	RobotOdliev_Stav_NalievamCentr1:= RobotOdliev_Inputs_0.20;
	RobotOdliev_Stav_NalievamCentr2:= RobotOdliev_Inputs_0.21;
	RobotOdliev_Stav_PripNaliatCent1:= RobotOdliev_Inputs_0.22;
	RobotOdliev_Stav_PripNaliatCent2:= RobotOdliev_Inputs_0.23;
	RobotOdliev_Stav_ServisnaPozicia:= RobotOdliev_Inputs_0.24;
	RobotOdliev_Stav_KritickaHladina:= RobotOdliev_Inputs_0.25;
	RobotOdliev_Stav_Preplachnuty:= RobotOdliev_Inputs_0.26;
	RobotOdliev_Stav_DoplnHlinik:= RobotOdliev_Inputs_0.27;
	RobotOdliev_Stav_NizkaHladina:= RobotOdliev_Inputs_0.28;
	RobotOdliev_Stav_PozNadCentrifug:= RobotOdliev_Inputs_0.29;
	RobotOdliev_RobotCaka:= RobotOdliev_Inputs_0.30;
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

