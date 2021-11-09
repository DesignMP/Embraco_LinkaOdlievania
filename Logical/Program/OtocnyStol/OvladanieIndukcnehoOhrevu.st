
ACTION OvladanieIndukcnehoOhrevu: 

	//Ovládanie ohrevu//
	IF IndukcnyOhrevStart AND diStol_OhrevStavREADY AND NOT CasSpusteniaIndukOhrevu.Q THEN
		doStol_OhrevSTART:= TRUE;
	ELSE
		doStol_OhrevSTART:= FALSE;
	END_IF	
	
	
	IF IndukcnyOhrevStart AND diStol_PoziciaStola THEN
		CasSpusteniaIndukOhrevu.IN:= TRUE;
	ELSE	
		CasSpusteniaIndukOhrevu.IN:= FALSE;
	END_IF	
	
	CasSpusteniaIndukOhrevu.PT:= T#20s;
	CasSpusteniaIndukOhrevu();
	
	
	
	//******************************************************Nastavenie výkonu indukèného ohrevu********************************************************//
	IF IndukcnyOhrev_StavPreruseny THEN
		CasPreruseniaIndukcnehoOhrevu.IN:= TRUE;
	ELSE	
		CasPreruseniaIndukcnehoOhrevu.IN:= FALSE;
	END_IF	
	
	IF CasPreruseniaIndukcnehoOhrevu.Q THEN
		IndukcnyOhrev_Dohrievanie:= TRUE;
	END_IF	

	CasPreruseniaIndukcnehoOhrevu.PT:= T#5m;
	CasPreruseniaIndukcnehoOhrevu();
	
	
	IF IndukcnyOhrev_Dohrievanie AND PocetOtoceniStola <= 3 THEN
		IF EDGEPOS(diStol_PoziciaStola = TRUE) THEN
			PocetOtoceniStola:= PocetOtoceniStola + 1;
		END_IF
	ELSIF IndukcnyOhrev_Dohrievanie AND PocetOtoceniStola > 3 THEN	
		IndukcnyOhrev_Dohrievanie:= FALSE;
		PocetOtoceniStola:= 0;
	END_IF	
	
	
	
	IF IndukcnyOhrev_Dohrievanie AND TP_VykonIndukcnehoOhrevu <= 80 THEN
		Ohrev_NastavenyVykon:= TP_VykonIndukcnehoOhrevu + 10;
	ELSE	
		Ohrev_NastavenyVykon:= TP_VykonIndukcnehoOhrevu;
	END_IF	
	

	
	//Ovládanie pomocného èerpadla chladiacej vody//
	IF Ohrev_Status_VentilOtvoreny THEN
		doStol_ChladenieChodCerpadla:= TRUE;
	ELSE
		doStol_ChladenieChodCerpadla:= FALSE;
	END_IF
	
	
	
	//Porucha indukèného ohrevu//
	IF Zariadenie_StavPoINIT AND NOT diStol_OhrevStavREADY AND NOT Zariadenie_KoniecCyklu THEN
		Zariadenie_KoniecCyklu:= TRUE;
		TP_ZobrazPopUp_IndOhrevPorucha:= 0;
	END_IF
	
	
	
	
	
		END_ACTION
