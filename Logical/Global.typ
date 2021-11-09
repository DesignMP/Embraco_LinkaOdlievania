
TYPE
	InverterTypes : 
		( (*Possible inverter types*)
		X64 := 1,
		P74 := 2,
		P84 := 3
		);
	INVERTER_STATES : 
		(
		INVERTER_WAIT, (*Wait for command*)
		INVERTER_RUN, (*State where the inverter is running with set speed*)
		INVERTER_POWER_ON, (*Power on the inverter*)
		INVERTER_POWER_OFF, (*Power off the inverter*)
		INVERTER_TUNE_X64, (*Autotune the inverter.*)
		INVERTER_TUNE_P74, (*Autotune the inverter.*)
		INVERTER_TUNE_P84, (*Autotune the inverter.*)
		INVERTER_STOP, (*Stop the movement*)
		INVERTER_ERROR (*Error state*)
		);
	InverterInputCommand_typ : 	STRUCT 
		AutoTune : BOOL; (*Command to autotune the inverter, It will be turned on for 2sec during this operation*)
		RunForward : BOOL; (*Run with positive direction. *)
		Acknowledge : BOOL;
		RunBackward : BOOL; (*Run with negative direction. *)
		RunLowSpeed : BOOL; (*Run with lowspeed. If lowspeed is false, highspeed will be used.*)
	END_STRUCT;
	InverterInput_typ : 	STRUCT 
		Command : InverterInputCommand_typ; (*Command structure*)
		LowSpeed : INT; (*Set lowspeed*)
		HighSpeed : INT; (*Set highspeed*)
		AccTime : UINT; (*Acceleration time to nominal frequency in 0.1s*)
		DecTime : UINT; (*Deceleration time from nominal frequency 0.1s*)
		DeviceString : STRING[80]; (*The device adress used. Eg *IF6.ST2*. Is needed to write parameters.*)
		InverterType : InverterTypes; (*Type of B&R inverter. X64, P74 or P84.*)
		Node : USINT; (*Powerlink node number of the inverter. Only required when inverter type is P74 or P84.*)
		StopType : USINT; (*0 = Stop by stop command bit. 1 = stop by setting the spedsetpoint to 0. *)
		InverterName : STRING[80]; (*Name of the inverter, not required.*)
	END_STRUCT;
	InverterOutputStatus_typ : 	STRUCT 
		Error : BOOL; (*An error occured, see ErrorNumber*)
		ErrorText : STRING[80]; (*Inverter error text*)
		ErrorNumber : UINT; (*Error number for additional information*)
		Tuned : BOOL;
		Running : BOOL;
	END_STRUCT;
	InverterOutput_typ : 	STRUCT 
		Status : InverterOutputStatus_typ; (*Status information*)
	END_STRUCT;
	Inverter_typ : 	STRUCT 
		Input : InverterInput_typ; (*Input structure*)
		Output : InverterOutput_typ; (*Output structure*)
		State : INVERTER_STATES; (*States of the state machine*)
		SubState : UINT; (*Substates*)
		IO : Inverter_IO_typ; (*IO structure to be mapped to the inverter IO mapping*)
	END_STRUCT;
END_TYPE

(*The IO structure is only used for the inverter IO mapping*)

