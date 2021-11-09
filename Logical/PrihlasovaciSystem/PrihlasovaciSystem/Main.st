
PROGRAM _INIT
	MpRecipeXml_1.Load:= TRUE;
	ZvolenyUzivatel:= '';
	ZvolenaUroven:= 0;
	
	
END_PROGRAM

PROGRAM _CYCLIC
	
	
	
	//Príznak karta prilozena, naèítanie kódu z èitaèky//
	IF EDGEPOS(NacitanyKodCitacky_0 <> 0) THEN
		UlozenyKodCitacky_0:= NacitanyKodCitacky_0; 
		UlozenyKodCitacky_1:= NacitanyKodCitacky_1;
		UlozenyKodCitacky_2:= NacitanyKodCitacky_2; 
		UlozenyKodCitacky_3:= NacitanyKodCitacky_3; 
		UlozenyKodCitacky_4:= NacitanyKodCitacky_4; 
		UlozenyKodCitacky_5:= NacitanyKodCitacky_5; 
		UlozenyKodCitacky_6:= NacitanyKodCitacky_6; 
		UlozenyKodCitacky_7:= NacitanyKodCitacky_7; 
		UlozenyKodCitacky_8:= NacitanyKodCitacky_8; 
		UlozenyKodCitacky_9:= NacitanyKodCitacky_9; 
		UlozenyKodCitacky_10:= NacitanyKodCitacky_10;
		UlozenyKodCitacky_11:= NacitanyKodCitacky_11; 
		UlozenyKodCitacky_12:= NacitanyKodCitacky_12; 
		UlozenyKodCitacky_13:= NacitanyKodCitacky_13; 
		KartaPrilozena:= TRUE;
	END_IF	
	
	IF NacitanyKodCitacky_0 = 0 THEN
		CasKontrolyKarty.IN:= TRUE;
	ELSE	
		CasKontrolyKarty.IN:= FALSE;
	END_IF
	
	IF CasKontrolyKarty.Q THEN
		KartaPrilozena:= FALSE;
	END_IF	
	
	
	CasKontrolyKarty.PT:= T#2s;
	CasKontrolyKarty();
	
	
	//Vymazanie naèítaných dát karty//
	IF EDGENEG(EditaciaUzivatelov = TRUE) THEN
		UlozenyKodCitacky_0:= 0; 
		UlozenyKodCitacky_1:= 0;
		UlozenyKodCitacky_2:= 0; 
		UlozenyKodCitacky_3:= 0; 
		UlozenyKodCitacky_4:= 0; 
		UlozenyKodCitacky_5:= 0; 
		UlozenyKodCitacky_6:= 0; 
		UlozenyKodCitacky_7:= 0; 
		UlozenyKodCitacky_8:= 0; 
		UlozenyKodCitacky_9:= 0; 
		UlozenyKodCitacky_10:= 0;
		UlozenyKodCitacky_11:= 0; 
		UlozenyKodCitacky_12:= 0; 
		UlozenyKodCitacky_13:= 0; 
	END_IF	
	
	
	
	
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_Uzivatelia);
	
	
	//Naèítanie receptur z pamäte//
	IF MpRecipeXml_1.Load AND (MpRecipeXml_1.CommandDone OR MpRecipeXml_1.Error) THEN
		MpRecipeXml_1.Load:= FALSE;
		old_a:= 1;
		i:= 0; 
		IndexZoznam:= 0;
	END_IF	
	
	
	//Konfigurácia receptur//
	MpRecipeXml_1.MpLink:= ADR(gRecipeUzivatelXmlLink);  //takto sa menuje mapp komponenta v configurating view//
	MpRecipeXml_1.Enable:= TRUE;
	MpRecipeXml_1.Category:= ADR('UZIVATELIA');
	MpRecipeXml_1.Category:= ADR(strCategory);
	MpRecipeXml_1.DeviceName:= ADR('HDD');  //Názov media, kde sa budú receptury ukladat//
	MpRecipeXml_1.FileName:= ADR('UlozenyUzivatel'); //Názov súboru do ktorého sa receptúry uložia//
	MpRecipeXml_1();
	
	MpRecipeRegPar_1.MpLink:= ADR(gRecipeUzivatelXmlLink);
	MpRecipeRegPar_1.Enable:= TRUE;
	MpRecipeRegPar_1.Category:= ADR('UZIVATELIA');
	MpRecipeRegPar_1.PVName:= ADR('Uzivatel'); //Názov premenné, kde je vytvorená štruktura dat pre receptury//
	MpRecipeRegPar_1();	
	
	
	//Zobrazenie názvou receptúr//
	FOR IndexZoznam:=0 TO 50 BY 1 DO
		ZoznamUzivatelov[IndexZoznam]:= Uzivatel[IndexZoznam].Meno;
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
	
	//Listovanie v uložených uživateloch//
	IF old_a <> i AND i >= 0 AND i <= 50 THEN
		MenoUzivatela:= Uzivatel[i].Meno;
		UrovenUzivatela:= Uzivatel[i].UrovenUzivatela;
		KodCitacky_0:= Uzivatel[i].Kod_citacky0;
		KodCitacky_1:= Uzivatel[i].Kod_citacky1;
		KodCitacky_2:= Uzivatel[i].Kod_citacky2;
		KodCitacky_3:= Uzivatel[i].Kod_citacky3;
		KodCitacky_4:= Uzivatel[i].Kod_citacky4;
		KodCitacky_5:= Uzivatel[i].Kod_citacky5;
		KodCitacky_6:= Uzivatel[i].Kod_citacky6;
		KodCitacky_7:= Uzivatel[i].Kod_citacky7;
		KodCitacky_8:= Uzivatel[i].Kod_citacky8;
		KodCitacky_9:= Uzivatel[i].Kod_citacky9;
		KodCitacky_10:= Uzivatel[i].Kod_citacky10;
		KodCitacky_11:= Uzivatel[i].Kod_citacky11;
		KodCitacky_12:= Uzivatel[i].Kod_citacky12;
		KodCitacky_13:= Uzivatel[i].Kod_citacky13;
		old_a:= i;
	END_IF	
	
	
	
	//Prihlasovanie//
	CASE SC_Uzivatelia.Step OF
		
		0://Vynulovanie uživatela//
			SC_Uzivatelia.StepName:= '0 - Nulovanie';
			UlozUzivatelov:= FALSE;
			VymazUzivatela:= FALSE;
			OdhlasUzivatela:= FALSE;
			MpRecipeXml_1.Save:= FALSE;
			b:= 0;
			SC_Uzivatelia.ResetStep:= TRUE;
			SC_Uzivatelia.Step:= 1;
			
		1://Rozhodnutie o èinnosti//
			SC_Uzivatelia.StepName:= '1 - Rozhodnutie o cinnosti';
			SC_Uzivatelia.IdleTime.PT:= T#500ms;
			IF UlozUzivatelov AND EditaciaUzivatelov THEN
				SC_Uzivatelia.Step:= 10;
			ELSIF KartaPrilozena AND NOT Uzivatel_Stav_Prihlaseny AND NOT EditaciaUzivatelov THEN  //Prihlásenie uzivatela
				SC_Uzivatelia.Step:= 20;
			ELSIF KartaPrilozena AND Uzivatel_Stav_Prihlaseny AND NOT EditaciaUzivatelov THEN  //Odhlasenie uzivatela
				SC_Uzivatelia.Step:= 30;
			ELSIF OdhlasUzivatela THEN
				SC_Uzivatelia.Step:= 30;
			ELSIF VymazUzivatela AND EditaciaUzivatelov THEN
				SC_Uzivatelia.Step:= 40;
			END_IF
		
		10://Ulozenie uzivatela//
			SC_Uzivatelia.StepName:= '10 - Ulozenie uzivatela';
			Uzivatel[i].Meno:= MenoUzivatela;
			Uzivatel[i].UrovenUzivatela:= UrovenUzivatela;
			Uzivatel[i].Kod_citacky0:= UlozenyKodCitacky_0;
			Uzivatel[i].Kod_citacky1:= UlozenyKodCitacky_1;
			Uzivatel[i].Kod_citacky2:= UlozenyKodCitacky_2;
			Uzivatel[i].Kod_citacky3:= UlozenyKodCitacky_3;
			Uzivatel[i].Kod_citacky4:= UlozenyKodCitacky_4;
			Uzivatel[i].Kod_citacky5:= UlozenyKodCitacky_5;
			Uzivatel[i].Kod_citacky6:= UlozenyKodCitacky_6;
			Uzivatel[i].Kod_citacky7:= UlozenyKodCitacky_7;
			Uzivatel[i].Kod_citacky8:= UlozenyKodCitacky_8;
			Uzivatel[i].Kod_citacky9:= UlozenyKodCitacky_9;
			Uzivatel[i].Kod_citacky10:= UlozenyKodCitacky_10;
			Uzivatel[i].Kod_citacky11:= UlozenyKodCitacky_11;
			Uzivatel[i].Kod_citacky12:= UlozenyKodCitacky_12;
			Uzivatel[i].Kod_citacky13:= UlozenyKodCitacky_13;
			MpRecipeXml_1.Save:= TRUE;
			IF MpRecipeXml_1.CommandDone THEN
				SC_Uzivatelia.ResetStep:= TRUE;
				SC_Uzivatelia.Step:= 0;
			END_IF
				
		
		20://Kontrola prihláseného uživatela//		
			SC_Uzivatelia.StepName:= '20 - Kontrola prihláseného uzivatela';
			SC_Uzivatelia.IdleTime.PT:= T#200ms;
			
			
			IF Uzivatel[b].Kod_citacky0 = UlozenyKodCitacky_0 AND
				Uzivatel[b].Kod_citacky1 = UlozenyKodCitacky_1 AND
				Uzivatel[b].Kod_citacky2 = UlozenyKodCitacky_2 AND
				Uzivatel[b].Kod_citacky3 = UlozenyKodCitacky_3 AND
				Uzivatel[b].Kod_citacky4 = UlozenyKodCitacky_4 AND
				Uzivatel[b].Kod_citacky5 = UlozenyKodCitacky_5 AND
				Uzivatel[b].Kod_citacky6 = UlozenyKodCitacky_6 AND
				Uzivatel[b].Kod_citacky7 = UlozenyKodCitacky_7 AND
				Uzivatel[b].Kod_citacky8 = UlozenyKodCitacky_8 AND
				Uzivatel[b].Kod_citacky9 = UlozenyKodCitacky_9 AND
				Uzivatel[b].Kod_citacky10 = UlozenyKodCitacky_10 AND
				Uzivatel[b].Kod_citacky11 = UlozenyKodCitacky_11 AND
				Uzivatel[b].Kod_citacky12 = UlozenyKodCitacky_12 AND
				Uzivatel[b].Kod_citacky13 = UlozenyKodCitacky_13 THEN
				ZvolenyUzivatel:= Uzivatel[b].Meno;
				ZvolenaUroven:= Uzivatel[b].UrovenUzivatela;
				ZvolenyKodCitacky_0:= Uzivatel[b].Kod_citacky0;
				ZvolenyKodCitacky_1:= Uzivatel[b].Kod_citacky1;
				ZvolenyKodCitacky_2:= Uzivatel[b].Kod_citacky2;
				ZvolenyKodCitacky_3:= Uzivatel[b].Kod_citacky3;
				ZvolenyKodCitacky_4:= Uzivatel[b].Kod_citacky4;
				ZvolenyKodCitacky_5:= Uzivatel[b].Kod_citacky5;
				ZvolenyKodCitacky_6:= Uzivatel[b].Kod_citacky6;
				ZvolenyKodCitacky_7:= Uzivatel[b].Kod_citacky7;
				ZvolenyKodCitacky_8:= Uzivatel[b].Kod_citacky8;
				ZvolenyKodCitacky_9:= Uzivatel[b].Kod_citacky9;
				ZvolenyKodCitacky_10:= Uzivatel[b].Kod_citacky10;
				ZvolenyKodCitacky_11:= Uzivatel[b].Kod_citacky11;
				ZvolenyKodCitacky_12:= Uzivatel[b].Kod_citacky12;
				ZvolenyKodCitacky_13:= Uzivatel[b].Kod_citacky13;
				Uzivatel_Stav_Prihlaseny:= TRUE;
				SC_Uzivatelia.ResetStep:= TRUE;
				SC_Uzivatelia.Step:= 21;
			ELSE
				b:= b + 1;
				IF b = 51 OR b < 0 OR b > 51 THEN 
					SC_Uzivatelia.ResetStep:= TRUE;
					SC_Uzivatelia.Step:= 21;
				END_IF
			END_IF
			
		
		
		21:
			//Èakanie na odobratie karty//		
			SC_Uzivatelia.StepName:= '21 - Cakanie na odobratie karty';	
			SC_Uzivatelia.IdleTime.PT:= T#500ms;
			
			IF NOT KartaPrilozena THEN
				UlozenyKodCitacky_0:= 0; 
				UlozenyKodCitacky_1:= 0;
				UlozenyKodCitacky_2:= 0; 
				UlozenyKodCitacky_3:= 0; 
				UlozenyKodCitacky_4:= 0; 
				UlozenyKodCitacky_5:= 0; 
				UlozenyKodCitacky_6:= 0; 
				UlozenyKodCitacky_7:= 0; 
				UlozenyKodCitacky_8:= 0; 
				UlozenyKodCitacky_9:= 0; 
				UlozenyKodCitacky_10:= 0;
				UlozenyKodCitacky_11:= 0; 
				UlozenyKodCitacky_12:= 0; 
				UlozenyKodCitacky_13:= 0; 
				SC_Uzivatelia.ResetStep:= TRUE;
				SC_Uzivatelia.Step:= 0;
			END_IF	
		
		
				
				
		30://Odhlásenie uživatela//
			SC_Uzivatelia.StepName:= '30 - Odhlasenie uzivatela';
			SC_Uzivatelia.IdleTime.PT:= T#200ms;
			
			IF (ZvolenyKodCitacky_0 = UlozenyKodCitacky_0 AND
				ZvolenyKodCitacky_1 = UlozenyKodCitacky_1 AND
				ZvolenyKodCitacky_2 = UlozenyKodCitacky_2 AND
				ZvolenyKodCitacky_3 = UlozenyKodCitacky_3 AND
				ZvolenyKodCitacky_4 = UlozenyKodCitacky_4 AND
				ZvolenyKodCitacky_5 = UlozenyKodCitacky_5 AND
				ZvolenyKodCitacky_6 = UlozenyKodCitacky_6 AND
				ZvolenyKodCitacky_7 = UlozenyKodCitacky_7 AND
				ZvolenyKodCitacky_8 = UlozenyKodCitacky_8 AND
				ZvolenyKodCitacky_9 = UlozenyKodCitacky_9 AND
				ZvolenyKodCitacky_10 = UlozenyKodCitacky_10 AND
				ZvolenyKodCitacky_11 = UlozenyKodCitacky_11 AND
				ZvolenyKodCitacky_12 = UlozenyKodCitacky_12 AND
				ZvolenyKodCitacky_13 = UlozenyKodCitacky_13) OR OdhlasUzivatela THEN
				ZvolenyUzivatel:= '';
				ZvolenaUroven:= 0;
				ZvolenyKodCitacky_0:=0;
				ZvolenyKodCitacky_1:=0;
				ZvolenyKodCitacky_2:=0;
				ZvolenyKodCitacky_3:=0;
				ZvolenyKodCitacky_4:=0;
				ZvolenyKodCitacky_5:=0;
				ZvolenyKodCitacky_6:=0;
				ZvolenyKodCitacky_7;
				ZvolenyKodCitacky_8;
				ZvolenyKodCitacky_9;
				ZvolenyKodCitacky_10;
				ZvolenyKodCitacky_11;
				ZvolenyKodCitacky_12;
				ZvolenyKodCitacky_13;
				Uzivatel_Stav_Prihlaseny:= FALSE;
				SC_Uzivatelia.ResetStep:= TRUE;
				SC_Uzivatelia.Step:= 31;
			ELSE
				SC_Uzivatelia.ResetStep:= TRUE;
				SC_Uzivatelia.Step:= 31;
			END_IF
		
		31:
			//Èakanie na odobratie karty//		
			SC_Uzivatelia.StepName:= '31 - Cakanie na odobratie karty';	
			SC_Uzivatelia.IdleTime.PT:= T#500ms;
			
			IF NOT KartaPrilozena THEN
				UlozenyKodCitacky_0:= 0; 
				UlozenyKodCitacky_1:= 0;
				UlozenyKodCitacky_2:= 0; 
				UlozenyKodCitacky_3:= 0; 
				UlozenyKodCitacky_4:= 0; 
				UlozenyKodCitacky_5:= 0; 
				UlozenyKodCitacky_6:= 0; 
				UlozenyKodCitacky_7:= 0; 
				UlozenyKodCitacky_8:= 0; 
				UlozenyKodCitacky_9:= 0; 
				UlozenyKodCitacky_10:= 0;
				UlozenyKodCitacky_11:= 0; 
				UlozenyKodCitacky_12:= 0; 
				UlozenyKodCitacky_13:= 0;
				SC_Uzivatelia.ResetStep:= TRUE;
				SC_Uzivatelia.Step:= 0;
			END_IF			
					
					
					
		
		40://Vymazanie uživatela//
			SC_Uzivatelia.StepName:= '40 - Vymazanie uzivatela';	
			Uzivatel[i].Meno:= '';
			Uzivatel[i].UrovenUzivatela:= 0;
			Uzivatel[i].Kod_citacky0:= 0;
			Uzivatel[i].Kod_citacky1:= 0;
			Uzivatel[i].Kod_citacky2:= 0;
			Uzivatel[i].Kod_citacky3:= 0;
			Uzivatel[i].Kod_citacky4:= 0;
			Uzivatel[i].Kod_citacky5:= 0;
			Uzivatel[i].Kod_citacky6:= 0;
			Uzivatel[i].Kod_citacky7:= 0;
			Uzivatel[i].Kod_citacky8:= 0;
			Uzivatel[i].Kod_citacky9:= 0;
			Uzivatel[i].Kod_citacky10:= 0;
			Uzivatel[i].Kod_citacky11:= 0;
			Uzivatel[i].Kod_citacky12:= 0;
			Uzivatel[i].Kod_citacky13:= 0;
			UlozenyKodCitacky_0:= 0; 
			UlozenyKodCitacky_1:= 0;
			UlozenyKodCitacky_2:= 0; 
			UlozenyKodCitacky_3:= 0; 
			UlozenyKodCitacky_4:= 0; 
			UlozenyKodCitacky_5:= 0; 
			UlozenyKodCitacky_6:= 0; 
			UlozenyKodCitacky_7:= 0; 
			UlozenyKodCitacky_8:= 0; 
			UlozenyKodCitacky_9:= 0; 
			UlozenyKodCitacky_10:= 0;
			UlozenyKodCitacky_11:= 0; 
			UlozenyKodCitacky_12:= 0; 
			UlozenyKodCitacky_13:= 0; 
			MpRecipeXml_1.Save:= TRUE;
			IF MpRecipeXml_1.CommandDone THEN
				SC_Uzivatelia.ResetStep:= TRUE;
				SC_Uzivatelia.Step:= 0;
			END_IF
		
	END_CASE	
	
	
	
	
	
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

