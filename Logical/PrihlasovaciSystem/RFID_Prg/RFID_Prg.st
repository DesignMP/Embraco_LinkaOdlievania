(********************************************************************
 * COPYRIGHT -- Bernecker + Rainer
 ********************************************************************
 * Program: RFID_Prg
 * File: RFID_Prg.st
 * Author: borsm
 * Created: December 23, 2015
 ********************************************************************
 * Implementation of program RFID_Prg
 ********************************************************************)

PROGRAM _INIT

doinit:=1;


END_PROGRAM


PROGRAM _CYCLIC

	//Reset èitaèiek RFID//
	IF NOT CasResetovaniaCitaciekRFID.Q THEN
		CasResetovaniaCitaciekRFID.IN:= TRUE;
	ELSIF CasResetovaniaCitaciekRFID.Q THEN
		doinit:= TRUE;
		CasResetovaniaCitaciekRFID.IN:= FALSE;
	END_IF	

	CasResetovaniaCitaciekRFID.PT:= T#5m;
	CasResetovaniaCitaciekRFID();
	
	
	
(* find the Transponder, and give the Device ID back, this FuB works only for USB interface Transponder, 

IF you use a serial interface transponder, please give the adress OF Interface ID directly TO the ident OF all FuBs *)

//Hladanie RFID èitaèky//	
IF (doinit = 1) THEN
    TP_Init_0.Enable := 1;
    IF (TP_Init_0.Done = 1) THEN
        InitDone := TP_Init_0.Done;  //Ak èitaèku našlo tak je TRUE//
        InitError := TP_Init_0.Error;  //Ak èitaèku nenašlo tak je TRUE//
        InitErrorID := TP_Init_0.ErrorID;
        DeviceID := TP_Init_0.Ident[0];
        DeviceID1 := TP_Init_0.Ident[1];
		DeviceID2 := TP_Init_0.Ident[2];	
		DeviceID3 := TP_Init_0.Ident[3];	
		TP_Init_0.Enable := 0;
		poc := poc + 1;
		IF poc	>= 2 THEN
			doRead := 1;
			doinit:=0;
			poc := 0;
		END_IF
	ELSIF (TP_Init_0.Error = 1) THEN
		InitError := TP_Init_0.Error ;
		InitErrorID := TP_Init_0.ErrorID;
		InitDone := TP_Init_0.Done;
		TP_Init_0.Enable := 0;
        doRead:= FALSE;
		doinit := 0;
    END_IF
END_IF


(* turn the frequency radio on *)

IF (doOnOff = 1) THEN

(* if you use a serial interface transponder, please just give the adresse of interface ID(like ADR('IF3')) to the ident of the FuB, *)
    TP_OnOff_0.Ident := DeviceID; 
    TP_OnOff_0.Mode:= TRUE; (* TRUE : On, FALSE: Off,*)
    TP_OnOff_0.Enable := 1;
    IF (TP_OnOff_0.Done = 1) THEN
        OnOffDone := TP_OnOff_0.Done;
        OnOffError := TP_OnOff_0.Error;
        OnOffErrorID := TP_OnOff_0.ErrorID;
        TP_OnOff_0.Enable := 0;
        doOnOff := 0;
    ELSIF (TP_OnOff_0.Error = 1) THEN
        OnOffError := TP_OnOff_0.Error;
        OnOffErrorID := TP_OnOff_0.ErrorID;
        OnOffDone := TP_OnOff_0.Done;
        TP_OnOff_0.Enable := 0;
        doOnOff := 0;
    END_IF
END_IF

(* ask Info *)
IF (doInfo = 1) THEN
    TP_Info_0.Ident := DeviceID ;
    memset(ADR(ID),0,SIZEOF(ID));
    memset(ADR(KEYTYPE),0,SIZEOF(KEYTYPE));
    memset(ADR(sl),0,SIZEOF(sl)); 
    TP_Info_0.Enable := 1;
    IF (TP_Info_0.Done = 1) THEN
        memcpy(ADR(ID),TP_Info_0.Info.ID,SIZEOF(TP_Info_0.Info.ID));
        memcpy(ADR(KEYTYPE),TP_Info_0.Info.Type,SIZEOF(TP_Info_0.Info.Type));
        memcpy(ADR(sl),TP_Info_0.Info.StackLevel,SIZEOF(TP_Info_0.Info.StackLevel)); (* in Info are HW/SW ID Key type and stack level *)
        InfoDone := TP_Info_0.Done;
        InfoError := TP_Info_0.Error;
        InfoErrorID := TP_Info_0.ErrorID;
        TP_Info_0.Enable := 0;
        doInfo := 0;
    ELSIF (TP_Info_0.Error = 1) THEN
        InfoDone := TP_Info_0.Done;
        InfoError := TP_Info_0.Error;
        InfoErrorID := TP_Info_0.ErrorID;
        TP_Info_0.Enable := 0;
        doInfo := 0;
    END_IF
