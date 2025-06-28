


INPUT Format;
INPUT FSn;
INPUT VClk;
INPUT HSn;
INPUT PALClock;
OUTPUT FrmFormat;
OUTPUT FormatClock;
OUTPUT PAD_LUMA;
OUTPUT LINE_PULSE;
OUTPUT HS;
OUTPUT LUMA_CONTROL;
OUTPUT CLK;

/*Arc definitions start here*/
pos_Format__FSn__setup:		SETUP (POSEDGE) Format FSn ;
pos_VClk__FSn__setup:		SETUP (POSEDGE) VClk FSn ;
pos_VClk__FSn__setup:		SETUP (POSEDGE) VClk FSn ;
pos_FSn__HSn__setup:		SETUP (POSEDGE) FSn HSn ;
pos_VClk__VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa__setup:		SETUP (POSEDGE) VClk VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa ;
pos_VClk__VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa__setup:		SETUP (POSEDGE) VClk VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa ;
pos_Format__FSn__hold:		HOLD (POSEDGE) Format FSn ;
pos_VClk__FSn__hold:		HOLD (POSEDGE) VClk FSn ;
pos_VClk__FSn__hold:		HOLD (POSEDGE) VClk FSn ;
pos_FSn__HSn__hold:		HOLD (POSEDGE) FSn HSn ;
pos_VClk__VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa__hold:		HOLD (POSEDGE) VClk VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa ;
pos_VClk__VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa__hold:		HOLD (POSEDGE) VClk VClkInterposer:interposer|DecaQuintCounter:DQCounter|iqa ;
pos_FSn__CLK__delay:		DELAY (POSEDGE) FSn CLK ;
pos_FSn__FormatClock__delay:		DELAY (POSEDGE) FSn FormatClock ;
pos_FSn__FrmFormat__delay:		DELAY (POSEDGE) FSn FrmFormat ;
pos_FSn__HS__delay:		DELAY (POSEDGE) FSn HS ;
pos_FSn__LUMA_CONTROL__delay:		DELAY (POSEDGE) FSn LUMA_CONTROL ;
pos_HSn__HS__delay:		DELAY (POSEDGE) HSn HS ;
pos_HSn__HS__delay:		DELAY (POSEDGE) HSn HS ;
pos_VClk__CLK__delay:		DELAY (POSEDGE) VClk CLK ;
pos_VClk__CLK__delay:		DELAY (POSEDGE) VClk CLK ;
pos_VClk__FormatClock__delay:		DELAY (POSEDGE) VClk FormatClock ;
pos_VClk__FormatClock__delay:		DELAY (POSEDGE) VClk FormatClock ;
pos_VClk__HS__delay:		DELAY (POSEDGE) VClk HS ;
pos_VClk__LINE_PULSE__delay:		DELAY (POSEDGE) VClk LINE_PULSE ;
pos_VClk__PAD_LUMA__delay:		DELAY (POSEDGE) VClk PAD_LUMA ;
pos_VClkInterposer:interposer|q__CLK__delay:		DELAY (POSEDGE) VClkInterposer:interposer|q CLK ;
pos_VClkInterposer:interposer|q__CLK__delay:		DELAY (POSEDGE) VClkInterposer:interposer|q CLK ;
pos_VClkInterposer:interposer|q__HS__delay:		DELAY (POSEDGE) VClkInterposer:interposer|q HS ;
pos_VClkInterposer:interposer|q__LINE_PULSE__delay:		DELAY (POSEDGE) VClkInterposer:interposer|q LINE_PULSE ;
pos_VClkInterposer:interposer|q__LUMA_CONTROL__delay:		DELAY (POSEDGE) VClkInterposer:interposer|q LUMA_CONTROL ;
pos_VClkInterposer:interposer|q__LUMA_CONTROL__delay:		DELAY (POSEDGE) VClkInterposer:interposer|q LUMA_CONTROL ;
pos_VClkInterposer:interposer|q__PAD_LUMA__delay:		DELAY (POSEDGE) VClkInterposer:interposer|q PAD_LUMA ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4]__HS__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4] HS ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4]__HS__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4] HS ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4]__LINE_PULSE__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4] LINE_PULSE ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4]__LINE_PULSE__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4] LINE_PULSE ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4]__PAD_LUMA__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4] PAD_LUMA ;
pos_VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4]__PAD_LUMA__delay:		DELAY (POSEDGE) VClkPulseGenerator:pulseGenerator|lpm_counter:count_rtl_0|dffs[4] PAD_LUMA ;
___10.000__delay:		DELAY  10.000 ;

ENDMODEL