TYPE
	Error_Info_typ : 	STRUCT 
		ErrorText : ARRAY[0..110]OF STRING[100]; (*Text info about possible faults*)
	END_STRUCT;
	Inverter_IO_typ : 	STRUCT 
		ModuleOk : BOOL; (*Module okay status*)
		SwitchOn : BOOL; (*Swith on the inverter command*)
		Run : BOOL; (*Command RUN*)
		SpeedSetpoint : INT; (*Speed setpoint to the inverter*)
		ReadyToSwitchOn : BOOL; (*Status that the inverter is ready to switch on*)
		SwitchedOn : BOOL; (*Status that the inverter is switched on*)
		Running : BOOL; (*Status that the inverter is running*)
		Fault : BOOL; (*Status that a fault have accoured*)
		ErrorNumber : INT; (*The error number in case of an inverter error*)
		FaultReset : BOOL; (*Fault reset command*)
		Stop : BOOL; (*Stop command. Not currently used in this task. The speed setpoint is set to 0 instead.*)
		Direction : BOOL; (*Direction of rotation*)
		Decelerating : BOOL; (*Status when the inverter is decelerating*)
		Brake : BOOL; (*Mapped to R2 if a brake funktion is needed*)
		TargetReached : BOOL; (*Status when the speed setpoint is reached*)
		SpeedMode : BOOL; (*Status when the inverter is running*)
		OutputFrequency : INT; (*Output frequency of the inverter*)
		MotorCurrent : UINT; (*Output current of the inverter*)
		MotorTorque : INT; (*Output torque of the inverter*)
		SwitchOnDisabled : BOOL; (*Status*)
		VoltageEnabled : BOOL; (*Status*)
		DisableVoltage : BOOL; (*Command Disable Voltage*)
		QuickStop : BOOL; (*Command Quick Stop*)
		StavRiadeniaMenica : BOOL; (*Status  0 - riaden˝ z panela, 1- riaden˝ cez komunik·ciu*)
		PoziciaDosiahnuta : BOOL; (*Status*)
		SmerOtacania : BOOL; (*Status 0 - smer dopredu, 1 - smer dozadu*)
	END_STRUCT;
END_TYPE

(***************Uzivatelia****************************)

TYPE
	ParametreUzivatelovTyp : 	STRUCT 
		Meno : STRING[50];
		UrovenUzivatela : UINT;
		Kod_citacky0 : USINT;
		Kod_citacky1 : USINT;
		Kod_citacky2 : USINT;
		Kod_citacky3 : USINT;
		Kod_citacky4 : USINT;
		Kod_citacky5 : USINT;
		Kod_citacky6 : USINT;
		Kod_citacky7 : USINT;
		Kod_citacky8 : USINT;
		Kod_citacky9 : USINT;
		Kod_citacky10 : USINT;
		Kod_citacky11 : USINT;
		Kod_citacky12 : USINT;
		Kod_citacky13 : USINT;
	END_STRUCT;
END_TYPE

(************Receptury*************************)

TYPE
	ParametreRecepturTyp : 	STRUCT 
		Nazov : STRING[50];
		CisloProgramuLinka : UDINT;
		CisloProgramuRobotOdlievania : UDINT;
		CisloProgramuRobotManipulacie : UDINT;
		VyskaBalika : REAL;
		VyskaBalikaHornaTolerancia : REAL;
		VyskaBalikaSpodnaTolerancia : REAL;
		UholOdlievaniaRobOdlievCentr1 : REAL;
		CasOdlievaniaRobOdlievCentr1 : REAL;
		UholOdlievaniaRobOdlievCentr2 : REAL;
		CasOdlievaniaRobOdlievCentr2 : REAL;
		CasOtacaniaPriOdlievani : REAL; (*v s*)
		RychlostOtacaniaPriOdlievani : REAL; (*v ot/min*)
	END_STRUCT;
END_TYPE

(***********Analog Input**************************)

TYPE
	Analog_Input : 	STRUCT 
		VstupHodnota : DINT; (*Hodnota ktor· ide zo snÌmaËa*)
		VstupSpodnaHranica : DINT; (*Spodn· hranica vstupnej hodnoty*)
		VstupHornaHranica : DINT; (*Horn· hranica vstupnej hodnoty*)
		VystupSpodnaHranica : REAL; (*Spodn· hranica v˝stupnej hodnoty*)
		VystupHornaHranica : REAL; (*Horn· hranica v˝stupnej hodnoty*)
		KalibKonstanta : REAL; (*KalibraËn· konötanta*)
		Precision : REAL := 1; (*Treba nastaviù minim·lne na 1.0*)
		VystupHodnota : REAL; (*Hodnota, ktor· je vprepoËte na jednotky *)
		VystupHodnotaKalibrovana : REAL; (*Hodnota, ktor· je vprepoËte na jednotky kalibrovan·*)
		FB_READY : BOOL;
		FB_ERROR : BOOL;
	END_STRUCT;
END_TYPE
