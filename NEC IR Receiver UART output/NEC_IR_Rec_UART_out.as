opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	12F675
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
# 27 "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 27 "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
	dw 0x31FC & 0x31F7 & 0x31FF & 0x31DF & 0x31FF & 0x31FF ;#
	FNCALL	_main,_UART_Transmit
	FNROOT	_main
	FNCALL	_t0intr,_timerInterruptIsr
	FNCALL	_t0intr,_interruptOnChangeIsr
	FNCALL	intlevel1,_t0intr
	global	intlevel1
	FNROOT	intlevel1
	global	_PREPULSE
	global	_TIMEOUT
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
	line	56

;initializer for _PREPULSE
	retlw	060h
	retlw	01Fh

	line	55

;initializer for _TIMEOUT
	retlw	024h
	retlw	02Bh

	global	interruptOnChangeIsr@rxbuffer
	global	_timer
	global	_address
	global	_command
	global	_dataready
	global	_necpoj
	global	_notaddress
	global	_notcommand
	global	_CMCON
_CMCON	set	25
	global	_GPIO
_GPIO	set	5
	global	_GPIObits
_GPIObits	set	5
	global	_INTCONbits
_INTCONbits	set	11
	global	_TMR0
_TMR0	set	1
	global	_ANSEL
_ANSEL	set	159
	global	_EEADR
_EEADR	set	155
	global	_EECON1bits
_EECON1bits	set	156
	global	_EECON2
_EECON2	set	157
	global	_EEDATA
_EEDATA	set	154
	global	_IOC
_IOC	set	150
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TRISIO
_TRISIO	set	133
	file	"NEC_IR_Rec_UART_out.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
interruptOnChangeIsr@rxbuffer:
       ds      4

_timer:
       ds      3

_address:
       ds      1

_command:
       ds      1

_dataready:
       ds      1

_necpoj:
       ds      1

_notaddress:
       ds      1

_notcommand:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
	line	56
_PREPULSE:
       ds      2

psect	dataBANK0
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
	line	55
_TIMEOUT:
       ds      2

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+0Dh)
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_timerInterruptIsr
??_timerInterruptIsr:	; 0 bytes @ 0x0
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_timerInterruptIsr
?_timerInterruptIsr:	; 0 bytes @ 0x0
	global	?_interruptOnChangeIsr
?_interruptOnChangeIsr:	; 0 bytes @ 0x0
	global	??_interruptOnChangeIsr
??_interruptOnChangeIsr:	; 0 bytes @ 0x0
	global	?_UART_Transmit
?_UART_Transmit:	; 0 bytes @ 0x0
	global	?_t0intr
?_t0intr:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	3
	global	interruptOnChangeIsr@tdiff
interruptOnChangeIsr@tdiff:	; 3 bytes @ 0x3
	ds	3
	global	interruptOnChangeIsr@pin
interruptOnChangeIsr@pin:	; 1 bytes @ 0x6
	ds	1
	global	??_t0intr
??_t0intr:	; 0 bytes @ 0x7
	ds	2
	global	??_UART_Transmit
??_UART_Transmit:	; 0 bytes @ 0x9
	ds	1
	global	UART_Transmit@DataValue
UART_Transmit@DataValue:	; 1 bytes @ 0xA
	ds	1
	global	UART_Transmit@i
UART_Transmit@i:	; 1 bytes @ 0xB
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xC
	ds	1
;;Data sizes: Strings 0, constant 0, data 4, bss 13, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           62     13      30

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _t0intr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_UART_Transmit
;;
;; Critical Paths under _t0intr in BANK0
;;
;;   _t0intr->_interruptOnChangeIsr

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0      90
;;                                             12 BANK0      1     1      0
;;                      _UART_Transmit
;; ---------------------------------------------------------------------------------
;; (1) _UART_Transmit                                        3     3      0      90
;;                                              9 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _t0intr                                               2     2      0     135
;;                                              7 BANK0      2     2      0
;;                  _timerInterruptIsr
;;               _interruptOnChangeIsr
;; ---------------------------------------------------------------------------------
;; (3) _interruptOnChangeIsr                                 7     7      0     135
;;                                              0 BANK0      7     7      0
;; ---------------------------------------------------------------------------------
;; (3) _timerInterruptIsr                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _UART_Transmit
;;
;; _t0intr (ROOT)
;;   _timerInterruptIsr
;;   _interruptOnChangeIsr
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      23       6        0.0%
;;ABS                  0      0      1E       5        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       5       2        0.0%
;;BANK0               3E      D      1E       4       48.4%
;;BITBANK0            3E      0       0       3        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               0      0       0       1        0.0%
;;BITCOMMON            0      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 96 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 20/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       1
;;      Totals:         0       1
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_UART_Transmit
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
	line	96
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	98
	
