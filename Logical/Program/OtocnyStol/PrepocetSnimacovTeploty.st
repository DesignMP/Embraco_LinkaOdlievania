
ACTION PrepocetSnimacovTeploty: 

	
	
	//Prepo�et sn�ma�a hodnoty sn�ma�a teploty vn�torn�ho okruhu na �C//
	Stol_TS_VnutornyOkruhKonstanta:= 768;  //Hodnota zo sn�ma�a//
	Stol_TS_VnutorOkruhKonstStupne:= 233;  //Po�et stupnov, ktor� zodpovedaj� hodnote snima�a// 
	Stol_TS_VnutorOkruhAktualStupne:= INT_TO_REAL((aiStol_SnimTeploty_VnutornyOkruh/10) * Stol_TS_VnutorOkruhKonstStupne)/Stol_TS_VnutornyOkruhKonstanta;
	
	
	
	//Prepo�et sn�ma�a hodnoty sn�ma�a teploty vonkaj�ieho okruhu na �C//
	Stol_TS_VonkajsiOkruhKonstanta:= 768;
	Stol_TS_VonkajOkruhKonstStupne:= 233;
	Stol_TS_VonkajOkruhAktualStupne:= INT_TO_REAL((aiStol_SnimTeploty_VonkajsiOkruh/10) * Stol_TS_VonkajOkruhKonstStupne)/Stol_TS_VonkajsiOkruhKonstanta;
	
	
	
END_ACTION