END_IF

(* Checksum on or off *)
IF (doCrc = 1) THEN
    TP_Crc_0.Ident := DeviceID;
    TP_Crc_0.Mode := TRUE;  (*TRUE: checksum on, FALSE: checksum off*)
    TP_Crc_0.Enable := 1;
    IF (TP_Crc_0.Done = 1) THEN
        CrcDone := TP_Crc_0.Done;
        CrcError := TP_Crc_0.Error;
        CrcErrorID := TP_Crc_0.ErrorID;
        TP_Crc_0.Enable := 0;
        doCrc := 0;
    ELSIF (TP_Crc_0.Error = 1) THEN
        CrcDone := TP_Crc_0.Done;
        CrcError := TP_Crc_0.Error;
        CrcErrorID := TP_Crc_0.ErrorID;
        TP_Crc_0.Enable := 0;
        doCrc := 0;
    END_IF
END_IF

(* Lock (reset) *)
IF (doLock = 1) THEN
    TP_Lock_0.Ident := DeviceID;
    TP_Lock_0.Enable := 1;
    IF TP_Lock_0.Done = 1 THEN
        LockDone := TP_Lock_0.Done;
        LockError := TP_Lock_0.Error;
        LockErrorID := TP_Lock_0.ErrorID;
        TP_Lock_0.Enable := 0;
        doLock := 0;
    ELSIF TP_Lock_0.Error = 1 THEN
        LockDone := TP_Lock_0.Done;
        LockError := TP_Lock_0.Error;
        LockErrorID := TP_Lock_0.ErrorID;
        TP_Lock_0.Enable := 0;
        doLock := 0;
    END_IF
END_IF

(* Unlock: log in with password *)
IF (doUnlock = 1) THEN
    TP_Unlock_0.Ident := DeviceID;
    TP_Unlock_0.Data := ADR(password); (* password is input variable ,for example password := '12345678'; *)
    TP_Unlock_0.Enable := 1;
    IF (TP_Unlock_0.Done = 1) THEN
        UnlockDone := TP_Unlock_0.Done;
        UnlockError := TP_Unlock_0.Error;
        UnlockErrorID := TP_Unlock_0.ErrorID;
        TP_Unlock_0.Enable := 0;
        doUnlock := 0;
    ELSIF (TP_Unlock_0.Error = 1) THEN
        UnlockDone := TP_Unlock_0.Done;
        UnlockError := TP_Unlock_0.Error;
        UnlockErrorID := TP_Unlock_0.ErrorID;
        TP_Unlock_0.Enable := 0;
    doUnlock := 0;
    END_IF
END_IF

(* change Password with new password *)
IF (doPassword = 1) THEN
	TP_PWProtect_0.Ident :=DeviceID;
	TP_PWProtect_0.Data :=ADR(passwordin); (*Password is input variable ,for example Password := '12345678'; *)
	TP_PWProtect_0.Enable := 1;
	IF (TP_PWProtect_0.Done = 1) THEN
		PasswordDone := TP_PWProtect_0.Done;
		PasswordError := TP_PWProtect_0.Error;
		PasswordErrorID := TP_PWProtect_0.ErrorID;
		TP_PWProtect_0.Enable:= 0;
		doPassword := 0;
	ELSIF (TP_PWProtect_0.Error = 1) THEN
		PasswordDone := TP_PWProtect_0.Done;
		PasswordError := TP_PWProtect_0.Error;
		PasswordErrorID := TP_PWProtect_0.ErrorID;
		TP_PWProtect_0.Enable:= 0;
		doPassword := 0;
	END_IF
END_IF