l1485:	
;main.c: 98: CMCON=0x7;
	movlw	(07h)
	movwf	(25)	;volatile
	line	99
	
l1487:	
;main.c: 99: ANSEL=0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	100
	
l1489:	
;main.c: 100: TRISIO=0x8;
	movlw	(08h)
	movwf	(133)^080h	;volatile
	line	101
	
l1491:	
;main.c: 101: GPIObits.GPIO4=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(5),4	;volatile
	line	102
;main.c: 102: TMR0 = 0;
	clrf	(1)	;volatile
	line	103
	
l1493:	
;main.c: 103: OPTION_REG = 0x88;
	movlw	(088h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	106
	
l1495:	
;main.c: 106: IOC = 0x8;
	movlw	(08h)
	movwf	(150)^080h	;volatile
	line	107
	
l1497:	
;main.c: 107: INTCONbits.T0IE = 1;
	bsf	(11),5	;volatile
	line	108
	
l1499:	
;main.c: 108: INTCONbits.T0IF = 0;
	bcf	(11),2	;volatile
	line	109
	
l1501:	
;main.c: 109: INTCONbits.GPIE = 1;
	bsf	(11),3	;volatile
	line	110
	
l1503:	
;main.c: 110: INTCONbits.GPIF = 0;
	bcf	(11),0	;volatile
	line	111
	
l1505:	
;main.c: 111: INTCONbits.PEIE = 1;
	bsf	(11),6	;volatile
	line	112
	
l1507:	
;main.c: 112: INTCONbits.GIE = 1;
	bsf	(11),7	;volatile
	line	116
;main.c: 116: EEADR = 0x00;
	clrf	(155)^080h	;volatile
	line	117
	
l1509:	
;main.c: 117: EECON1bits.RD = 1;
	bsf	(156)^080h,0	;volatile
	line	118
	
l1511:	
;main.c: 118: GPIO = EEDATA;
	movf	(154)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	123
	
l1513:	
;main.c: 121: {
;main.c: 123: if(dataready)
	movf	(_dataready),w
	skipz
	goto	u440
	goto	l1513
u440:
	goto	l1525
	line	135
	
l1517:	
	movlw	0
	btfss	(5),0	;volatile
	movlw	1
	movwf	(??_main+0)+0
	movf	(5),w	;volatile
	xorwf	(??_main+0)+0,w
	andlw	not ((1<<1)-1)
	xorwf	(??_main+0)+0,w
	movwf	(5)	;volatile
	line	136
;main.c: 136: break;
	goto	l1527
	line	137
	
l1519:	
	movlw	0
	btfss	(5),1	;volatile
	movlw	1
	movwf	(??_main+0)+0
	rlf	(??_main+0)+0,f
	movf	(5),w	;volatile
	xorwf	(??_main+0)+0,w
	andlw	not (((1<<1)-1)<<1)
	xorwf	(??_main+0)+0,w
	movwf	(5)	;volatile
	line	138
;main.c: 138: break;
	goto	l1527
	line	139
	
l1521:	
	movlw	0
	btfss	(5),2	;volatile
	movlw	1
	movwf	(??_main+0)+0
	rlf	(??_main+0)+0,f
	rlf	(??_main+0)+0,f
	movf	(5),w	;volatile
	xorwf	(??_main+0)+0,w
	andlw	not (((1<<1)-1)<<2)
	xorwf	(??_main+0)+0,w
	movwf	(5)	;volatile
	line	140
;main.c: 140: break;
	goto	l1527
	line	143
;main.c: 143: case 0xB0: GPIObits.GPIO0 = 0;
	
l382:	
	bcf	(5),0	;volatile
	line	144
;main.c: 144: GPIObits.GPIO1 = 0;
	bcf	(5),1	;volatile
	line	145
;main.c: 145: GPIObits.GPIO2 = 0;
	bcf	(5),2	;volatile
	line	147
;main.c: 147: break;
	goto	l1527
	line	133
	
l1525:	
	movf	(_command),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 80 to 248
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte          178     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	80^0	; case 80
	skipnz
	goto	l1517
	xorlw	176^80	; case 176
	skipnz
	goto	l382
	xorlw	216^176	; case 216
	skipnz
	goto	l1519
	xorlw	248^216	; case 248
	skipnz
	goto	l1521
	goto	l1527
	opt asmopt_on

	line	151
	
l1527:	
;main.c: 151: UART_Transmit(address);
	movf	(_address),w
	fcall	_UART_Transmit
	line	152
;main.c: 152: UART_Transmit(command);
	bcf	status, 5	;RP0=0, select bank0
	movf	(_command),w
	fcall	_UART_Transmit
	line	154
	
l1529:	
;main.c: 154: EEADR = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(155)^080h	;volatile
	line	155
	
l1531:	
;main.c: 155: EEDATA = GPIO;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	movwf	(154)^080h	;volatile
	line	156
	
l1533:	
;main.c: 156: EECON1bits.WREN = 1;
	bsf	(156)^080h,2	;volatile
	line	157
	
l1535:	
;main.c: 157: INTCONbits.GIE = 0;
	bcf	(11),7	;volatile
	line	158
	
l1537:	
;main.c: 158: EECON2 = 0x55;
	movlw	(055h)
	movwf	(157)^080h	;volatile
	line	159
	
l1539:	
;main.c: 159: EECON2 = 0xAA;
	movlw	(0AAh)
	movwf	(157)^080h	;volatile
	line	160
	
l1541:	
;main.c: 160: EECON1bits.WR = 1;
	bsf	(156)^080h,1	;volatile
	line	161
	
l1543:	
;main.c: 161: INTCONbits.GIE = 1;
	bsf	(11),7	;volatile
	line	163
	
l1545:	
;main.c: 163: dataready=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_dataready)
	goto	l1513
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	169
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_UART_Transmit
psect	text123,local,class=CODE,delta=2
global __ptext123
__ptext123:

;; *************** function _UART_Transmit *****************
;; Defined at:
;;		line 331 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
;; Parameters:    Size  Location     Type
;;  DataValue       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  DataValue       1   10[BANK0 ] unsigned char 
;;  i               1   11[BANK0 ] unsigned char 
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
;;      Locals:         0       2
;;      Temps:          0       1
;;      Totals:         0       3
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text123
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
	line	331
	global	__size_of_UART_Transmit
	__size_of_UART_Transmit	equ	__end_of_UART_Transmit-_UART_Transmit
	
_UART_Transmit:	
	opt	stack 5
; Regs used in _UART_Transmit: [wreg+status,2+status,0]
;UART_Transmit@DataValue stored from wreg
	line	341
	movwf	(UART_Transmit@DataValue)
	
l1463:	
;main.c: 341: GPIObits.GPIO4 = 0;
	bcf	(5),4	;volatile
	line	342
	
l1465:	
;main.c: 342: _delay((unsigned long)(((1000000/9600))*(4000000/4000000.0)));
	opt asmopt_off
movlw	34
movwf	(??_UART_Transmit+0)+0,f
u457:
decfsz	(??_UART_Transmit+0)+0,f
	goto	u457
	clrwdt
opt asmopt_on

	line	344
	
l1467:	
;main.c: 344: for ( unsigned char i = 0; i < 8; i++ )
	bcf	status, 5	;RP0=0, select bank0
	clrf	(UART_Transmit@i)
	line	347
	
l1473:	
;main.c: 345: {
;main.c: 347: if( ((DataValue>>i)&0x1) == 0x1 )
	movf	(UART_Transmit@DataValue),w
	movwf	(??_UART_Transmit+0)+0
	incf	(UART_Transmit@i),w
	goto	u414
u415:
	clrc
	rrf	(??_UART_Transmit+0)+0,f
u414:
	addlw	-1
	skipz
	goto	u415
	btfss	0+(??_UART_Transmit+0)+0,(0)&7
	goto	u421
	goto	u420
u421:
	goto	l420
u420:
	line	349
	
l1475:	
;main.c: 348: {
;main.c: 349: GPIObits.GPIO4 = 1;
	bsf	(5),4	;volatile
	line	350
;main.c: 350: }
	goto	l1477
	line	351
	
l420:	
	line	353
;main.c: 351: else
;main.c: 352: {
;main.c: 353: GPIObits.GPIO4 = 0;
	bcf	(5),4	;volatile
	line	356
	
l1477:	
;main.c: 354: }
;main.c: 356: _delay((unsigned long)(((1000000/9600))*(4000000/4000000.0)));
	opt asmopt_off
movlw	34
movwf	(??_UART_Transmit+0)+0,f
u467:
decfsz	(??_UART_Transmit+0)+0,f
	goto	u467
	clrwdt
opt asmopt_on

	line	344
	
l1479:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(UART_Transmit@i),f
	
l1481:	
	movlw	(08h)
	subwf	(UART_Transmit@i),w
	skipc
	goto	u431
	goto	u430
u431:
	goto	l1473
u430:
	
l419:	
	line	360
;main.c: 357: }
;main.c: 360: GPIObits.GPIO4 = 1;
	bsf	(5),4	;volatile
	line	361
	
l1483:	
;main.c: 361: _delay((unsigned long)(((1000000/9600))*(4000000/4000000.0)));
	opt asmopt_off
movlw	34
movwf	(??_UART_Transmit+0)+0,f
u477:
decfsz	(??_UART_Transmit+0)+0,f
	goto	u477
	clrwdt
opt asmopt_on

	line	362
	
l422:	
	return
	opt stack 0
GLOBAL	__end_of_UART_Transmit
	__end_of_UART_Transmit:
;; =============== function _UART_Transmit ends ============

	signat	_UART_Transmit,4216
	global	_t0intr
psect	text124,local,class=CODE,delta=2
global __ptext124
__ptext124:

;; *************** function _t0intr *****************
;; Defined at:
;;		line 76 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       2
;;      Totals:         0       2
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_timerInterruptIsr
;;		_interruptOnChangeIsr
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text124
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
	line	76
	global	__size_of_t0intr
	__size_of_t0intr	equ	__end_of_t0intr-_t0intr
	
_t0intr:	
	opt	stack 5
; Regs used in _t0intr: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_t0intr+0)
	movf	pclath,w
	movwf	(??_t0intr+1)
	ljmp	_t0intr
