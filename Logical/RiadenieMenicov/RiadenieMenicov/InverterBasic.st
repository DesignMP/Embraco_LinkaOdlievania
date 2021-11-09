
PROGRAM _INIT
 
	//Nastavenie node number (adresy) na FM P74, DRI -> COnF -> FULL -> COM -> Cbd -> AdrC {0..239] a dlhsie podrzat otocne tlacidlo
	// + OFF/ON menica
	
	
	
	(*Specify your inverter*)
	FM_Menic[1].Input.InverterName	:= 'Tunel - pohon dopravnika'; 
	FM_Menic[1].Input.DeviceString	:= 'IF3.ST4';
	FM_Menic[1].Input.InverterType := P74;
	FM_Menic[1].Input.Node	:= 4; //Rovnaký ako má NOD number meniè//								

	
	
	
	(*X64 error texts for the corresponding error number*)		
	ErrorInfo[1].ErrorText[0]	:= '"nOF": No fault code saved';
	ErrorInfo[1].ErrorText[1]	:= '"CFF": Incorrect configuration (parameters)';
	ErrorInfo[1].ErrorText[2]	:= '"CFI": Invalid configuration (parameters)';
	ErrorInfo[1].ErrorText[3]	:= '"SLF": Modbus communication interuption';
	ErrorInfo[1].ErrorText[4]	:= '"ILF": Internal communcation interuption';
	ErrorInfo[1].ErrorText[5]	:= '"CnF": Communication option card';
	ErrorInfo[1].ErrorText[6]	:= '"EPF": External fault';
	ErrorInfo[1].ErrorText[7]	:= '"OCF": Overcurrent';
	ErrorInfo[1].ErrorText[8]	:= '"CrF": Capacitor pre-charge';
	ErrorInfo[1].ErrorText[9]	:= '"LFF": 4 - 20 mA loss';
	ErrorInfo[1].ErrorText[10]	:= '"OHF": Drive overheating';
	ErrorInfo[1].ErrorText[11]	:= '"OLF": Motor overload';
	ErrorInfo[1].ErrorText[12]	:= '"ObF": DC bus overvoltage';
	ErrorInfo[1].ErrorText[13]	:= '"OSF": Line supply overvoltage';
	ErrorInfo[1].ErrorText[14]	:= '"OPF": Motor phase loss';
	ErrorInfo[1].ErrorText[15]	:= '"PHF": Line phase loss';
	ErrorInfo[1].ErrorText[16]	:= '"USF": Line supply undervoltage';
	ErrorInfo[1].ErrorText[17]	:= '"OCF": Motor short-circuit (phase to phase)';
	ErrorInfo[1].ErrorText[18]	:= '"SOF": Motor overspeed';
	ErrorInfo[1].ErrorText[19]	:= '"tnF": Auto-tuning was unsuccessful';
	ErrorInfo[1].ErrorText[20]	:= '"IF1": Unknown rating';
	ErrorInfo[1].ErrorText[21]	:= '"IF2": MMI card';
	ErrorInfo[1].ErrorText[22]	:= '"IF3": MMI communication';
	ErrorInfo[1].ErrorText[23]	:= '"IF4": Industrial EEPROM';
	ErrorInfo[1].ErrorText[24]	:= '"EEF": EEPROM memory';
	ErrorInfo[1].ErrorText[25]	:= '"OCF": Impeding short-circuit';
	ErrorInfo[1].ErrorText[26]	:= '"SCF": Motor short-circuit (to ground)';
	ErrorInfo[1].ErrorText[27]	:= '"OPF": Motor phase loss - 3 phases';
	ErrorInfo[1].ErrorText[28]	:= '"COF": Communication interuption, fault line 2 (CANopen)';
	ErrorInfo[1].ErrorText[29]	:= '"bLF": Brake control';
	ErrorInfo[1].ErrorText[30]	:= '"OCF": Power module, specific to 15kW drives';
	ErrorInfo[1].ErrorText[31]	:= '"SCF": Power module or motor short-circuit, detected at power up.';
	ErrorInfo[1].ErrorText[110]	:= 'Inverter module not Ok';			
	(*P74 and P84 error texts for the corresponding error number*)	
	ErrorInfo[2].ErrorText[0]	:= '[No fault] (nOF)';
	ErrorInfo[2].ErrorText[1]	:= '[Calibration error] (InF)';
	ErrorInfo[2].ErrorText[2]	:= '[Control Eeprom] (EEF1)';
	ErrorInfo[2].ErrorText[3]	:= '[Incorrect config.] (CFF)';
	ErrorInfo[2].ErrorText[4]	:= '[Invalid config.] (CFI)';
	ErrorInfo[2].ErrorText[5]	:= '[Ground short circuit](SCF3)';
	ErrorInfo[2].ErrorText[6]	:= '[int. com.link] (ILF)';
	ErrorInfo[2].ErrorText[7]	:= '[Com. network] (CnF)';
	ErrorInfo[2].ErrorText[8]	:= '[External flt-LI/Bit] (EPF1)';
	ErrorInfo[2].ErrorText[9]	:= '[Overcurrent] (OCF)';
	ErrorInfo[2].ErrorText[10]	:= '[Precharge] (CrF)';
	ErrorInfo[2].ErrorText[11]	:= '[Speed fdback loss] (SPF)';
	ErrorInfo[2].ErrorText[12]	:= '[Load slipping] (AnF)';
	ErrorInfo[2].ErrorText[13]	:= '[AI2 4-20mA loss] (LFF2)';
	ErrorInfo[2].ErrorText[14]	:= '[PTC1 probe] (PtF1)';
	ErrorInfo[2].ErrorText[15]	:= '[PTC1 overheat] (OtF1)';
	ErrorInfo[2].ErrorText[16]	:= '[Drive overheat] (OHF)';
	ErrorInfo[2].ErrorText[17]	:= '[Motor overload] (OLF)';
	ErrorInfo[2].ErrorText[18]	:= '[Overbraking] (ObF)';
	ErrorInfo[2].ErrorText[19]	:= '[Mains overvoltage] (OSF)';
	ErrorInfo[2].ErrorText[20]	:= '[1 output phase loss] (OPF1)';
	ErrorInfo[2].ErrorText[21]	:= '[Input phase loss] (PHF)';
	ErrorInfo[2].ErrorText[22]	:= '[Undervoltage] (USF)';
	ErrorInfo[2].ErrorText[23]	:= '[Motor short circuit] (SCF1)';
	ErrorInfo[2].ErrorText[24]	:= '[Overspeed] (SOF)';
	ErrorInfo[2].ErrorText[25]	:= '[Auto-tuning] (tnF)';
	ErrorInfo[2].ErrorText[26]	:= '[Rating error] (InF1)';
	ErrorInfo[2].ErrorText[27]	:= '[PWR Calib.] (InF2)';
	ErrorInfo[2].ErrorText[28]	:= '[Int.serial link] (InF3)';
	ErrorInfo[2].ErrorText[29]	:= '[Int.Mfg area] (InF4)';
	ErrorInfo[2].ErrorText[30]	:= '[Power Eeprom] (EEF2)';
	ErrorInfo[2].ErrorText[31]	:= '[Impedant sh. circuit] (SCF2)';
	ErrorInfo[2].ErrorText[32]	:= '[Ground short circuit] (SCF3)';
	ErrorInfo[2].ErrorText[33]	:= '[3out ph loss] (OPF2)';
	ErrorInfo[2].ErrorText[34]	:= '[CAN com.] (COF)';
	ErrorInfo[2].ErrorText[35]	:= '[Brake control] (bLF)';
	ErrorInfo[2].ErrorText[36]	:= '';
	ErrorInfo[2].ErrorText[37]	:= '[Internal-hard init.] (InF7)';
	ErrorInfo[2].ErrorText[38]	:= '[External fault com.] (EPF2)';
	ErrorInfo[2].ErrorText[39]	:= '[Application fault] (APF)';
	ErrorInfo[2].ErrorText[40]	:= '[Internal-ctrl supply] (InF8)';
	ErrorInfo[2].ErrorText[41]	:= '[Brake feedback] (brF)';
	ErrorInfo[2].ErrorText[42]	:= '[PowerSuite com.] (SLF2)';
	ErrorInfo[2].ErrorText[43]	:= '[Enc. coupl.] (ECF)';
	ErrorInfo[2].ErrorText[44]	:= '[Torque/current lim] (SSF)';
	ErrorInfo[2].ErrorText[45]	:= '[HMI com.] (SLF3)';
	ErrorInfo[2].ErrorText[46]	:= '[Power removal] (PrF)';
	ErrorInfo[2].ErrorText[47]	:= '[PTC2 probe] (PtF2)';
	ErrorInfo[2].ErrorText[48]	:= '[PTC2 overheat] (OtF2)';
	ErrorInfo[2].ErrorText[49]	:= '[LI6=PTC probe] (PtFL)';
	ErrorInfo[2].ErrorText[50]	:= '[PTC fault] (OtFL)';
	ErrorInfo[2].ErrorText[51]	:= '[Internal- I measure] (InF9)';
	ErrorInfo[2].ErrorText[52]	:= '[Internal-mains circuit] (InFA)';	
	ErrorInfo[2].ErrorText[53]	:= '[Internal- th. sensor] (InFb)';
	ErrorInfo[2].ErrorText[54]	:= '[IGBT overheat] (tJF)';
	ErrorInfo[2].ErrorText[55]	:= '[IGBT short circuit] (SCF4)';
	ErrorInfo[2].ErrorText[56]	:= '[Motor short circuit] (SCF5)';
	ErrorInfo[2].ErrorText[57]	:= '[Torque time-out] (SrF)';
	ErrorInfo[2].ErrorText[58]	:= '[Out. contact. stuck] (FCF1)';
	ErrorInfo[2].ErrorText[59]	:= '[Out. contact. open.] (FCF2)';
	ErrorInfo[2].ErrorText[60]	:= '[Int. T meas.] (InFC)';
	ErrorInfo[2].ErrorText[61]	:= '[AI2 input] (AI2F)';
	ErrorInfo[2].ErrorText[62]	:= '[Encoder] (EnF)';
	ErrorInfo[2].ErrorText[63]	:= '[Thyr. soft charge] (CrF2)';
	ErrorInfo[2].ErrorText[64]	:= '[input contactor] (LCF)';
	ErrorInfo[2].ErrorText[65]	:= '[DB unit sh. circuit] (bUF)';
	ErrorInfo[2].ErrorText[66]	:= '[Diff. I fault] (dCF)';
	ErrorInfo[2].ErrorText[67]	:= '[IGBT desaturation] (HdF)';
	ErrorInfo[2].ErrorText[68]	:= '[Internal-option] (InF6)';
	ErrorInfo[2].ErrorText[69]	:= '[internal- CPU] (InFE)';
	ErrorInfo[2].ErrorText[70]	:= '[BR overload] (bOF)';
	ErrorInfo[2].ErrorText[71]	:= '[AI3 4-20mA loss] (LFF3)';
	ErrorInfo[2].ErrorText[72]	:= '[AI4 4-20mA loss] (LFF4)';					
	ErrorInfo[2].ErrorText[73]	:= '[Cards pairing] (HCF)';
	ErrorInfo[2].ErrorText[76]	:= '[Load fault] (dLF)';
	ErrorInfo[2].ErrorText[77]	:= '[Bad conf] (CFI2)';		
	ErrorInfo[2].ErrorText[99]	:= '[Ch.sw. fault] (CSF)';
	ErrorInfo[2].ErrorText[100]	:= '[Pr.Underload.Flt] (ULF)';
	ErrorInfo[2].ErrorText[101]	:= '[Proc.Overload Flt] (OLC)';		
	ErrorInfo[2].ErrorText[105]	:= '[Angle error] (ASF)';
	ErrorInfo[2].ErrorText[107]	:= '[Safety fault] (SAFF)';
	ErrorInfo[2].ErrorText[108]	:= '[FB fault] (FbE)';
	ErrorInfo[2].ErrorText[109]	:= '[FB stop flt.] (FbES)';		
	ErrorInfo[2].ErrorText[110]	:= 'Inverter module not Ok';																																																										
	
