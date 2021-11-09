
ACTION PrepocetSnimacovTeploty: 

	
	
	//Prepoèet snímaèa hodnoty snímaèa teploty vnútorného okruhu na °C//
	Stol_TS_VnutornyOkruhKonstanta:= 768;  //Hodnota zo snímaèa//
	Stol_TS_VnutorOkruhKonstStupne:= 233;  //Poèet stupnov, ktoré zodpovedajú hodnote snimaèa// 
	Stol_TS_VnutorOkruhAktualStupne:= INT_TO_REAL((aiStol_SnimTeploty_VnutornyOkruh/10) * Stol_TS_VnutorOkruhKonstStupne)/Stol_TS_VnutornyOkruhKonstanta;
	
	
	
	//Prepoèet snímaèa hodnoty snímaèa teploty vonkajšieho okruhu na °C//
	Stol_TS_VonkajsiOkruhKonstanta:= 768;
	Stol_TS_VonkajOkruhKonstStupne:= 233;
	Stol_TS_VonkajOkruhAktualStupne:= INT_TO_REAL((aiStol_SnimTeploty_VonkajsiOkruh/10) * Stol_TS_VonkajOkruhKonstStupne)/Stol_TS_VonkajsiOkruhKonstanta;
	
	
	
END_ACTION
