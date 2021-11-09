######################################################
#                                                    #
# Automatic generated Makefile for Visual Components #
#                                                    #
#                  Do NOT edit!                      #
#                                                    #
######################################################

VCC:=@'$(AS_BIN_PATH)/br.vc.pc.exe'
LINK:=@'$(AS_BIN_PATH)/BR.VC.Link.exe'
MODGEN:=@'$(AS_BIN_PATH)/BR.VC.ModGen.exe'
VCPL:=@'$(AS_BIN_PATH)/BR.VC.PL.exe'
VCHWPP:=@'$(AS_BIN_PATH)/BR.VC.HWPP.exe'
VCDEP:=@'$(AS_BIN_PATH)/BR.VC.Depend.exe'
VCFLGEN:=@'$(AS_BIN_PATH)/BR.VC.lfgen.exe'
VCREFHANDLER:=@'$(AS_BIN_PATH)/BR.VC.CrossReferenceHandler.exe'
VCXREFEXTENDER:=@'$(AS_BIN_PATH)/BR.AS.CrossRefVCExtender.exe'
RM=CMD /C DEL
PALFILE_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Palette.vcr
VCCFLAGS_Visu=-server -proj Visu -vc '$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/VCObject.vc' -prj_path '$(AS_PROJECT_PATH)' -temp_path '$(AS_TEMP_PATH)' -cfg $(AS_CONFIGURATION) -plc $(AS_PLC) -plctemp $(AS_TEMP_PLC) -cpu_path '$(AS_CPU_PATH)'
VCFIRMWARE=4.72.6
VCFIRMWAREPATH=$(AS_VC_PATH)/Firmware/V4.72.6/SG4
VCOBJECT_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/VCObject.vc
VCSTARTUP='vcstart.br'
VCLOD='vclod.br'
VCSTPOST='vcstpost.br'
TARGET_FILE_Visu=$(AS_CPU_PATH)/Visu.br
OBJ_SCOPE_Visu=Vizualizacia
PRJ_PATH_Visu=$(AS_PROJECT_PATH)
SRC_PATH_Visu=$(AS_PROJECT_PATH)/Logical/$(OBJ_SCOPE_Visu)/Visu
TEMP_PATH_Visu=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu
TEMP_PATH_Shared=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared
TEMP_PATH_ROOT_Visu=$(AS_TEMP_PATH)
VC_LIBRARY_LIST_Visu=$(TEMP_PATH_Visu)/libraries.vci
VC_XREF_BUILDFILE_Visu=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.build
VC_XREF_CLEANFILE=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.clean
VC_LANGUAGES_Visu=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr
CPUHWC='$(TEMP_PATH_Visu)/cpuhwc.vci'
VC_STATIC_OPTIONS_Visu='$(TEMP_PATH_Visu)/vcStaticOptions.xml'
VC_STATIC_OPTIONS_Shared='$(TEMP_PATH_Shared)/vcStaticOptions.xml'
# include Shared and Font Makefile (only once)
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCFntDat/Font_Visu.mak
ifneq ($(VCINC),1)
	VCINC=1
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/VCShared.mak
endif

DEPENDENCIES_Visu=-d vcgclass -profile 'False'
DEFAULT_STYLE_SHEET_Visu='Source[local].StyleSheet[Default]'
SHARED_MODULE=$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcshared.br
LFNTFLAGS_Visu=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)'
BDRFLAGS_Visu=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)'

# Local Libs
LIB_LOCAL_OBJ_Visu=$(TEMP_PATH_Visu)/localobj.vca

# Hardware sources
PANEL_HW_OBJECT_Visu=$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu/dis.Hardware.vco
PANEL_HW_VCI_Visu=$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu/dis.Hardware.vci
PANEL_HW_SOURCE_Visu=D:/Projekty\ BER/Embraco_LinkaOdlievania/Physical/Config1/Hardware.hw 
DIS_OBJECTS_Visu=$(PANEL_HW_OBJECT_Visu) $(KEYMAP_OBJECTS_Visu)

# KeyMapping flags
$(TEMP_PATH_Visu)/dis.PS2-Keyboard.vco: $(AS_PROJECT_PATH)/Physical/Config1/AB0/VC/PS2-Keyboard.dis $(PANEL_HW_SOURCE_Visu)
	$(VCHWPP) -f '$(PANEL_HW_SOURCE_Visu)' -o '$(subst .vco,.vci,$(TEMP_PATH_Visu)/dis.PS2-Keyboard.vco)' -n Visu -d Visu -pal '$(PALFILE_Visu)' -c '$(AS_CONFIGURATION)' -p '$(AS_PLC)' -ptemp '$(AS_TEMP_PLC)' -B 'C4.91' -L '' -hw '$(CPUHWC)' -warninglevel 2 -so $(VC_STATIC_OPTIONS_Visu) -sos $(VC_STATIC_OPTIONS_Shared) -keyboard '$(AS_PROJECT_PATH)/Physical/Config1/AB0/VC/PS2-Keyboard.dis' -fp '$(AS_VC_PATH)/Firmware/V4.72.6/SG4' -prj '$(AS_PROJECT_PATH)' -apj 'HlavnaLinkaNaOdlievanieRotorov_Rev1' -sfas -vcob '$(VCOBJECT_Visu)'
	$(VCC) -f '$(subst .vco,.vci,$@)' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -k '$(VCVK_SOURCES_Visu)' $(VCCFLAGS_Visu) -p Visu -sfas

KEYMAP_SOURCES_Visu=$(AS_PROJECT_PATH)/Physical/Config1/AB0/VC/PS2-Keyboard.dis 
KEYMAP_OBJECTS_Visu=$(TEMP_PATH_Visu)/dis.PS2-Keyboard.vco 

# All Source Objects
TXTGRP_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/InstantMessages.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/HeaderBar.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/PageNames.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/Buttons_PageTexts.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/Languages.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/NumPad_Limits.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/DateTimeFormats.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/StavLinky.txtgrp 

FNINFO_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Pads.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/DateTime.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Aerial_14.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Aerial_24b.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial10.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial10_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial10_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial10_Bold_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial12.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial12_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial12_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial12_Bold_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial16_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial16_Bold_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial18.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial18_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial20.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial20_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial8.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial9.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial_11Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial_11.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial_12.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial_9_Bold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Design.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Digitalny_22.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Digitalny_22_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Digitalny_50.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Digitalny_50_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/uzivatel.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Aerial_14_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Aerial_24b_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial10_1.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial10_0_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial10_Bold_1.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial10_Bold_0_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial12_1.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial12_0_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial12_Bold_1.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial12_Bold_0_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial16_Bold_1.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial16_Bold_0_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial18_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial18_Bold_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial20_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial20_Bold_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial8_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial9_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial_11Bold_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial_11_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial_12_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Arial_9_Bold_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Button.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Default.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Design_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Digitalny_22_1.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Digitalny_22_0_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Digitalny_50_1.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Digitalny_50_0_0.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Header.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Html_SDM.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Info.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Input.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/MpButton.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/MpDefault.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/MpHeader.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/MpHtml_SDM.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/MpInfo.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/MpInput.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/MpMenuButtons.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/MpPackMLStateNames.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/MpPads.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/Status.fninfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Fonts/uzivatel_0.fninfo 

