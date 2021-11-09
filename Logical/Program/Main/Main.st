
PROGRAM _INIT
	//0 - hlásenie vidno , 1 - hlásenie nevidno//
	TP_ZobrazHlasenieResetZariadenia:= 1;
	TP_ZobrazPopUp_Centrifuga1:= 1;
	TP_ZobrazPopUp_Centrifuga2:= 1;
	TP_ZobrazPopUp_Manipulator:= 1;
	TP_ZobrazPopUp_Oddelovac:= 1;
	TP_ZobrazPopUp_Stol:= 1;
	TP_ZobrazPopUp_Tunel:= 1;
	TP_ZobrazPopUp_TunelVstup:= 1;
	TP_ZobrazPopUp_RobotManip:= 1;
	TP_ZobrazPopUp_RobotOdliev:= 1;
	TP_ZobrazPopUp_TeplotaHlinikaNG:= 1;
	TP_ZobrazPopUp_KontrolaKrytuPece:= 1;
	TP_ZobrazPopUp_KontrolaCentrifug:= 1;
	TP_ZobrazPopUp_NizkaHladina:= 1;
	TP_ZobrazHlasVyskaBalikaCentrif1:= 1;
	TP_ZobrazHlasVyskaBalikaCentrif2:= 1;
	TP_ZobrazPopUp_NizkeNaliatky:= 1;
	TP_ZobrazPopUp_TratZaTunelomPlna:= 1;
	TP_ZobrazPopUp_OdoberKrytPece:= 1;
	TP_ZobrazPopUp_DoplnHlinik:= 1;
	TP_ZobrazPopUp_KritickaHladina:= 1;
	TP_ZobrazPopUp_IndOhrevPorucha:= 1;
END_PROGRAM

