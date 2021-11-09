
PROGRAM _INIT
	Motion[1].par.axis:= ADR(gAxis01);  //Otoèný stol - manipulátor//
	Motion[2].par.axis:= ADR(gAxis02);  //Centrifuga 1 - otáèanie//
	Motion[3].par.axis:= ADR(gAxis03);  //Centrifuga 1 - zdvih 1//
	Motion[4].par.axis:= ADR(gAxis04);  //Centrifuga 1 - zdvih 2//
	Motion[5].par.axis:= ADR(gAxis05);  //Centrifuga 2 - otáèanie//
	Motion[6].par.axis:= ADR(gAxis06);  //Centrifuga 2 - zdvih 1//
	Motion[7].par.axis:= ADR(gAxis07);  //Centrifuga 2 - zdvih 2//
	
END_PROGRAM

PROGRAM _CYCLIC
	
	FOR idx:=1 TO MAX_MOTION DO 
		Motion[idx].enable := TRUE;
		Motion[idx];
	END_FOR

	IF BezpOkruhCS_Aktivovany THEN
		Motion[1].cmd.power:= TRUE;
		Motion[2].cmd.power:= TRUE;
		Motion[3].cmd.power:= TRUE;
		Motion[4].cmd.power:= TRUE;
		Motion[5].cmd.power:= TRUE;
		Motion[6].cmd.power:= TRUE;
		Motion[7].cmd.power:= TRUE;
	ELSE
		Motion[1].cmd.power:= FALSE;
		Motion[2].cmd.power:= FALSE;
		Motion[3].cmd.power:= FALSE;
		Motion[4].cmd.power:= FALSE;
		Motion[5].cmd.power:= FALSE;
		Motion[6].cmd.power:= FALSE;
		Motion[7].cmd.power:= FALSE;
	END_IF	
	 
	IF EDGEPOS (BezpOkruhOplotenia_Aktivovany = TRUE) THEN
		Motion[1].cmd.autoInicialization:= TRUE;
		Motion[2].cmd.autoInicialization:= TRUE;
		Motion[3].cmd.autoInicialization:= TRUE;
		Motion[4].cmd.autoInicialization:= TRUE;
		Motion[5].cmd.autoInicialization:= TRUE;
		Motion[6].cmd.autoInicialization:= TRUE;
		Motion[7].cmd.autoInicialization:= TRUE;
		CasVypnutiaAutoInitServ.IN:= TRUE;
	END_IF
	IF CasVypnutiaAutoInitServ.Q AND Motion[1].errorID = 0 AND Motion[2].errorID = 0 AND Motion[3].errorID = 0 AND Motion[4].errorID = 0 AND Motion[5].errorID = 0 AND Motion[6].errorID = 0 AND Motion[7].errorID = 0  THEN
		Motion[1].cmd.autoInicialization:= FALSE;
		Motion[2].cmd.autoInicialization:= FALSE;
		Motion[3].cmd.autoInicialization:= FALSE;
		Motion[4].cmd.autoInicialization:= FALSE;
		Motion[5].cmd.autoInicialization:= FALSE;
		Motion[6].cmd.autoInicialization:= FALSE;
		Motion[7].cmd.autoInicialization:= FALSE;
		CasVypnutiaAutoInitServ.IN:= FALSE;
	END_IF
	
	CasVypnutiaAutoInitServ.PT:= T#3s;
	CasVypnutiaAutoInitServ();
		
	
	//Stavy homingov serv//
	Stol_Manipulator_HomingOK:= Motion[1].status.DriveStatus.HomingOk;
	Centrifuga1_Otacanie_HomingOK:= Motion[2].status.DriveStatus.HomingOk;
	Centrifuga1_Zdvih1_HomingOK:= Motion[3].status.DriveStatus.HomingOk;
	Centrifuga1_Zdvih2_HomingOK:= Motion[4].status.DriveStatus.HomingOk;
	Centrifuga2_Otacanie_HomingOK:= Motion[5].status.DriveStatus.HomingOk;
	Centrifuga2_Zdvih1_HomingOK:= Motion[6].status.DriveStatus.HomingOk;
	Centrifuga2_Zdvih2_HomingOK:= Motion[7].status.DriveStatus.HomingOk;
	
	
	
	
	//Zobrazenie aktuálnej pozície serv//
	Stol_Manipulator_AktualPozMM:= (Motion[1].status.ActPosition / 100);
	Centrifuga1_Otacanie_AktualPozST:= (Motion[2].status.ActPosition / 100);
	Centrifuga1_Zdvih1_AktualPozMM:= (Motion[3].status.ActPosition / 100);
	Centrifuga1_Zdvih2_AktualPozMM:= (Motion[4].status.ActPosition / 100);
	Centrifuga2_Otacanie_AktualPozST:= (Motion[5].status.ActPosition / 100);
	Centrifuga2_Zdvih1_AktualPozMM:= (Motion[6].status.ActPosition / 100);
	Centrifuga2_Zdvih2_AktualPozMM:= (Motion[7].status.ActPosition / 100);

	
	//Príznak serva READY//
	IF Motion[1].errorID = 0 AND Motion[2].errorID = 0 AND Motion[3].errorID = 0 AND Motion[4].errorID = 0 AND Motion[5].errorID = 0 AND Motion[6].errorID = 0 AND Motion[7].errorID = 0 THEN
		Stav_ServaREADY:= TRUE;
	ELSE	
		Stav_ServaREADY:= FALSE;
	END_IF
	
	
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