BMINFO_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_AcknowledgeReset.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_BypassOFF.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_BypassON.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Inactive.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Latched.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_NotQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Quit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Reset.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_ResetAcknowledge.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Triggered.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ProgressBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarm.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox_checked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_default.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_default_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_down.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_global_area.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_global_area_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/information.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_left.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_left_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_down_multi.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_down_multi_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_up_multi.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_up_multi_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_radio_selected.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_radio.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_right.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_right_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_up.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/warning.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_decrease_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_increase.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_increase_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_decrease.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/frame_header.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox_small.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox_small_checked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BorderSlider09x09.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_BallGray.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/gauge_200x200_round_nodiv.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/gauge_NeedleRed100x11_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox_small_gray.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWXGA.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/FrameInvisible.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_off.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_on.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_ready.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_error.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackTransparent.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_Numpad.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_Numpad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_lower.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_upper.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_numeric.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_numeric2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_lowerPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_upperPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_numericPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_numeric2Pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_lower.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_upper.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_numeric.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_numeric2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_lowerPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_upperPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_numericPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_numeric2Pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/InputBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/OutputBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/LabelBoarder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/GroupControl.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Config.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Diagnostics.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Home.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Trend.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Warning.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_control_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Pozadie1366x768.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_140x140.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Arrow_left.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Arrow_right.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Automat48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWVGA_NoLogo.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWVGA_NoLogo_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_3.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_6.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_7.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_8.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Black_LED.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Blesk48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Blue_LED.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Cancel_24x24.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Cancel_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/CasDatum32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/CasDatum48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Cistenie.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DMP_LogoNew300x105.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Disketa48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Disketa_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DokoncovaciaStanica.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Domcek_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleDown32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleDown48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleLeft32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleRight32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleUp32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleUp48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Down48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EditaciaReceptur32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EditaciaReceptur48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EditaciaUzivatelov32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EditaciaUzivatelov48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Embraco_logo25x155.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EmergencyButton32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Exit_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/FileManager.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Green_LED.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Historia32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Info32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPadLimits.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPadLimits_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPad_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPad_pressed_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Kos_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Load_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/LogoDesignMP130x100.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Logo_PNG.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Logo_PNG_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Manual48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_AcknowledgeReset.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_Active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_BypassON.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_Inactive.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_NotQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_Quit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_ResetAcknowledge.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_3rdPartyEvent.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_CheckBox.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_CheckBox_checked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_CustomEvent.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_UserEvent.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_VC4Event.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAxis_Alarm.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAxis_Gear_Off.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAxis_Gear_On.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAxis_Warning.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackTransparent.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundSemiTransparent.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundVGA_Logo.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundVGA_Logo_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundVGA_Logo_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundWVGA_Logo.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBorderSlider09x09.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_control_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_decrease.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_decrease_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_default.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_default_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_device_selected_left.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_device_unselected_left.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_error.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_bottom.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_left.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_pres_bottom.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_press_left.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_increase.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_increase_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_off.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_on.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_radio_selected.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_radio_unselected.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_ready.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_down.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_down_multi.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_down_multi_press.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_left.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_left_multi.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_left_multi_press.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_left_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_right.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_right_multi.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_right_multi_pres.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_right_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_up.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_up_multi.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_up_multi_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckBoxGray.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckBoxOrange.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckbox_small.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckbox_small_checked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckbox_small_gray.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpClickMe.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpComLoggerAlarm.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpComLoggerInformation.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpComLoggerUI.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpComLoggerWarning.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_ArrowDown.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_ArrowLeft.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_ArrowRight.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_ArrowUp.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_BMP.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_CSV.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_Cancel.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_DOC.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_FILE.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_FOLDER.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_HTML.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_JPG.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_OK.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_PDF.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_TXT.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_UNKOWN.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER10.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER3.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER4.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER5.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER6.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER7.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER8.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER9.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_XLS.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_XML.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFrameHeader.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFrameInvisible.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpGroupControl.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpGroupControl_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAlarmClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAlarmXClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAlarmX.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAlarm.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAuditClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAudit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAxis1Click.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAxis1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAxisClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAxis.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCnc1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCnc2Click.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCnc3Click.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCnc.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpComClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCom.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDataClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpData.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDelta1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDelta3Click.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDelta4Click.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDelta.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpEnergyClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpEnergy.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpFileClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpFile.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpHeat.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOeeClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOeeList.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOeeTimeline.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOeeTrend.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOee.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpPackMLClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpPackML.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRecipeClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRecipeXClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRecipeX.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRecipe.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm4Click.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm4.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm5Click.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm5.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm6Click.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm6.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpScara1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpScara2Click.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpScara4Click.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpScara.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpSpindleClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpSpindle.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpTeachClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpTeach.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpTrendClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpTrend.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpUser1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpUserClick1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpUserClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpUser.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpWebXsClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpWebXs.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpWinderClick.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpWinder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_mapp.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_ActiveWarning.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_Config.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_Diagnostics.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_Home.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_Warning.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpInputBorderCenterless.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpInputBorderInactiveCenterless.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpInputBorderInactive.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpInputBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_lowerPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_lower.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_numeric2Pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_numeric2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_numericPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_numeric.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_upperPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_upper.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_lowerPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_lower.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_numeric2Pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_numeric2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_numericPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_numeric.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_upperPressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_upper.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_ListPadHor.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_ListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_ListPadVer.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_ListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_Numpad.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_Numpad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLabelBorderDown.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLabelBorderLeft.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLabelBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLabelBorder_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLogoTransparent.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeList.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeList_64x64.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeTimeline.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeTimeline_64x64.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeTrend.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeTrend_64x64.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOutputBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_BlueOFF.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_BlueON.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_GreenOFF.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_GreenON.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_Main.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_YellowOFF.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_YellowON.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpProgressBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpSlider_BallGray.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpSlider_BallGray_small.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Add.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Copy.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Cut.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Delete.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Export.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Generate.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Import.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Insert.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_MoveDown.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_MoveUp.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Paste.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Replace.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_add.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_add_locked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_delete.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_delete_locked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_edit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_edit_locked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_CriteriaError.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_CriteriaOK.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Exit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Exit_locked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Export.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Export_locked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Import.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Import_locked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_UserEdit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_UserGroupEdit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_add.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_add_locked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_clock_stop.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_delete.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_delete_locked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_edit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_edit_locked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_lock.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_lock_locked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_pw_change.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_pw_change_locked.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/NOK48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/NoveLogoDMP.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Nulovanie48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/OK48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Odhlasenie_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PageDOWN.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PageUP.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ParametreZariadenia32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PriebeznyRezim.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Prihlasovanie48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Receptury48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Receptury.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Recepty48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/RecipeLoad.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/RecipeSave.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Recipe_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Red_LED.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Resetlinky.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ScrollDOWN.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ScrollUP.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Setup32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Setup48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVlavo32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVlavoHore_48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVpravo32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Sipka_spat.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SivaLED_30x30.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_09x09.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_ArrowRightGray.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_ArrowUpGray.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slniecko32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Spat.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StartVyroby.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Start.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StopVyroby.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SvetloON.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SystemoveNastavenia.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Up48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Uzivatelia48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ViewFile48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/YES_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamkaOdomknuta_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamkaZamknuta_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Zamok48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamokLock.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamokUnlock.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZaskrtPolicka48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/agt_forum.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/agt_home.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarm_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarmd.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarmd_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alert.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/anglicka_vlajka32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/anglicka_vlajka48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/anglicka_vlajka64x64.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/cervena_kontrolka.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/cervena_led.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ciselna_klavesnica.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ciselna_klavesnica_stlacena.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/domcek_s_krizom32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/domov.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/edit_user.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/fileexport.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/filesave.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/gohome.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/kfm.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/klavesnica.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/klavesnica_stlacena.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/nastaveniaKolieska48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/priebehovyRezim.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/revert.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/siva_kontrolka.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/siva_led.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/slovenska_vlajka32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/slovenska_vlajka48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/slovenska_vlajka64x64.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/stopAutomat.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/stop.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/text_block.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/text_block_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/undo.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/undo_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zamka_biela32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zamka_cierna32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zelena_kontrolka.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zelena_led.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zvoncek_biely32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zvoncek_cierny.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_60x60.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWVGA_NoLogo_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWVGA_NoLogo_0_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_1_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_2_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_3_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Cistenie_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DMP_LogoNew300x105_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DokoncovaciaStanica_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Domcek_32x32_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleDown48x48_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleUp48x48_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Down48x48_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Embraco_logo25x155_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/FileManager_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Info32x32_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPad_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPad_pressed_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Logo_PNG_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/NoveLogoDMP_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Odhlasenie_32x32_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PageDOWN_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PageUP_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Receptury48x48_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Receptury_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/RecipeLoad_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/RecipeSave_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Red_LED_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Resetlinky_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ScrollDOWN_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ScrollUP_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Setup32x32_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Setup48x48_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SivaLED_30x30_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_09x09_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StartVyroby_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Start_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StavZariadenia32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StopVyroby_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SystemoveNastavenia_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Up48x48_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Uzivatelia48x48_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/YES_32x32_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamkaOdomknuta_32x32_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamkaZamknuta_32x32_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Zamok48x48_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamokLock_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamokUnlock_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/agt_forum_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/agt_home_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarm_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarmd_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarmd_0_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/cervena_kontrolka_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/cervena_led_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_0_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_1_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/edit_user_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/fileexport_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/filesave_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info_0_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/kfm_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_0_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_1_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/nastaveniaKolieska48x48_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/priebehovyRezim_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/revert_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/siva_kontrolka_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/siva_led_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/stopAutomat_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/stop_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/text_block_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/text_block_0_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/undo_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/undo_0_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zelena_kontrolka_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zelena_led_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zvoncek_biely32x32_0.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/LogoDesignMP_1366x768.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Linka_1360x632.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Horak.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info_black.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Help_60x60.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Info_60x60.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Warning_60x60.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ChipCarta.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ID_Cards128x128.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ID_Cards36x36.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ID_Cards46x46.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVlavo_64x64.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVpravo_64x64.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaBlackRight_48x48.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/CS_NG_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/CS_OK_32x32.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_4.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_5.bminfo \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Info_32x32.bminfo 

BMGRP_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/SymbolAlarmu60x60.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/GlobalArea.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/AlarmAcknowledgeState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/AlarmBypassState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/AlarmEvent.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/AlarmState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/Borders.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/MpBorders.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/MpPads.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/Pads.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/StavBezpecnZamku.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/SymbolAlarmu2.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/SymbolAlarmu.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/SymbolZamku.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/ZelenaKontrolka30x30.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/msgBox.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/CheckBox.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/PristupovaKarta.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/ID_Karta46x46.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/Stav_CS.bmgrp 

PAGE_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/ObrazovkaInfo.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/StartPage.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/StavZariadenia_Page2.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/NastavenieCasuDatumu.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/ObrazovkaHistorieAlarmov.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/OvladanieZamkovOplotenia.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RecepturyEditacia.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RecepturyVyber.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/UzivateliaEditacia.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/ObrazovkaAlarmov.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/SetupZariadenia.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/AutomatickyRezim.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/HlavnaObrazovka.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RR_HlavnaObrazovka.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/SetupHlavnaObrazovka.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RR_Stol.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RR_Centrifuga1.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RR_Centrifuga2.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RR_Tunel.page \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/StavZariadenia_Page1.page 

LAYER_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/globalArea.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/Background.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpVstupnyOddelovac.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpManipulator.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpStol.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/Pozadie_DMP.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpResetZariadenia.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PozadieBack.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PozadiePrazdne.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PozadieAlarmySetupInfo.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PozadieBackRR.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PozadieHomeAlarmySetup.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopAlarm.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpCentrifuga1.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpCentrifuga2.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpTunel.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpRobotOdliev.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpRobotManip.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/Upozornenia_1.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpKontrolaDeklaPece.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpZaplnenieVystupTrate.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpTunelVstup.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PozadieSpravaUzivatelovBack.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpNizkaHladinaHlinika.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpVyskaBalika.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpKontrolaNaliatkovNG.layer \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpDruhaKontrolaDeklaPece.layer 

VCS_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/StyleSheets/Default.vcs 

BDR_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/OutputBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/InputBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/GroupControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/LabelBoarder.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Control.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Control_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/TabActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Flat_black.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Flat_grey.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/FrameGlobal.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/FrameInvisible.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Flat_grey.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_FrameInvisible.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_LabelBorderDown.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_TabActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/OverdriveBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/RaisedInner.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Raised.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/SliderBorder09.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/SunkenOuter.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Sunken.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Decrease.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Decrease_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Global_Area.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Global_Area_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Increase.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Increase_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_KeyRingOff.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_KeyRingOn.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Multi_Scroll_Down.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Multi_Scroll_Down_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Multi_Scroll_Up.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Multi_Scroll_Up_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Radio.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Radio_selected.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scoll_Up.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scoll_Up_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scroll_Down.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scroll_Down_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scroll_Left.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scroll_Left_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scroll_Right.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scroll_Right_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/CheckBox_checked.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/FrameHeader.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Control.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Control_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Multi_Scroll_Down.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Multi_Scroll_Dwn_press.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Multi_Scroll_Up.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Multi_Scroll_Up_press.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Scoll_Up.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Scoll_Up_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Scroll_Down.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Scroll_Down_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_pressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_CheckBox_checked.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_GroupControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_InputBorderInactive.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_InputBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_LabelBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_OutputBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_SunkenNG.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/ProgressBarBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/SunkenNG.bdr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/SunkenNGgray.bdr 

TPR_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/AlphaPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/EditPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/MpAlphaPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/MpNumPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/NavigationPad_hor.tpr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/NavigationPad_ver.tpr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/NumPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/NumPad_Limits.tpr 

TDC_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Trends/TrendData.tdc 

TRD_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Trends/CPUTemperature.trd \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Trends/ROOMTemperature.trd 

TRE_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Trends/Trend_Temperature.tre 

CLM_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/ControlkaNC.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/ControlkaNO.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/KontrolkaSivaModra.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/KontrolkaSivaZelena.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/ResetBezpecnosti.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaRucnyRezim.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaTlacitkaCistenie.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaTlacitkaStart.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaTlacitkaUkoncenie.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaUpozornenia.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/StavZariadenia.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/cervena_zelena.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaZamkovOplotenia.clm \
	$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaBezpecnosti.clm 

VCVK_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/VirtualKeys.vcvk 

VCR_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Palette.vcr 

# Runtime Object sources
VCR_OBJECT_Visu=$(TEMP_PATH_Visu)/vcrt.vco
VCR_SOURCE_Visu=$(SRC_PATH_Visu)/package.vcp
# All Source Objects END

#Panel Hardware
$(PANEL_HW_VCI_Visu): $(PANEL_HW_SOURCE_Visu) $(VC_LIBRARY_LIST_Visu) $(KEYMAP_SOURCES_Visu) $(PALFILE_Visu)
	$(VCHWPP) -f '$<' -o '$@' -n Visu -d Visu -pal '$(PALFILE_Visu)' -c '$(AS_CONFIGURATION)' -p '$(AS_PLC)' -ptemp '$(AS_TEMP_PLC)' -B 'C4.91' -L '' -verbose 'False' -profile 'False' -hw '$(CPUHWC)' -warninglevel 2 -so $(VC_STATIC_OPTIONS_Visu) -sos $(VC_STATIC_OPTIONS_Shared) -fp '$(AS_VC_PATH)/Firmware/V4.72.6/SG4' -sfas -prj '$(AS_PROJECT_PATH)' -apj 'HlavnaLinkaNaOdlievanieRotorov_Rev1' -vcob '$(VCOBJECT_Visu)'

$(PANEL_HW_OBJECT_Visu): $(PANEL_HW_VCI_Visu) $(VC_LIBRARY_LIST_Visu)
	$(VCC) -f '$(subst .vco,.vci,$@)' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -k '$(VCVK_SOURCES_Visu)' $(VCCFLAGS_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


# Pages
PAGE_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/page., $(notdir $(PAGE_SOURCES_Visu:.page=.vco)))

$(TEMP_PATH_Visu)/page.ObrazovkaInfo.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/ObrazovkaInfo.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.StartPage.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/StartPage.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.StavZariadenia_Page2.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/StavZariadenia_Page2.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.NastavenieCasuDatumu.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/NastavenieCasuDatumu.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.ObrazovkaHistorieAlarmov.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/ObrazovkaHistorieAlarmov.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.OvladanieZamkovOplotenia.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/OvladanieZamkovOplotenia.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.RecepturyEditacia.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RecepturyEditacia.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.RecepturyVyber.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RecepturyVyber.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.UzivateliaEditacia.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/UzivateliaEditacia.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.ObrazovkaAlarmov.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/ObrazovkaAlarmov.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.SetupZariadenia.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/SetupZariadenia.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.AutomatickyRezim.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/AutomatickyRezim.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.HlavnaObrazovka.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/HlavnaObrazovka.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.RR_HlavnaObrazovka.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RR_HlavnaObrazovka.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.SetupHlavnaObrazovka.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/SetupHlavnaObrazovka.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.RR_Stol.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RR_Stol.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.RR_Centrifuga1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RR_Centrifuga1.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.RR_Centrifuga2.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RR_Centrifuga2.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.RR_Tunel.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/RR_Tunel.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/page.StavZariadenia_Page1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Pages/StavZariadenia_Page1.page $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu)/StyleSheets/Default.vcs' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


#Pages END




# Stylesheets
VCS_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/vcs., $(notdir $(VCS_SOURCES_Visu:.vcs=.vco)))

$(TEMP_PATH_Visu)/vcs.Default.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/StyleSheets/Default.vcs
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -P '$(AS_PROJECT_PATH)' -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


#Stylesheets END




# Layers
LAYER_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/layer., $(notdir $(LAYER_SOURCES_Visu:.layer=.vco)))

$(TEMP_PATH_Visu)/layer.globalArea.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/globalArea.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.Background.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/Background.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpVstupnyOddelovac.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpVstupnyOddelovac.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpManipulator.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpManipulator.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpStol.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpStol.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.Pozadie_DMP.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/Pozadie_DMP.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpResetZariadenia.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpResetZariadenia.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PozadieBack.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PozadieBack.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PozadiePrazdne.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PozadiePrazdne.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PozadieAlarmySetupInfo.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PozadieAlarmySetupInfo.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PozadieBackRR.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PozadieBackRR.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PozadieHomeAlarmySetup.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PozadieHomeAlarmySetup.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopAlarm.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopAlarm.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpCentrifuga1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpCentrifuga1.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpCentrifuga2.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpCentrifuga2.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpTunel.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpTunel.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpRobotOdliev.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpRobotOdliev.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpRobotManip.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpRobotManip.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.Upozornenia_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/Upozornenia_1.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpKontrolaDeklaPece.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpKontrolaDeklaPece.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpZaplnenieVystupTrate.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpZaplnenieVystupTrate.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpTunelVstup.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpTunelVstup.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PozadieSpravaUzivatelovBack.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PozadieSpravaUzivatelovBack.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpNizkaHladinaHlinika.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpNizkaHladinaHlinika.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpVyskaBalika.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpVyskaBalika.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpKontrolaNaliatkovNG.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpKontrolaNaliatkovNG.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/layer.PopUpDruhaKontrolaDeklaPece.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Layers/PopUpDruhaKontrolaDeklaPece.layer $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -ds $(DEFAULT_STYLE_SHEET_Visu) -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


#Layers END




# Virtual Keys
VCVK_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/vcvk., $(notdir $(VCVK_SOURCES_Visu:.vcvk=.vco)))

$(TEMP_PATH_Visu)/vcvk.VirtualKeys.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/VirtualKeys.vcvk
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas

$(VCVK_OBJECTS_Visu): $(VC_LANGUAGES_Visu)

#Virtual Keys END




# Touch Pads
TPR_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/tpr., $(notdir $(TPR_SOURCES_Visu:.tpr=.vco)))

$(TEMP_PATH_Visu)/tpr.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/AlphaPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'D:/Projekty BER/Embraco_LinkaOdlievania/Logical/Vizualizacia/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/tpr.EditPad.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/EditPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'D:/Projekty BER/Embraco_LinkaOdlievania/Logical/Vizualizacia/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/tpr.MpAlphaPad.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/MpAlphaPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'D:/Projekty BER/Embraco_LinkaOdlievania/Logical/Vizualizacia/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/tpr.MpNumPad.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/MpNumPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'D:/Projekty BER/Embraco_LinkaOdlievania/Logical/Vizualizacia/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/tpr.NavigationPad_hor.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/NavigationPad_hor.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'D:/Projekty BER/Embraco_LinkaOdlievania/Logical/Vizualizacia/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/tpr.NavigationPad_ver.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/NavigationPad_ver.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'D:/Projekty BER/Embraco_LinkaOdlievania/Logical/Vizualizacia/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/tpr.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/NumPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'D:/Projekty BER/Embraco_LinkaOdlievania/Logical/Vizualizacia/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/tpr.NumPad_Limits.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TouchPads/NumPad_Limits.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu) -prj 'D:/Projekty BER/Embraco_LinkaOdlievania/Logical/Vizualizacia/Visu' -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


#Touch Pads END




# Text Groups
TXTGRP_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/txtgrp., $(notdir $(TXTGRP_SOURCES_Visu:.txtgrp=.vco)))