PROGRAM _CYCLIC
	
	diStol_OhrevStavREADY;
	doStol_OhrevResetPoruchy;
	doStol_OhrevSTART;
	Pec_PozadovanaTeplotaPece;
	Pec_StavHoraka;
	Pec_TeplotaHlinika;
	Pec_TeplotaPece;
	RozsahBargrafu;
	doPecHlinik_ChodOdsavania;
	doRobotOdliev_ChodChladenia;
	
	//Ovládanie odsávania nad pecou//
	IF Zariadenie_StavAutomat THEN
		doPecHlinik_ChodOdsavania:= TRUE;
	ELSE	
		doPecHlinik_ChodOdsavania:= FALSE;
	END_IF
	
	//Ovládanie chladenia robota odlievania//
	doRobotOdliev_ChodChladenia:= TRUE;
	
	
	
	//Ovládanie chladenia gripra robota odlievania//
	IF RobotOdliev_Stav_Odparkovany THEN
		doRobotOdliev_ChladenieGripra:= FALSE;
	ELSE	
		doRobotOdliev_ChladenieGripra:= TRUE;
	END_IF	
	
	
	
	//Resetovanie poèitadiel poètu kusov//
	IF ResetPoctuVyrobenychKusov_Model THEN
		PocetVyrobenychKusov_Model:= 0;
		ResetPoctuVyrobenychKusov_Model:= FALSE;
	END_IF	
	
	IF ResetPoctuVyrobenychKusov_Smena THEN
		PocetVyrobenychKusov_Smena:= 0;
		ResetPoctuVyrobenychKusov_Smena:= FALSE;
	END_IF	
	

	//Volanie podprogramov//
	ZobrazenieTlacitok;
	OvladanieSafety;
	PriemernyTaktime;
	

	
	//Príznak volba programu je OK//
	IF ZvolenyNazovProduktu = '' OR ZvolenyProgramRobotManipulacie = 0 OR ZvolenyProgramRobotOdlievania = 0 OR VyskaBalika = 0 OR VyskaBalikaHornaTolerancia = 0 OR VyskaBalikaSpodnaTolerancia = 0 THEN
		VolbaProgramuOK:= FALSE;
	ELSE
		VolbaProgramuOK:= TRUE;
	END_IF	
	
	
	//Zobrazenie úvodnej obrazovky//
	IF NOT SafetyPLC_Nabehlo THEN
		CisloZadanejObrazovky:= 0;
		IF EDGEPOS (Blikac500ms = TRUE) THEN
			Slider:= Slider+1;
			IF Slider > 10 THEN
				Slider:= 0;
			END_IF
		END_IF
	END_IF
	
	
	
	//Zobrazenie hlásenia nízka teplota hliníka v peci//
	IF Pec_TeplotaHlinika < TeplotaHlinika_SpodnyLimit THEN
		CasTeplotyHlinika.IN:= TRUE;
	ELSIF Pec_TeplotaHlinika > TeplotaHlinika_HornyLimit THEN
		CasTeplotyHlinika.IN:= TRUE;
	ELSE
		CasTeplotyHlinika.IN:= FALSE;
	END_IF	
	
	IF CasTeplotyHlinika.Q THEN
		TP_ZobrazPopUp_TeplotaHlinikaNG:= 0;
		TeplotaHlinika_MimoRozsah:= TRUE;
	ELSE
		TP_ZobrazPopUp_TeplotaHlinikaNG:= 1;
		TeplotaHlinika_MimoRozsah:= FALSE;
	END_IF	
	
	CasTeplotyHlinika.PT:= T#5s;
	CasTeplotyHlinika();
	
	
		
		
		
	
	//Zobrazenie hlásenia skontroluj centrifugy//
	IF EDGEPOS(RobotMan_Tunel_KusyNG_NaMerani = TRUE) AND TunelVstup_KontrolaNaliatkovON THEN
		(*Zariadenie_KoniecCyklu:= TRUE;*)
		TP_ZobrazPopUp_KontrolaCentrifug:= 0;
	END_IF	
		
	
	//Prepnutie na hlavnú obrazovku//
	IF EDGEPOS (SafetyPLC_Nabehlo = TRUE) THEN
		CisloZadanejObrazovky:= 1;
	ELSIF SafetyPLC_Nabehlo AND CisloAktualnejObrazovky = 0 THEN
		CisloZadanejObrazovky:= 1;
	END_IF	
		
	
	
	//Prepnutie na obrazovku alarmov pri poruche//
	IF EDGEPOS(NastalaPorucha) THEN
		CisloZadanejObrazovky:= 102;
	END_IF	
	
	
	//Zobrazenie stavov hliníka v peci//
	IF EDGEPOS(RobotOdliev_Stav_NizkaHladina = TRUE) THEN
		TP_ZobrazPopUp_NizkaHladina:= 0;
		Zariadenie_KoniecCyklu:= TRUE;
	END_IF
	
	IF EDGEPOS(RobotOdliev_Stav_DoplnHlinik = TRUE) THEN
		TP_ZobrazPopUp_DoplnHlinik:= 0;
	END_IF
	
	
	
	
	//Zariadenie stav Homing OK//
	IF Stol_Manipulator_HomingOK AND Centrifuga1_Otacanie_HomingOK AND Centrifuga1_Zdvih1_HomingOK AND Centrifuga1_Zdvih2_HomingOK AND Centrifuga2_Otacanie_HomingOK AND Centrifuga2_Zdvih1_HomingOK AND Centrifuga2_Zdvih2_HomingOK THEN
		Zariadenie_HomingOK:= TRUE;
	ELSE	
		Zariadenie_HomingOK:= FALSE;
	END_IF	
	
		
	//Zariadenie stav Automat//
	IF Stol_Automat OR Stol_Manipulator_Automat OR Oddelovac_Automat OR Centrifuga1_Automat OR Centrifuga2_Automat OR Tunel_Automat OR TunelVstup_Automat OR RobotManipulacie_Automat OR RobotOdlievania_Automat THEN
		Zariadenie_StavAutomat:= TRUE;
	ELSE	
		Zariadenie_StavAutomat:= FALSE;
		PrebiehaUkoncenieVyroby:= FALSE;
		PrebiehaKoniecCyklu:= FALSE;
		Zariadenie_UkoncenieModelu:= FALSE;
	END_IF	
	
	//Zariadenie stav Manual//
	IF Stol_Manual OR Stol_Manipulator_Manual OR Oddelovac_Manual OR Stol_Manual OR Centrifuga1_Manual OR Centrifuga2_Manual OR Tunel_Manual OR TunelVstup_Manual OR RobotManipulacie_Manual OR RobotOdlievania_Manual THEN
		Zariadenie_StavManual:= TRUE;
	ELSE	
		Zariadenie_StavManual:= FALSE;
	END_IF
	
	//Zariadenie stav po inicializacii//
	IF Stol_PoINIT AND Stol_Manipulator_PoINIT AND Oddelovac_PoINIT AND (Centrifuga1_PoINIT OR Centrifuga1_OFF) AND (Centrifuga2_PoINIT OR Centrifuga2_OFF) AND Tunel_PoINIT AND TunelVstup_PoINIT AND RobotManipulacie_PoINIT AND RobotOdlievania_PoINIT THEN
		Zariadenie_StavPoINIT:= TRUE;
	ELSE
		Zariadenie_StavPoINIT:= FALSE;
	END_IF
	
	//Signál pre robot manipulácie linka pripravena//
	IF Stol_PoINIT AND (Centrifuga1_PoINIT OR Centrifuga1_OFF) AND (Centrifuga2_PoINIT OR Centrifuga2_OFF) AND Tunel_PoINIT AND TunelVstup_PoINIT THEN
		RobotManipulacie_LinkaPripravena:= TRUE;
	ELSE	
		RobotManipulacie_LinkaPripravena:= FALSE;
	END_IF	
	
	
	
	//Spustenie homingu zariadenia//
	IF Zariadenie_HOME AND BezpOkruhOplotenia_Aktivovany AND RobotMan_Stav_RezimAUTOMAT THEN
		RobotManipulacie_Automat:= TRUE;
		Stol_Manipulator_HOME:= TRUE;
		IF NOT Centrifuga1_OFF THEN
			Centrifuga1_Otacanie_HOME_Senzor:= TRUE;
			Centrifuga1_Zdvih1_HOME:= TRUE;
			Centrifuga1_Zdvih2_HOME:= TRUE;
		END_IF
		IF NOT Centrifuga2_OFF THEN
			Centrifuga2_Otacanie_HOME_Senzor:= TRUE;
			Centrifuga2_Zdvih1_HOME:= TRUE;
			Centrifuga2_Zdvih2_HOME:= TRUE;
		END_IF	
		Zariadenie_HOME:= FALSE;
	END_IF
	
	
	
	
	//Spustenie režimu automat//
	IF Zariadenie_Automat AND BezpOkruhOplotenia_Aktivovany THEN
		Stol_Automat:= TRUE;
		Stol_Manipulator_Automat:= TRUE;
		Oddelovac_Automat:= TRUE;
		IF NOT Centrifuga1_OFF THEN
			Centrifuga1_Automat:= TRUE;
		END_IF
		IF NOT Centrifuga2_OFF THEN
			Centrifuga2_Automat:= TRUE;
		END_IF	
		Tunel_Automat:= TRUE;
		TunelVstup_Automat:= TRUE;
		RobotManipulacie_Automat:= TRUE;
		RobotOdlievania_Automat:= TRUE;
		Zariadenie_Automat:= FALSE;
		IndukcnyOhrev_StavPreruseny:= FALSE;
	ELSIF Zariadenie_Automat AND NOT BezpOkruhOplotenia_Aktivovany THEN	
		Zariadenie_Automat:= FALSE;
	END_IF	
		
	//Spustenie režimu manual//
	IF Zariadenie_Manual AND BezpOkruhOplotenia_Aktivovany THEN
		Stol_Manual:= TRUE;
		Stol_Manipulator_Manual:= TRUE;
		Oddelovac_Manual:= TRUE;
		IF NOT Centrifuga1_OFF THEN
			Centrifuga1_Manual:= TRUE;
		END_IF
		IF NOT Centrifuga2_OFF THEN
			Centrifuga2_Manual:= TRUE;
		END_IF	
		Tunel_Manual:= TRUE;
		TunelVstup_Manual:= TRUE;
		RobotManipulacie_Manual:= TRUE;
		RobotOdlievania_Manual:= TRUE;
		Zariadenie_Manual:= FALSE;
	ELSIF Zariadenie_Manual AND NOT BezpOkruhOplotenia_Aktivovany THEN	
		Zariadenie_Manual:= FALSE;
	END_IF
	
	//Reset zariadenia//
	IF Zariadenie_Reset THEN
		Stol_Reset:= TRUE;
		Stol_Manipulator_Reset:= TRUE;
		Oddelovac_Reset:= TRUE;
		Centrifuga1_Reset:= TRUE;
		Centrifuga2_Reset:= TRUE;
		Tunel_Reset:= TRUE;
		TunelVstup_Reset:= TRUE;
		RobotManipulacie_Reset:= TRUE;
		RobotOdlievania_Reset:= TRUE;
		Zariadenie_Reset:= FALSE;
	END_IF	
	
	 
	//Ukonèenie výroby zariadenia//
	IF Zariadenie_KoniecVyroby AND Zariadenie_StavAutomat THEN
		Stol_KoniecVyroby:= TRUE;
		Stol_Manipulator_KoniecVyroby:= TRUE;
		Oddelovac_KoniecVyroby:= TRUE;
		IF NOT Centrifuga1_OFF THEN
			Centrifuga1_KoniecVyroby:= TRUE;
		END_IF
		IF NOT Centrifuga2_OFF THEN
			Centrifuga2_KoniecVyroby:= TRUE;
		END_IF	
		Tunel_KoniecVyroby:= TRUE;
		TunelVstup_KoniecVyroby:= TRUE;
		RobotManipulacie_KoniecVyroby:= TRUE;
		RobotOdlievania_KoniecVyroby:= TRUE;
		PrebiehaUkoncenieVyroby:= TRUE;
		Zariadenie_KoniecVyroby:= FALSE;
	ELSIF Zariadenie_KoniecVyroby AND NOT Zariadenie_StavAutomat THEN
		Zariadenie_KoniecVyroby:= FALSE;
	END_IF
	
	//Ukonèenie cyklu zariadenia//
	IF Zariadenie_KoniecCyklu THEN
		Stol_KoniecCyklu:= TRUE;
		Stol_Manipulator_KoniecCyklu:= TRUE;
		Oddelovac_KoniecCyklu:= TRUE;
		IF NOT Centrifuga1_OFF THEN
			Centrifuga1_KoniecCyklu:= TRUE;
		END_IF
		IF NOT Centrifuga2_OFF THEN
			Centrifuga2_KoniecCyklu:= TRUE;
		END_IF	
		TunelVstup_KoniecCyklu:= TRUE;
		Tunel_KoniecCyklu:= TRUE;
		RobotManipulacie_KoniecCyklu:= TRUE;
		RobotOdlievania_KoniecCyklu:= TRUE;
		PrebiehaKoniecCyklu:= TRUE;
		IndukcnyOhrev_StavPreruseny:= TRUE;
		Zariadenie_KoniecCyklu:= FALSE;
	END_IF
	
	
	
	
	
	
		END_PROGRAM

PROGRAM _EXIT
		(* Insert code here *)
	 
		END_PROGRAM

