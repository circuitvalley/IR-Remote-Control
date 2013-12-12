opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	12F615
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 10 "J:\new work\MPLAB\New folder\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 10 "J:\new work\MPLAB\New folder\main.c"
	dw 0xFFFC & 0xFFF7 & 0xFFFF & 0xFFDF & 0xFFFF & 0xFFFF & 0xFEFF ;#
	FNROOT	_main
	FNCALL	_swInt,_sendFrame
	FNCALL	_swInt,_sendRepeate
	FNCALL	_sendFrame,_sendByte
	FNCALL	intlevel1,_swInt
	global	intlevel1
	FNROOT	intlevel1
	global	_CCP1CON
psect	text113,local,class=CODE,delta=2
global __ptext113
__ptext113:
_CCP1CON	set	21
	global	_CCP1CONbits
_CCP1CONbits	set	21
	global	_CCPR1L
_CCPR1L	set	19
	global	_CMCON0bits
_CMCON0bits	set	26
	global	_GPIO
_GPIO	set	5
	global	_GPIObits
_GPIObits	set	5
	global	_INTCONbits
_INTCONbits	set	11
	global	_T2CON
_T2CON	set	18
	global	_TMR2
_TMR2	set	17
	global	_ANSEL
_ANSEL	set	159
	global	_IOC
_IOC	set	150
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_PR2
_PR2	set	146
	global	_TRISIO
_TRISIO	set	133
	global	_WPU
_WPU	set	149
	file	"NEC IR Remote 5Sw.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_sendRepeate
?_sendRepeate:	; 0 bytes @ 0x0
	global	??_sendRepeate
??_sendRepeate:	; 0 bytes @ 0x0
	global	?_sendByte
?_sendByte:	; 0 bytes @ 0x0
	global	??_sendByte
??_sendByte:	; 0 bytes @ 0x0
	global	?_swInt
?_swInt:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	2
	global	sendByte@byte
sendByte@byte:	; 1 bytes @ 0x2
	ds	1
	global	sendByte@i
sendByte@i:	; 1 bytes @ 0x3
	ds	1
	global	?_sendFrame
?_sendFrame:	; 0 bytes @ 0x4
	global	sendFrame@command
sendFrame@command:	; 1 bytes @ 0x4
	ds	1
	global	??_sendFrame
??_sendFrame:	; 0 bytes @ 0x5
	ds	2
	global	sendFrame@address
sendFrame@address:	; 1 bytes @ 0x7
	ds	1
	global	??_swInt
??_swInt:	; 0 bytes @ 0x8
	ds	6
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_main
??_main:	; 0 bytes @ 0x0
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           48      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _swInt in COMMON
;;
;;   _swInt->_sendFrame
;;   _sendFrame->_sendByte
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _swInt in BANK0
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (1) _swInt                                                6     6      0     105
;;                                              8 COMMON     6     6      0
;;                          _sendFrame
;;                        _sendRepeate
;; ---------------------------------------------------------------------------------
;; (2) _sendFrame                                            4     3      1     105
;;                                              4 COMMON     4     3      1
;;                           _sendByte
;; ---------------------------------------------------------------------------------
;; (3) _sendByte                                             4     4      0      45
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (2) _sendRepeate                                          2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;
;; _swInt (ROOT)
;;   _sendFrame
;;     _sendByte
;;   _sendRepeate
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       6       2        0.0%
;;BITBANK0            30      0       0       3        0.0%
;;BANK0               30      0       0       4        0.0%
;;ABS                  0      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 91 in file "J:\new work\MPLAB\New folder\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"J:\new work\MPLAB\New folder\main.c"
	line	91
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2]
	line	92
	
l1066:	
;main.c: 92: CMCON0bits.CMON =0;
	bcf	(26),7	;volatile
	line	93
	
l1068:	
;main.c: 93: ANSEL = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	94
	
l1070:	
;main.c: 94: TRISIO = 0x3B;
	movlw	(03Bh)
	movwf	(133)^080h	;volatile
	line	95
	
l1072:	
;main.c: 95: OPTION_REG = 0x5F;
	movlw	(05Fh)
	movwf	(129)^080h	;volatile
	line	99
	