$(TEMP_PATH_Visu)/txtgrp.InstantMessages.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/InstantMessages.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/txtgrp.HeaderBar.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/HeaderBar.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/txtgrp.PageNames.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/PageNames.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/txtgrp.Buttons_PageTexts.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/Buttons_PageTexts.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/txtgrp.Languages.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/Languages.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/txtgrp.NumPad_Limits.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/NumPad_Limits.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/txtgrp.DateTimeFormats.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/DateTimeFormats.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/txtgrp.StavLinky.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/TextGroups/StavLinky.txtgrp $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


#Text Groups END




# BitmapGroups
BMGRP_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/bmgrp., $(notdir $(BMGRP_SOURCES_Visu:.bmgrp=.vco)))

$(TEMP_PATH_Visu)/bmgrp.SymbolAlarmu60x60.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/SymbolAlarmu60x60.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.GlobalArea.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/GlobalArea.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.AlarmAcknowledgeState.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/AlarmAcknowledgeState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.AlarmBypassState.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/AlarmBypassState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.AlarmEvent.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/AlarmEvent.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.AlarmState.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/AlarmState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.Borders.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/Borders.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.MpBorders.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/MpBorders.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.MpPads.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/MpPads.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.Pads.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/Pads.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.StavBezpecnZamku.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/StavBezpecnZamku.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.SymbolAlarmu2.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/SymbolAlarmu2.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.SymbolAlarmu.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/SymbolAlarmu.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.SymbolZamku.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/SymbolZamku.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.ZelenaKontrolka30x30.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/ZelenaKontrolka30x30.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.msgBox.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/msgBox.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.CheckBox.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/CheckBox.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.PristupovaKarta.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/PristupovaKarta.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.ID_Karta46x46.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/ID_Karta46x46.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bmgrp.Stav_CS.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/BitmapGroups/Stav_CS.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


#BitmapGroups END




# Bitmaps
BMINFO_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/bminfo., $(notdir $(BMINFO_SOURCES_Visu:.bminfo=.vco)))

