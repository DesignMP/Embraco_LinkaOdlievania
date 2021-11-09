
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	RobotMan_Inputs_0;
	RobotMan_Inputs_1;
	RobotMan_Inputs_2;
	RobotMan_Inputs_3;
	RobotMan_Outputs_0;
	RobotMan_Outputs_1;
	RobotMan_Outputs_2;
	RobotMan_Outputs_3;
	
	
	//Signály pre robot//
	RobotMan_Outputs_0.0:= diRobotManip_GriperOTVORENY_LS; 
	RobotMan_Outputs_0.1:= diRobotManip_GriperOTVORENY_PS;
	RobotMan_Outputs_0.2:= diRobotManip_GriperZATVORENY_LS;
	RobotMan_Outputs_0.3:= diRobotManip_GriperZATVORENY_PS;
	RobotMan_Outputs_0.4:= diRobotManip_Rotor_v_GripriLS;
	RobotMan_Outputs_0.5:= diRobotManip_Rotor_v_GripriPS;
	RobotMan_Outputs_0.6:= RobotMan_Centrifug1_OdoberKusy;
	RobotMan_Outputs_0.7:= RobotMan_Centrifug1_VlozKusy;
	RobotMan_Outputs_0.8:= RobotMan_Centrifug2_OdoberKusy;
	RobotMan_Outputs_0.9:= RobotMan_Centrifug2_VlozKusy;
	RobotMan_Outputs_0.10:= RobotMan_Stol_OdoberKusy;
	RobotMan_Outputs_0.11:= RobotMan_Tunel_VlozKusy;
	RobotMan_Outputs_0.13:= RobotMan_ZapniMotory;
	RobotMan_Outputs_0.14:= RobotMan_VypniMotory;
	RobotMan_Outputs_0.15:= RobotMan_PP_na_Main;
	RobotMan_Outputs_0.16:= RobotMan_StartProgramu;
	RobotMan_Outputs_0.17:= RobotMan_StopProgramu;
	RobotMan_Outputs_0.18:= RobotMan_UkonciVyrobu;
	RobotMan_Outputs_0.19:= RobotMan_ResetCS;
	RobotMan_Outputs_0.20:= RobotMan_StartProgramuMain;
	RobotMan_Outputs_0.21:= RobotManipulacie_LinkaPripravena;
	RobotMan_Outputs_0.22:= RobotMan_Stol_OdoberKusyNG;
	RobotMan_Outputs_0.23:= RobotManipulacie_NaliatkyOK;
	RobotMan_Outputs_0.24:= RobotMan_PripravaNaCentrifugu1;
	RobotMan_Outputs_0.25:= RobotMan_PripravaNaCentrifugu2;
	RobotMan_Outputs_0.26:= RobotMan_PripravaNaStol;
	RobotMan_Outputs_0.27:= RobotMan_Centrifug1_DoCentrifugy;
	RobotMan_Outputs_0.28:= RobotMan_Centrifug2_DoCentrifugy;
	RobotMan_Outputs_0.29:= RobotMan_ChodDoServisPozicie;
	
	RobotMan_Outputs_1:= ZvolenyProgramRobotManipulacie;
	RobotMan_Outputs_2:= RobotMan_VyskaBalika;
	
	
	//Signály od robota//
	doRobotManip_GripreOTVOR:= RobotMan_Inputs_0.0;
	doRobotManip_GripreZATVOR:= RobotMan_Inputs_0.1;
	RobotMan_Centrifug1_BezpVzdialen:= RobotMan_Inputs_0.2;
	RobotMan_Centrifug1_KusyOdobrate:= RobotMan_Inputs_0.3;
	RobotMan_Centrifug1_KusyVlozene:= RobotMan_Inputs_0.4;
	RobotMan_Centrifug2_BezpVzdialen:= RobotMan_Inputs_0.5;
	RobotMan_Centrifug2_KusyOdobrate:= RobotMan_Inputs_0.6;
	RobotMan_Centrifug2_KusyVlozene:= RobotMan_Inputs_0.7;
	RobotMan_Stol_BezpVzdialenost:= RobotMan_Inputs_0.8;
	RobotMan_Stol_KusyOdobrate:= RobotMan_Inputs_0.9;
	RobotMan_Tunel_BezpVzdialenost:= RobotMan_Inputs_0.10;
	RobotMan_Tunel_KusyVlozene:= RobotMan_Inputs_0.11;
	RobotMan_Stav_MotoryON:= RobotMan_Inputs_0.13;
	RobotMan_Stav_MotoryOFF:= RobotMan_Inputs_0.14;
	RobotMan_Stav_ProgramRUN:= RobotMan_Inputs_0.15;
	RobotMan_Stav_RezimAUTOMAT:= RobotMan_Inputs_0.16;
	RobotMan_Stav_Odparkovany:= RobotMan_Inputs_0.17;
	RobotMan_Stav_RobotCS:= RobotMan_Inputs_0.18;
	RobotMan_Stav_Porucha:= RobotMan_Inputs_0.19;
	RobotMan_Tunel_KusyNGVlozene:= RobotMan_Inputs_0.20;
	RobotMan_Tunel_KusyNG_NaMerani:= RobotMan_Inputs_0.21;
	RobotMan_Stav_VkladamDoCentrif1:= RobotMan_Inputs_0.22;
	RobotMan_Stav_VkladamDoCentrif2:= RobotMan_Inputs_0.23;
	RobotMan_Stav_PripravenyCentrif1:= RobotMan_Inputs_0.24;
	RobotMan_Stav_PripravenyCentrif2:= RobotMan_Inputs_0.25;
	RobotMan_Stav_PripravenyStol:= RobotMan_Inputs_0.26;
	RobotMan_Stav_VypadliKusy:= RobotMan_Inputs_0.27;
	RobotMan_MimoZonyNavratu:= RobotMan_Inputs_0.28;
	RobotMan_Stav_ServisnaPozicia:= RobotMan_Inputs_0.29;
	
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