l1074:	
;main.c: 99: WPU = 0x3B;
	movlw	(03Bh)
	movwf	(149)^080h	;volatile
	line	100
	
l1076:	
;main.c: 100: GPIO = 0x3B;
	movlw	(03Bh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	101
	
l1078:	
;main.c: 101: T2CON = 0x04;
	movlw	(04h)
	movwf	(18)	;volatile
	line	105
	
l1080:	
;main.c: 105: CCPR1L = 0x1A;
	movlw	(01Ah)
	movwf	(19)	;volatile
	line	106
	
l1082:	
;main.c: 106: PR2 = 51;
	movlw	(033h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	107
	
l1084:	
;main.c: 107: CCP1CON = 0x20;
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(21)	;volatile
	line	108
	
l1086:	
;main.c: 108: IOC = 0x3B;
	movlw	(03Bh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	109
	
l1088:	
;main.c: 109: INTCONbits.GPIE = 1;
	bsf	(11),3	;volatile
	line	110
	
l1090:	
;main.c: 110: INTCONbits.GPIF = 0;
	bcf	(11),0	;volatile
	line	111
	
l1092:	
;main.c: 111: INTCONbits.PEIE = 1;
	bsf	(11),6	;volatile
	line	112
	
l1094:	
;main.c: 112: INTCONbits.GIE = 1;
	bsf	(11),7	;volatile
	line	115
	
l1096:	
# 115 "J:\new work\MPLAB\New folder\main.c"
sleep ;#
psect	maintext
	goto	l1096
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	118
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_swInt
psect	text114,local,class=CODE,delta=2
global __ptext114
__ptext114:

;; *************** function _swInt *****************
;; Defined at:
;;		line 42 in file "J:\new work\MPLAB\New folder\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          6       0
;;      Totals:         6       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_sendFrame
;;		_sendRepeate
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text114
	file	"J:\new work\MPLAB\New folder\main.c"
	line	42
	global	__size_of_swInt
	__size_of_swInt	equ	__end_of_swInt-_swInt
	
_swInt:	
	opt	stack 5
; Regs used in _swInt: [allreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_swInt+2)
	movf	fsr0,w
	movwf	(??_swInt+3)
	movf	pclath,w
	movwf	(??_swInt+4)
	bcf	status, 5	;RP0=0, select bank0
	movf	btemp+1,w
	movwf	(??_swInt+5)
	ljmp	_swInt
psect	text114
	line	44
	
i1l924:	
;main.c: 44: if (INTCONbits.GPIF)
	btfss	(11),0	;volatile
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l536
u1_20:
	line	46
	
i1l926:	
;main.c: 45: {
;main.c: 46: _delay((unsigned long)((2)*(8000000/4000.0)));
	opt asmopt_off
movlw	6
movwf	((??_swInt+0)+0+1),f
	movlw	48
movwf	((??_swInt+0)+0),f
u14_27:
	decfsz	((??_swInt+0)+0),f
	goto	u14_27
	decfsz	((??_swInt+0)+0+1),f
	goto	u14_27
	clrwdt
opt asmopt_on

	line	48
	
i1l928:	
;main.c: 48: if(!GPIObits.GPIO0)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(5),0	;volatile
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l512
u2_20:
	line	50
	
i1l930:	
;main.c: 49: {
;main.c: 50: sendFrame(0x01,0xF8);
	movlw	(0F8h)
	movwf	(?_sendFrame)
	movlw	(01h)
	fcall	_sendFrame
	line	51
;main.c: 51: while(!GPIObits.GPIO0)
	goto	i1l934
	line	53
	
i1l932:	
;main.c: 52: {
;main.c: 53: sendRepeate();
	fcall	_sendRepeate
	line	51
	
i1l934:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(5),0	;volatile
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l932
u3_20:
	goto	i1l960
	line	55
	
i1l512:	
	btfsc	(5),1	;volatile
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l517
u4_20:
	line	57
	
i1l936:	
;main.c: 56: {
;main.c: 57: sendFrame(0x01,0x50);
	movlw	(050h)
	movwf	(?_sendFrame)
	movlw	(01h)
	fcall	_sendFrame
	line	58
;main.c: 58: while(!GPIObits.GPIO1)
	goto	i1l940
	line	60
	
i1l938:	
;main.c: 59: {
;main.c: 60: sendRepeate();
	fcall	_sendRepeate
	line	58
	
i1l940:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(5),1	;volatile
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l938
u5_20:
	goto	i1l960
	line	62
	
i1l517:	
	btfsc	(5),3	;volatile
	goto	u6_21
	goto	u6_20
u6_21:
	goto	i1l522
u6_20:
	line	64
	
i1l942:	
;main.c: 63: {
;main.c: 64: sendFrame(0x01,0xD8);
	movlw	(0D8h)
	movwf	(?_sendFrame)
	movlw	(01h)
	fcall	_sendFrame
	line	65
;main.c: 65: while(!GPIObits.GPIO3)
	goto	i1l946
	line	67
	
i1l944:	
;main.c: 66: {
;main.c: 67: sendRepeate();
	fcall	_sendRepeate
	line	65
	
i1l946:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(5),3	;volatile
	goto	u7_21
	goto	u7_20
u7_21:
	goto	i1l944
u7_20:
	goto	i1l960
	line	69
	
i1l522:	
	btfsc	(5),4	;volatile
	goto	u8_21
	goto	u8_20
u8_21:
	goto	i1l527
u8_20:
	line	71
	
i1l948:	
;main.c: 70: {
;main.c: 71: sendFrame(0x01,0xB0);
	movlw	(0B0h)
	movwf	(?_sendFrame)
	movlw	(01h)
	fcall	_sendFrame
	line	72
;main.c: 72: while(!GPIObits.GPIO4)
	goto	i1l952
	line	74
	
i1l950:	
;main.c: 73: {
;main.c: 74: sendRepeate();
	fcall	_sendRepeate
	line	72
	
i1l952:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(5),4	;volatile
	goto	u9_21
	goto	u9_20
u9_21:
	goto	i1l950
u9_20:
	goto	i1l960
	line	76
	
i1l527:	
	btfsc	(5),5	;volatile
	goto	u10_21
	goto	u10_20
u10_21:
	goto	i1l960
u10_20:
	line	78
	
i1l954:	
;main.c: 77: {
;main.c: 78: sendFrame(0x01,0x30);
	movlw	(030h)
	movwf	(?_sendFrame)
	movlw	(01h)
	fcall	_sendFrame
	line	79
;main.c: 79: while(!GPIObits.GPIO5)
	goto	i1l958
	line	81
	
i1l956:	
;main.c: 80: {
;main.c: 81: sendRepeate();
	fcall	_sendRepeate
	line	79
	
i1l958:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(5),5	;volatile
	goto	u11_21
	goto	u11_20
u11_21:
	goto	i1l956
u11_20:
	line	84
	
i1l960:	
;main.c: 82: }
;main.c: 83: }
;main.c: 84: GPIObits.GPIO0;
	movf	(5),w	;volatile
	line	85
	
i1l962:	
;main.c: 85: INTCONbits.GPIF =0;
	bcf	(11),0	;volatile
	line	87
	
i1l536:	
	movf	(??_swInt+5),w
	movwf	btemp+1
	movf	(??_swInt+4),w
	movwf	pclath
	movf	(??_swInt+3),w
	movwf	fsr0
	swapf	(??_swInt+2)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_swInt
	__end_of_swInt:
;; =============== function _swInt ends ============

	signat	_swInt,88
	global	_sendFrame
psect	text115,local,class=CODE,delta=2
global __ptext115
__ptext115:

;; *************** function _sendFrame *****************
;; Defined at:
;;		line 121 in file "J:\new work\MPLAB\New folder\main.c"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;;  command         1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         1       0
;;      Locals:         1       0
;;      Temps:          2       0
;;      Totals:         4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_sendByte
;; This function is called by:
;;		_swInt
;; This function uses a non-reentrant model
;;
psect	text115
	file	"J:\new work\MPLAB\New folder\main.c"
	line	121
	global	__size_of_sendFrame
	__size_of_sendFrame	equ	__end_of_sendFrame-_sendFrame
	
_sendFrame:	
	opt	stack 5
; Regs used in _sendFrame: [allreg]
;sendFrame@address stored from wreg
	movwf	(sendFrame@address)
	line	122
	
i1l964:	
;main.c: 122: TMR2 = 0x00;
	clrf	(17)	;volatile
	line	123
	
i1l966:	
;main.c: 123: CCP1CONbits.CCP1M = 0xC;
	movf	(21),w	;volatile
	andlw	not (((1<<4)-1)<<0)
	iorlw	(0Ch & ((1<<4)-1))<<0
	movwf	(21)	;volatile
	line	124
	
i1l968:	
;main.c: 124: _delay((unsigned long)((8999)*(8000000/4000000.0)));
	opt asmopt_off
movlw	24
movwf	((??_sendFrame+0)+0+1),f
	movlw	94
movwf	((??_sendFrame+0)+0),f
u15_27:
	decfsz	((??_sendFrame+0)+0),f
	goto	u15_27
	decfsz	((??_sendFrame+0)+0+1),f
	goto	u15_27
	clrwdt
opt asmopt_on

	line	125
	
i1l970:	
;main.c: 125: CCP1CONbits.CCP1M = 0x0;
	movlw	((0 & ((1<<4)-1))<<0)|not (((1<<4)-1)<<0)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(21),f	;volatile
	line	126
	
i1l972:	
;main.c: 126: _delay((unsigned long)((4490)*(8000000/4000000.0)));
	opt asmopt_off
movlw	12
movwf	((??_sendFrame+0)+0+1),f
	movlw	168
movwf	((??_sendFrame+0)+0),f
u16_27:
	decfsz	((??_sendFrame+0)+0),f
	goto	u16_27
	decfsz	((??_sendFrame+0)+0+1),f
	goto	u16_27
	clrwdt
opt asmopt_on

	line	128
	
i1l974:	
;main.c: 128: sendByte(address);
	movf	(sendFrame@address),w
	fcall	_sendByte
	line	129
	
i1l976:	
;main.c: 129: sendByte(~address);
	comf	(sendFrame@address),w
	fcall	_sendByte
	line	130
	
i1l978:	
;main.c: 130: sendByte(command);
	movf	(sendFrame@command),w
	fcall	_sendByte
	line	131
	
i1l980:	
;main.c: 131: sendByte(~command);
	comf	(sendFrame@command),w
	fcall	_sendByte
	line	134
;main.c: 134: TMR2 = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(17)	;volatile
	line	135
	
i1l982:	
;main.c: 135: CCP1CONbits.CCP1M = 0xC;
	movf	(21),w	;volatile
	andlw	not (((1<<4)-1)<<0)
	iorlw	(0Ch & ((1<<4)-1))<<0
	movwf	(21)	;volatile
	line	136
	
i1l984:	
;main.c: 136: _delay((unsigned long)((561)*(8000000/4000000.0)));
	opt asmopt_off
movlw	224
movwf	(??_sendFrame+0)+0,f
u17_27:
	nop2
decfsz	(??_sendFrame+0)+0,f
	goto	u17_27
	clrwdt
opt asmopt_on

	line	137
	
i1l986:	
;main.c: 137: CCP1CONbits.CCP1M = 0x0;
	movlw	((0 & ((1<<4)-1))<<0)|not (((1<<4)-1)<<0)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(21),f	;volatile
	line	138
	
i1l988:	
;main.c: 138: _delay((unsigned long)((40)*(8000000/4000.0)));
	opt asmopt_off
movlw	104
movwf	((??_sendFrame+0)+0+1),f
	movlw	228
movwf	((??_sendFrame+0)+0),f
u18_27:
	decfsz	((??_sendFrame+0)+0),f
	goto	u18_27
	decfsz	((??_sendFrame+0)+0+1),f
	goto	u18_27
	clrwdt
opt asmopt_on

	line	139
	
i1l545:	
	return
	opt stack 0
GLOBAL	__end_of_sendFrame
	__end_of_sendFrame:
;; =============== function _sendFrame ends ============

	signat	_sendFrame,8312
	global	_sendByte
psect	text116,local,class=CODE,delta=2
global __ptext116
__ptext116:

;; *************** function _sendByte *****************
;; Defined at:
;;		line 142 in file "J:\new work\MPLAB\New folder\main.c"
;; Parameters:    Size  Location     Type
;;  byte            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  byte            1    2[COMMON] unsigned char 
;;  i               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         2       0
;;      Temps:          2       0
;;      Totals:         4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sendFrame
;; This function uses a non-reentrant model
;;
psect	text116
	file	"J:\new work\MPLAB\New folder\main.c"
	line	142
	global	__size_of_sendByte
	__size_of_sendByte	equ	__end_of_sendByte-_sendByte
	
_sendByte:	
	opt	stack 5
; Regs used in _sendByte: [wreg+status,2+status,0]
;sendByte@byte stored from wreg
	line	144
	movwf	(sendByte@byte)
	
i1l1040:	
;main.c: 143: unsigned char i;
;main.c: 144: for(i=8 ;i>0;i--)
	movlw	(08h)
	movwf	(sendByte@i)
	line	146
	
i1l1046:	
;main.c: 145: {
;main.c: 146: TMR2 = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(17)	;volatile
	line	147
	
i1l1048:	
;main.c: 147: CCP1CONbits.CCP1M=0xC;
	movf	(21),w	;volatile
	andlw	not (((1<<4)-1)<<0)
	iorlw	(0Ch & ((1<<4)-1))<<0
	movwf	(21)	;volatile
	line	148
	
i1l1050:	
;main.c: 148: _delay((unsigned long)((561)*(8000000/4000000.0)));
	opt asmopt_off
movlw	224
movwf	(??_sendByte+0)+0,f
u19_27:
	nop2
decfsz	(??_sendByte+0)+0,f
	goto	u19_27
	clrwdt
opt asmopt_on

	line	149
	
i1l1052:	
;main.c: 149: CCP1CONbits.CCP1M=0x0;
	movlw	((0 & ((1<<4)-1))<<0)|not (((1<<4)-1)<<0)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(21),f	;volatile
	line	151
	
i1l1054:	
;main.c: 151: if(byte & 0x80)
	btfss	(sendByte@byte),(7)&7
	goto	u12_21
	goto	u12_20
u12_21:
	goto	i1l1058
u12_20:
	line	153
	
i1l1056:	
;main.c: 152: {
;main.c: 153: _delay((unsigned long)((1686)*(8000000/4000000.0)));
	opt asmopt_off
movlw	5
movwf	((??_sendByte+0)+0+1),f
	movlw	95
movwf	((??_sendByte+0)+0),f
u20_27:
	decfsz	((??_sendByte+0)+0),f
	goto	u20_27
	decfsz	((??_sendByte+0)+0+1),f
	goto	u20_27
	nop2
opt asmopt_on

	line	154
;main.c: 154: }
	goto	i1l1060
	line	157
	
i1l1058:	
;main.c: 155: else
;main.c: 156: {
;main.c: 157: _delay((unsigned long)((558)*(8000000/4000000.0)));
	opt asmopt_off
movlw	223
movwf	(??_sendByte+0)+0,f
u21_27:
	nop2
decfsz	(??_sendByte+0)+0,f
	goto	u21_27
opt asmopt_on

	line	159
	
i1l1060:	
;main.c: 158: }
;main.c: 159: byte = byte <<1;
	clrc
	rlf	(sendByte@byte),f
	line	144
	
i1l1062:	
	decf	(sendByte@i),f
	
i1l1064:	
	movf	(sendByte@i),f
	skipz
	goto	u13_21
	goto	u13_20
u13_21:
	goto	i1l1046
u13_20:
	line	161
	
i1l552:	
	return
	opt stack 0
GLOBAL	__end_of_sendByte
	__end_of_sendByte:
;; =============== function _sendByte ends ============

	signat	_sendByte,4216
	global	_sendRepeate
psect	text117,local,class=CODE,delta=2
global __ptext117
__ptext117:

;; *************** function _sendRepeate *****************
;; Defined at:
;;		line 164 in file "J:\new work\MPLAB\New folder\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          2       0
;;      Totals:         2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_swInt
;; This function uses a non-reentrant model
;;
psect	text117
	file	"J:\new work\MPLAB\New folder\main.c"
	line	164
	global	__size_of_sendRepeate
	__size_of_sendRepeate	equ	__end_of_sendRepeate-_sendRepeate
	
_sendRepeate:	
	opt	stack 6
; Regs used in _sendRepeate: [wreg+status,2+status,0]
	line	165
	
i1l990:	
;main.c: 165: TMR2 = 0x00;
	clrf	(17)	;volatile
	line	166
	
i1l992:	
;main.c: 166: CCP1CONbits.CCP1M = 0xC;
	movf	(21),w	;volatile
	andlw	not (((1<<4)-1)<<0)
	iorlw	(0Ch & ((1<<4)-1))<<0
	movwf	(21)	;volatile
	line	167
	
i1l994:	
;main.c: 167: _delay((unsigned long)((8999)*(8000000/4000000.0)));
	opt asmopt_off
movlw	24
movwf	((??_sendRepeate+0)+0+1),f
	movlw	94
movwf	((??_sendRepeate+0)+0),f
u22_27:
	decfsz	((??_sendRepeate+0)+0),f
	goto	u22_27
	decfsz	((??_sendRepeate+0)+0+1),f
	goto	u22_27
	clrwdt
opt asmopt_on

	line	168
	
i1l996:	
;main.c: 168: CCP1CONbits.CCP1M = 0x0;
	movlw	((0 & ((1<<4)-1))<<0)|not (((1<<4)-1)<<0)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(21),f	;volatile
	line	169
	
i1l998:	
;main.c: 169: _delay((unsigned long)((2245)*(8000000/4000000.0)));
	opt asmopt_off
movlw	6
movwf	((??_sendRepeate+0)+0+1),f
	movlw	211
movwf	((??_sendRepeate+0)+0),f
u23_27:
	decfsz	((??_sendRepeate+0)+0),f
	goto	u23_27
	decfsz	((??_sendRepeate+0)+0+1),f
	goto	u23_27
	nop2
opt asmopt_on

	line	171
;main.c: 171: TMR2 = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(17)	;volatile
	line	172
	
i1l1000:	
;main.c: 172: CCP1CONbits.CCP1M = 0xC;
	movf	(21),w	;volatile
	andlw	not (((1<<4)-1)<<0)
	iorlw	(0Ch & ((1<<4)-1))<<0
	movwf	(21)	;volatile
	line	173
	
i1l1002:	
;main.c: 173: _delay((unsigned long)((556)*(8000000/4000000.0)));
	opt asmopt_off
movlw	222
movwf	(??_sendRepeate+0)+0,f
u24_27:
	nop2
decfsz	(??_sendRepeate+0)+0,f
	goto	u24_27
	clrwdt
opt asmopt_on

	line	174
	
i1l1004:	
;main.c: 174: CCP1CONbits.CCP1M = 0x0;
	movlw	((0 & ((1<<4)-1))<<0)|not (((1<<4)-1)<<0)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(21),f	;volatile
	line	175
	
i1l1006:	
;main.c: 175: _delay((unsigned long)((96187)*(8000000/4000000.0)));
	opt asmopt_off
movlw	250
movwf	((??_sendRepeate+0)+0+1),f
	movlw	213
movwf	((??_sendRepeate+0)+0),f
u25_27:
	decfsz	((??_sendRepeate+0)+0),f
	goto	u25_27
	decfsz	((??_sendRepeate+0)+0+1),f
	goto	u25_27
opt asmopt_on

	line	177
	
i1l555:	
	return
	opt stack 0
GLOBAL	__end_of_sendRepeate
	__end_of_sendRepeate:
;; =============== function _sendRepeate ends ============

	signat	_sendRepeate,88
psect	text118,local,class=CODE,delta=2
global __ptext118
__ptext118:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