$(TEMP_PATH_Visu)/bminfo.Alarm_AcknowledgeReset.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_AcknowledgeReset.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_AcknowledgeReset.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_Active.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Active.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Active.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_BypassOFF.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_BypassOFF.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_BypassOFF.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_BypassON.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_BypassON.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_BypassON.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_Inactive.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Inactive.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Inactive.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_Latched.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Latched.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Latched.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_NotQuit.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_NotQuit.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_NotQuit.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_Quit.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Quit.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Quit.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_Reset.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Reset.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Reset.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_ResetAcknowledge.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_ResetAcknowledge.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_ResetAcknowledge.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_Triggered.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Triggered.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_Triggered.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ProgressBorder.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ProgressBorder.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ProgressBorder.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.alarm.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarm.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarm.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.checkbox.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.checkbox_checked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox_checked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox_checked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_default.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_default.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_default.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_default_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_default_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_default_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_down.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_down.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_down.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_global_area.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_global_area.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_global_area.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_global_area_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_global_area_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_global_area_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.information.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/information.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/information.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_left.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_left.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_left.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_left_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_left_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_left_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_down_multi.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_down_multi.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_down_multi.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_down_multi_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_down_multi_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_down_multi_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_up_multi.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_up_multi.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_up_multi.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_up_multi_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_up_multi_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_up_multi_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_radio_selected.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_radio_selected.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_radio_selected.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_radio.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_radio.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_radio.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_right.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_right.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_right.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_right_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_right_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_right_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_up.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_up.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_up.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_up_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_up_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.warning.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/warning.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/warning.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_decrease_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_decrease_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_decrease_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_increase.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_increase.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_increase.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_increase_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_increase_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_increase_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_decrease.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_decrease.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_decrease.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.frame_header.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/frame_header.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/frame_header.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.checkbox_small.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox_small.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox_small.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.checkbox_small_checked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox_small_checked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox_small_checked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.BorderSlider09x09.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BorderSlider09x09.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BorderSlider09x09.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Slider_BallGray.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_BallGray.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_BallGray.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.gauge_200x200_round_nodiv.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/gauge_200x200_round_nodiv.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/gauge_200x200_round_nodiv.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.gauge_NeedleRed100x11_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/gauge_NeedleRed100x11_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/gauge_NeedleRed100x11_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.checkbox_small_gray.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox_small_gray.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/checkbox_small_gray.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.BackgroundWXGA.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWXGA.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWXGA.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.FrameInvisible.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/FrameInvisible.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/FrameInvisible.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_off.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_off.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_off.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_on.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_on.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_on.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_ready.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_ready.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_ready.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_error.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_error.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_error.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.BackTransparent.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackTransparent.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackTransparent.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_Numpad.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_Numpad.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_Numpad.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_Numpad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_Numpad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_Numpad_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_lower.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_lower.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_lower.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_upper.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_upper.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_upper.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_numeric.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_numeric.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_numeric.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_numeric2.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_numeric2.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_numeric2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_lowerPressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_lowerPressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_lowerPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_upperPressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_upperPressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_upperPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_numericPressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_numericPressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_numericPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_numeric2Pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_numeric2Pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_numeric2Pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadVer.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadHor.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_lower.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_lower.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_lower.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_upper.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_upper.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_upper.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_numeric.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_numeric.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_numeric.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_numeric2.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_numeric2.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_numeric2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_lowerPressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_lowerPressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_lowerPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_upperPressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_upperPressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_upperPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_numericPressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_numericPressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_numericPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_numeric2Pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_numeric2Pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_numeric2Pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.InputBorder.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/InputBorder.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/InputBorder.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_scroll_down_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_scroll_down_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.OutputBorder.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/OutputBorder.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/OutputBorder.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.LabelBoarder.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/LabelBoarder.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/LabelBoarder.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.GroupControl.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/GroupControl.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/GroupControl.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Img_Config.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Config.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Config.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Img_Diagnostics.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Diagnostics.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Diagnostics.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Img_Home.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Home.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Home.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Img_Trend.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Trend.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Trend.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Img_Warning.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Warning.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Img_Warning.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_control.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_control.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_control.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.button_control_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_control_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/button_control_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Pozadie1366x768.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Pozadie1366x768.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Pozadie1366x768.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_140x140.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_140x140.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_140x140.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Arrow_left.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Arrow_left.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Arrow_left.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Arrow_right.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Arrow_right.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Arrow_right.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Automat48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Automat48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Automat48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.BackgroundWVGA_NoLogo.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWVGA_NoLogo.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWVGA_NoLogo.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.BackgroundWVGA_NoLogo_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWVGA_NoLogo_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWVGA_NoLogo_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_2.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_2.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_3.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_3.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_3.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_6.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_6.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_6.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_7.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_7.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_7.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_8.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_8.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_8.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Black_LED.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Black_LED.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Black_LED.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Blesk48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Blesk48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Blesk48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Blue_LED.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Blue_LED.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Blue_LED.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Cancel_24x24.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Cancel_24x24.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Cancel_24x24.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Cancel_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Cancel_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Cancel_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.CasDatum32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/CasDatum32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/CasDatum32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.CasDatum48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/CasDatum48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/CasDatum48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Cistenie.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Cistenie.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Cistenie.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.DMP_LogoNew300x105.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DMP_LogoNew300x105.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DMP_LogoNew300x105.jpg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Disketa48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Disketa48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Disketa48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Disketa_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Disketa_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Disketa_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.DokoncovaciaStanica.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DokoncovaciaStanica.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DokoncovaciaStanica.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Domcek_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Domcek_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Domcek_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.DoubleDown32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleDown32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleDown32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.DoubleDown48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleDown48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleDown48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.DoubleLeft32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleLeft32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleLeft32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.DoubleRight32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleRight32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleRight32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.DoubleUp32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleUp32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleUp32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.DoubleUp48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleUp48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleUp48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Down48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Down48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Down48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.EditaciaReceptur32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EditaciaReceptur32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EditaciaReceptur32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.EditaciaReceptur48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EditaciaReceptur48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EditaciaReceptur48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.EditaciaUzivatelov32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EditaciaUzivatelov32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EditaciaUzivatelov32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.EditaciaUzivatelov48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EditaciaUzivatelov48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EditaciaUzivatelov48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Embraco_logo25x155.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Embraco_logo25x155.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Embraco_logo25x155.jpg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.EmergencyButton32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EmergencyButton32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/EmergencyButton32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Exit_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Exit_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Exit_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.FileManager.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/FileManager.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/FileManager.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Green_LED.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Green_LED.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Green_LED.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Historia32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Historia32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Historia32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Info32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Info32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Info32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_AlphaPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_AlphaPad_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_EditPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_EditPad_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadHor_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadHor_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_pressed_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadVer_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadVer_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_pressed_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_NumPadLimits.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPadLimits.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPadLimits.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_NumPadLimits_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPadLimits_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPadLimits_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_NumPad_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPad_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPad_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_NumPad_pressed_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPad_pressed_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPad_pressed_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Kos_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Kos_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Kos_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Load_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Load_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Load_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.LogoDesignMP130x100.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/LogoDesignMP130x100.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/LogoDesignMP130x100.jpg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Logo_PNG.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Logo_PNG.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Logo_PNG.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Logo_PNG_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Logo_PNG_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Logo_PNG_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Manual48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Manual48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Manual48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAlarm_AcknowledgeReset.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_AcknowledgeReset.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_AcknowledgeReset.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAlarm_Active.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_Active.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_Active.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAlarm_BypassON.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_BypassON.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_BypassON.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAlarm_Inactive.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_Inactive.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_Inactive.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAlarm_NotQuit.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_NotQuit.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_NotQuit.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAlarm_Quit.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_Quit.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_Quit.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAlarm_ResetAcknowledge.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_ResetAcknowledge.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAlarm_ResetAcknowledge.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAudit_3rdPartyEvent.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_3rdPartyEvent.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_3rdPartyEvent.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAudit_CheckBox.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_CheckBox.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_CheckBox.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAudit_CheckBox_checked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_CheckBox_checked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_CheckBox_checked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAudit_CustomEvent.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_CustomEvent.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_CustomEvent.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAudit_UserEvent.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_UserEvent.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_UserEvent.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAudit_VC4Event.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_VC4Event.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAudit_VC4Event.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAxis_Alarm.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAxis_Alarm.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAxis_Alarm.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAxis_Gear_Off.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAxis_Gear_Off.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAxis_Gear_Off.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAxis_Gear_On.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAxis_Gear_On.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAxis_Gear_On.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpAxis_Warning.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAxis_Warning.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpAxis_Warning.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpBackTransparent.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackTransparent.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackTransparent.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpBackgroundSemiTransparent.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundSemiTransparent.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundSemiTransparent.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpBackgroundVGA_Logo.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundVGA_Logo.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundVGA_Logo.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpBackgroundVGA_Logo_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundVGA_Logo_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundVGA_Logo_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpBackgroundVGA_Logo_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundVGA_Logo_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundVGA_Logo_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpBackgroundWVGA_Logo.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundWVGA_Logo.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBackgroundWVGA_Logo.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpBorderSlider09x09.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBorderSlider09x09.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpBorderSlider09x09.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_control.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_control.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_control.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_control_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_control_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_control_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_decrease.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_decrease.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_decrease.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_decrease_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_decrease_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_decrease_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_default.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_default.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_default.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_default_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_default_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_default_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_device_selected_left.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_device_selected_left.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_device_selected_left.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_device_unselected_left.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_device_unselected_left.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_device_unselected_left.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_error.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_error.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_error.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_global_area.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_global_area_bottom.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_bottom.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_bottom.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_global_area_left.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_left.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_left.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_global_area_pres_bottom.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_pres_bottom.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_pres_bottom.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_global_area_press_left.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_press_left.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_press_left.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_global_area_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_global_area_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_increase.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_increase.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_increase.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_increase_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_increase_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_increase_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_off.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_off.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_off.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_on.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_on.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_on.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_radio_selected.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_radio_selected.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_radio_selected.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_radio_unselected.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_radio_unselected.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_radio_unselected.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_ready.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_ready.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_ready.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_down.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_down.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_down.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_down_multi.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_down_multi.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_down_multi.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_down_multi_press.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_down_multi_press.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_down_multi_press.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_down_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_down_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_left.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_left.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_left.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_left_multi.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_left_multi.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_left_multi.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_left_multi_press.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_left_multi_press.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_left_multi_press.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_left_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_left_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_left_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_right.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_right.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_right.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_right_multi.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_right_multi.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_right_multi.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_right_multi_pres.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_right_multi_pres.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_right_multi_pres.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_right_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_right_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_right_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_up.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_up.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_up.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_up_multi.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_up_multi.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_up_multi.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_up_multi_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_up_multi_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_up_multi_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpButton_scroll_up_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpButton_scroll_up_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpCheckBoxGray.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckBoxGray.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckBoxGray.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpCheckBoxOrange.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckBoxOrange.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckBoxOrange.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpCheckbox_small.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckbox_small.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckbox_small.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpCheckbox_small_checked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckbox_small_checked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckbox_small_checked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpCheckbox_small_gray.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckbox_small_gray.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpCheckbox_small_gray.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpClickMe.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpClickMe.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpClickMe.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpComLoggerAlarm.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpComLoggerAlarm.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpComLoggerAlarm.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpComLoggerInformation.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpComLoggerInformation.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpComLoggerInformation.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpComLoggerUI.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpComLoggerUI.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpComLoggerUI.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpComLoggerWarning.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpComLoggerWarning.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpComLoggerWarning.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_ArrowDown.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_ArrowDown.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_ArrowDown.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_ArrowLeft.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_ArrowLeft.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_ArrowLeft.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_ArrowRight.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_ArrowRight.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_ArrowRight.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_ArrowUp.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_ArrowUp.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_ArrowUp.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_BMP.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_BMP.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_BMP.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_CSV.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_CSV.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_CSV.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_Cancel.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_Cancel.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_Cancel.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_DOC.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_DOC.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_DOC.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_FILE.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_FILE.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_FILE.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_FOLDER.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_FOLDER.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_FOLDER.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_HTML.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_HTML.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_HTML.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_JPG.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_JPG.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_JPG.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_OK.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_OK.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_OK.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_PDF.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_PDF.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_PDF.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_TXT.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_TXT.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_TXT.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_UNKOWN.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_UNKOWN.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_UNKOWN.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_USER10.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER10.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER10.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_USER1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_USER2.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER2.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_USER3.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER3.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER3.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_USER4.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER4.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER4.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_USER5.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER5.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER5.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_USER6.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER6.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER6.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_USER7.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER7.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER7.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_USER8.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER8.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER8.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_USER9.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER9.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_USER9.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_XLS.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_XLS.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_XLS.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFile_XML.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_XML.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFile_XML.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFrameHeader.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFrameHeader.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFrameHeader.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpFrameInvisible.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFrameInvisible.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpFrameInvisible.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpGroupControl.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpGroupControl.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpGroupControl.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpGroupControl_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpGroupControl_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpGroupControl_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpAlarmClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAlarmClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAlarmClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpAlarmXClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAlarmXClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAlarmXClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpAlarmX.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAlarmX.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAlarmX.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpAlarm.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAlarm.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAlarm.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpAuditClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAuditClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAuditClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpAudit.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAudit.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAudit.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpAxis1Click.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAxis1Click.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAxis1Click.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpAxis1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAxis1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAxis1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpAxisClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAxisClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAxisClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpAxis.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAxis.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpAxis.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpCnc1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCnc1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCnc1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpCnc2Click.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCnc2Click.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCnc2Click.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpCnc3Click.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCnc3Click.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCnc3Click.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpCnc.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCnc.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCnc.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpComClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpComClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpComClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpCom.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCom.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpCom.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpDataClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDataClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDataClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpData.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpData.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpData.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpDelta1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDelta1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDelta1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpDelta3Click.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDelta3Click.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDelta3Click.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpDelta4Click.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDelta4Click.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDelta4Click.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpDelta.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDelta.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpDelta.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpEnergyClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpEnergyClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpEnergyClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpEnergy.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpEnergy.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpEnergy.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpFileClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpFileClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpFileClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpFile.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpFile.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpFile.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpHeat.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpHeat.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpHeat.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpOeeClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOeeClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOeeClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpOeeList.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOeeList.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOeeList.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpOeeTimeline.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOeeTimeline.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOeeTimeline.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpOeeTrend.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOeeTrend.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOeeTrend.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpOee.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOee.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpOee.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpPackMLClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpPackMLClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpPackMLClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpPackML.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpPackML.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpPackML.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpRecipeClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRecipeClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRecipeClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpRecipeXClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRecipeXClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRecipeXClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpRecipeX.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRecipeX.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRecipeX.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpRecipe.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRecipe.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRecipe.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpRoboArm4Click.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm4Click.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm4Click.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpRoboArm4.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm4.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm4.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpRoboArm5Click.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm5Click.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm5Click.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpRoboArm5.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm5.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm5.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpRoboArm6Click.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm6Click.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm6Click.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpRoboArm6.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm6.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpRoboArm6.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpScara1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpScara1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpScara1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpScara2Click.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpScara2Click.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpScara2Click.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpScara4Click.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpScara4Click.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpScara4Click.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpScara.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpScara.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpScara.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpSpindleClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpSpindleClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpSpindleClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpSpindle.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpSpindle.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpSpindle.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpTeachClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpTeachClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpTeachClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpTeach.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpTeach.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpTeach.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpTrendClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpTrendClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpTrendClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpTrend.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpTrend.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpTrend.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpUser1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpUser1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpUser1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpUserClick1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpUserClick1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpUserClick1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpUserClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpUserClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpUserClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpUser.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpUser.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpUser.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpWebXsClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpWebXsClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpWebXsClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpWebXs.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpWebXs.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpWebXs.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpWinderClick.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpWinderClick.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpWinderClick.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_MpWinder.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpWinder.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_MpWinder.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpIcon_mapp.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_mapp.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpIcon_mapp.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpImg_ActiveWarning.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_ActiveWarning.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_ActiveWarning.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpImg_Config.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_Config.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_Config.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpImg_Diagnostics.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_Diagnostics.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_Diagnostics.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpImg_Home.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_Home.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_Home.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpImg_Warning.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_Warning.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpImg_Warning.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpInputBorderCenterless.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpInputBorderCenterless.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpInputBorderCenterless.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpInputBorderInactiveCenterless.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpInputBorderInactiveCenterless.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpInputBorderInactiveCenterless.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpInputBorderInactive.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpInputBorderInactive.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpInputBorderInactive.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpInputBorder.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpInputBorder.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpInputBorder.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_AlphaPad_lowerPressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_lowerPressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_lowerPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_AlphaPad_lower.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_lower.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_lower.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_AlphaPad_numeric2Pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_numeric2Pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_numeric2Pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_AlphaPad_numeric2.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_numeric2.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_numeric2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_AlphaPad_numericPressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_numericPressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_numericPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_AlphaPad_numeric.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_numeric.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_numeric.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_AlphaPad_upperPressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_upperPressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_upperPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_AlphaPad_upper.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_upper.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_AlphaPad_upper.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_EditPad_lowerPressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_lowerPressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_lowerPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_EditPad_lower.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_lower.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_lower.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_EditPad_numeric2Pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_numeric2Pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_numeric2Pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_EditPad_numeric2.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_numeric2.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_numeric2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_EditPad_numericPressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_numericPressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_numericPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_EditPad_numeric.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_numeric.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_numeric.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_EditPad_upperPressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_upperPressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_upperPressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_EditPad_upper.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_upper.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_EditPad_upper.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_ListPadHor.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_ListPadHor.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_ListPadHor.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_ListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_ListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_ListPadHor_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_ListPadVer.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_ListPadVer.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_ListPadVer.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_ListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_ListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_ListPadVer_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_Numpad.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_Numpad.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_Numpad.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpKey_Numpad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_Numpad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpKey_Numpad_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpLabelBorderDown.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLabelBorderDown.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLabelBorderDown.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpLabelBorderLeft.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLabelBorderLeft.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLabelBorderLeft.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpLabelBorder.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLabelBorder.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLabelBorder.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpLabelBorder_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLabelBorder_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLabelBorder_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpLogoTransparent.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLogoTransparent.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpLogoTransparent.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpOeeList.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeList.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeList.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpOeeList_64x64.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeList_64x64.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeList_64x64.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpOeeTimeline.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeTimeline.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeTimeline.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpOeeTimeline_64x64.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeTimeline_64x64.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeTimeline_64x64.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpOeeTrend.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeTrend.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeTrend.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpOeeTrend_64x64.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeTrend_64x64.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOeeTrend_64x64.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpOutputBorder.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOutputBorder.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpOutputBorder.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpPackML_BlueOFF.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_BlueOFF.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_BlueOFF.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpPackML_BlueON.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_BlueON.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_BlueON.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpPackML_GreenOFF.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_GreenOFF.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_GreenOFF.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpPackML_GreenON.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_GreenON.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_GreenON.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpPackML_Main.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_Main.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_Main.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpPackML_YellowOFF.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_YellowOFF.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_YellowOFF.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpPackML_YellowON.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_YellowON.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpPackML_YellowON.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpProgressBorder.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpProgressBorder.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpProgressBorder.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpSlider_BallGray.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpSlider_BallGray.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpSlider_BallGray.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpSlider_BallGray_small.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpSlider_BallGray_small.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpSlider_BallGray_small.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpTeach_Add.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Add.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Add.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpTeach_Copy.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Copy.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Copy.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpTeach_Cut.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Cut.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Cut.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpTeach_Delete.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Delete.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Delete.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpTeach_Export.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Export.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Export.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpTeach_Generate.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Generate.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Generate.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpTeach_Import.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Import.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Import.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpTeach_Insert.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Insert.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Insert.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpTeach_MoveDown.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_MoveDown.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_MoveDown.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpTeach_MoveUp.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_MoveUp.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_MoveUp.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpTeach_Paste.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Paste.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Paste.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpTeach_Replace.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Replace.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpTeach_Replace.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUserGroup_add.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_add.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_add.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUserGroup_add_locked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_add_locked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_add_locked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUserGroup_delete.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_delete.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_delete.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUserGroup_delete_locked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_delete_locked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_delete_locked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUserGroup_edit.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_edit.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_edit.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUserGroup_edit_locked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_edit_locked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUserGroup_edit_locked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_CriteriaError.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_CriteriaError.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_CriteriaError.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_CriteriaOK.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_CriteriaOK.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_CriteriaOK.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_Exit.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Exit.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Exit.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_Exit_locked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Exit_locked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Exit_locked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_Export.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Export.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Export.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_Export_locked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Export_locked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Export_locked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_Import.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Import.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Import.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_Import_locked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Import_locked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_Import_locked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_UserEdit.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_UserEdit.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_UserEdit.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_UserGroupEdit.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_UserGroupEdit.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_UserGroupEdit.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_add.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_add.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_add.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_add_locked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_add_locked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_add_locked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_clock_stop.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_clock_stop.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_clock_stop.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_delete.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_delete.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_delete.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_delete_locked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_delete_locked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_delete_locked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_edit.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_edit.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_edit.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_edit_locked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_edit_locked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_edit_locked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_lock.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_lock.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_lock.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_lock_locked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_lock_locked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_lock_locked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_pw_change.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_pw_change.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_pw_change.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.MpUser_pw_change_locked.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_pw_change_locked.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/MpUser_pw_change_locked.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.NOK48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/NOK48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/NOK48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.NoveLogoDMP.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/NoveLogoDMP.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/NoveLogoDMP.jpg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Nulovanie48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Nulovanie48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Nulovanie48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.OK48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/OK48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/OK48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Odhlasenie_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Odhlasenie_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Odhlasenie_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.PageDOWN.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PageDOWN.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PageDOWN.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.PageUP.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PageUP.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PageUP.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ParametreZariadenia32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ParametreZariadenia32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ParametreZariadenia32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.PriebeznyRezim.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PriebeznyRezim.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PriebeznyRezim.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Prihlasovanie48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Prihlasovanie48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Prihlasovanie48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Receptury48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Receptury48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Receptury48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Receptury.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Receptury.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Receptury.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Recepty48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Recepty48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Recepty48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.RecipeLoad.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/RecipeLoad.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/RecipeLoad.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.RecipeSave.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/RecipeSave.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/RecipeSave.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Recipe_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Recipe_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Recipe_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Red_LED.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Red_LED.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Red_LED.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Resetlinky.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Resetlinky.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Resetlinky.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ScrollDOWN.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ScrollDOWN.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ScrollDOWN.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ScrollUP.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ScrollUP.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ScrollUP.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Setup32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Setup32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Setup32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Setup48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Setup48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Setup48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.SipkaVlavo32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVlavo32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVlavo32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.SipkaVlavoHore_48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVlavoHore_48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVlavoHore_48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.SipkaVpravo32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVpravo32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVpravo32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Sipka_spat.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Sipka_spat.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Sipka_spat.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.SivaLED_30x30.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SivaLED_30x30.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SivaLED_30x30.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Slider_09x09.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_09x09.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_09x09.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Slider_ArrowRightGray.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_ArrowRightGray.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_ArrowRightGray.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Slider_ArrowUpGray.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_ArrowUpGray.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_ArrowUpGray.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Slniecko32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slniecko32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slniecko32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Spat.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Spat.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Spat.jpg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.StartVyroby.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StartVyroby.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StartVyroby.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Start.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Start.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Start.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.StopVyroby.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StopVyroby.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StopVyroby.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.SvetloON.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SvetloON.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SvetloON.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.SystemoveNastavenia.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SystemoveNastavenia.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SystemoveNastavenia.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Up48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Up48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Up48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Uzivatelia48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Uzivatelia48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Uzivatelia48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ViewFile48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ViewFile48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ViewFile48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.YES_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/YES_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/YES_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ZamkaOdomknuta_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamkaOdomknuta_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamkaOdomknuta_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ZamkaZamknuta_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamkaZamknuta_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamkaZamknuta_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Zamok48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Zamok48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Zamok48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ZamokLock.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamokLock.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamokLock.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ZamokUnlock.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamokUnlock.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamokUnlock.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ZaskrtPolicka48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZaskrtPolicka48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZaskrtPolicka48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.agt_forum.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/agt_forum.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/agt_forum.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.agt_home.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/agt_home.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/agt_home.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.alarm_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarm_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarm_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.alarmd.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarmd.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarmd.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.alarmd_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarmd_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarmd_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.alert.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alert.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alert.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.anglicka_vlajka32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/anglicka_vlajka32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/anglicka_vlajka32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.anglicka_vlajka48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/anglicka_vlajka48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/anglicka_vlajka48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.anglicka_vlajka64x64.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/anglicka_vlajka64x64.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/anglicka_vlajka64x64.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.cervena_kontrolka.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/cervena_kontrolka.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/cervena_kontrolka.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.cervena_led.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/cervena_led.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/cervena_led.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ciselna_klavesnica.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ciselna_klavesnica.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ciselna_klavesnica.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ciselna_klavesnica_stlacena.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ciselna_klavesnica_stlacena.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ciselna_klavesnica_stlacena.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.configure.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.configure_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.configure_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.domcek_s_krizom32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/domcek_s_krizom32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/domcek_s_krizom32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.domov.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/domov.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/domov.jpg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.edit_user.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/edit_user.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/edit_user.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.fileexport.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/fileexport.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/fileexport.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.filesave.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/filesave.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/filesave.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.gohome.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/gohome.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/gohome.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.info.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.info_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.kfm.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/kfm.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/kfm.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.klavesnica.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/klavesnica.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/klavesnica.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.klavesnica_stlacena.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/klavesnica_stlacena.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/klavesnica_stlacena.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.logo_Des_MP_pre_BR.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.logo_Des_MP_pre_BR_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.logo_Des_MP_pre_BR_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.nastaveniaKolieska48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/nastaveniaKolieska48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/nastaveniaKolieska48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.priebehovyRezim.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/priebehovyRezim.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/priebehovyRezim.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.revert.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/revert.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/revert.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.siva_kontrolka.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/siva_kontrolka.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/siva_kontrolka.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.siva_led.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/siva_led.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/siva_led.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.slovenska_vlajka32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/slovenska_vlajka32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/slovenska_vlajka32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.slovenska_vlajka48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/slovenska_vlajka48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/slovenska_vlajka48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.slovenska_vlajka64x64.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/slovenska_vlajka64x64.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/slovenska_vlajka64x64.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.stopAutomat.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/stopAutomat.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/stopAutomat.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.stop.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/stop.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/stop.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.text_block.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/text_block.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/text_block.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.text_block_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/text_block_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/text_block_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.undo.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/undo.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/undo.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.undo_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/undo_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/undo_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.zamka_biela32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zamka_biela32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zamka_biela32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.zamka_cierna32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zamka_cierna32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zamka_cierna32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.zelena_kontrolka.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zelena_kontrolka.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zelena_kontrolka.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.zelena_led.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zelena_led.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zelena_led.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.zvoncek_biely32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zvoncek_biely32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zvoncek_biely32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.zvoncek_cierny.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zvoncek_cierny.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zvoncek_cierny.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Alarm_60x60.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_60x60.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Alarm_60x60.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.BackgroundWVGA_NoLogo_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWVGA_NoLogo_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWVGA_NoLogo_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.BackgroundWVGA_NoLogo_0_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWVGA_NoLogo_0_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/BackgroundWVGA_NoLogo_0_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_1_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_1_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_1_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_2_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_2_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_2_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_3_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_3_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_3_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Cistenie_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Cistenie_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Cistenie_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.DMP_LogoNew300x105_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DMP_LogoNew300x105_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DMP_LogoNew300x105_0.jpg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.DokoncovaciaStanica_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DokoncovaciaStanica_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DokoncovaciaStanica_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Domcek_32x32_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Domcek_32x32_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Domcek_32x32_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.DoubleDown48x48_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleDown48x48_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleDown48x48_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.DoubleUp48x48_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleUp48x48_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/DoubleUp48x48_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Down48x48_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Down48x48_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Down48x48_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Embraco_logo25x155_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Embraco_logo25x155_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Embraco_logo25x155_0.jpg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.FileManager_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/FileManager_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/FileManager_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Info32x32_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Info32x32_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Info32x32_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadHor_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadHor_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadHor_pressed_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadVer_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_ListPadVer_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_ListPadVer_pressed_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_NumPad_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPad_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPad_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Key_NumPad_pressed_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPad_pressed_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Key_NumPad_pressed_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Logo_PNG_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Logo_PNG_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Logo_PNG_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.NoveLogoDMP_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/NoveLogoDMP_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/NoveLogoDMP_0.jpg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Odhlasenie_32x32_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Odhlasenie_32x32_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Odhlasenie_32x32_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.PageDOWN_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PageDOWN_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PageDOWN_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.PageUP_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PageUP_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/PageUP_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Receptury48x48_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Receptury48x48_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Receptury48x48_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Receptury_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Receptury_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Receptury_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.RecipeLoad_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/RecipeLoad_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/RecipeLoad_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.RecipeSave_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/RecipeSave_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/RecipeSave_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Red_LED_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Red_LED_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Red_LED_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Resetlinky_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Resetlinky_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Resetlinky_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ScrollDOWN_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ScrollDOWN_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ScrollDOWN_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ScrollUP_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ScrollUP_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ScrollUP_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Setup32x32_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Setup32x32_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Setup32x32_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Setup48x48_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Setup48x48_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Setup48x48_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.SivaLED_30x30_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SivaLED_30x30_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SivaLED_30x30_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Slider_09x09_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_09x09_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Slider_09x09_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.StartVyroby_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StartVyroby_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StartVyroby_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Start_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Start_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Start_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.StavZariadenia32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StavZariadenia32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StavZariadenia32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.StopVyroby_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StopVyroby_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/StopVyroby_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.SystemoveNastavenia_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SystemoveNastavenia_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SystemoveNastavenia_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Up48x48_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Up48x48_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Up48x48_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Uzivatelia48x48_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Uzivatelia48x48_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Uzivatelia48x48_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.YES_32x32_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/YES_32x32_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/YES_32x32_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ZamkaOdomknuta_32x32_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamkaOdomknuta_32x32_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamkaOdomknuta_32x32_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ZamkaZamknuta_32x32_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamkaZamknuta_32x32_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamkaZamknuta_32x32_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Zamok48x48_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Zamok48x48_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Zamok48x48_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ZamokLock_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamokLock_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamokLock_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ZamokUnlock_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamokUnlock_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ZamokUnlock_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.agt_forum_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/agt_forum_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/agt_forum_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.agt_home_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/agt_home_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/agt_home_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.alarm_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarm_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarm_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.alarmd_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarmd_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarmd_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.alarmd_0_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarmd_0_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/alarmd_0_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.cervena_kontrolka_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/cervena_kontrolka_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/cervena_kontrolka_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.cervena_led_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/cervena_led_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/cervena_led_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.configure_2.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_2.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_2.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.configure_0_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_0_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_0_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.configure_1_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_1_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/configure_1_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.edit_user_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/edit_user_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/edit_user_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.fileexport_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/fileexport_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/fileexport_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.filesave_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/filesave_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/filesave_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.info_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.info_0_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info_0_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info_0_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.kfm_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/kfm_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/kfm_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.logo_Des_MP_pre_BR_2.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_2.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_2.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.logo_Des_MP_pre_BR_0_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_0_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_0_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.logo_Des_MP_pre_BR_1_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_1_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/logo_Des_MP_pre_BR_1_0.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.nastaveniaKolieska48x48_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/nastaveniaKolieska48x48_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/nastaveniaKolieska48x48_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.priebehovyRezim_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/priebehovyRezim_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/priebehovyRezim_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.revert_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/revert_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/revert_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.siva_kontrolka_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/siva_kontrolka_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/siva_kontrolka_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.siva_led_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/siva_led_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/siva_led_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.stopAutomat_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/stopAutomat_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/stopAutomat_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.stop_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/stop_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/stop_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.text_block_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/text_block_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/text_block_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.text_block_0_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/text_block_0_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/text_block_0_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.undo_1.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/undo_1.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/undo_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.undo_0_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/undo_0_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/undo_0_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.zelena_kontrolka_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zelena_kontrolka_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zelena_kontrolka_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.zelena_led_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zelena_led_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zelena_led_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.zvoncek_biely32x32_0.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zvoncek_biely32x32_0.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/zvoncek_biely32x32_0.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.LogoDesignMP_1366x768.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/LogoDesignMP_1366x768.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/LogoDesignMP_1366x768.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Linka_1360x632.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Linka_1360x632.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Linka_1360x632.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Horak.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Horak.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Horak.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.info_black.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info_black.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/info_black.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Help_60x60.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Help_60x60.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Help_60x60.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Info_60x60.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Info_60x60.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Info_60x60.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Warning_60x60.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Warning_60x60.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Warning_60x60.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ChipCarta.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ChipCarta.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ChipCarta.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ID_Cards128x128.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ID_Cards128x128.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ID_Cards128x128.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ID_Cards36x36.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ID_Cards36x36.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ID_Cards36x36.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.ID_Cards46x46.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ID_Cards46x46.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/ID_Cards46x46.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.SipkaVlavo_64x64.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVlavo_64x64.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVlavo_64x64.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.SipkaVpravo_64x64.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVpravo_64x64.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaVpravo_64x64.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.SipkaBlackRight_48x48.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaBlackRight_48x48.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/SipkaBlackRight_48x48.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.CS_NG_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/CS_NG_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/CS_NG_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.CS_OK_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/CS_OK_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/CS_OK_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_4.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_4.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_4.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Bitmap_5.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_5.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Bitmap_5.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/bminfo.Info_32x32.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Info_32x32.bminfo $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Bitmaps/Info_32x32.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


