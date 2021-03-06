
ACTION ZobrazenieTlacitok: 

	//**************************************Zamknutie tla��tka homing serv**************************************************************//
	IF BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND RobotMan_Stav_RezimAUTOMAT THEN
		TP_ZamkniTlacitkoHomingServ:= 0;
	ELSE	
		TP_ZamkniTlacitkoHomingServ:= 1;
	END_IF	
	
	//***************************************Zamknutie tla��tka automatick� re�im zariadenia*********************************************//
	IF ZvolenaUroven >= 10 AND BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND RobotMan_Stav_RezimAUTOMAT AND RobotOdliev_Stav_RezimAUTOMAT AND VolbaProgramuOK AND diStol_OhrevStavREADY AND Stav_ServaREADY THEN
		TP_ZamkniTlacitkoRezimAutomat:= 0;
	ELSE
		TP_ZamkniTlacitkoRezimAutomat:= 1;
	END_IF
	
	
	//*************************************Zamknutie tlacitka manualny re�im zariadenia*************************************************//
	IF ZvolenaUroven >= 20 AND BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND Stav_ServaREADY THEN
		TP_ZamkniTlacitkoRezimManual:= 0;
	ELSE	
		TP_ZamkniTlacitkoRezimManual:= 1;
	END_IF
	
	
	
	//**************************************Zamknutie tla��tka �tart zariadenia*********************************************************//
	IF ZvolenaUroven >= 10 AND BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND RobotMan_Stav_RezimAUTOMAT AND RobotOdliev_Stav_RezimAUTOMAT AND VolbaProgramuOK AND diStol_OhrevStavREADY AND NOT PrebiehaKoniecCyklu AND NOT PrebiehaUkoncenieVyroby AND NOT Tunel_Vyprazdnenie AND Stav_ServaREADY AND NOT TeplotaHlinika_MimoRozsah THEN
		TP_ZamkniTlacStartAutomat:= 0;
	ELSE
		TP_ZamkniTlacStartAutomat:= 1;
	END_IF	
	
	
	//Ovl�danie podsvietenia tla��tka �tart zariadenia//
	IF Zariadenie_StavAutomat AND NOT Zariadenie_StavPoINIT THEN
		BlikanieTlacitkaStartZariadenia:= Blikac500ms;
	ELSIF NOT Zariadenie_StavAutomat THEN
		BlikanieTlacitkaStartZariadenia:= FALSE;
	ELSIF Zariadenie_StavAutomat AND Zariadenie_StavPoINIT THEN	
		BlikanieTlacitkaStartZariadenia:= TRUE;
	END_IF	
	
	
	
	//***************************************Zamknutie tla��tka ukon�enie v�roby*******************************************************//
	IF Zariadenie_StavPoINIT AND NOT PrebiehaUkoncenieVyroby AND NOT PrebiehaKoniecCyklu THEN
		TP_ZamkniTlacUkoncenieVyroby:= 0;
	ELSE	
		TP_ZamkniTlacUkoncenieVyroby:= 1;
	END_IF
	
	//***************************************Zamknutie tla��tka ukon�enie cyklu*********************************************************//
	IF Zariadenie_StavPoINIT AND NOT PrebiehaKoniecCyklu THEN
		TP_ZamkniTlacKoniecCyklu:= 0;
	ELSE	
		TP_ZamkniTlacKoniecCyklu:= 1;
	END_IF	
	
	
	
	//***************************************Zamknutie tla��tka Ru�n� re�im st�l s ohrevom**********************************************//
	IF BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND Stav_ServaREADY AND ZvolenaUroven >= 20 THEN
		TP_ZamkniTlacitkoRR_Stol:= 0;
	ELSE	
		TP_ZamkniTlacitkoRR_Stol:= 1;
	END_IF
	
	
	//***************************************Zamknutie tla��tka Ru�n� re�im centrifuga 1**********************************************//
	IF BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND Stav_ServaREADY AND ZvolenaUroven >= 20 THEN
		TP_ZamkniTlacitkoRR_Centrifuga1:= 0;
	ELSE	
		TP_ZamkniTlacitkoRR_Centrifuga1:= 1;
	END_IF
	
	//***************************************Zamknutie tla��tka Ru�n� re�im centrifuga 2**********************************************//
	IF BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND Stav_ServaREADY AND ZvolenaUroven >= 20 THEN
		TP_ZamkniTlacitkoRR_Centrifuga2:= 0;
	ELSE	
		TP_ZamkniTlacitkoRR_Centrifuga2:= 1;
	END_IF
	
	//***************************************Zamknutie tla��tka Ru�n� re�im tunel***************************************************//
	IF BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND ZvolenaUroven >= 20 THEN
		TP_ZamkniTlacitkoRR_Tunel:= 0;
	ELSE	
		TP_ZamkniTlacitkoRR_Tunel:= 1;
	END_IF
	
	//***************************************Zamknutie tla��tka Ru�n� re�im robot manipul�cie**********************************************//
	IF BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND ZvolenaUroven >= 20 THEN
		TP_ZamkniTlacitkoRR_RobotManip:= 0;
	ELSE	
		TP_ZamkniTlacitkoRR_RobotManip:= 1;
	END_IF
	
	
	//***************************************Zamknutie tla��tka z�mku dver� robot manipul�cie**********************************************//
	IF NOT Zariadenie_StavAutomat THEN
		TP_ZamkniTlacitkoZamokRobManip:= 0;
	ELSE	
		TP_ZamkniTlacitkoZamokRobManip:= 1;
	END_IF
	
	
	
	//***************************************Zamknutie tla��tka z�mku dver� robot odlievania*************************************************//
	IF NOT Zariadenie_StavAutomat THEN
		TP_ZamkniTlacitkoZamokRobOdliev:= 0;
	ELSE
		TP_ZamkniTlacitkoZamokRobOdliev:= 1;
	END_IF
	
	//***************************************Zamknutie tla��tka z�mku ochrann�ho krytu v�stupu tunela*****************************************//
	IF NOT Zariadenie_StavAutomat THEN
		TP_ZamkniTlacitkoZamokTunel:= 0;
	ELSE
		TP_ZamkniTlacitkoZamokTunel:= 1;
	END_IF
	
	//**************************************Zamknutie tla��tok pojazdu vstupn�ho manipul�tora**************************************************//
	IF diVstupManipul_ZasunutyHORE AND Stol_Manipulator_HomingOK THEN
		TP_ZamkniTlacitkoPojazdManipul:= 0;
	ELSE
		TP_ZamkniTlacitkoPojazdManipul:= 1;
	END_IF
	
	//**************************************Zamknutie tla��tok ot��ania stola******************************************************************//
	IF Stol_BlokaciaOtacania THEN
		TP_ZamkniTlacitkoOtacaniaStola:= 1;
	ELSE	
		TP_ZamkniTlacitkoOtacaniaStola:= 0;
	END_IF	
	
	//**************************************Zamknutie tla��tka tunel dopravnik chod vpred*********************************************************************************//
	IF Tunel_BlokaciaDopravnika OR NOT diTunel_KoliziaNaVystupeDoprav THEN
		TP_ZamkniTlacitkoTunelDoprVpred:= 1;
	ELSE	
		TP_ZamkniTlacitkoTunelDoprVpred:= 0;
	END_IF
	
	//***************************************Zamknutie tla��tka tunel dopravn�k chod vzad*******************************************************//
	IF Tunel_BlokaciaDopravnika THEN
		TP_ZamkniTlacitkoTunelDoprVzad:= 1;
	ELSE	
		TP_ZamkniTlacitkoTunelDoprVzad:= 0;
	END_IF	
	
	
	//*****************************************Zamknutie tla��tka tunel vypr�zdnenie************************************************************//
	IF NOT Zariadenie_StavAutomat AND BezpOkruhOplotenia_Aktivovany AND NOT Tunel_Vyprazdnenie AND NOT NastalaPorucha AND ZvolenaUroven >= 10 THEN 
		TP_ZamkniTlacitkoTunelVyprazdni:= 0;
	ELSE
		TP_ZamkniTlacitkoTunelVyprazdni:= 1;
	END_IF
	
	//***************************************Zamknutie tla��tok ot��ania centrifugy 1***********************************************************//
	IF Centrifuga1_Otacanie_HomingOK THEN
		TP_ZamkniTlacitkoCentr1_Otacanie:= 0;
	ELSE	
		TP_ZamkniTlacitkoCentr1_Otacanie:= 1;
	END_IF
	
	//***************************************Zamknutie tla��tka inicializ�cia ot��ania centrifugy 1**********************************************//
	IF RobotMan_Centrifug1_BezpVzdialen THEN
		TP_ZamkniTlacitkoCentr1_InitOtac:= 0;
	ELSE	
		TP_ZamkniTlacitkoCentr1_InitOtac:= 1;
	END_IF	
	
	
	
	//***************************************Zamknutie tla��tok zdvihu centrifugy 1 vretena 1****************************************************//
	IF Centrifuga1_Zdvih1_HomingOK THEN
		TP_ZamkniTlacitkoCentr1_ZdvihVR1:= 0;
	ELSE
		TP_ZamkniTlacitkoCentr1_ZdvihVR1:= 1;
	END_IF	
	
	//***************************************Zamknutie tla��tok zdvihu centrifugy 1 vretena 2****************************************************//
	IF Centrifuga1_Zdvih2_HomingOK THEN
		TP_ZamkniTlacitkoCentr1_ZdvihVR2:= 0;
	ELSE	
		TP_ZamkniTlacitkoCentr1_ZdvihVR2:= 1;
	END_IF	
		
	//***************************************Zamknutie tla��tok ot��ania centrifugy 2***********************************************************//
	IF Centrifuga2_Otacanie_HomingOK THEN
		TP_ZamkniTlacitkoCentr2_Otacanie:= 0;
	ELSE
		TP_ZamkniTlacitkoCentr2_Otacanie:= 1;
	END_IF	
	
	//***************************************Zamknutie tla��tka inicializ�cia ot��ania centrifugy 2**********************************************//
	IF RobotMan_Centrifug2_BezpVzdialen THEN
		TP_ZamkniTlacitkoCentr2_InitOtac:= 0;
	ELSE	
		TP_ZamkniTlacitkoCentr2_InitOtac:= 1;
	END_IF	
	
	
	
	//***************************************Zamknutie tla��tok zdvihu centrifugy 2 vretena 1****************************************************//
	IF Centrifuga2_Zdvih1_HomingOK THEN
		TP_ZamkniTlacitkoCentr2_ZdvihVR1:= 0;
	ELSE
		TP_ZamkniTlacitkoCentr2_ZdvihVR1:= 1;
	END_IF	
	
	//***************************************Zamknutie tla��tok zdvihu centrifugy 2 vretena 2****************************************************//
	IF Centrifuga2_Zdvih2_HomingOK THEN
		TP_ZamkniTlacitkoCentr2_ZdvihVR2:= 0;
	ELSE
		TP_ZamkniTlacitkoCentr2_ZdvihVR2:= 1;
	END_IF
	
	//***************************************Zamknutie tla��tka spustenie induk�n�ho ohrevu*******************************************************//
	IF diStol_OhrevStavREADY AND BezpOkruhOplotenia_Aktivovany THEN
		TP_ZamkniTlacitkoIndukOhrevu:= 0;
	ELSE	
		TP_ZamkniTlacitkoIndukOhrevu:= 1;
	END_IF	
	
	
	//***************************************Zamknutie tla��tka odparkuj, servisna poz�cia robot odlievania***********************************************************//
	IF ZvolenaUroven >= 10 AND BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND RobotOdliev_Stav_RezimAUTOMAT AND SC_RobotOdlievania.Step = 1 THEN
		TP_ZamkniTlacitkoRobOdlievParkov:= 0;
	ELSE
		TP_ZamkniTlacitkoRobOdlievParkov:= 1;
	END_IF
	
	
	//****************************************Zamknutie tla��tka poz�cia ohrevu ly��c, robot odlievania****************************************************************//
	IF ZvolenaUroven >= 10 AND BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND RobotOdliev_Stav_RezimAUTOMAT AND SC_RobotOdlievania.Step = 1 THEN
		TP_ZamkniTlacitkoRobOdlievOhrev:= 0;
	ELSE
		TP_ZamkniTlacitkoRobOdlievOhrev:= 1;
	END_IF	
	
	
	//***************************************Zamknutie tla��tka odparkuj robot manipul�cie***********************************************************//
	IF ZvolenaUroven >= 10 AND BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND RobotMan_Stav_RezimAUTOMAT AND SC_RobotManipulacie.Step = 1 THEN 
		TP_ZamkniTlacitkoRobManipParkov:= 0;
	ELSE	
		TP_ZamkniTlacitkoRobManipParkov:= 1;
	END_IF
	
	//***************************************Zamknutie tla��tka prepl�chnutia ly��c robota odlievania************************************************//
	IF ZvolenaUroven >= 10 AND BezpOkruhOplotenia_Aktivovany AND NOT NastalaPorucha AND RobotOdliev_Stav_RezimAUTOMAT AND SC_RobotOdlievania.Step = 1 THEN
		TP_ZamkniTlacitkoRobOdlievPrepl:= 0;
	ELSE
		TP_ZamkniTlacitkoRobOdlievPrepl:= 1;
	END_IF	

	//***************************************Zamknutie tla��tok volby v�roby manipul�tora*************************************************************//
	IF ZvolenaUroven >= 10 AND NOT Stol_Manipulator_Automat THEN
		TP_ZamkniTlacitkaVolbyVyroby:= 0;
	ELSE
		TP_ZamkniTlacitkaVolbyVyroby:= 1;
	END_IF
	

	//****************************************Zamknutie tla��tka otvor centrifugu 1*******************************************************************//
	IF ZvolenaUroven >= 10 AND NOT Centrifuga1_Automat AND NOT StavPrebiehaOtvorenieCentrif_1 AND BezpOkruhOplotenia_Aktivovany AND Stav_ServaREADY THEN
		TP_ZamkniTlacitkoOtvorCentrif_1:= 0;
	ELSE	
		TP_ZamkniTlacitkoOtvorCentrif_1:= 1;
	END_IF	
	
	
	//****************************************Zamknutie tla��tka otvor centrifugu 2*******************************************************************//
	IF ZvolenaUroven >= 10 AND NOT Centrifuga2_Automat AND NOT StavPrebiehaOtvorenieCentrif_2 AND BezpOkruhOplotenia_Aktivovany AND Stav_ServaREADY THEN
		TP_ZamkniTlacitkoOtvorCentrif_2:= 0;
	ELSE	
		TP_ZamkniTlacitkoOtvorCentrif_2:= 1;
	END_IF	
	
	
	//****************************************Zamknutie tla��tka Centrifuga 1 OFF***********************************************************************//
	IF ZvolenaUroven >= 20 AND NOT Zariadenie_StavAutomat THEN
		TP_ZamkniTlacitkoOFF_Centrifuga1:= 0;
	ELSE	
		TP_ZamkniTlacitkoOFF_Centrifuga1:= 1;
	END_IF	
	
	//****************************************Zamknutie tla��tka Centrifuga 2 OFF***********************************************************************//
	IF ZvolenaUroven >= 20 AND NOT Zariadenie_StavAutomat THEN
		TP_ZamkniTlacitkoOFF_Centrifuga2:= 0;
	ELSE	
		TP_ZamkniTlacitkoOFF_Centrifuga2:= 1;
	END_IF	
	
	//*****************************************Zamknutie tla��tok volby po�tu kusov na vstupe tunela*****************************************************//
	IF ZvolenaUroven >= 10 AND NOT TunelVstup_Automat THEN
		TP_ZamkniTlacitkaPocetKusovVtun:= 0;
	ELSE	
		TP_ZamkniTlacitkaPocetKusovVtun:= 1;
	END_IF	
	
	
	
	
	//Zobrazenie tla��tka Home//
	IF Zariadenie_StavAutomat THEN
		TP_ZobrazTlacitkoHome:= 1;
	ELSE	
		TP_ZobrazTlacitkoHome:= 0;
	END_IF	
	
	
	//Zobrazenie hl�senia nezvolen� program//
	IF VolbaProgramuOK THEN
		TP_ZobrazPopUp_NezvolenyProgram:= 1;
	ELSE
		TP_ZobrazPopUp_NezvolenyProgram:= 0;
	END_IF	
	
	
	//Zobrazenie hl�senia induk�n� ohrev je vypnut�//
	IF diStol_OhrevStavREADY THEN
		TP_ZobrazPopUp_IndukOhrevVypnut:= 1;
	ELSE
		TP_ZobrazPopUp_IndukOhrevVypnut:= 0;
	END_IF
	
	
	//Zobrazenie hl�senia robot odlievania nieje v automate//
	IF RobotOdliev_Stav_RezimAUTOMAT THEN
		TP_ZobrazPopUp_RobOdlievVypnut:= 1;
	ELSE
		TP_ZobrazPopUp_RobOdlievVypnut:= 0;
	END_IF	
	
	
	
	//Zobrazenie hl�senia robot manipulacie nieje v automate//
	IF RobotMan_Stav_RezimAUTOMAT THEN
		TP_ZobrazPopUp_RobManipVypnut:= 1;
	ELSE
		TP_ZobrazPopUp_RobManipVypnut:= 0;
	END_IF	
	
	//Zobrazenie hl�senia n�zke naliatky//
	IF Zariadenie_StavAutomat THEN
		IF EDGEPOS (RobotMan_Tunel_KusyNG_NaMerani = TRUE) THEN
			TP_ZobrazPopUp_NizkeNaliatky:= 0;
			(*Zariadenie_KoniecCyklu:= TRUE;*)
		END_IF
	END_IF	
	
	//Zobrazenie hl�senia z�mky vyblokovan�//
	IF RezimServis THEN
		TP_ZobrazHlasenieZamkyVyblokov:= 0;
	ELSE
		TP_ZobrazHlasenieZamkyVyblokov:= 1;
	END_IF
	
	
	
	
	//0-siv�, 1- �lt�, 2- zelen�, 3- �erven�//
	//Stav zariadenia oddelova�//
	IF PoruchaOddelovaca THEN
		StavOddelovaca:= 3;
	ELSIF NOT Oddelovac_Automat THEN
		StavOddelovaca:= 0;
	ELSIF Oddelovac_Automat AND NOT Oddelovac_PoINIT THEN
		StavOddelovaca:= 1;
	ELSIF Oddelovac_Automat AND Oddelovac_PoINIT THEN
		StavOddelovaca:= 2;
	END_IF
	
	//Stav zariadenia vstupn� manipul�tor//
	IF PoruchaVstupManipulator THEN
		StavManipulatora:= 3;
	ELSIF NOT Stol_Manipulator_Automat THEN
		StavManipulatora:= 0;
	ELSIF Stol_Manipulator_Automat AND NOT Stol_Manipulator_PoINIT THEN
		StavManipulatora:= 1;
	ELSIF Stol_Manipulator_Automat AND Stol_Manipulator_PoINIT THEN
		StavManipulatora:= 2;	
	END_IF
	
	//Stav zariadenia stol//
	IF PoruchaOtocnyStol THEN
		StavStola:= 3;
	ELSIF NOT Stol_Automat THEN
		StavStola:= 0;
	ELSIF Stol_Automat AND NOT Stol_PoINIT THEN
		StavStola:= 1;
	ELSIF Stol_Automat AND Stol_PoINIT THEN
		StavStola:= 2;	
	END_IF
	
	//Stav zariadenia centrifuga 1//
	IF PoruchaCentrifugy1 THEN
		StavCentrifugy_1:= 3;
	ELSIF NOT Centrifuga1_Automat THEN
		StavCentrifugy_1:= 0;
	ELSIF Centrifuga1_Automat AND NOT Centrifuga1_PoINIT THEN
		StavCentrifugy_1:= 1;
	ELSIF Centrifuga1_Automat AND Centrifuga1_PoINIT THEN
		StavCentrifugy_1:= 2;	
	END_IF
	
	//Stav zariadenia centrifuga 2//
	IF PoruchaCentrifugy2 THEN
		StavCentrifugy_2:= 3;
	ELSIF NOT Centrifuga2_Automat THEN
		StavCentrifugy_2:= 0;
	ELSIF Centrifuga2_Automat AND NOT Centrifuga2_PoINIT THEN
		StavCentrifugy_2:= 1;
	ELSIF Centrifuga2_Automat AND Centrifuga2_PoINIT THEN
		StavCentrifugy_2:= 2;	
	END_IF
	
	
	//Stav zariadenia vstup chladiac� tunel//
	IF PoruchaVstupuChladiacehoTunela THEN
		StavTunelaVstup:= 3;
	ELSIF NOT TunelVstup_Automat THEN
		StavTunelaVstup:= 0;
	ELSIF TunelVstup_Automat AND NOT TunelVstup_PoINIT THEN
		StavTunelaVstup:= 1;
	ELSIF TunelVstup_Automat AND TunelVstup_PoINIT THEN
		StavTunelaVstup:= 2;
	END_IF
	
	
	
	
	//Stav zariadenia chladiac� tunel//
	IF PoruchaChladiacehoTunela THEN
		StavTunela:= 3;
	ELSIF NOT Tunel_Automat THEN
		StavTunela:= 0;
	ELSIF Tunel_Automat AND NOT Tunel_PoINIT THEN
		StavTunela:= 1;
	ELSIF Tunel_Automat AND Tunel_PoINIT THEN
		StavTunela:= 2;
	END_IF
	
	//Stav zariadenia robot manipul�cie//
	IF PoruchaRobotManipulacie THEN
		StavRobotaManipulacie:= 3;
	ELSIF NOT RobotManipulacie_Automat THEN
		StavRobotaManipulacie:= 0;
	ELSIF RobotManipulacie_Automat AND NOT RobotManipulacie_PoINIT THEN
		StavRobotaManipulacie:= 1;
	ELSIF RobotManipulacie_Automat AND RobotManipulacie_PoINIT THEN
		StavRobotaManipulacie:= 2;	
	END_IF	
	
	//Stav zariadenia robot odlievania//
	IF PoruchaRobotOdlievania THEN
		StavRobotaOdlievania:= 3;
	ELSIF NOT RobotOdlievania_Automat THEN
		StavRobotaOdlievania:= 0;
	ELSIF RobotOdlievania_Automat AND NOT RobotOdlievania_PoINIT THEN
		StavRobotaOdlievania:= 1;
	ELSIF RobotOdlievania_Automat AND RobotOdlievania_PoINIT THEN
		StavRobotaOdlievania:= 2;
	END_IF	
	
	
	
	//Stav zariadenia induk�n� ohrev//
	IF diStol_OhrevStavREADY THEN
		StavIndukcnehoOhrevu:= 2;
	ELSE	
		StavIndukcnehoOhrevu:= 3;
	END_IF	
	
	//Zobrazenie stavov na linke//
	IF NOT Zariadenie_StavAutomat AND NOT NastalaPorucha THEN
		StavLinky:= 0;
	ELSIF Zariadenie_StavAutomat AND NOT Zariadenie_StavPoINIT AND NOT NastalaPorucha AND NOT PrebiehaUkoncenieVyroby AND NOT PrebiehaKoniecCyklu THEN
		StavLinky:= 1;
	ELSIF Zariadenie_StavAutomat AND Zariadenie_StavPoINIT AND NOT NastalaPorucha AND NOT PrebiehaUkoncenieVyroby AND NOT PrebiehaKoniecCyklu THEN
		StavLinky:= 2;	
	ELSIF Zariadenie_StavAutomat AND PrebiehaUkoncenieVyroby AND NOT NastalaPorucha THEN
		StavLinky:= 3;
	ELSIF Zariadenie_StavAutomat AND PrebiehaKoniecCyklu AND NOT NastalaPorucha THEN
		StavLinky:= 3;	
	ELSIF NastalaPorucha THEN
		StavLinky:= 4;
	END_IF	
	
	
	//Stav z�mku robot odlievania//
	IF diDvereRobotOdliev_PetlicaZasun AND NOT diDvereRobotOdliev_DvereZamkn THEN
		StavZamkuRobotOdlievania:= Blikac500ms;
	ELSIF diDvereRobotOdliev_PetlicaZasun AND diDvereRobotOdliev_DvereZamkn THEN
		StavZamkuRobotOdlievania:= 2;
	ELSE
		StavZamkuRobotOdlievania:= 3;
	END_IF	
		
	//Stav z�mku robot manipul�cie//
	IF diDvereRobotMan_PetlicaZasunuta AND NOT diDvereRobotMan_DvereZamknute THEN
		StavZamkuRobotManipulacie:= Blikac500ms;
	ELSIF diDvereRobotMan_PetlicaZasunuta AND diDvereRobotMan_DvereZamknute THEN
		StavZamkuRobotManipulacie:= 2;
	ELSE
		StavZamkuRobotManipulacie:= 3;
	END_IF	
	
	
	//Stav z�mku v�stup tunela//
	IF diTunel_Vystup_BZ_PritomnPetlice AND NOT Stav_BZ3_Zamknuty THEN
		StavZamkuVystupTunela:= Blikac500ms;
	ELSIF diTunel_Vystup_BZ_PritomnPetlice AND Stav_BZ3_Zamknuty THEN
		StavZamkuVystupTunela:= 2;
	ELSE	
		StavZamkuVystupTunela:= 3;
	END_IF	
	
	
	
	//Siva - 7, �erven� - 51, Zelen� - 10, Modr� - 11//
	//Prep�nanie farieb na bargrafe teploty hlin�ka v peci//
	IF Pec_TeplotaHlinika < 720 THEN
		TeplotaHlinika_FarbaGrafu:= 11;
	ELSIF Pec_TeplotaHlinika > 750 THEN
		TeplotaHlinika_FarbaGrafu:= 51;
	ELSE	
		TeplotaHlinika_FarbaGrafu:= 10;
	END_IF	
	
	//Prep�nanie farieb na bargrafe teploty rotora na vonkaj�om okruhu stola//
	IF Stol_TS_VonkajOkruhAktualStupne < TP_Stol_SpodnaHranicaTeplotyOK THEN
		TeplRotoraVonkOkruh_FarbaGrafu:= 11;
	ELSIF Stol_TS_VonkajOkruhAktualStupne > TP_Stol_HornaHranicaTeplotyOK THEN
		TeplRotoraVonkOkruh_FarbaGrafu:= 51;
	ELSE	
		TeplRotoraVonkOkruh_FarbaGrafu:= 10;
	END_IF	
		
	//Prep�nanie farieb na bargrafe teploty rotora na vn�tornom okruhu stola//
	IF Stol_TS_VnutorOkruhAktualStupne < TP_Stol_SpodnaHranicaTeplotyOK THEN
		TeplRotoraVnutOkruh_FarbaGrafu:= 11;
	ELSIF Stol_TS_VnutorOkruhAktualStupne > TP_Stol_HornaHranicaTeplotyOK THEN
		TeplRotoraVnutOkruh_FarbaGrafu:= 51;
	ELSE	
		TeplRotoraVnutOkruh_FarbaGrafu:= 10;
	END_IF	
	
	
	//Prep�nanie farieb na bargrafe ot��ok centrifugy 1//
	IF Centrifuga1_Otac_AktualneOtacMin < ZvolRychlostOtacaniaPriOdlievani THEN
		OtackyCentrifugy1_FarbaGrafu:= 11;
	ELSIF Centrifuga1_Otac_AktualneOtacMin > ZvolRychlostOtacaniaPriOdlievani THEN
		OtackyCentrifugy1_FarbaGrafu:= 51;
	ELSE
		OtackyCentrifugy1_FarbaGrafu:= 10;
	END_IF	
	
		
	//Prep�nanie farieb na bargrafe ot��ok centrifugy 2//
	IF Centrifuga2_Otac_AktualneOtacMin < ZvolRychlostOtacaniaPriOdlievani THEN
		OtackyCentrifugy2_FarbaGrafu:= 11;
	ELSIF Centrifuga2_Otac_AktualneOtacMin > ZvolRychlostOtacaniaPriOdlievani THEN
		OtackyCentrifugy2_FarbaGrafu:= 51;
	ELSE
		OtackyCentrifugy2_FarbaGrafu:= 10;
	END_IF	
	
	
	
	
	
	
	
END_ACTION