END_PROGRAM
	
PROGRAM _CYCLIC

	//Potvrdenie poruchy pri štarte//
	IF EDGEPOS (BezpOkruhCS_Aktivovany = TRUE) THEN
		FM_Menic[1].Input.Command.Acknowledge:= TRUE;
		CasResetovaniaMenicov.IN:= TRUE;
	END_IF
	
	IF CasResetovaniaMenicov.Q THEN
		FM_Menic[1].Input.Command.Acknowledge:= FALSE;
		CasResetovaniaMenicov.IN:= FALSE;
	END_IF
	
		
	CasResetovaniaMenicov.PT:= T#500ms;
	CasResetovaniaMenicov();
	
	
	
	
	
	
	(*loop trough the number of inverters*)
	FOR InvNr := 1 TO NR_OF_INVERTERS DO
	
		(************************************(STATUS)************************************)	
		FM_Menic[InvNr].Output.Status.Running	:= FM_Menic[InvNr].IO.Running;
			
		(************************************(ENABLE/DISABLE)************************************)
		IF FM_Menic[InvNr].State = INVERTER_TUNE_X64 OR FM_Menic[InvNr].State = INVERTER_TUNE_P74 OR FM_Menic[InvNr].State = INVERTER_TUNE_P84 THEN
			(*do nothing*)
		ELSE
			(*set the disable voltage and quickstop to the same as module ok*)
			FM_Menic[InvNr].IO.DisableVoltage	:= FM_Menic[InvNr].IO.ModuleOk;
			FM_Menic[InvNr].IO.QuickStop		:= FM_Menic[InvNr].IO.ModuleOk;
		END_IF
		(*********************************(PARAMETER WRITE/READ)*************************************)
		
		(*Parameters are written trough X2X*)
		IF FM_Menic[InvNr].Input.InverterType = X64 THEN
			(*Tune state also write par to inverter, not at same time*)
			IF FM_Menic[InvNr].State <> INVERTER_TUNE_X64 OR FM_Menic[InvNr].State <> INVERTER_TUNE_P74 OR FM_Menic[InvNr].State <> INVERTER_TUNE_P84 THEN
				(*write acceleration*)
				IF OldAccTime[InvNr] <> FM_Menic[InvNr].Input.AccTime THEN
					AsIOAccWrite_0[InvNr].enable 		:= TRUE;
					AsIOAccWrite_0[InvNr].pChannelName	:= ADR('ACC_Output');
					AsIOAccWrite_0[InvNr].pDeviceName	:= ADR(FM_Menic[InvNr].Input.DeviceString);
					AsIOAccWrite_0[InvNr].value		:= FM_Menic[InvNr].Input.AccTime;
					(*write is done*)
					IF AsIOAccWrite_0[InvNr].status = 0 THEN
						AsIOAccWrite_0[InvNr].enable 	:= FALSE;
						OldAccTime[InvNr]				:= FM_Menic[InvNr].Input.AccTime;				
					END_IF	
				(*write deceleration*)	
				ELSIF OldDecTime[InvNr] <> FM_Menic[InvNr].Input.DecTime THEN
					AsIOAccWrite_0[InvNr].enable 		:= TRUE;
					AsIOAccWrite_0[InvNr].pChannelName	:= ADR('DEC_Output');
					AsIOAccWrite_0[InvNr].pDeviceName	:= ADR(FM_Menic[InvNr].Input.DeviceString);
					AsIOAccWrite_0[InvNr].value		:= FM_Menic[InvNr].Input.DecTime;
					(*write is done*)
					IF AsIOAccWrite_0[InvNr].status = 0 THEN
						AsIOAccWrite_0[InvNr].enable 	:= FALSE;
						OldDecTime[InvNr]				:= FM_Menic[InvNr].Input.DecTime;
					END_IF
				ELSE
					AsIOAccWrite_0[InvNr].enable 	:= FALSE;
				END_IF	
			END_IF
		(*Parameters are written trough Powerlink*)	
		ELSIF FM_Menic[InvNr].Input.InverterType = P74 OR FM_Menic[InvNr].Input.InverterType = P84 THEN
			(*Tune state also write par to inverter, not at same time*)
			IF FM_Menic[InvNr].State <> INVERTER_TUNE_X64 OR FM_Menic[InvNr].State <> INVERTER_TUNE_P74 OR FM_Menic[InvNr].State <> INVERTER_TUNE_P84 THEN
			
				EplSDOWrite_0[InvNr].node		:= FM_Menic[InvNr].Input.Node;
				EplSDOWrite_0[InvNr].datalen	:= 2;
				EplSDOWrite_0[InvNr].index		:= 16#203C;	
				EplSDOWrite_0[InvNr].pDevice	:= ADR(FM_Menic[InvNr].Input.DeviceString);	
				(*write acceleration*)					
				IF OldAccTime[InvNr] <> FM_Menic[InvNr].Input.AccTime THEN
					EplSDOWrite_0[InvNr].enable	:= TRUE;			
					EplSDOWrite_0[InvNr].pData		:= ADR(FM_Menic[InvNr].Input.AccTime);	
					EplSDOWrite_0[InvNr].subindex	:= 2;				
					(*write is done*)
					IF EplSDOWrite_0[InvNr].status = 0 THEN
						EplSDOWrite_0[InvNr].enable	:= FALSE;
						OldAccTime[InvNr]				:= FM_Menic[InvNr].Input.AccTime;
					END_IF	
				(*write deceleration*)				
				ELSIF OldDecTime[InvNr] <> FM_Menic[InvNr].Input.DecTime THEN
					EplSDOWrite_0[InvNr].enable	:= TRUE;			
					EplSDOWrite_0[InvNr].pData		:= ADR(FM_Menic[InvNr].Input.DecTime);
					EplSDOWrite_0[InvNr].subindex	:= 3;
					(*write is done*)				
					IF EplSDOWrite_0[InvNr].status = 0 THEN
						EplSDOWrite_0[InvNr].enable	:= FALSE;
						OldDecTime[InvNr]				:= FM_Menic[InvNr].Input.DecTime;
					END_IF
				END_IF
			END_IF
		END_IF
	
		(*********************************(ERROR)*************************************)
		
		(*Error*)
		IF 	(FM_Menic[InvNr].IO.Fault = TRUE OR FM_Menic[InvNr].IO.ModuleOk = FALSE) AND FM_Menic[InvNr].State <> INVERTER_ERROR THEN
			FM_Menic[InvNr].State := INVERTER_ERROR;
		END_IF	
		
		(*error status*)
		FM_Menic[InvNr].Output.Status.Error	:= FM_Menic[InvNr].IO.Fault;
		FM_Menic[InvNr].Output.Status.ErrorNumber := FM_Menic[InvNr].IO.ErrorNumber;
		
		(*In case of an inverter fault. Read the error number and select an error text*)
		IF FM_Menic[InvNr].IO.Fault = TRUE OR FM_Menic[InvNr].IO.ModuleOk = FALSE THEN	
			IF FM_Menic[InvNr].IO.ModuleOk = TRUE THEN
				(*select list of error text depending on inverter type*)
				IF FM_Menic[InvNr].Input.InverterType = X64 THEN	
					FM_Menic[InvNr].Output.Status.ErrorText	:= ErrorInfo[1].ErrorText[FM_Menic[InvNr].IO.ErrorNumber];					
				ELSIF FM_Menic[InvNr].Input.InverterType = P74 OR FM_Menic[InvNr].Input.InverterType = P84 THEN
					FM_Menic[InvNr].Output.Status.ErrorText	:= ErrorInfo[2].ErrorText[FM_Menic[InvNr].IO.ErrorNumber];
				END_IF				
			ELSIF FM_Menic[InvNr].IO.ModuleOk = FALSE AND FM_Menic[InvNr].IO.ErrorNumber = 0 THEN
				(*Module not okay*)
				FM_Menic[InvNr].Output.Status.ErrorText 	:= ErrorInfo[1].ErrorText[110];
			END_IF
		END_IF	
		
		(************************************(EXTRA FUNCTION)************************************)	
		(*Simple brake handling*)
		IF FM_Menic[InvNr].IO.SwitchedOn = TRUE THEN
			FM_Menic[InvNr].IO.Brake := TRUE;
		ELSE
			FM_Menic[InvNr].IO.Brake := FALSE;
		END_IF
		
		(**************************************************************************************)
		
		(*Reset substate*)
		IF FM_Menic[InvNr].State <> oldState[InvNr] THEN
			FM_Menic[InvNr].SubState := 0;
			oldState[InvNr] := FM_Menic[InvNr].State;
		END_IF			
		
		CASE FM_Menic[InvNr].State OF 
	
		(**************************************************************************************)		
				
			(*WAIT*)
			INVERTER_WAIT:
			
				IF FM_Menic[InvNr].Input.Command.RunBackward = TRUE THEN
					FM_Menic[InvNr].IO.Direction 	:= 0;
					FM_Menic[InvNr].State 			:= INVERTER_RUN;
				ELSIF  FM_Menic[InvNr].Input.Command.RunForward = TRUE THEN
					FM_Menic[InvNr].IO.Direction 	:= 1;
					FM_Menic[InvNr].State 			:= INVERTER_RUN;
				ELSIF FM_Menic[InvNr].Input.Command.AutoTune = TRUE THEN
					FM_Menic[InvNr].Input.Command.AutoTune	:= FALSE;	
					IF FM_Menic[InvNr].Input.InverterType = X64 THEN
						FM_Menic[InvNr].State 		:= INVERTER_TUNE_X64;					
					ELSIF FM_Menic[InvNr].Input.InverterType = P74 THEN
						FM_Menic[InvNr].State 		:= INVERTER_TUNE_P74;					
					ELSIF FM_Menic[InvNr].Input.InverterType = P84 THEN
						FM_Menic[InvNr].State 		:= INVERTER_TUNE_P84;					
					END_IF
				END_IF;
			
		(**************************************************************************************)				
				
			INVERTER_TUNE_X64: (*Autotune the inverter*)
						
				CASE FM_Menic[InvNr].SubState OF
											
					(**************************************************************************)			
					0:	(*make sure to stop the motor*)
						FM_Menic[InvNr].Output.Status.Tuned	:= FALSE;
						FM_Menic[InvNr].IO.Stop				:= TRUE;
						FM_Menic[InvNr].IO.Run					:= FALSE;					
						FM_Menic[InvNr].SubState 				:= 10;
					(**************************************************************************)
					10:(*check that it is stopped*)
						IF FM_Menic[InvNr].IO.Running = FALSE THEN
							FM_Menic[InvNr].SubState 	:= 20;
							FM_Menic[InvNr].IO.Stop	:= FALSE;
						END_IF		
					(**************************************************************************)
					20:	(*Write tune parameter to inverter X64 through X2X*)
						AsIOAccWrite_0[InvNr].enable 		:= TRUE;
						AsIOAccWrite_0[InvNr].pChannelName	:= ADR('TUN_Output');
						AsIOAccWrite_0[InvNr].pDeviceName	:= ADR(FM_Menic[InvNr].Input.DeviceString);
						AsIOAccWrite_0[InvNr].value			:= 112;
						
						IF AsIOAccWrite_0[InvNr].status = 0 THEN
							AsIOAccWrite_0[InvNr].enable 	:= FALSE;
							FM_Menic[InvNr].SubState 			:= 30;
						END_IF				
					(**************************************************************************)		
					30:	
						IF FM_Menic[InvNr].IO.ReadyToSwitchOn = TRUE THEN
							FM_Menic[InvNr].IO.SwitchOn	:= TRUE;
							FM_Menic[InvNr].SubState 		:= 40;
						END_IF
					(**************************************************************************)	
					40:
						IF FM_Menic[InvNr].IO.SwitchedOn = TRUE THEN
							FM_Menic[InvNr].IO.Run			:= TRUE;
							FM_Menic[InvNr].SubState 		:= 50;
						END_IF					
					(**************************************************************************)				
					50:	(*Give the tuning some time to be finished*)
						IF FM_Menic[InvNr].IO.Running = TRUE THEN
							TON_TUNE[InvNr].IN :=  TRUE;
							TON_TUNE[InvNr].PT := T#2s;
							IF TON_TUNE[InvNr].Q = TRUE THEN
								TON_TUNE[InvNr].IN 				:= FALSE;
								FM_Menic[InvNr].IO.Run 		:= FALSE;	
								FM_Menic[InvNr].SubState 		:= 60;
							END_IF				
						END_IF
					(**************************************************************************)	
					60:	(*Power off*)
						IF FM_Menic[InvNr].IO.Running = FALSE THEN
							FM_Menic[InvNr].IO.Stop		:= FALSE;
							FM_Menic[InvNr].IO.SwitchOn 	:= FALSE;
							FM_Menic[InvNr].IO.Run 		:= FALSE;
							IF FM_Menic[InvNr].IO.SwitchedOn = FALSE THEN
								FM_Menic[InvNr].Output.Status.Tuned	:= TRUE;
								FM_Menic[InvNr].State 					:= INVERTER_WAIT;
							END_IF
						END_IF
				END_CASE			
		(**************************************************************************************)				
				
			INVERTER_TUNE_P74: (*Autotune the inverter*)		
						
				CASE FM_Menic[InvNr].SubState OF
											
					(**************************************************************************)			
					0:	(*make sure to stop the motor and disable voltage*)
						FM_Menic[InvNr].Output.Status.Tuned	:= FALSE;
						FM_Menic[InvNr].IO.Stop				:= TRUE;
						FM_Menic[InvNr].IO.DisableVoltage		:= FALSE;
						FM_Menic[InvNr].IO.QuickStop			:= FALSE;	
						FM_Menic[InvNr].SubState 				:= 10;											
					
					(**************************************************************************)
					10:(*check that voltage is disabled*)
						IF FM_Menic[InvNr].IO.SwitchOnDisabled = TRUE AND FM_Menic[InvNr].IO.VoltageEnabled = TRUE THEN
							FM_Menic[InvNr].SubState 			:= 20;
							FM_Menic[InvNr].IO.DisableVoltage	:= TRUE;
							FM_Menic[InvNr].IO.QuickStop		:= TRUE;		
						END_IF
					(**************************************************************************)
					20:(*switch controller on*)
						IF FM_Menic[InvNr].IO.SwitchedOn = FALSE AND FM_Menic[InvNr].IO.ReadyToSwitchOn = TRUE THEN
							FM_Menic[InvNr].IO.SwitchOn		:= TRUE;
							FM_Menic[InvNr].IO.Run				:= TRUE;
							FM_Menic[InvNr].SubState 			:= 30;
						END_IF	
					(**************************************************************************)
					30:(*check if controller is on*)
						IF FM_Menic[InvNr].IO.SwitchedOn = TRUE AND FM_Menic[InvNr].IO.Running THEN
							FM_Menic[InvNr].SubState 		:= 40;
						END_IF	
					(**************************************************************************)	
					40:	(*Write tune parameter to inverter P74 or P84 through Powerlink*)
						data := 1;
						EplSDOWrite_0[InvNr].enable	:= TRUE;
						EplSDOWrite_0[InvNr].node		:= FM_Menic[InvNr].Input.Node;
						EplSDOWrite_0[InvNr].datalen	:= 2;
						EplSDOWrite_0[InvNr].index		:= 16#2042;	
						EplSDOWrite_0[InvNr].pDevice	:= ADR(FM_Menic[InvNr].Input.DeviceString);	
						EplSDOWrite_0[InvNr].pData		:= ADR(data);	
						EplSDOWrite_0[InvNr].subindex	:= 9;			
	
						IF EplSDOWrite_0[InvNr].status = 0 THEN
							EplSDOWrite_0[InvNr].enable	:= FALSE;
							FM_Menic[InvNr].SubState 	:= 50;
						END_IF		
					(**************************************************************************)	
					50:(*Check tuning status*)
						EplSDORead_0[InvNr].enable 		:= TRUE;
						EplSDORead_0[InvNr].pDevice 	:= ADR(FM_Menic[InvNr].Input.DeviceString);
						EplSDORead_0[InvNr].node		:= FM_Menic[InvNr].Input.Node;
						
						EplSDORead_0[InvNr].datalen		:= SIZEOF(INT);
						EplSDORead_0[InvNr].index		:= 16#2042;
						EplSDORead_0[InvNr].subindex	:= 16#0A;
						EplSDORead_0[InvNr].pData		:= ADR(tuningStatus[InvNr]);
						
						FM_Menic[InvNr].SubState := 60;
					(**************************************************************************)	
					60:	(*if status is wrong return to previus state and try again*)
						IF EplSDORead_0[InvNr].status = 0 THEN
							EplSDORead_0[InvNr].enable := FALSE;
							IF (tuningStatus[InvNr] <> 4) THEN
								FM_Menic[InvNr].SubState := 50;	
							ELSE
								paramIndex := 0;
								FM_Menic[InvNr].SubState := 70;
							END_IF		
						END_IF	
					(**************************************************************************)				
					70:	(*Give the tuning some time to be finished*)
						IF FM_Menic[InvNr].IO.Running = TRUE THEN
							TON_TUNE[InvNr].IN :=  TRUE;
							TON_TUNE[InvNr].PT := T#2s;
							IF TON_TUNE[InvNr].Q = TRUE THEN
								TON_TUNE[InvNr].IN 				:= FALSE;
								FM_Menic[InvNr].IO.Run 		:= FALSE;	
								FM_Menic[InvNr].SubState 		:= 80;
							END_IF				
						END_IF
					(**************************************************************************)	
					80:	(*Power off*)
						IF FM_Menic[InvNr].IO.Running = FALSE THEN
							FM_Menic[InvNr].IO.Stop		:= FALSE;
							FM_Menic[InvNr].IO.SwitchOn 	:= FALSE;
							FM_Menic[InvNr].IO.Run 		:= FALSE;
							IF FM_Menic[InvNr].IO.SwitchedOn = FALSE THEN
								FM_Menic[InvNr].Output.Status.Tuned	:= TRUE;
								FM_Menic[InvNr].State 					:= INVERTER_WAIT;
							END_IF
						END_IF
				END_CASE
									
		(**************************************************************************************)				
				
			INVERTER_TUNE_P84: (*Autotune the inverter*)

				CASE FM_Menic[InvNr].SubState OF

					(**************************************************************************)			
					0:	(*make sure to stop the motor and disable voltage*)
						FM_Menic[InvNr].Output.Status.Tuned	:= FALSE;
						FM_Menic[InvNr].IO.Stop				:= TRUE;
						FM_Menic[InvNr].IO.Run					:= FALSE;							
						FM_Menic[InvNr].SubState 				:= 10;					
					(**************************************************************************)
					10:(*check that it is stopped*)
						IF FM_Menic[InvNr].IO.Running = FALSE THEN
							FM_Menic[InvNr].IO.Stop				:= FALSE;
							FM_Menic[InvNr].SubState 				:= 20;
						END_IF			
					(**************************************************************************)	
					20:	(*Write tune parameter to inverter P84 through Powerlink*)
						data := 1;
						EplSDOWrite_0[InvNr].enable	:= TRUE;
						EplSDOWrite_0[InvNr].node		:= FM_Menic[InvNr].Input.Node;
						EplSDOWrite_0[InvNr].datalen	:= 2;
						EplSDOWrite_0[InvNr].index		:= 16#2042;	
						EplSDOWrite_0[InvNr].pDevice	:= ADR(FM_Menic[InvNr].Input.DeviceString);	
						EplSDOWrite_0[InvNr].pData		:= ADR(data);	
						EplSDOWrite_0[InvNr].subindex	:= 9;			
	
						IF EplSDOWrite_0[InvNr].status = 0 THEN
							EplSDOWrite_0[InvNr].enable	:= FALSE;
							FM_Menic[InvNr].SubState 	:= 30;
						END_IF	
					(**************************************************************************)	
					30:(*power on*)					
						FM_Menic[InvNr].IO.SwitchOn			:= TRUE;
						FM_Menic[InvNr].IO.Run					:= TRUE;						
						FM_Menic[InvNr].IO.SpeedSetpoint		:= 0;
						
						IF FM_Menic[InvNr].IO.SwitchedOn = TRUE AND FM_Menic[InvNr].IO.Running = TRUE THEN
							FM_Menic[InvNr].SubState 				:= 40;
						END_IF
					(**************************************************************************)	
					40:(*Check tuning status*)
						EplSDORead_0[InvNr].enable 		:= TRUE;
						EplSDORead_0[InvNr].pDevice 	:= ADR(FM_Menic[InvNr].Input.DeviceString);
						EplSDORead_0[InvNr].node		:= FM_Menic[InvNr].Input.Node;
						
						EplSDORead_0[InvNr].datalen		:= SIZEOF(INT);
						EplSDORead_0[InvNr].index		:= 16#2042;
						EplSDORead_0[InvNr].subindex	:= 16#0A;
						EplSDORead_0[InvNr].pData		:= ADR(tuningStatus[InvNr]);
						
						FM_Menic[InvNr].SubState := 50;
					(**************************************************************************)	
					50:	(*if status is wrong return to previus state and try again*)
						IF EplSDORead_0[InvNr].status = 0 THEN
							EplSDORead_0[InvNr].enable := FALSE;
							
							IF (tuningStatus[InvNr] <> 4) THEN
								FM_Menic[InvNr].SubState := 40;	
							ELSE
								paramIndex := 0;
								FM_Menic[InvNr].SubState := 60;
							END_IF		
						END_IF	
					(**************************************************************************)				
					60:	(*Give the tuning some time to be finished*)
						IF FM_Menic[InvNr].IO.Running = TRUE THEN
							TON_TUNE[InvNr].IN :=  TRUE;
							TON_TUNE[InvNr].PT := T#2s;
							IF TON_TUNE[InvNr].Q = TRUE THEN
								TON_TUNE[InvNr].IN 				:= FALSE;
								FM_Menic[InvNr].IO.Run 		:= FALSE;	
								FM_Menic[InvNr].SubState 		:= 70;
							END_IF				
						END_IF
					(**************************************************************************)	
					70:	(*Power off*)
						IF FM_Menic[InvNr].IO.Running = FALSE THEN
							FM_Menic[InvNr].IO.Stop		:= FALSE;
							FM_Menic[InvNr].IO.SwitchOn 	:= FALSE;
							FM_Menic[InvNr].IO.Run 		:= FALSE;
							IF FM_Menic[InvNr].IO.SwitchedOn = FALSE THEN
								FM_Menic[InvNr].Output.Status.Tuned	:= TRUE;
								FM_Menic[InvNr].State 					:= INVERTER_WAIT;
							END_IF
						END_IF
				END_CASE
		(**************************************************************************************)						
				
			(*RUN*)
			INVERTER_RUN:
				
				(*Swith on and run*)
				IF FM_Menic[InvNr].IO.ReadyToSwitchOn THEN
					FM_Menic[InvNr].IO.SwitchOn := TRUE;
					IF FM_Menic[InvNr].IO.SwitchedOn THEN
						FM_Menic[InvNr].IO.Run := TRUE;
					END_IF		
				END_IF
				
				(*Select speed*)
				IF FM_Menic[InvNr].Input.Command.RunLowSpeed = TRUE THEN
					FM_Menic[InvNr].IO.SpeedSetpoint := FM_Menic[InvNr].Input.LowSpeed;
				ELSE
					FM_Menic[InvNr].IO.SpeedSetpoint := FM_Menic[InvNr].Input.HighSpeed;
				END_IF
						
				(*Stop when comand is false*)
				IF FM_Menic[InvNr].IO.Direction = 0 AND FM_Menic[InvNr].Input.Command.RunBackward = FALSE THEN
					FM_Menic[InvNr].State 				:= INVERTER_STOP;
				ELSIF FM_Menic[InvNr].IO.Direction = 1 AND FM_Menic[InvNr].Input.Command.RunForward = FALSE THEN
					FM_Menic[InvNr].State 				:= INVERTER_STOP;
				END_IF;
	
		(**************************************************************************************)				
	
			INVERTER_STOP:(*STOP*)
			
				CASE FM_Menic[InvNr].SubState OF
					
					0: 
						(*stop command bit*)
						IF FM_Menic[InvNr].Input.StopType = 0 THEN
							FM_Menic[InvNr].SubState := 10;
						(*freeweel stop*)	
						ELSIF FM_Menic[InvNr].Input.StopType = 1 THEN 
							FM_Menic[InvNr].SubState := 20;							
						END_IF
					(**************************************************************************)	
					10:
						(*check standstill*)
						FM_Menic[InvNr].IO.Stop 			:= TRUE;
						FM_Menic[InvNr].IO.Run				:= TRUE;
						FM_Menic[InvNr].IO.SpeedSetpoint	:= 0;
	
						IF FM_Menic[InvNr].IO.SpeedMode = FALSE AND FM_Menic[InvNr].IO.OutputFrequency = 0 AND FM_Menic[InvNr].IO.MotorTorque = 0 AND FM_Menic[InvNr].IO.MotorCurrent = 0 THEN
							FM_Menic[InvNr].IO.Stop 		:= FALSE;
							FM_Menic[InvNr].IO.Run			:= FALSE;
							FM_Menic[InvNr].State 			:= INVERTER_POWER_OFF;
						END_IF
					(**************************************************************************)	
					20:
						(*set run command off*)
						FM_Menic[InvNr].IO.Run				:= FALSE;
						FM_Menic[InvNr].IO.SpeedSetpoint	:= 0;
	
						IF FM_Menic[InvNr].IO.SpeedMode = FALSE AND FM_Menic[InvNr].IO.OutputFrequency = 0 AND FM_Menic[InvNr].IO.MotorTorque = 0 AND FM_Menic[InvNr].IO.MotorCurrent = 0 THEN
							FM_Menic[InvNr].IO.Stop 		:= FALSE;
							FM_Menic[InvNr].State 			:= INVERTER_POWER_OFF;
						END_IF																			
				END_CASE
	
	(**************************************************************************************)	
						
			INVERTER_POWER_OFF:	(*POWER OFF*)
				
				(*set comand bits to inverter*)
				FM_Menic[InvNr].IO.Run			:= FALSE;		
				FM_Menic[InvNr].IO.SwitchOn 	:= FALSE;	
				
				(*exit state on status*)
				IF FM_Menic[InvNr].IO.SwitchedOn = FALSE THEN
					FM_Menic[InvNr].State 				:= INVERTER_WAIT;
				END_IF
	
	(**************************************************************************************)				
							
			INVERTER_ERROR:	(*ERROR*)
				
				(*reset fault by comand bit. A hardware reset through an assigned DI might be required*)
				IF FM_Menic[InvNr].Input.Command.Acknowledge = TRUE THEN
					FM_Menic[InvNr].IO.FaultReset := TRUE;
				END_IF
				
				(*Set the run commands to false*)
				FM_Menic[InvNr].Input.Command.RunForward	:= FALSE;
				FM_Menic[InvNr].Input.Command.RunBackward	:= FALSE;
				
				(*make sure inverter is stopped*)			
				FM_Menic[InvNr].IO.Run			:= FALSE;
				FM_Menic[InvNr].IO.Stop		:= FALSE;
				FM_Menic[InvNr].IO.SwitchOn	:= FALSE;
				
				(*exit state if there is no fault*)
				IF FM_Menic[InvNr].IO.Fault = FALSE AND FM_Menic[InvNr].IO.ReadyToSwitchOn = TRUE THEN
					FM_Menic[InvNr].IO.FaultReset 				:= FALSE;
					FM_Menic[InvNr].Input.Command.Acknowledge 	:= FALSE;
					FM_Menic[InvNr].Output.Status.ErrorText	:= '';
					FM_Menic[InvNr].Output.Status.ErrorNumber	:= 0;
					FM_Menic[InvNr].State						:= INVERTER_WAIT;
				END_IF
				
			END_CASE;
	
	(**************************************************************************************)		
				
		(*FUB calls*)
		EplSDOWrite_0[InvNr]();
		AsIOAccWrite_0[InvNr]();
		EplSDORead_0[InvNr]();
		TON_TUNE[InvNr]();	
				
	END_FOR	
	
END_PROGRAM
	
PROGRAM _EXIT
	
END_PROGRAM
