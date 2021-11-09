
ACTION OvladanieSafety: 

	SafetyPLC_Nabehlo;
	Reset_CS;
	Reset_Oplotenia;
	Reset_ZamkuTunelVystup;
	BezpOkruhCS_Aktivovany;
	BezpOkruhOplotenia_Aktivovany;
	Stav_BZ1_Zamknuty;
	Stav_BZ2_Zamknuty;
	Stav_BZ3_Zamknuty;
	Stav_CS_BZ1_Odblokovany;
	Stav_CS_BZ2_Odblokovany;
	Stav_CS_DokonStanica_Odblokovane;
	Stav_CS_Linky_Odblokovane;
	Stav_CS_RoboManipul_Odblokovane;
	Stav_CS_RobotOdliev_Odblokovane;
	Zamkni_BZ1;
	Zamkni_BZ2;
	Zamkni_BZ3;
	siTunel_Vystup_BZ_KanalA;
	siTunel_Vystup_BZ_KanalB;
	diStavBezpRele_OtocnyStol;
	diStavBezpRele_Centrifugy;
	diStavBezpRele_Tunel;
	diStavBezpRele_OplotenieLinky;
	diStavBezpRele_StavCS_Linky;
	diStavBezpRele_Vystupy_Vzduch;
	diStav_HlavPrivoduVzduchuKanalA;
	diStav_HlavPrivoduVzduchuKanalB;
	doDvereRobotOdliev_ZamkniDvere;
	doDvereRobotMan_ZamkniDvere;
	doDvereRobotMan_ZelenaLED;
	doDvereRobotOdliev_ZelenaLED;
	siCS_DokoncovaciaStanica_KanalA;
	siCS_DokoncovaciaStanica_KanalB;
	siCS_DvereRobotMan_KanalA;
	siCS_DvereRobotMan_KanalB;
	siCS_DvereRobotOdliev_KanalA;
	siCS_DvereRobotOdliev_KanalB;
	siCS_Linka_KanalA;
	siCS_Linka_KanalB;
	siCS_RobotManipulacie_KanalA;
	siCS_RobotManipulacie_KanalB;
	siCS_RobotOdlievania_KanalA;
	siCS_RobotOdlievania_KanalB;
	siDvereRobotMan_KanalA;
	siDvereRobotMan_KanalB;
	siDvereRobotOdliev_KanalA;
	siDvereRobotOdliev_KanalB;
	siTunel_Vystup_BZ_KanalA;
	siTunel_Vystup_BZ_KanalB;
	
	
	//***********************************Zrušenie režimu servis**********************************************************************************//
	IF ZvolenaUroven <> 1000 THEN
		RezimServis:= FALSE;
	END_IF	
	
	
	
	
	//***********************************Odhlásenie uživatela***********************************************************************************************//
	IF (ZvolenaUroven > 0 AND ZvolenaUroven < 1000)  AND NOT Zariadenie_StavAutomat AND NOT Zariadenie_StavManual THEN
		CasPredOdhlasenimUzivatela.IN:= TRUE;
	ELSE	
		CasPredOdhlasenimUzivatela.IN:= FALSE;
	END_IF
	
	IF CasPredOdhlasenimUzivatela.Q THEN
		OdhlasUzivatela:= TRUE;
	END_IF
	
	IF EDGEPOS(Zariadenie_StavPoINIT = TRUE) THEN	
		IF ZvolenaUroven < 1000 THEN
			OdhlasUzivatela:= TRUE;
		END_IF	
	END_IF
	
	CasPredOdhlasenimUzivatela.PT:= T#7m;
	CasPredOdhlasenimUzivatela();
	
	//*************************************Ovladanie zámku servisných dverí è.1 - Robot manipulácie********************************************************//
	IF NOT Zariadenie_StavAutomat AND ZvolenaUroven > 0 AND BezpOkruhCS_Aktivovany THEN
		IF EDGEPOS (Zamkni_BZ1 = TRUE) THEN
			IF diDvereRobotMan_PetlicaZasunuta AND NOT diDvereRobotMan_DvereZamknute THEN
				doDvereRobotMan_ZamkniDvere:= TRUE;
			ELSIF diDvereRobotMan_DvereZamknute AND NOT Zariadenie_StavAutomat THEN
				doDvereRobotMan_ZamkniDvere:= FALSE;
			END_IF
		ELSIF diDvereRobotMan_ZeleneTlacidlo AND diDvereRobotMan_PetlicaZasunuta AND NOT diDvereRobotMan_DvereZamknute THEN
			doDvereRobotMan_ZamkniDvere:= TRUE;
		ELSIF diDvereRobotMan_CerveneTlacidlo AND diDvereRobotMan_DvereZamknute THEN
			doDvereRobotMan_ZamkniDvere:= FALSE;
		END_IF
	ELSIF NOT Zariadenie_StavAutomat AND ZvolenaUroven = 0 AND BezpOkruhCS_Aktivovany THEN	
		IF diDvereRobotMan_PetlicaZasunuta AND NOT diDvereRobotMan_DvereZamknute THEN
			doDvereRobotMan_ZamkniDvere:= TRUE;
		END_IF	
	ELSIF NOT BezpOkruhCS_Aktivovany THEN
		doDvereRobotMan_ZamkniDvere:= FALSE;
	END_IF	
	
	
	
	//Ovládanie podsvietenia tlaèítok zámkov dverí è.1 - Robot manipulácie//
	IF NOT Zariadenie_StavAutomat AND diDvereRobotMan_DvereZamknute AND ZvolenaUroven > 0 AND BezpOkruhCS_Aktivovany THEN
		doDvereRobotMan_ZelenaLED:= FALSE;
		doDvereRobotMan_CervenaLED:= TRUE;
	ELSIF NOT Zariadenie_StavAutomat AND NOT diDvereRobotMan_DvereZamknute AND ZvolenaUroven > 0 AND BezpOkruhCS_Aktivovany THEN
		doDvereRobotMan_CervenaLED:= FALSE;
		doDvereRobotMan_ZelenaLED:= TRUE;
	ELSE 
		doDvereRobotMan_ZelenaLED:= FALSE;
		doDvereRobotMan_CervenaLED:= FALSE;
	END_IF	
	
	
	
	
	
	
	
	//*************************************************Ovladanie zámku servisných dverí è.2 - Robot odlievania*****************************************************//
	IF NOT Zariadenie_StavAutomat AND ZvolenaUroven > 0 AND BezpOkruhCS_Aktivovany THEN
		IF EDGEPOS (Zamkni_BZ2 = TRUE) THEN
			IF diDvereRobotOdliev_PetlicaZasun AND NOT diDvereRobotOdliev_DvereZamkn THEN
				doDvereRobotOdliev_ZamkniDvere:= TRUE;
			ELSIF diDvereRobotOdliev_DvereZamkn AND NOT Zariadenie_StavAutomat THEN
				doDvereRobotOdliev_ZamkniDvere:= FALSE;
			END_IF
		ELSIF diDvereRobotOdliev_ZeleneTlac AND diDvereRobotOdliev_PetlicaZasun AND NOT diDvereRobotOdliev_DvereZamkn THEN
			doDvereRobotOdliev_ZamkniDvere:= TRUE;
		ELSIF diDvereRobotOdliev_CerveneTlac AND diDvereRobotOdliev_DvereZamkn THEN
			doDvereRobotOdliev_ZamkniDvere:= FALSE;
		END_IF
	ELSIF NOT Zariadenie_StavAutomat AND ZvolenaUroven = 0 AND BezpOkruhCS_Aktivovany THEN	
		IF diDvereRobotOdliev_PetlicaZasun AND NOT diDvereRobotOdliev_DvereZamkn THEN
			doDvereRobotOdliev_ZamkniDvere:= TRUE;
		END_IF
	ELSIF NOT BezpOkruhCS_Aktivovany THEN
		doDvereRobotOdliev_ZamkniDvere:= FALSE;	
	END_IF	
	
	
	//Ovládanie podsvietenia tlaèítok zámkov dverí è.2 - Robot odlievania//
	IF NOT Zariadenie_StavAutomat AND diDvereRobotOdliev_DvereZamkn AND ZvolenaUroven > 0 AND BezpOkruhCS_Aktivovany THEN
		doDvereRobotOdliev_ZelenaLED:= FALSE;
		doDvereRobotOdliev_CervenaLED:= TRUE;
	ELSIF NOT Zariadenie_StavAutomat AND NOT diDvereRobotOdliev_DvereZamkn AND ZvolenaUroven > 0 AND BezpOkruhCS_Aktivovany THEN
		doDvereRobotOdliev_CervenaLED:= FALSE;
		doDvereRobotOdliev_ZelenaLED:= TRUE;
	ELSE 
		doDvereRobotOdliev_ZelenaLED:= FALSE;
		doDvereRobotOdliev_CervenaLED:= FALSE;
	END_IF	
	
	
	
	//*********************************************************Ovladanie zámku - výstup tunela************************************************************************//
	IF EDGEPOS (Zamkni_BZ3 = TRUE) AND ZvolenaUroven > 0 THEN
		IF diTunel_Vystup_BZ_PritomnPetlice AND NOT Stav_BZ3_Zamknuty THEN
			doTunel_Vystup_ZamkniBZ:= TRUE;
		ELSIF Stav_BZ3_Zamknuty AND NOT Zariadenie_StavAutomat THEN
			doTunel_Vystup_ZamkniBZ:= FALSE;
		END_IF
	ELSIF ZvolenaUroven = 0 THEN
		IF diTunel_Vystup_BZ_PritomnPetlice AND NOT Stav_BZ3_Zamknuty THEN
			doTunel_Vystup_ZamkniBZ:= TRUE;
		END_IF	
	END_IF	
	
	
	
	
	//Resetovanie oplotenia//
	IF (Stav_BZ1_Zamknuty AND Stav_BZ2_Zamknuty AND Stav_BZ3_Zamknuty) OR RezimServis THEN
		CasPredResetomOplotenia.IN:= TRUE;
	ELSE
		CasPredResetomOplotenia.IN:= FALSE;
	END_IF
	
	IF CasPredResetomOplotenia.Q AND NOT BezpOkruhOplotenia_Aktivovany THEN
		Reset_Oplotenia:= TRUE;
	ELSE	
		Reset_Oplotenia:= FALSE;
	END_IF	
	
	
	CasPredResetomOplotenia.PT:= T#500ms;
	CasPredResetomOplotenia();
	
	
	//*******************************Modré podsvietenie tlaèítka reset CS***************************************************************************//
	Reset_CS;
	IF Stav_CS_Linky_Odblokovane AND Stav_CS_DokonStanica_Odblokovane AND Stav_CS_BZ1_Odblokovany AND Stav_CS_BZ2_Odblokovany AND Stav_CS_RoboManipul_Odblokovane AND Stav_CS_RobotOdliev_Odblokovane AND NOT BezpOkruhCS_Aktivovany THEN
		TP_ModraLEDResetCS:= Blikac500ms;
	ELSIF BezpOkruhCS_Aktivovany THEN	
		TP_ModraLEDResetCS:= 2;
	ELSE	
		TP_ModraLEDResetCS:= 3;
	END_IF
	
	
	//********************************Modré podsvietenie tlaèítka reset Oplotenia*******************************************************************//
	IF ((Stav_BZ1_Zamknuty AND Stav_BZ2_Zamknuty AND Stav_BZ3_Zamknuty) OR RezimServis) AND BezpOkruhCS_Aktivovany AND NOT BezpOkruhOplotenia_Aktivovany THEN
		TP_ModraLEDResetOplotenia:= Blikac500ms;
	ELSIF BezpOkruhOplotenia_Aktivovany THEN
		TP_ModraLEDResetOplotenia:= 2;
	ELSE	
		TP_ModraLEDResetOplotenia:= 3;
	END_IF	
	
	
	
	
		END_ACTION