#Bitmaps END




# Trend Configuration
TRE_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/tre., $(notdir $(TRE_SOURCES_Visu:.tre=.vco)))

$(TEMP_PATH_Visu)/tre.Trend_Temperature.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Trends/Trend_Temperature.tre
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


#Trend Configuration END




# Trend Data
TRD_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/trd., $(notdir $(TRD_SOURCES_Visu:.trd=.vco)))

$(TEMP_PATH_Visu)/trd.CPUTemperature.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Trends/CPUTemperature.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/trd.ROOMTemperature.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Trends/ROOMTemperature.trd
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


#Trend Data END




# Trend Data Configuration
TDC_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/tdc., $(notdir $(TDC_SOURCES_Visu:.tdc=.vco)))

$(TEMP_PATH_Visu)/tdc.TrendData.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Trends/TrendData.tdc
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


#Trend Data Configuration END




# ColorMap Table
CLM_OBJECTS_Visu = $(addprefix $(TEMP_PATH_Visu)/clm., $(notdir $(CLM_SOURCES_Visu:.clm=.vco)))

$(TEMP_PATH_Visu)/clm.ControlkaNC.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/ControlkaNC.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.ControlkaNO.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/ControlkaNO.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.KontrolkaSivaModra.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/KontrolkaSivaModra.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.KontrolkaSivaZelena.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/KontrolkaSivaZelena.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.ResetBezpecnosti.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/ResetBezpecnosti.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.SchemaRucnyRezim.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaRucnyRezim.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.SchemaTlacitkaCistenie.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaTlacitkaCistenie.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.SchemaTlacitkaStart.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaTlacitkaStart.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.SchemaTlacitkaUkoncenie.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaTlacitkaUkoncenie.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.SchemaUpozornenia.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaUpozornenia.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.StavZariadenia.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/StavZariadenia.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.cervena_zelena.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/cervena_zelena.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.SchemaZamkovOplotenia.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaZamkovOplotenia.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