psect	text124
	line	77
	
i1l1355:	
;main.c: 77: if(INTCONbits.T0IF)
	btfss	(11),2	;volatile
	goto	u23_21
	goto	u23_20
u23_21:
	goto	i1l369
u23_20:
	line	79
	
i1l1357:	
;main.c: 78: {
;main.c: 79: timerInterruptIsr();
	fcall	_timerInterruptIsr
	line	80
	
i1l1359:	
;main.c: 80: INTCONbits.T0IF =0;
	bcf	(11),2	;volatile
	line	81
;main.c: 81: }
	goto	i1l372
	line	82
	
i1l369:	
;main.c: 82: else if (INTCONbits.GPIF)
	btfss	(11),0	;volatile
	goto	u24_21
	goto	u24_20
u24_21:
	goto	i1l372
u24_20:
	line	84
	
i1l1361:	
;main.c: 83: {
;main.c: 84: GPIObits.GPIO5=1;
	bsf	(5),5	;volatile
	line	85
	
i1l1363:	
;main.c: 85: interruptOnChangeIsr();
	fcall	_interruptOnChangeIsr
	line	86
	
i1l1365:	
;main.c: 86: INTCONbits.GPIF =0;
	bcf	(11),0	;volatile
	line	87
	
i1l1367:	
;main.c: 87: GPIObits.GPIO5=0;
	bcf	(5),5	;volatile
	line	90
	
i1l372:	
	movf	(??_t0intr+1),w
	movwf	pclath
	swapf	(??_t0intr+0)^00h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_t0intr
	__end_of_t0intr:
;; =============== function _t0intr ends ============

	signat	_t0intr,88
	global	_interruptOnChangeIsr
psect	text125,local,class=CODE,delta=2
global __ptext125
__ptext125:

;; *************** function _interruptOnChangeIsr *****************
;; Defined at:
;;		line 172 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tdiff           3    3[BANK0 ] unsigned um
;;  pin             1    6[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       4
;;      Temps:          0       3
;;      Totals:         0       7
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_t0intr
;; This function uses a non-reentrant model
;;
psect	text125
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
	line	172
	global	__size_of_interruptOnChangeIsr
	__size_of_interruptOnChangeIsr	equ	__end_of_interruptOnChangeIsr-_interruptOnChangeIsr
	
_interruptOnChangeIsr:	
	opt	stack 5
; Regs used in _interruptOnChangeIsr: [wreg+status,2+status,0]
	line	179
	
i1l1373:	
;main.c: 174: unsigned short long tdiff;
;main.c: 175: unsigned char pin;
;main.c: 176: static unsigned long rxbuffer;
;main.c: 179: tdiff = ((timer<<8)+TMR0) ;
	movf	(_timer),w
	movwf	((??_interruptOnChangeIsr+0)+0)
	movf	(_timer+1),w
	movwf	((??_interruptOnChangeIsr+0)+0+1)
	movf	(_timer+2),w
	movwf	((??_interruptOnChangeIsr+0)+0+2)
	movf	(??_interruptOnChangeIsr+0)+1,w
	movwf	(??_interruptOnChangeIsr+0)+2
	movf	(??_interruptOnChangeIsr+0)+0,w
	movwf	(??_interruptOnChangeIsr+0)+1
	clrf	(??_interruptOnChangeIsr+0)+0
	movf	0+(??_interruptOnChangeIsr+0)+0,w
	movwf	(interruptOnChangeIsr@tdiff)
	movf	1+(??_interruptOnChangeIsr+0)+0,w
	movwf	(interruptOnChangeIsr@tdiff+1)
	movf	2+(??_interruptOnChangeIsr+0)+0,w
	movwf	(interruptOnChangeIsr@tdiff+2)
	movf	(1),w	;volatile
	addwf	(interruptOnChangeIsr@tdiff),f
	movlw	1
	skipnc
	addwf	(interruptOnChangeIsr@tdiff+1),f
	skipnc
	addwf	(interruptOnChangeIsr@tdiff+2),f
	line	181
	
i1l1375:	
;main.c: 181: pin = GPIObits.GPIO3;
	movlw	0
	btfsc	(5),3	;volatile
	movlw	1
	movwf	(interruptOnChangeIsr@pin)
	line	182
;main.c: 182: TMR0 = 0;
	clrf	(1)	;volatile
	line	183
	
i1l1377:	
;main.c: 183: timer = 0;
	clrf	(_timer)
	clrf	(_timer+1)
	clrf	(_timer+2)
	line	213
	
i1l1379:	
;main.c: 213: if ((tdiff>PREPULSE) && (tdiff<TIMEOUT) )
	movf	(_PREPULSE),w
	movwf	((??_interruptOnChangeIsr+0)+0)
	movf	(_PREPULSE+1),w
	movwf	((??_interruptOnChangeIsr+0)+0+1)
	clrf	((??_interruptOnChangeIsr+0)+0+2)
	movf	(interruptOnChangeIsr@tdiff+2),w
	subwf	2+(??_interruptOnChangeIsr+0)+0,w
	skipz
	goto	u26_25
	movf	(interruptOnChangeIsr@tdiff+1),w
	subwf	1+(??_interruptOnChangeIsr+0)+0,w
	skipz
	goto	u26_25
	movf	(interruptOnChangeIsr@tdiff),w
	subwf	0+(??_interruptOnChangeIsr+0)+0,w
u26_25:
	skipnc
	goto	u26_21
	goto	u26_20
u26_21:
	goto	i1l1445
u26_20:
	
i1l1381:	
	movf	(_TIMEOUT),w
	movwf	((??_interruptOnChangeIsr+0)+0)
	movf	(_TIMEOUT+1),w
	movwf	((??_interruptOnChangeIsr+0)+0+1)
	clrf	((??_interruptOnChangeIsr+0)+0+2)
	movf	2+(??_interruptOnChangeIsr+0)+0,w
	subwf	(interruptOnChangeIsr@tdiff+2),w
	skipz
	goto	u27_25
	movf	1+(??_interruptOnChangeIsr+0)+0,w
	subwf	(interruptOnChangeIsr@tdiff+1),w
	skipz
	goto	u27_25
	movf	0+(??_interruptOnChangeIsr+0)+0,w
	subwf	(interruptOnChangeIsr@tdiff),w
u27_25:
	skipnc
	goto	u27_21
	goto	u27_20
u27_21:
	goto	i1l1445
u27_20:
	line	219
	
i1l1383:	
;main.c: 214: {
;main.c: 219: if(necpoj==1 || necpoj==2)
	decf	(_necpoj),w
	skipnz
	goto	u28_21
	goto	u28_20
u28_21:
	goto	i1l1387
u28_20:
	
i1l1385:	
	movf	(_necpoj),w
	xorlw	02h
	skipz
	goto	u29_21
	goto	u29_20
u29_21:
	goto	i1l1413
u29_20:
	line	222
	
i1l1387:	
;main.c: 220: {
;main.c: 222: if((pin==1) && (necpoj==1))
	decf	(interruptOnChangeIsr@pin),w
	skipz
	goto	u30_21
	goto	u30_20
u30_21:
	goto	i1l1397
u30_20:
	
i1l1389:	
	decf	(_necpoj),w
	skipz
	goto	u31_21
	goto	u31_20
u31_21:
	goto	i1l1397
u31_20:
	line	224
	
i1l1391:	
;main.c: 223: {
;main.c: 224: necpoj++;
	incf	(_necpoj),f
	line	225
	
i1l1393:	
;main.c: 225: TIMEOUT = 5522;
	movlw	low(01592h)
	movwf	(_TIMEOUT)
	movlw	high(01592h)
	movwf	((_TIMEOUT))+1
	line	226
	
i1l1395:	
;main.c: 226: PREPULSE = 3012;
	movlw	low(0BC4h)
	movwf	(_PREPULSE)
	movlw	high(0BC4h)
	movwf	((_PREPULSE))+1
	line	227
;main.c: 227: }
	goto	i1l411
	line	228
	
i1l1397:	
;main.c: 228: else if((pin==0)&& (necpoj ==2))
	movf	(interruptOnChangeIsr@pin),f
	skipz
	goto	u32_21
	goto	u32_20
u32_21:
	goto	i1l1407
u32_20:
	
i1l1399:	
	movf	(_necpoj),w
	xorlw	02h
	skipz
	goto	u33_21
	goto	u33_20
u33_21:
	goto	i1l1407
u33_20:
	line	230
	
i1l1401:	
;main.c: 229: {
;main.c: 230: necpoj++;
	incf	(_necpoj),f
	line	232
	
i1l1403:	
;main.c: 232: TIMEOUT = 2309;
	movlw	low(0905h)
	movwf	(_TIMEOUT)
	movlw	high(0905h)
	movwf	((_TIMEOUT))+1
	line	233
	
i1l1405:	
;main.c: 233: PREPULSE = 200;
	movlw	0C8h
	movwf	(_PREPULSE)
	clrf	(_PREPULSE+1)
	line	235
;main.c: 235: }
	goto	i1l411
	line	238
	
i1l1407:	
;main.c: 236: else
;main.c: 237: {
;main.c: 238: necpoj = 0;
	clrf	(_necpoj)
	line	239
	
i1l1409:	
;main.c: 239: TIMEOUT = 11044;
	movlw	low(02B24h)
	movwf	(_TIMEOUT)
	movlw	high(02B24h)
	movwf	((_TIMEOUT))+1
	line	240
	
i1l1411:	
;main.c: 240: PREPULSE = 8032;
	movlw	low(01F60h)
	movwf	(_PREPULSE)
	movlw	high(01F60h)
	movwf	((_PREPULSE))+1
	goto	i1l411
	line	243
	
i1l1413:	
;main.c: 243: else if(necpoj>2)
	movlw	(03h)
	subwf	(_necpoj),w
	skipc
	goto	u34_21
	goto	u34_20
u34_21:
	goto	i1l1443
u34_20:
	line	246
	
i1l1415:	
;main.c: 244: {
;main.c: 246: necpoj++;
	incf	(_necpoj),f
	line	248
	
i1l1417:	
;main.c: 248: if(necpoj&0x01)
	btfss	(_necpoj),(0)&7
	goto	u35_21
	goto	u35_20
u35_21:
	goto	i1l1425
u35_20:
	line	251
	
i1l1419:	
;main.c: 250: {
;main.c: 251: rxbuffer=rxbuffer<<1;
	clrc
	rlf	(interruptOnChangeIsr@rxbuffer),f
	rlf	(interruptOnChangeIsr@rxbuffer+1),f
	rlf	(interruptOnChangeIsr@rxbuffer+2),f
	rlf	(interruptOnChangeIsr@rxbuffer+3),f
	line	252
	
i1l1421:	
;main.c: 252: if(tdiff>1250)
	movlw	0
	subwf	(interruptOnChangeIsr@tdiff+2),w
	skipz
	goto	u36_25
	movlw	04h
	subwf	(interruptOnChangeIsr@tdiff+1),w
	skipz
	goto	u36_25
	movlw	0E3h
	subwf	(interruptOnChangeIsr@tdiff),w
u36_25:
	skipc
	goto	u36_21
	goto	u36_20
u36_21:
	goto	i1l1425
u36_20:
	line	255
	
i1l1423:	
;main.c: 254: {
;main.c: 255: rxbuffer = rxbuffer | 0x1;
	bsf	(interruptOnChangeIsr@rxbuffer)+(0/8),(0)&7
	line	266
;main.c: 257: }
	
i1l1425:	
;main.c: 262: }
;main.c: 264: }
;main.c: 266: if(necpoj >66)
	movlw	(043h)
	subwf	(_necpoj),w
	skipc
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l399
u37_20:
	line	269
	
i1l1427:	
;main.c: 267: {
;main.c: 269: address = (rxbuffer>>24)& 0xFF;
	movf	0+(((interruptOnChangeIsr@rxbuffer))+3),w
	movwf	(_address)
	line	270
;main.c: 270: notaddress = (rxbuffer>>16)& 0xFF;
	movf	0+(((interruptOnChangeIsr@rxbuffer))+2),w
	movwf	(_notaddress)
	line	271
;main.c: 271: command = (rxbuffer>>8) & 0xFF;
	movf	0+(((interruptOnChangeIsr@rxbuffer))+1),w
	movwf	(_command)
	line	272
;main.c: 272: notcommand = (rxbuffer) & 0xFF;
	movf	(interruptOnChangeIsr@rxbuffer),w
	movwf	(_notcommand)
	line	273
	
i1l1429:	
;main.c: 273: rxbuffer=0;
	clrf	(interruptOnChangeIsr@rxbuffer)
	clrf	(interruptOnChangeIsr@rxbuffer+1)
	clrf	(interruptOnChangeIsr@rxbuffer+2)
	clrf	(interruptOnChangeIsr@rxbuffer+3)
	line	275
	
i1l1431:	
;main.c: 275: if((!(address & notaddress)) && (!(command & notcommand)))
	movf	(_address),w
	andwf	(_notaddress),w
	btfss	status,2
	goto	u38_21
	goto	u38_20
u38_21:
	goto	i1l1437
u38_20:
	
i1l1433:	
	movf	(_command),w
	andwf	(_notcommand),w
	btfss	status,2
	goto	u39_21
	goto	u39_20
u39_21:
	goto	i1l1437
u39_20:
	line	277
	
i1l1435:	
;main.c: 276: {
;main.c: 277: dataready =1;
	clrf	(_dataready)
	incf	(_dataready),f
	line	278
;main.c: 278: }
	goto	i1l1439
	line	281
	
i1l1437:	
;main.c: 279: else
;main.c: 280: {
;main.c: 281: dataready=0;
	clrf	(_dataready)
	line	283
	
i1l1439:	
;main.c: 282: }
;main.c: 283: TIMEOUT = 11044;
	movlw	low(02B24h)
	movwf	(_TIMEOUT)
	movlw	high(02B24h)
	movwf	((_TIMEOUT))+1
	line	284
	
i1l1441:	
;main.c: 284: PREPULSE = 8032;
	movlw	low(01F60h)
	movwf	(_PREPULSE)
	movlw	high(01F60h)
	movwf	((_PREPULSE))+1
	line	285
;main.c: 285: necpoj=0;
	clrf	(_necpoj)
	goto	i1l411
	line	292
	
i1l1443:	
;main.c: 289: else
;main.c: 290: {
;main.c: 292: TIMEOUT = 11044;
	movlw	low(02B24h)
	movwf	(_TIMEOUT)
	movlw	high(02B24h)
	movwf	((_TIMEOUT))+1
	line	293
;main.c: 293: PREPULSE = 8032;
	movlw	low(01F60h)
	movwf	(_PREPULSE)
	movlw	high(01F60h)
	movwf	((_PREPULSE))+1
	goto	i1l411
	line	294
	
i1l399:	
	line	299
;main.c: 294: }
;main.c: 299: }
	goto	i1l411
	line	303
	
i1l1445:	
;main.c: 300: else
;main.c: 301: {
;main.c: 303: if(pin==0)
	movf	(interruptOnChangeIsr@pin),f
	skipz
	goto	u40_21
	goto	u40_20
u40_21:
	goto	i1l1449
u40_20:
	line	305
	
i1l1447:	
;main.c: 304: {
;main.c: 305: necpoj = 1;
	clrf	(_necpoj)
	incf	(_necpoj),f
	line	306
;main.c: 306: }
	goto	i1l1451
	line	309
	
i1l1449:	
;main.c: 307: else
;main.c: 308: {
;main.c: 309: necpoj = 0;
	clrf	(_necpoj)
	line	312
	
i1l1451:	
;main.c: 310: }
;main.c: 312: address = 0xFF;
	movlw	(0FFh)
	movwf	(_address)
	line	313
	
i1l1453:	
;main.c: 313: notaddress = 0xFF;
	movlw	(0FFh)
	movwf	(_notaddress)
	line	314
	
i1l1455:	
;main.c: 314: command = 0xFF;
	movlw	(0FFh)
	movwf	(_command)
	line	315
	
i1l1457:	
;main.c: 315: notcommand = 0xFF;
	movlw	(0FFh)
	movwf	(_notcommand)
	line	316
;main.c: 316: dataready = 0x000;
	clrf	(_dataready)
	goto	i1l1409
	line	321
	
i1l411:	
	return
	opt stack 0
GLOBAL	__end_of_interruptOnChangeIsr
	__end_of_interruptOnChangeIsr:
;; =============== function _interruptOnChangeIsr ends ============

	signat	_interruptOnChangeIsr,88
	global	_timerInterruptIsr
psect	text126,local,class=CODE,delta=2
global __ptext126
__ptext126:

;; *************** function _timerInterruptIsr *****************
;; Defined at:
;;		line 324 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
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
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_t0intr
;; This function uses a non-reentrant model
;;
psect	text126
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR Receiver UART output\main.c"
	line	324
	global	__size_of_timerInterruptIsr
	__size_of_timerInterruptIsr	equ	__end_of_timerInterruptIsr-_timerInterruptIsr
	
_timerInterruptIsr:	
	opt	stack 5
; Regs used in _timerInterruptIsr: [wreg+status,2+status,0]
	line	325
	
i1l1369:	
;main.c: 325: if(timer<0xFFFF)
	movlw	0
	subwf	(_timer+2),w
	skipz
	goto	u25_25
	movlw	0FFh
	subwf	(_timer+1),w
	skipz
	goto	u25_25
	movlw	0FFh
	subwf	(_timer),w
u25_25:
	skipnc
	goto	u25_21
	goto	u25_20
u25_21:
	goto	i1l415
u25_20:
	line	326
	
i1l1371:	
;main.c: 326: timer++;
	incf	(_timer),f
	skipnz
	incf	(_timer+1),f
	skipnz
	incf	(_timer+2),f
	line	327
	
i1l415:	
	return
	opt stack 0
GLOBAL	__end_of_timerInterruptIsr
	__end_of_timerInterruptIsr:
;; =============== function _timerInterruptIsr ends ============

	signat	_timerInterruptIsr,88
psect	text127,local,class=CODE,delta=2
global __ptext127
__ptext127:
	global	btemp
	btemp set 05Eh

	DABS	1,94,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
