<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio Version=4.3.7.46 SP?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="RiadenieMe" Source="RiadenieMenicov.RiadenieMenicov.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="OtocnySto1" Source="Program.OtocnyStol_Manipulator.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Tunel" Source="Program.Tunel.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Serva_Prir" Source="RiadenieServ.Serva_PriradenieVstupov.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2">
    <Task Name="RiadenieSe" Source="RiadenieServ.RiadenieServ.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Centrifuga" Source="Program.Centrifuga_1.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Centrifug1" Source="Program.Centrifuga_2.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="OtocnyStol" Source="Program.OtocnyStol.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="OtocnySto2" Source="Program.OtocnyStol_Oddelovac.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Tunel_Vstu" Source="Program.Tunel_VstupnyOdsuvac.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="RobotManip" Source="Program.RobotManipulacie.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="RobotOdlie" Source="Program.RobotOdlievania.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="RFID_Prg" Source="PrihlasovaciSystem.RFID_Prg.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Prihlasova" Source="PrihlasovaciSystem.PrihlasovaciSystem.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Main" Source="Program.Main.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Poruchy_Si" Source="Program.Poruchy_Signalizacie.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#3">
    <Task Name="KOM_MedziP" Source="Komunikacia.KOM_MedziPLC.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#4">
    <Task Name="Blikanie20" Source="Blikace.Blikanie200ms.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#5">
    <Task Name="Blikanie50" Source="Blikace.Blikanie500ms.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#6">
    <Task Name="Blikanie1s" Source="Blikace.Blikanie1s.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#7">
    <Task Name="Blikanie5s" Source="Blikace.Blikanie5s.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#8">
    <Task Name="Komunikac1" Source="Komunikacia.KOMRobotManipulacie.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Komunikac2" Source="Komunikacia.KOM_RobotOdlievania.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="KOM_Indukc" Source="Komunikacia.KOM_IndukcnyOhrev.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Komunikaci" Source="Komunikacia.KOMDokoncovaciaStanica.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="KOM_PecNaH" Source="Komunikacia.KOM_PecNaHlinik.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Receptury" Source="Receptury.Receptury.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <DataObjects>
    <DataObject Name="Acp10sys" Source="" Memory="UserROM" Language="Binary" />
    <DataObject Name="assl1" Source="" Memory="UserROM" Language="Binary" />
  </DataObjects>
  <NcDataObjects>
    <NcDataObject Name="acp10etxen" Source="RiadenieServ.acp10etxen.dob" Memory="UserROM" Language="Ett" />
    <NcDataObject Name="gAxis01a" Source="RiadenieServ.OtocnyStol_Manipulator.gAxis01a.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="gAxis01i" Source="RiadenieServ.OtocnyStol_Manipulator.gAxis01i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="gAxis02a" Source="RiadenieServ.Centrifuga1_Otacanie.gAxis02a.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="gAxis02i" Source="RiadenieServ.Centrifuga1_Otacanie.gAxis02i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="gAxis03a" Source="RiadenieServ.Centrifuga1_Zdvih1.gAxis03a.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="gAxis03i" Source="RiadenieServ.Centrifuga1_Zdvih1.gAxis03i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="gAxis04a" Source="RiadenieServ.Centrifuga1_Zdvih2.gAxis04a.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="gAxis04i" Source="RiadenieServ.Centrifuga1_Zdvih2.gAxis04i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="gAxis05a" Source="RiadenieServ.Centrifuga2_Otacanie.gAxis05a.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="gAxis05i" Source="RiadenieServ.Centrifuga2_Otacanie.gAxis05i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="gAxis06a" Source="RiadenieServ.Centrifuga2_Zdvih1.gAxis06a.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="gAxis06i" Source="RiadenieServ.Centrifuga2_Zdvih1.gAxis06i.dob" Memory="UserROM" Language="Ax" />
    <NcDataObject Name="gAxis07a" Source="RiadenieServ.Centrifuga2_Zdvih2.gAxis07a.dob" Memory="UserROM" Language="Apt" />
    <NcDataObject Name="gAxis07i" Source="RiadenieServ.Centrifuga2_Zdvih2.gAxis07i.dob" Memory="UserROM" Language="Ax" />
  </NcDataObjects>
  <VcDataObjects>
    <VcDataObject Name="Visu" Source="Vizualizacia.Visu.dob" Memory="UserROM" Language="Vc" WarningLevel="2" Compress="false" />
  </VcDataObjects>
  <Binaries>
    <BinaryObject Name="udbdef" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="TCData" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arsvcreg" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdvnc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arialbd" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcmgr" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vctcal" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcgclass" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcfile" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpkat" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcdsloc" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcbclass" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcfntttf" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpfx20" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="arial" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Visu03" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcalarm" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Visu01" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbmp" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcshared" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcrt" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcnet" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Visu02" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcdsint" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcpdsw" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccovl" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbtn" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcchspot" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccalarm" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccline" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcctext" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccbar" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccnum" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccstr" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccshape" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccdt" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vcclbox" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="vccscale" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="asnxdb2" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="ashwac" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="User" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="asnxdb1" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="Role" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Config_1" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Config" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Acp10map" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="acp10cfg" Source="" Memory="UserROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="standard" Source="Libraries.standard.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsSafety" Source="Libraries.AsSafety.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="FileIO" Source="Libraries.FileIO.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="DataObj" Source="Libraries.DataObj.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsXml" Source="Libraries.AsXml.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="runtime" Source="Libraries.runtime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="astime" Source="Libraries.astime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10man" Source="Libraries.Acp10man.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10par" Source="Libraries.Acp10par.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="NcGlobal" Source="Libraries.NcGlobal.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Acp10_MC" Source="Libraries.Acp10_MC.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="brsystem" Source="Libraries.brsystem.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="sys_lib" Source="Libraries.sys_lib.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="IecCheck" Source="Libraries.IecCheck.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="SC" Source="Libraries.SC.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="AsBrStr" Source="Libraries.AsBrStr.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MpRecipe" Source="Libraries.MpRecipe.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MpBase" Source="Libraries.MpBase.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MpCom" Source="Libraries.MpCom.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsEPL" Source="Libraries.AsEPL.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsIOAcc" Source="Libraries.AsIOAcc.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsIecCon" Source="Libraries.AsIecCon.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AxisLib" Source="Libraries.AxisLib.lby" Memory="UserROM" Language="ANSIC" Debugging="true" />
    <LibraryObject Name="Acp10sim" Source="Libraries.Acp10sim.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="Analog" Source="Libraries.Analog.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="RFID" Source="Libraries.RFID.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="dvframe" Source="Libraries.dvframe.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsUSB" Source="Libraries.AsUSB.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="asstring" Source="Libraries.asstring.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="LoopConR" Source="Libraries.LoopConR.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="powerlnk" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="vcresman" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="ashw" Source="" Memory="UserROM" Language="Binary" Debugging="true" />
  </Libraries>
</SwConfiguration>