$(TEMP_PATH_Visu)/clm.SchemaBezpecnosti.vco: $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/ColorMaps/SchemaBezpecnosti.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu)' $(VCCFLAGS_Visu)  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas


#ColorMap Table END


#
# Borders
#
BDR_SOURCES_Visu=$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/OutputBorder.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/InputBorder.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/GroupControl.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/LabelBoarder.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Control.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Control_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/TabActive.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Flat_black.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Flat_grey.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/FrameGlobal.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/FrameInvisible.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Flat_grey.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_FrameInvisible.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_LabelBorderDown.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_TabActive.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/OverdriveBorder.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/RaisedInner.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Raised.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/SliderBorder09.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/SunkenOuter.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Sunken.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Decrease.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Decrease_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Global_Area.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Global_Area_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Increase.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Increase_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_KeyRingOff.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_KeyRingOn.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Multi_Scroll_Down.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Multi_Scroll_Down_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Multi_Scroll_Up.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Multi_Scroll_Up_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Radio.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Radio_selected.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scoll_Up.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scoll_Up_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scroll_Down.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scroll_Down_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scroll_Left.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scroll_Left_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scroll_Right.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_Scroll_Right_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Button_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/CheckBox_checked.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/FrameHeader.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Control.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Control_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Multi_Scroll_Down.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Multi_Scroll_Dwn_press.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Multi_Scroll_Up.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Multi_Scroll_Up_press.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Scoll_Up.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Scoll_Up_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Scroll_Down.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_Scroll_Down_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_Button_pressed.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_CheckBox_checked.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_GroupControl.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_InputBorderInactive.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_InputBorder.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_LabelBorder.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_OutputBorder.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/Mp_SunkenNG.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/ProgressBarBorder.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/SunkenNG.bdr $(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Borders/SunkenNGgray.bdr 
BDR_OBJECTS_Visu=$(TEMP_PATH_Visu)/bdr.Bordermanager.vco
$(TEMP_PATH_Visu)/bdr.Bordermanager.vco: $(BDR_SOURCES_Visu)
	$(VCC) -f '$<' -o '$@' -pkg '$(SRC_PATH_Visu)' $(BDRFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu$(SRC_PATH_Visu)
#
# Logical fonts
#
$(TEMP_PATH_Visu)/lfnt.en.vco: $(TEMP_PATH_Visu)/en.lfnt $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu -sfas
$(TEMP_PATH_Visu)/lfnt.de.vco: $(TEMP_PATH_Visu)/de.lfnt $(VC_LANGUAGES_Visu)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu) $(VCCFLAGS_Visu) -p Visu -sfas
LFNT_OBJECTS_Visu=$(TEMP_PATH_Visu)/lfnt.en.vco $(TEMP_PATH_Visu)/lfnt.de.vco 

#Runtime Object
$(VCR_OBJECT_Visu) : $(VCR_SOURCE_Visu)
	$(VCC) -f '$<' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -sl en $(VCCFLAGS_Visu) -rt  -p Visu -so $(VC_STATIC_OPTIONS_Visu) -vcr 4726 -sfas
# Local resources Library rules
LIB_LOCAL_RES_Visu=$(TEMP_PATH_Visu)/localres.vca
$(LIB_LOCAL_RES_Visu) : $(TEMP_PATH_Visu)/Visu02.ccf

# Bitmap Library rules
LIB_BMP_RES_Visu=$(TEMP_PATH_Visu)/bmpres.vca
$(LIB_BMP_RES_Visu) : $(TEMP_PATH_Visu)/Visu03.ccf
$(BMGRP_OBJECTS_Visu) : $(PALFILE_Visu) $(VC_LANGUAGES_Visu)
$(BMINFO_OBJECTS_Visu) : $(PALFILE_Visu)

BUILD_FILE_Visu=$(TEMP_PATH_Visu)/BuildFiles.arg
$(BUILD_FILE_Visu) : BUILD_FILE_CLEAN_Visu $(BUILD_SOURCES_Visu)
BUILD_FILE_CLEAN_Visu:
	$(RM) /F /Q '$(BUILD_FILE_Visu)' 2>nul
#All Modules depending to this project
PROJECT_MODULES_Visu=$(AS_CPU_PATH)/Visu01.br $(AS_CPU_PATH)/Visu02.br $(AS_CPU_PATH)/Visu03.br $(FONT_MODULES_Visu) $(SHARED_MODULE)

# General Build rules

$(TARGET_FILE_Visu): $(PROJECT_MODULES_Visu) $(TEMP_PATH_Visu)/Visu.prj
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu) -fw '$(VCFIRMWAREPATH)' -m $(VCSTPOST) -v V1.00.0 -f '$(TEMP_PATH_Visu)/Visu.prj' -o '$@' -vc '$(VCOBJECT_Visu)' $(DEPENDENCIES_Visu) $(addprefix -d ,$(notdir $(PROJECT_MODULES_Visu:.br=)))