(* Read *)
IF (doRead = 1) AND InitDone=1 AND InitError = 0 THEN
			
	CASE step OF	
	
			0:
				TP_Read_0.Ident := DeviceID;
				TP_Read_0.Enable := 1;
				IF (TP_Read_0.Done = 1) THEN
					strcpy(ADR(READDATA),TP_Read_0.Data); (* copy the output data *)
					ReadDone := TP_Read_0.Done;
					ReadError := TP_Read_0.Error;
					ReadErrorID := TP_Read_0.ErrorID;
					TP_Read_0.Enable := 0;
					step:= 10;
				ELSIF TP_Read_0.Error = 1 THEN
					ReadDone := TP_Read_0.Done;
					ReadError := TP_Read_0.Error;
					ReadErrorID := TP_Read_0.ErrorID;
					memset(ADR(READDATA),0,SIZEOF(READDATA));
					TP_Read_0.Enable := 0;
					step:= 10;
				END_IF
				
			10:	
				TP_Read_0.Ident := DeviceID1;
				TP_Read_0.Enable := 1;
				IF (TP_Read_0.Done = 1) THEN
					strcpy(ADR(READDATA),TP_Read_0.Data); (* copy the output data *)
					ReadDone := TP_Read_0.Done;
					ReadError := TP_Read_0.Error;
					ReadErrorID := TP_Read_0.ErrorID;
					TP_Read_0.Enable := 0;
					step:= 20;
				ELSIF TP_Read_0.Error = 1 THEN
					ReadDone := TP_Read_0.Done;
					ReadError := TP_Read_0.Error;
					ReadErrorID := TP_Read_0.ErrorID;
					memset(ADR(READDATA),0,SIZEOF(READDATA));
					TP_Read_0.Enable := 0;
					step:= 20;
				END_IF
				
			20:
				TP_Read_0.Ident := DeviceID2;
				TP_Read_0.Enable := 1;
				IF (TP_Read_0.Done = 1) THEN
					strcpy(ADR(READDATA),TP_Read_0.Data); (* copy the output data *)
					ReadDone := TP_Read_0.Done;
					ReadError := TP_Read_0.Error;
					ReadErrorID := TP_Read_0.ErrorID;
					TP_Read_0.Enable := 0;
					step:= 30;
				ELSIF TP_Read_0.Error = 1 THEN
					ReadDone := TP_Read_0.Done;
					ReadError := TP_Read_0.Error;
					ReadErrorID := TP_Read_0.ErrorID;
					memset(ADR(READDATA),0,SIZEOF(READDATA));
					TP_Read_0.Enable := 0;
					step:= 30;
				END_IF
			
			30:
				TP_Read_0.Ident := DeviceID3;
				TP_Read_0.Enable := 1;
				IF (TP_Read_0.Done = 1) THEN
					strcpy(ADR(READDATA),TP_Read_0.Data); (* copy the output data *)
					ReadDone := TP_Read_0.Done;
					ReadError := TP_Read_0.Error;
					ReadErrorID := TP_Read_0.ErrorID;
					TP_Read_0.Enable := 0;
					step:= 0;
				ELSIF TP_Read_0.Error = 1 THEN
					ReadDone := TP_Read_0.Done;
					ReadError := TP_Read_0.Error;
					ReadErrorID := TP_Read_0.ErrorID;
					memset(ADR(READDATA),0,SIZEOF(READDATA));
					TP_Read_0.Enable := 0;
					step:= 0;
				END_IF
	END_CASE			
END_IF

(* Write *)
IF (doWrite = 1) THEN
	TP_Write_0.Ident := DeviceID;
	TP_Write_0.Data := ADR(WRITEDATA); (* copy the input Data *)
	TP_Write_0.RegNr := 8; (* 8 is here only a example *)
	TP_Write_0.Enable := 1;
	IF (TP_Write_0.Done = 1) THEN
		WriteDone := TP_Write_0.Done;
		WriteError := TP_Write_0.Error;
		WriteErrorID := TP_Write_0.ErrorID;
		TP_Write_0.Enable := 0;
		doWrite := 0;
	ELSIF TP_Write_0.Error = 1 THEN
		WriteDone := TP_Write_0.Done;
		WriteError := TP_Write_0.Error;
		WriteErrorID := TP_Write_0.ErrorID;
		TP_Write_0.Enable := 0;
		doWrite := 0;
	END_IF
END_IF

(* call FuBs *)
TP_Init_0();
TP_OnOff_0();
TP_Write_0();
TP_Crc_0();
TP_Lock_0();
TP_Info_0();
TP_Read_0();
TP_PWProtect_0();
TP_Unlock_0();


	
	NacitanyKodCitacky_0:=READDATA[0];
	NacitanyKodCitacky_1:=READDATA[1];
	NacitanyKodCitacky_2:=READDATA[2];
	NacitanyKodCitacky_3:=READDATA[3];
	NacitanyKodCitacky_4:=READDATA[4];
	NacitanyKodCitacky_5:=READDATA[5];
	NacitanyKodCitacky_6:=READDATA[6];
	NacitanyKodCitacky_7:=READDATA[7];
	NacitanyKodCitacky_8:=READDATA[8];
	NacitanyKodCitacky_9:=READDATA[9];
	NacitanyKodCitacky_10:=READDATA[10];
	NacitanyKodCitacky_11:=READDATA[11];
	NacitanyKodCitacky_12:=READDATA[12];
	NacitanyKodCitacky_13:=READDATA[13];
END_PROGRAM
