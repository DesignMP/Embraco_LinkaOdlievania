
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	//Vstupy z indukèného ohrevu//
	Ohrev_Inputs_0;
	Ohrev_Inputs_1;
	Ohrev_Inputs_2;
	Ohrev_Inputs_3;
	Ohrev_Inputs_4;
	Ohrev_Inputs_5;
	Ohrev_Inputs_6;
	Ohrev_Inputs_7;
	Ohrev_Inputs_8;
	Ohrev_Inputs_9;
	Ohrev_Inputs_10;
	Ohrev_Inputs_11;
	
	Ohrev_Status_GeneratorBezi:= Ohrev_Inputs_6.0;
	Ohrev_PoruchaPrepetiaInduktora:= Ohrev_Inputs_6.1;
	Ohrev_PoruchaTranzistorov:= Ohrev_Inputs_6.2;
	Ohrev_PoruchaVysokaTeplotaMenica:= Ohrev_Inputs_6.3;
	Ohrev_PoruchaPrietoku:= Ohrev_Inputs_6.4;
	Ohrev_PoruchaVystupnehoPrudu:= Ohrev_Inputs_6.5;
	Ohrev_Status_LimitNapatia:= Ohrev_Inputs_6.6;
	Ohrev_Status_LimitPrudu:= Ohrev_Inputs_6.7;
	Ohrev_Status_LimitVykonu:= Ohrev_Inputs_7.0;
	Ohrev_Status_LimitFrekvencie:= Ohrev_Inputs_7.1;
	Ohrev_PoruchaTeplotyVody:= Ohrev_Inputs_7.3;
	Ohrev_PoruchaVysokaTeplotaIndukt:= Ohrev_Inputs_7.4;
	Ohrev_Status_VentilOtvoreny:= Ohrev_Inputs_7.5;
	
	Ohrev_Status_AktualnaFrekvencia:= Ohrev_Inputs_8;
	Ohrev_Status_AktualnyVykon:= Ohrev_Inputs_10;
	
	
	
	//Výstupy pre indukèný ohrev//
	Ohrev_Outputs_0;
	Ohrev_Outputs_1;
	Ohrev_Outputs_2;
	Ohrev_Outputs_3;
	Ohrev_Outputs_4;
	Ohrev_Outputs_5;
	Ohrev_Outputs_6;
	Ohrev_Outputs_7;
	Ohrev_Outputs_8;
	Ohrev_Outputs_9;
	Ohrev_Outputs_10;
	Ohrev_Outputs_11;
	
	Ohrev_Outputs_0:= Ohrev_NastavenyVykon;
	
	
	
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

