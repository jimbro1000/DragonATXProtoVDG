/*
 Copyright (C) 1991-2013 Altera Corporation
 Your use of Altera Corporation's design tools, logic functions 
 and other software and tools, and its AMPP partner logic 
 functions, and any output files from any of the foregoing 
 (including device programming or simulation files), and any 
 associated documentation or information are expressly subject 
 to the terms and conditions of the Altera Program License 
 Subscription Agreement, Altera MegaCore Function License 
 Agreement, or other applicable license agreement, including, 
 without limitation, that your use is for the sole purpose of 
 programming logic devices manufactured by Altera and sold by 
 Altera or its authorized distributors.  Please refer to the 
 applicable agreement for further details.
*/
MODEL
/*MODEL HEADER*/
/*
 This file contains Slow Corner delays for the design using part EPM7064AETC44-10
 with speed grade 10, core voltage Auto, and temperature 2147483647 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "DragonPalLogic";
DATE "06/02/2025 21:21:39";
PROGRAM "Quartus II 64-Bit";



INPUT Format;
INPUT FSn;
INPUT VClk;
INPUT HSn;
INPUT PALClock;
OUTPUT LUMA_CONTROL;
OUTPUT CHROMA_CONTROL;
OUTPUT SYNC_CONTROL;
OUTPUT FrmFormat;
OUTPUT CLK;
OUTPUT FormatClock;
OUTPUT LINE_PULSE;
OUTPUT HS;

/*Arc definitions start here*/
pos_Format__FSn__setup:		SETUP (POSEDGE) Format FSn ;
pos_FSn__HSn__setup:		SETUP (POSEDGE) FSn HSn ;
pos_VClk__VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa__setup:		SETUP (POSEDGE) VClk VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa ;
pos_VClk__VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa__setup:		SETUP (POSEDGE) VClk VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa ;
pos_Format__FSn__hold:		HOLD (POSEDGE) Format FSn ;
pos_FSn__HSn__hold:		HOLD (POSEDGE) FSn HSn ;
pos_VClk__VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa__hold:		HOLD (POSEDGE) VClk VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa ;
pos_VClk__VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa__hold:		HOLD (POSEDGE) VClk VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa ;
pos_FSn__CLK__delay:		DELAY (POSEDGE) FSn CLK ;
pos_FSn__FormatClock__delay:		DELAY (POSEDGE) FSn FormatClock ;
pos_FSn__FrmFormat__delay:		DELAY (POSEDGE) FSn FrmFormat ;
pos_FSn__HS__delay:		DELAY (POSEDGE) FSn HS ;
pos_HSn__HS__delay:		DELAY (POSEDGE) HSn HS ;
pos_HSn__HS__delay:		DELAY (POSEDGE) HSn HS ;
pos_VClk__CLK__delay:		DELAY (POSEDGE) VClk CLK ;
pos_VClk__CLK__delay:		DELAY (POSEDGE) VClk CLK ;
pos_VClk__FormatClock__delay:		DELAY (POSEDGE) VClk FormatClock ;
pos_VClk__FormatClock__delay:		DELAY (POSEDGE) VClk FormatClock ;
pos_VClk__HS__delay:		DELAY (POSEDGE) VClk HS ;
pos_VClk__LINE_PULSE__delay:		DELAY (POSEDGE) VClk LINE_PULSE ;
pos_VClkInterposer:interposer|q__HS__delay:		DELAY (POSEDGE) VClkInterposer:interposer|q HS ;
pos_VClkInterposer:interposer|q__LINE_PULSE__delay:		DELAY (POSEDGE) VClkInterposer:interposer|q LINE_PULSE ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[0]__HS__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[0] HS ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[0]__HS__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[0] HS ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[0]__LINE_PULSE__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[0] LINE_PULSE ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[0]__LINE_PULSE__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[0] LINE_PULSE ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4]__HS__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4] HS ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4]__HS__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4] HS ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4]__LINE_PULSE__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4] LINE_PULSE ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4]__LINE_PULSE__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4] LINE_PULSE ;
___10.000__delay:		DELAY  10.000 ;

ENDMODEL
