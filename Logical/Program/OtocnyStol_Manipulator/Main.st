
PROGRAM _INIT
	Stol_Manipulator_StartVyroby:= TRUE;
	Stol_Manipulator_VyrobaPrebieha:= FALSE;
	Stol_Manipulator_UkoncenieVyroby:= FALSE;
	Stol_Manipulator_VlozeneKusy:= 0;
END_PROGRAM

PROGRAM _CYCLIC
	
	//Volanie podprogramov//
	OvladanieGripra;
	OvladaniePojazdu;
	OvladanieZdvihu;
	
	//Volanie funkcie SequenceControl//
	SequenceControl(SC:= SC_Stol_Manipulator);

	
	//Reset sekcie //
	IF Stol_Manipulator_Reset OR NOT BezpOkruhOplotenia_Aktivovany OR PoruchaVstupManipulator THEN
		SC_Stol_Manipulator.Step:= 0;
	END_IF
	
	
	CASE SC_Stol_Manipulator.Step OF 
	
	
		0:
			SC_Stol_Manipulator.StepName:='0 - Nulovanie';
			SC_OvlGripra.Step:= 0;
			SC_OvlServoPojazdu.Step:= 0;
			SC_OvlZdvihu.Step:= 0;
			Stol_Manipulator_Automat:= FALSE;
			Stol_Manipulator_KoniecVyroby:= FALSE;
			Stol_Manipulator_KoniecCyklu:= FALSE;
			Stol_Manipulator_Manual:= FALSE;
			Stol_Manipulator_PoINIT:= FALSE;
			Stol_Manipulator_Reset:= FALSE;
			Stol_Manipulator_PojazdVPOZICI:= FALSE;
			Stol_Manipulator_CakaNaOtocenie:= FALSE;
			IF BezpOkruhOplotenia_Aktivovany AND NOT PoruchaVstupManipulator THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 1;
			END_IF
	
		1:
			SC_Stol_Manipulator.StepName:='1 - Rozhodnutie o cinnosti';
			IF Stol_Manipulator_Automat THEN
				SC_Stol_Manipulator.Step:= 2;
			ELSIF Stol_Manipulator_Manual THEN
				SC_Stol_Manipulator.Step:= 700;
			END_IF
		
		
			//********************************************************Inicializácia****************************************************************************//
		
		2:
			SC_Stol_Manipulator.StepName:='2 - Inicializacia - cakanie na spustenie';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#5s;
			SC_Stol_Manipulator.IdleTime.IN:= TRUE;
				
			
			IF SC_Stol_Manipulator.IdleTime.Q THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 3;
			END_IF
	
		
		3:
			SC_Stol_Manipulator.StepName:='3 - Inicializacia - kontrola home serva';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#5s;
		
			IF Motion[1].status.DriveStatus.HomingOk THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 5;
			ELSE
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 4;
			END_IF
		
		
		4:
			SC_Stol_Manipulator.StepName:='4 - Inicializacia - homing serva';
			SC_Stol_Manipulator.IdleTime.PT:= T#200ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#5s;
			
			
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Stol_Manipulator_HOME:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
			
			IF Motion[1].status.DriveStatus.HomingOk THEN
				SC_Stol_Manipulator.IdleTime.IN:= TRUE;
			END_IF
		
			IF Motion[1].status.DriveStatus.HomingOk AND SC_Stol_Manipulator.IdleTime.Q THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 6;
			END_IF
			
		
		5:
			SC_Stol_Manipulator.StepName:='5 - Inicializacia - zodvihnutie gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#5s;
			
		
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zdvih_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_ZasunutyHORE THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 6;
			END_IF
		
					
		6:
			SC_Stol_Manipulator.StepName:='6 - Inicializacia - presun do odoberacej pozicie';
			SC_Stol_Manipulator.IdleTime.PT:= T#200ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#5s;
			SC_Stol_Manipulator.IdleTime.IN:= TRUE;
			
			Stol_Manipulator_Rychlost_MM_s:= TP_Manipul_RychlostPolohovania; //100 mm/s
			Stol_Manipulator_ZadanaPozMM:= TP_Manipul_PoziciaOdoberania; //24.0
			
			IF NOT SC_Stol_Manipulator.Switch1 AND SC_OvlServoPojazdu.Step = 1 AND SC_Stol_Manipulator.IdleTime.Q THEN
				ServoPojazd_Polohuj:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF Stol_Manipulator_PojazdVPOZICI THEN
				Stol_Manipulator_PojazdVPOZICI:= FALSE;
				Stol_Manipulator_PoINIT:= TRUE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 100;
			END_IF
		
	
			
		
			//********************************************************Automatický režim****************************************************************************//
		100:
			SC_Stol_Manipulator.StepName:='100 - Automaticky rezim - rozhodnutie o vyrobe';
			SC_Stol_Manipulator.IdleTime.PT:= T#1s;
			SC_Stol_Manipulator.AlarmTime.PT:= T#5s;
			SC_Stol_Manipulator.IdleTime.IN:= TRUE;
			
					
			IF Stol_Manipulator_KoniecCyklu THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 0;
			ELSIF Stol_Manipulator_StartVyroby AND Stol_Manipulator_VlozeneKusy < 2 AND diVstupManipul_PritomRotora AND diOddelovac_PritomnostRotora AND diOddelovac_PoziciaPredOddelovac AND SC_Stol_Manipulator.IdleTime.Q THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 150;
			ELSIF Stol_Manipulator_StartVyroby AND Stol_Manipulator_VlozeneKusy >= 2 THEN
				Stol_Manipulator_StartVyroby:= FALSE;
				Stol_Manipulator_VyrobaPrebieha:= TRUE;
				Stol_Manipulator_VlozeneKusy:= 0;
			ELSIF Stol_Manipulator_StartVyroby AND Stol_Manipulator_VlozeneKusy = 0 AND Stol_Manipulator_KoniecVyroby THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 300;
			ELSIF Stol_Manipulator_VyrobaPrebieha AND diVstupManipul_PritomRotora AND diOddelovac_PritomnostRotora AND diOddelovac_PoziciaPredOddelovac AND SC_Stol_Manipulator.IdleTime.Q THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 200;
			ELSIF Stol_Manipulator_VyrobaPrebieha AND ((NOT diOddelovac_PoziciaPredOddelovac AND SC_Stol_Manipulator.IdleTime.Q) OR Stol_Manipulator_KoniecVyroby) THEN
				Stol_Manipulator_VyrobaPrebieha:= FALSE;
				Stol_Manipulator_UkoncenieVyroby:= TRUE;
			ELSIF Stol_Manipulator_UkoncenieVyroby AND Stol_Manipulator_VlozeneKusy < 2 THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 250;
			ELSIF Stol_Manipulator_UkoncenieVyroby AND Stol_Manipulator_VlozeneKusy >= 2 THEN
				Stol_Manipulator_UkoncenieVyroby:= FALSE;
				Stol_Manipulator_VyrobaPrebieha:= FALSE;
				Stol_Manipulator_StartVyroby:= TRUE;
				Stol_Manipulator_VlozeneKusy:= 0;
			END_IF	
			
		
			//*************Štart výroby*********//		
		
		150:
			SC_Stol_Manipulator.StepName:='150 - Automaticky rezim - start vyroby, kontrola stavu gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#6s;
			SC_Stol_Manipulator.AlarmTime.PT:= T#5s;
			SC_Stol_Manipulator.IdleTime.IN:= TRUE;
			
			IF diVstupManipul_GriperOtvoreny AND NOT diVstupManipul_GriperZatvoreny AND diVstupManipul_PritomRotora THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 151;
			ELSIF diVstupManipul_GriperZatvoreny AND NOT diVstupManipul_GriperOtvoreny THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 155;
			ELSIF diVstupManipul_GriperOtvoreny AND diVstupManipul_GriperZatvoreny THEN
				Alarmy[21]:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			ELSIF NOT diVstupManipul_GriperOtvoreny AND NOT diVstupManipul_GriperZatvoreny THEN	
				Alarmy[21]:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			END_IF
		
		
		151:
			SC_Stol_Manipulator.StepName:='151 - Automaticky rezim - start vyroby, zostup gripra na dopravnik';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#5s;
		
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zostup_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_VysunutyDOLE THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 152;
			END_IF
		
				
		
		152:
			SC_Stol_Manipulator.StepName:='152 - Automaticky rezim - start vyroby, zatvorenie gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#200ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
			SC_Stol_Manipulator.IdleTime.IN:= TRUE;
					
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zatvor_Griper:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_GriperZatvoreny AND SC_Stol_Manipulator.IdleTime.Q THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 153;
			END_IF
		
				
		153:
			SC_Stol_Manipulator.StepName:='153 - Automaticky rezim - start vyroby, zdvih gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
					
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zdvih_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_ZasunutyHORE THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 155;
			END_IF
		
	
		
		155:
			SC_Stol_Manipulator.StepName:='155 - Automaticky rezim - start vyroby, kontrola stola';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF Stol_PoINIT THEN
				IF NOT Stol_Manipulator_CakaNaOtocenie AND diStol_PoziciaStola AND NOT diStol_Rotor_Vstup_VonkajsiOkruh THEN
					SC_Stol_Manipulator.ResetStep:= TRUE;
					SC_Stol_Manipulator.Step:= 160;
				ELSIF NOT Stol_Manipulator_CakaNaOtocenie AND diStol_PoziciaStola AND diStol_Rotor_Vstup_VonkajsiOkruh THEN
					Stol_Manipulator_CakaNaOtocenie:= TRUE;
					SC_Stol_Manipulator.ResetStep:= TRUE;
					SC_Stol_Manipulator.Step:= 166;
				END_IF	
			END_IF	
	
		
		
		160:
			SC_Stol_Manipulator.StepName:='160 - Automaticky rezim - start vyroby, presun nad poziciu vonkajsieho okruhu';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			Stol_Manipulator_Rychlost_MM_s:= TP_Manipul_RychlostPolohovania; //100 mm/s
			Stol_Manipulator_ZadanaPozMM:= TP_Manipul_PozVkladaniaVonkajsia; // 174 mm
			
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				ServoPojazd_Polohuj:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF Stol_Manipulator_PojazdVPOZICI THEN
				Stol_Manipulator_PojazdVPOZICI:= FALSE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 161;
			END_IF
		
		161:
			SC_Stol_Manipulator.StepName:='161 - Automaticky rezim - start vyroby, zostup gripra na stol';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF NOT SC_Stol_Manipulator.Switch1 AND diStol_PoziciaStola THEN
				Zostup_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
						
			IF diVstupManipul_VysunutyDOLE THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 162;
			END_IF
		
		162:
			SC_Stol_Manipulator.StepName:='162 - Automaticky rezim - start vyroby, otvorenie gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#200ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Otvor_Griper:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			
			IF diVstupManipul_GriperOtvoreny THEN
				Stol_Manipulator_VlozeneKusy:= Stol_Manipulator_VlozeneKusy + 1;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 163;
			END_IF
		
		163:
			SC_Stol_Manipulator.StepName:='163 - Automaticky rezim - start vyroby, zdvih gripra, vystavenie signalu manipulator caka na otocenie';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zdvih_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_ZasunutyHORE THEN
				Stol_Manipulator_CakaNaOtocenie:= TRUE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 165;
			END_IF
		
		
		165:
			SC_Stol_Manipulator.StepName:='125 - Automaticky rezim - start vyroby, presun do pozicie nad dopravnikom';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			Stol_Manipulator_Rychlost_MM_s:= TP_Manipul_RychlostPolohovania; //100 mm/s
			Stol_Manipulator_ZadanaPozMM:= TP_Manipul_PoziciaOdoberania; //v 24 mm
			
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				ServoPojazd_Polohuj:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF Stol_Manipulator_PojazdVPOZICI THEN
				Stol_Manipulator_PojazdVPOZICI:= FALSE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 166;
			END_IF
		
		166:
			SC_Stol_Manipulator.StepName:='166 - Automaticky rezim - start vyroby, rozhodnutie o ukonceni sekvencie';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
						
			IF Stol_Manipulator_VlozeneKusy < 2 THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 150;
			ELSIF Stol_Manipulator_VlozeneKusy >= 2 THEN	
				Stol_Manipulator_StartVyroby:= FALSE;
				Stol_Manipulator_VyrobaPrebieha:= TRUE;
				Stol_Manipulator_UkoncenieVyroby:= FALSE;
				Stol_Manipulator_VlozeneKusy:= 0;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 100;
			END_IF
			
			
						
		
			//*********Výroba prebieha*******************//	
		
		200:
			SC_Stol_Manipulator.StepName:='200 - Automaticky rezim - vyroba prebieha, kontrola stavu gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#6s;
			SC_Stol_Manipulator.AlarmTime.PT:= T#5s;
			SC_Stol_Manipulator.IdleTime.IN:= TRUE;
					
			IF diVstupManipul_GriperOtvoreny AND NOT diVstupManipul_GriperZatvoreny AND diVstupManipul_PritomRotora THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 201;
			ELSIF diVstupManipul_GriperZatvoreny AND NOT diVstupManipul_GriperOtvoreny THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 205;
			ELSIF diVstupManipul_GriperOtvoreny AND diVstupManipul_GriperZatvoreny THEN
				Alarmy[21]:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			ELSIF NOT diVstupManipul_GriperOtvoreny AND NOT diVstupManipul_GriperZatvoreny THEN	
				Alarmy[21]:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			END_IF
		
			
		
		201:
			SC_Stol_Manipulator.StepName:='201 - Automaticky rezim - vyroba prebieha, zostup gripra na dopravnik';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#5s;
		
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zostup_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_VysunutyDOLE THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 202;
			END_IF
		
			
		202:
			SC_Stol_Manipulator.StepName:='202 - Automaticky rezim - vyroba prebieha, zatvorenie gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#200ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
			SC_Stol_Manipulator.IdleTime.IN:= TRUE;
					
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zatvor_Griper:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_GriperZatvoreny AND SC_Stol_Manipulator.IdleTime.Q THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 203;
			END_IF
		
			
		203:
			SC_Stol_Manipulator.StepName:='203 - Automaticky rezim - vyroba prebieha, zdvih gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
					
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zdvih_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_ZasunutyHORE THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 205;
			END_IF
		
		
		205:
			SC_Stol_Manipulator.StepName:='205 - Automaticky rezim - vyroba prebieha, kontrola stola';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			
			IF Stol_Manipulator_KoniecCyklu THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 0;
			ELSIF NOT Stol_Manipulator_CakaNaOtocenie AND diStol_PoziciaStola AND NOT diStol_Rotor_Vstup_VnutornyOkruh AND Stol_PoINIT THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 210;
			ELSIF NOT Stol_Manipulator_CakaNaOtocenie AND diStol_PoziciaStola AND NOT diStol_Rotor_Vstup_VonkajsiOkruh AND Stol_PoINIT THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 220;
			ELSIF NOT Stol_Manipulator_CakaNaOtocenie AND diStol_PoziciaStola AND diStol_Rotor_Vstup_VnutornyOkruh AND diStol_Rotor_Vstup_VonkajsiOkruh AND Stol_PoINIT THEN
				Stol_Manipulator_CakaNaOtocenie:= TRUE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 100;
			END_IF	
				
			
			
				
		210:
			SC_Stol_Manipulator.StepName:='210 - Automaticky rezim - vyroba prebieha, presun nad poziciu vnutorneho okruhu';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			Stol_Manipulator_Rychlost_MM_s:= TP_Manipul_RychlostPolohovania; //100 mm/s
			Stol_Manipulator_ZadanaPozMM:= TP_Manipul_PozVkladaniaVnutorna; //v 340 mm
			
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				ServoPojazd_Polohuj:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF Stol_Manipulator_PojazdVPOZICI THEN
				Stol_Manipulator_PojazdVPOZICI:= FALSE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 211;
			END_IF
		
		211:
			SC_Stol_Manipulator.StepName:='211 - Automaticky rezim - vyroba prebieha, zostup gripra na stol';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF NOT SC_Stol_Manipulator.Switch1 AND diStol_PoziciaStola THEN
				Zostup_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_VysunutyDOLE THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 212;
			END_IF
			
		212:
			SC_Stol_Manipulator.StepName:='212 - Automaticky rezim - vyroba prebieha, otvorenie gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#200ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Otvor_Griper:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_GriperOtvoreny THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 213;
			END_IF
			
			
		213:
			SC_Stol_Manipulator.StepName:='213 - Automaticky rezim - vyroba prebieha, zdvih gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zdvih_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_ZasunutyHORE THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 214;
			END_IF
			
		214:
			SC_Stol_Manipulator.StepName:='214 - Automaticky rezim - vyroba prebieha, presun do pozicie nad dopravnik';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			Stol_Manipulator_Rychlost_MM_s:= TP_Manipul_RychlostPolohovania; //100 mm/s
			Stol_Manipulator_ZadanaPozMM:= TP_Manipul_PoziciaOdoberania; //24
			
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				ServoPojazd_Polohuj:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF Stol_Manipulator_PojazdVPOZICI THEN
				Stol_Manipulator_PojazdVPOZICI:= FALSE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 200;
			END_IF
			
			
		
		220:
			SC_Stol_Manipulator.StepName:='220 - Automaticky rezim - vyroba prebieha, presun nad poziciu vonkajsieho okruhu';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			Stol_Manipulator_Rychlost_MM_s:= TP_Manipul_RychlostPolohovania; //100 mm/s
			Stol_Manipulator_ZadanaPozMM:= TP_Manipul_PozVkladaniaVonkajsia; //v 174 mm
			
			IF NOT SC_Stol_Manipulator.Switch1 AND SC_OvlServoPojazdu.Step = 1 THEN
				ServoPojazd_Polohuj:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF Stol_Manipulator_PojazdVPOZICI THEN
				Stol_Manipulator_PojazdVPOZICI:= FALSE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 221;
			END_IF
		
		
		221:
			SC_Stol_Manipulator.StepName:='221 - Automaticky rezim - vyroba prebieha, zostup gripra na stol';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF NOT SC_Stol_Manipulator.Switch1 AND diStol_PoziciaStola  THEN
				Zostup_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_VysunutyDOLE THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 222;
			END_IF
		
		222:
			SC_Stol_Manipulator.StepName:='222 - Automaticky rezim - vyroba prebieha, otvorenie gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#200ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Otvor_Griper:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_GriperOtvoreny THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 223;
			END_IF
		
		223:
			SC_Stol_Manipulator.StepName:='223 - Automaticky rezim - vyroba prebieha, zdvih gripra, vystavenie signalu manipulator caka na otocenie';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zdvih_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_ZasunutyHORE THEN
				Stol_Manipulator_CakaNaOtocenie:= TRUE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 224;
			END_IF
		
		
		224:
			SC_Stol_Manipulator.StepName:='224 - Automaticky rezim - vyroba prebieha, presun do odoberacej pozicie';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			Stol_Manipulator_Rychlost_MM_s:= TP_Manipul_RychlostPolohovania; //100 mm/s
			Stol_Manipulator_ZadanaPozMM:= TP_Manipul_PoziciaOdoberania; //24
			
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				ServoPojazd_Polohuj:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF Stol_Manipulator_PojazdVPOZICI THEN
				Stol_Manipulator_PojazdVPOZICI:= FALSE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 100;
			END_IF
		
		
			//**********Ukonèenie výroby**************//		
		
		250:
			SC_Stol_Manipulator.StepName:='250 - Automaticky rezim - ukoncenie vyroby,kontrola stavu gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#6s;
			SC_Stol_Manipulator.AlarmTime.PT:= T#5s;
			
					
			IF diVstupManipul_GriperOtvoreny AND NOT diVstupManipul_GriperZatvoreny AND diVstupManipul_PritomRotora THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 251;
			ELSIF diVstupManipul_GriperZatvoreny AND NOT diVstupManipul_GriperOtvoreny THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 255;
			ELSIF diVstupManipul_GriperOtvoreny AND diVstupManipul_GriperZatvoreny THEN
				Alarmy[21]:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			ELSIF NOT diVstupManipul_GriperOtvoreny AND NOT diVstupManipul_GriperZatvoreny THEN	
				Alarmy[21]:= TRUE;
				PoruchaVstupManipulator:= TRUE;
			ELSIF Stol_Manipulator_KoniecVyroby THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 300;
			END_IF
		
		251:
			SC_Stol_Manipulator.StepName:='251 - Automaticky rezim - ukoncenie vyroby, zostup gripra na dopravnik';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#5s;
		
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zostup_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_VysunutyDOLE THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 252;
			END_IF
		
		
		252:
			SC_Stol_Manipulator.StepName:='153 - Automaticky rezim - ukoncenie vyroby, zatvorenie gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
					
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zatvor_Griper:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_GriperZatvoreny THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 253;
			END_IF
		
			
		253:
			SC_Stol_Manipulator.StepName:='253 - Automaticky rezim - ukoncenie vyroby, zdvih gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
					
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zdvih_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_ZasunutyHORE THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 255;
			END_IF
		
	
		
		255:
			SC_Stol_Manipulator.StepName:='255 - Automaticky rezim - ukoncenie vyroby,kontrola stola';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF Stol_PoINIT THEN
				IF NOT Stol_Manipulator_CakaNaOtocenie AND diStol_PoziciaStola AND NOT diStol_Rotor_Vstup_VnutornyOkruh THEN
					SC_Stol_Manipulator.ResetStep:= TRUE;
					SC_Stol_Manipulator.Step:= 260;
				ELSIF NOT Stol_Manipulator_CakaNaOtocenie AND diStol_PoziciaStola AND diStol_Rotor_Vstup_VnutornyOkruh THEN
					Stol_Manipulator_CakaNaOtocenie:= TRUE;
					SC_Stol_Manipulator.ResetStep:= TRUE;
					SC_Stol_Manipulator.Step:= 267;
				END_IF	
			END_IF	
			
			
			
				
		260:
			SC_Stol_Manipulator.StepName:='260 - Automaticky rezim - ukoncenie vyroby, presun nad poziciu vnutorneho okruhu';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			Stol_Manipulator_Rychlost_MM_s:= TP_Manipul_RychlostPolohovania; //100 mm/s
			Stol_Manipulator_ZadanaPozMM:= TP_Manipul_PozVkladaniaVnutorna; //340
			
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				ServoPojazd_Polohuj:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF Stol_Manipulator_PojazdVPOZICI THEN
				Stol_Manipulator_PojazdVPOZICI:= FALSE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 261;
			END_IF
	
		
		261:
			SC_Stol_Manipulator.StepName:='261 - Automaticky rezim - ukoncenie vyroby, zostup gripra nad stol';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF NOT SC_Stol_Manipulator.Switch1 AND diStol_PoziciaStola THEN
				Zostup_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_VysunutyDOLE THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 262;
			END_IF
		
		262:
			SC_Stol_Manipulator.StepName:='262 - Automaticky rezim - ukoncenie vyroby, otvorenie gripra';
			SC_Stol_Manipulator.IdleTime.PT:= T#200ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Otvor_Griper:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
						
			IF diVstupManipul_GriperOtvoreny THEN
				Stol_Manipulator_VlozeneKusy:= Stol_Manipulator_VlozeneKusy + 1;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 263;
			END_IF
			
				
		263:
			SC_Stol_Manipulator.StepName:='263 - Automaticky rezim - ukoncenie vyroby, zdvih gripra, vystavenie signalu manipulator caka na otocenie';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				Zdvih_Manipulatora:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF diVstupManipul_ZasunutyHORE THEN
				Stol_Manipulator_CakaNaOtocenie:= TRUE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 264;
			END_IF
		
		
		264:
			SC_Stol_Manipulator.StepName:='264 - Automaticky rezim - ukoncenie vyroby, presun do odoberacej pozicie';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
			Stol_Manipulator_Rychlost_MM_s:= TP_Manipul_RychlostPolohovania; //100 mm/s
			Stol_Manipulator_ZadanaPozMM:= TP_Manipul_PoziciaOdoberania; //24
			
			IF NOT SC_Stol_Manipulator.Switch1 THEN
				ServoPojazd_Polohuj:= TRUE;
				SC_Stol_Manipulator.Switch1:= TRUE;
			END_IF
		
			IF Stol_Manipulator_PojazdVPOZICI THEN
				Stol_Manipulator_PojazdVPOZICI:= FALSE;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 267;
			END_IF
		
		267:
			SC_Stol_Manipulator.StepName:='267 - Automaticky rezim - ukoncenie vyroby, rozhodnutie o ukonceni sekvencie';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
		
		
			IF Stol_Manipulator_VlozeneKusy < 2 THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 250;
			ELSIF Stol_Manipulator_VlozeneKusy >= 2 AND NOT Stol_Manipulator_KoniecVyroby THEN	
				Stol_Manipulator_UkoncenieVyroby:= FALSE;
				Stol_Manipulator_StartVyroby:= TRUE;
				Stol_Manipulator_VyrobaPrebieha:= FALSE;
				Stol_Manipulator_VlozeneKusy:= 0;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 100;
			ELSIF Stol_Manipulator_VlozeneKusy >= 2 AND Stol_Manipulator_KoniecVyroby THEN	
				Stol_Manipulator_UkoncenieVyroby:= FALSE;
				Stol_Manipulator_StartVyroby:= TRUE;
				Stol_Manipulator_VyrobaPrebieha:= FALSE;
				Stol_Manipulator_VlozeneKusy:= 0;
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 300;
			END_IF
			
	
			//**********Èakanie na vyprázdnenie stola**************//		
		
		300:			
			SC_Stol_Manipulator.StepName:='300 - Automaticky rezim - cakanie na vyprazdnenie stola';
			SC_Stol_Manipulator.IdleTime.PT:= T#500ms;
			SC_Stol_Manipulator.AlarmTime.PT:= T#1s;
			
			Stol_Manipulator_UkoncenieVyroby:= FALSE;
			Stol_Manipulator_VyrobaPrebieha:= FALSE;
			Stol_Manipulator_StartVyroby:= TRUE;
			Stol_Manipulator_VlozeneKusy:= 0;
			
			
			IF NOT Stol_Automat THEN
				SC_Stol_Manipulator.ResetStep:= TRUE;
				SC_Stol_Manipulator.Step:= 0;
			ELSIF NOT Stol_Manipulator_CakaNaOtocenie THEN
				Stol_Manipulator_CakaNaOtocenie:= TRUE;
			END_IF
			
			
			
				
			
			//********************************************************Ruèný režim***********************************************************************************//
		700:
			SC_Stol_Manipulator.StepName:='700 - Rucny rezim';
		
			//Polohovanie manipulátora//
			IF RR_PoziciaOdoberania AND SC_OvlServoPojazdu.Step = 1 THEN
				Stol_Manipulator_Rychlost_MM_s:= TP_Manipul_RychlostPolohovania;
				Stol_Manipulator_ZadanaPozMM:= TP_Manipul_PoziciaOdoberania;
				ServoPojazd_Polohuj:= TRUE;
			ELSIF RR_PoziciaVkladaniaVnutorna AND SC_OvlServoPojazdu.Step = 1 THEN
				Stol_Manipulator_Rychlost_MM_s:= TP_Manipul_RychlostPolohovania;
				Stol_Manipulator_ZadanaPozMM:= TP_Manipul_PozVkladaniaVnutorna;
				ServoPojazd_Polohuj:= TRUE;
			ELSIF RR_PoziciaVkladaniaVonkajsia AND SC_OvlServoPojazdu.Step = 1 THEN
				Stol_Manipulator_Rychlost_MM_s:= TP_Manipul_RychlostPolohovania;
				Stol_Manipulator_ZadanaPozMM:= TP_Manipul_PozVkladaniaVonkajsia;
				ServoPojazd_Polohuj:= TRUE;
			END_IF	
			
		
		
		
		
		
		
		
	END_CASE
	
	
	
	
	 
					END_PROGRAM

PROGRAM _EXIT
					(* Insert code here *)
	 
					END_PROGRAM

