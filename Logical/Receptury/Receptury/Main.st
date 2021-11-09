
PROGRAM _INIT

	
END_PROGRAM

PROGRAM _CYCLIC

	//Naèítanie receptur pri prvom spustení//
	IF EDGEPOS(SafetyPLC_Nabehlo = TRUE) THEN
		MpRecipeXml_0.Load:= TRUE;
	END_IF
	
	//Naèítanie receptur z pamäte//
	IF MpRecipeXml_0.Load AND (MpRecipeXml_0.CommandDone OR MpRecipeXml_0.Error) THEN
		MpRecipeXml_0.Load:= FALSE;
		old_i:= 1;
		i:= 0;
		IndexZoznam:= 0;
	END_IF	
	
	//Konfigurácia receptur//
	MpRecipeXml_0.MpLink:= ADR(gRecipeXmlLink);  //takto sa menuje mapp komponenta v configurating view//
	MpRecipeXml_0.Enable:= TRUE;
	MpRecipeXml_0.Category:= ADR('RECEPTURY');
	MpRecipeXml_0.DeviceName:= ADR('HDD');  //Názov media, kde sa budú receptury ukladat//
	MpRecipeXml_0.FileName:= ADR('UlozeneReceptury'); //Názov súboru do ktorého sa receptúry uložia//
	MpRecipeXml_0();
	
	MpRecipeRegPar_0.MpLink:= ADR(gRecipeXmlLink);
	MpRecipeRegPar_0.Enable:= TRUE;
	MpRecipeRegPar_0.Category:= ADR('RECEPTURY');
	MpRecipeRegPar_0.PVName:= ADR('Receptura'); //Názov premenné, kde je vytvorená štruktura dat pre receptury//
	MpRecipeRegPar_0();

	//Zobrazenie názvou receptúr//
	FOR IndexZoznam:=0 TO 50 BY 1 DO
		ZoznamReceptur[IndexZoznam]:= Receptura[IndexZoznam].Nazov;
	END_FOR
	
	//Posun indexu//
	IF MoveUP THEN
		IF i< 50 THEN
			i:= i+1;
		END_IF
		MoveUP:= FALSE;
	END_IF
	
	IF MoveDown THEN
		IF i>0 THEN
			i:= i-1;
		END_IF
		MoveDown:= FALSE;
	END_IF
	
	//Listovanie v uložených recepturach//
	IF old_i <> i THEN
		Nazov:= Receptura[i].Nazov;
		CisloProgramuLinka:= Receptura[i].CisloProgramuLinka;
		CisloProgramuRobotOdlievania:= Receptura[i].CisloProgramuRobotOdlievania;
		CisloProgramuRobotManipulacie:= Receptura[i].CisloProgramuRobotManipulacie;
		VyskaBalika:= Receptura[i].VyskaBalika;
		VyskaBalikaHornaTolerancia:= Receptura[i].VyskaBalikaHornaTolerancia;
		VyskaBalikaSpodnaTolerancia:= Receptura[i].VyskaBalikaSpodnaTolerancia;
		UholOdlievaniaRobOdlievCentr1:= Receptura[i].UholOdlievaniaRobOdlievCentr1; 
		CasOdlievaniaRobOdlievCentr1:= Receptura[i].CasOdlievaniaRobOdlievCentr1;
		UholOdlievaniaRobOdlievCentr2:= Receptura[i].UholOdlievaniaRobOdlievCentr2;
		CasOdlievaniaRobOdlievCentr2:= 	Receptura[i].CasOdlievaniaRobOdlievCentr2;
		CasOtacaniaPriOdlievani:= Receptura[i].CasOtacaniaPriOdlievani;
		RychlostOtacaniaPriOdlievani:= Receptura[i].RychlostOtacaniaPriOdlievani;
		old_i:= i;
	END_IF
	
	
	
	//Uloženie receptury//
	IF UlozRecepturu THEN
		Receptura[i].Nazov:= Nazov;
		Receptura[i].CisloProgramuLinka:= CisloProgramuLinka;
		Receptura[i].CisloProgramuRobotOdlievania:= CisloProgramuRobotOdlievania;
		Receptura[i].CisloProgramuRobotManipulacie:= CisloProgramuRobotManipulacie;
		Receptura[i].VyskaBalika:= VyskaBalika;
		Receptura[i].VyskaBalikaHornaTolerancia:= VyskaBalikaHornaTolerancia;
		Receptura[i].VyskaBalikaSpodnaTolerancia:= VyskaBalikaSpodnaTolerancia;
		Receptura[i].UholOdlievaniaRobOdlievCentr1:= UholOdlievaniaRobOdlievCentr1;
		Receptura[i].CasOdlievaniaRobOdlievCentr1:= CasOdlievaniaRobOdlievCentr1;
		Receptura[i].UholOdlievaniaRobOdlievCentr2:= UholOdlievaniaRobOdlievCentr2;
		Receptura[i].CasOdlievaniaRobOdlievCentr2:= CasOdlievaniaRobOdlievCentr2;
		Receptura[i].CasOtacaniaPriOdlievani:= CasOtacaniaPriOdlievani;
		Receptura[i].RychlostOtacaniaPriOdlievani:= RychlostOtacaniaPriOdlievani;
		MpRecipeXml_0.Save:= TRUE;
		IF MpRecipeXml_0.CommandDone THEN
			MpRecipeXml_0.Save:= FALSE;
			UlozRecepturu:= FALSE;
		END_IF
	END_IF	
	
	//Naèitanie receptur do premenných//
	IF NacitajRecepturu THEN
		ZvolenyNazovProduktu:= Nazov;
		ZvolenyProgramLinka:= CisloProgramuLinka;
		ZvolenyProgramRobotOdlievania:= CisloProgramuRobotOdlievania;
		ZvolenyProgramRobotManipulacie:= CisloProgramuRobotManipulacie;
		ZvolenaVyskaBalika:= VyskaBalika;
		ZvolenaHornaToleranciaBalika:= VyskaBalikaHornaTolerancia;
		ZvolenaSpodnaToleranciaBalika:= VyskaBalikaSpodnaTolerancia;
		ZvolUholOdlievRobOdlievCentr1:= REAL_TO_UDINT(UholOdlievaniaRobOdlievCentr1*10);
		ZvolCasOdlievRobOdlievCentr1:= REAL_TO_UDINT(CasOdlievaniaRobOdlievCentr1*10);
		ZvolUholOdlievRobOdlievCentr2:= REAL_TO_UDINT(UholOdlievaniaRobOdlievCentr2*10);
		ZvolCasOdlievRobOdlievCentr2:= REAL_TO_UDINT(CasOdlievaniaRobOdlievCentr2*10);
		ZvolCasOtacaniaPriOdlievani:= CasOtacaniaPriOdlievani;
		ZvolRychlostOtacaniaPriOdlievani:= RychlostOtacaniaPriOdlievani;
		NacitajRecepturu:= FALSE;
	END_IF
	
	
	
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

