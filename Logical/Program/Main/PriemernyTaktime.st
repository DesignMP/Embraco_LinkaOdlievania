
ACTION PriemernyTaktime: 

		
	IF TaktTime_VyratajPriemer THEN
		TaktTime_ZratanePole:= 0;
		FOR i:= 0 TO 25 DO
			TaktTime_ZratanePole:= TaktTime_ZratanePole + TaktTime_Pole[i];
		END_FOR
		TaktTime_VyratanyPriemernyCas:= TaktTime_ZratanePole/26;
		TaktTime_VyratajPriemer:= FALSE;
	END_IF	
	
	TaktTimeLinky:= TIME_TO_REAL(TaktTime_VyratanyPriemernyCas);
	TP_Zariadenie_TaktTime:= (TaktTimeLinky/1000);
	
END_ACTION