$(AS_CPU_PATH)/Visu01.br: $(TEMP_PATH_Visu)/Visu01.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_Visu)' -f '$<' -o '$@' $(DEPENDENCIES_Visu)

$(AS_CPU_PATH)/Visu02.br: $(TEMP_PATH_Visu)/Visu02.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_Visu)' -f '$<' -o '$@' $(DEPENDENCIES_Visu)

$(AS_CPU_PATH)/Visu03.br: $(TEMP_PATH_Visu)/Visu03.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_Visu)' -f '$<' -o '$@' $(DEPENDENCIES_Visu)

# General Build rules END
$(LIB_LOCAL_OBJ_Visu) : $(TEMP_PATH_Visu)/Visu01.ccf

# Main Module
$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu.vcm:
$(TEMP_PATH_Visu)/Visu.prj: $(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu.vcm
	$(VCDEP) -m '$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu.vcm' -s '$(AS_CPU_PATH)/VCShared/Shared.vcm' -p '$(AS_PATH)/AS/VC/Firmware' -c '$(AS_CPU_PATH)' -fw '$(VCFIRMWAREPATH)' -hw '$(CPUHWC)' -so $(VC_STATIC_OPTIONS_Visu) -o Visu -proj Visu
	$(VCPL) $(notdir $(PROJECT_MODULES_Visu:.br=,4)) Visu,2 -o '$@' -p Visu -vc 'Visu' -verbose 'False' -fl '$(TEMP_PATH_ROOT_Visu)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu.vcm' -vcr '$(VCR_SOURCE_Visu)' -prj '$(AS_PROJECT_PATH)' -warningLevel2 -sfas

# 01 Module

DEL_TARGET01_LFL_Visu=$(TEMP_PATH_Visu)\Visu01.ccf.lfl
$(TEMP_PATH_Visu)/Visu01.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_Visu) $(TEMP_PATH_Visu)/Visu03.ccf $(LIB_LOCAL_RES_Visu) $(TEMP_PATH_Visu)/Visu02.ccf $(DIS_OBJECTS_Visu) $(PAGE_OBJECTS_Visu) $(VCS_OBJECTS_Visu) $(VCVK_OBJECTS_Visu) $(VCRT_OBJECTS_Visu) $(TPR_OBJECTS_Visu) $(TXTGRP_OBJECTS_Visu) $(LAYER_OBJECTS_Visu) $(VCR_OBJECT_Visu) $(TDC_OBJECTS_Visu) $(TRD_OBJECTS_Visu) $(TRE_OBJECTS_Visu) $(PRC_OBJECTS_Visu) $(SCR_OBJECTS_Visu)
	-@CMD /Q /C if exist "$(DEL_TARGET01_LFL_Visu)" DEL /F /Q "$(DEL_TARGET01_LFL_Visu)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_BMP_RES_Visu)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_LOCAL_RES_Visu)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(DIS_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .page -vcp '$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCS_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .vcvk -vcp '$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCRT_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TPR_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .txtgrp -vcp '$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .layer -vcp '$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCR_OBJECT_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .tdc -vcp '$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .trd -vcp '$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TEMP_PATH_Visu)/tre.Trend_Temperature.vco' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(SCR_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p Visu -lib '$(LIB_LOCAL_OBJ_Visu)' -P '$(AS_PROJECT_PATH)' -m 'local objects' -profile 'False' -warningLevel2 -vcr 4726 -sfas
# 01 Module END

# 02 Module

DEL_TARGET02_LFL_Visu=$(TEMP_PATH_Visu)\Visu02.ccf.lfl
$(TEMP_PATH_Visu)/Visu02.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_Visu) $(TEMP_PATH_Visu)/Visu03.ccf $(BDR_OBJECTS_Visu) $(LFNT_OBJECTS_Visu) $(CLM_OBJECTS_Visu)
	-@CMD /Q /C if exist "$(DEL_TARGET02_LFL_Visu)" DEL /F /Q "$(DEL_TARGET02_LFL_Visu)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_BMP_RES_Visu)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(BDR_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LFNT_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(CLM_OBJECTS_Visu:.vco=.vco|)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p Visu -lib '$(LIB_LOCAL_RES_Visu)' -P '$(AS_PROJECT_PATH)' -m 'local resources' -profile 'False' -warningLevel2 -vcr 4726 -sfas
# 02 Module END

# 03 Module

DEL_TARGET03_LFL_Visu=$(TEMP_PATH_Visu)\Visu03.ccf.lfl
$(TEMP_PATH_Visu)/Visu03.ccf: $(LIB_SHARED) $(SHARED_CCF) $(BMGRP_OBJECTS_Visu) $(BMINFO_OBJECTS_Visu) $(PALFILE_Visu)
	-@CMD /Q /C if exist "$(DEL_TARGET03_LFL_Visu)" DEL /F /Q "$(DEL_TARGET03_LFL_Visu)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .bmgrp -vcp '$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .bminfo -vcp '$(AS_PROJECT_PATH)/Logical/Vizualizacia/Visu/Package.vcp' -temp '$(TEMP_PATH_Visu)' -prj '$(PRJ_PATH_Visu)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p Visu -lib '$(LIB_BMP_RES_Visu)' -P '$(AS_PROJECT_PATH)' -m 'bitmap resources' -profile 'False' -warningLevel2 -vcr 4726 -sfas
# 03 Module END

