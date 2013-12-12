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
# 27 "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 27 "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
	dw 0x31FC & 0x31F7 & 0x31FF & 0x31DF & 0x31FF & 0x31FF ;#
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
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
	line	50

;initializer for _PREPULSE
	retlw	060h
	retlw	01Fh

	line	49

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
	file	"NEC IR Receiver.mcw.as"
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
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
	line	50
_PREPULSE:
       ds      2

psect	dataBANK0
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
	line	49
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
	global	??_main
??_main:	; 0 bytes @ 0x9
	ds	1
;;Data sizes: Strings 0, constant 0, data 4, bss 13, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           62     10      27

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
;;   None.
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
;; (0) _main                                                 1     1      0       0
;;                                              9 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (1) _t0intr                                               2     2      0     135
;;                                              7 BANK0      2     2      0
;;                  _timerInterruptIsr
;;               _interruptOnChangeIsr
;; ---------------------------------------------------------------------------------
;; (2) _interruptOnChangeIsr                                 7     7      0     135
;;                                              0 BANK0      7     7      0
;; ---------------------------------------------------------------------------------
;; (2) _timerInterruptIsr                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
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
;;DATA                 0      0      1F       6        0.0%
;;ABS                  0      0      1B       5        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               3E      A      1B       4       43.5%
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
;;		line 90 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       1
;;      Totals:         0       1
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
	line	90
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0]
	line	92
	
l1433:	
;main.c: 92: CMCON=0x7;
	movlw	(07h)
	movwf	(25)	;volatile
	line	93
	
l1435:	
;main.c: 93: ANSEL=0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	94
	
l1437:	
;main.c: 94: TRISIO=0x8;
	movlw	(08h)
	movwf	(133)^080h	;volatile
	line	95
;main.c: 95: TMR0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(1)	;volatile
	line	96
	
l1439:	
;main.c: 96: OPTION_REG = 0x88;
	movlw	(088h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	99
	
l1441:	
;main.c: 99: IOC = 0x8;
	movlw	(08h)
	movwf	(150)^080h	;volatile
	line	100
	
l1443:	
;main.c: 100: INTCONbits.T0IE = 1;
	bsf	(11),5	;volatile
	line	101
	
l1445:	
;main.c: 101: INTCONbits.T0IF = 0;
	bcf	(11),2	;volatile
	line	102
	
l1447:	
;main.c: 102: INTCONbits.GPIE = 1;
	bsf	(11),3	;volatile
	line	103
	
l1449:	
;main.c: 103: INTCONbits.GPIF = 0;
	bcf	(11),0	;volatile
	line	104
	
l1451:	
;main.c: 104: INTCONbits.PEIE = 1;
	bsf	(11),6	;volatile
	line	105
	
l1453:	
;main.c: 105: INTCONbits.GIE = 1;
	bsf	(11),7	;volatile
	line	109
;main.c: 109: EEADR = 0x00;
	clrf	(155)^080h	;volatile
	line	110
	
l1455:	
;main.c: 110: EECON1bits.RD = 1;
	bsf	(156)^080h,0	;volatile
	line	111
	
l1457:	
;main.c: 111: GPIO = EEDATA;
	movf	(154)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	116
	
l1459:	
;main.c: 114: {
;main.c: 116: if(dataready)
	movf	(_dataready),w
	skipz
	goto	u380
	goto	l1459
u380:
	goto	l1473
	line	128
	
l1463:	
	movlw	0
	btfss	(5),0	;volatile
	movlw	1
	movwf	(??_main+0)+0
	movf	(5),w	;volatile
	xorwf	(??_main+0)+0,w
	andlw	not ((1<<1)-1)
	xorwf	(??_main+0)+0,w
	movwf	(5)	;volatile
	line	129
;main.c: 129: break;
	goto	l1475
	line	130
	
l1465:	
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
	line	131
;main.c: 131: break;
	goto	l1475
	line	132
	
l1467:	
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
	line	133
;main.c: 133: break;
	goto	l1475
	line	134
	
l1469:	
	movlw	0
	btfss	(5),4	;volatile
	movlw	1
	movwf	(??_main+0)+0
	swapf	(??_main+0)+0,f
	movf	(5),w	;volatile
	xorwf	(??_main+0)+0,w
	andlw	not (((1<<1)-1)<<4)
	xorwf	(??_main+0)+0,w
	movwf	(5)	;volatile
	line	135
;main.c: 135: break;
	goto	l1475
	line	136
;main.c: 136: case 0xB0: GPIObits.GPIO0 = 0;
	
l379:	
	bcf	(5),0	;volatile
	line	137
;main.c: 137: GPIObits.GPIO1 = 0;
	bcf	(5),1	;volatile
	line	138
;main.c: 138: GPIObits.GPIO2 = 0;
	bcf	(5),2	;volatile
	line	139
;main.c: 139: GPIObits.GPIO4 = 0;
	bcf	(5),4	;volatile
	line	140
;main.c: 140: break;
	goto	l1475
	line	126
	
l1473:	
	movf	(_command),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 48 to 248
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte          210     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	48^0	; case 48
	skipnz
	goto	l1469
	xorlw	80^48	; case 80
	skipnz
	goto	l1463
	xorlw	176^80	; case 176
	skipnz
	goto	l379
	xorlw	216^176	; case 216
	skipnz
	goto	l1465
	xorlw	248^216	; case 248
	skipnz
	goto	l1467
	goto	l1475
	opt asmopt_on

	line	145
	
l1475:	
;main.c: 145: EEADR = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(155)^080h	;volatile
	line	146
	
l1477:	
;main.c: 146: EEDATA = GPIO;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	movwf	(154)^080h	;volatile
	line	147
	
l1479:	
;main.c: 147: EECON1bits.WREN = 1;
	bsf	(156)^080h,2	;volatile
	line	148
	
l1481:	
;main.c: 148: INTCONbits.GIE = 0;
	bcf	(11),7	;volatile
	line	149
	
l1483:	
;main.c: 149: EECON2 = 0x55;
	movlw	(055h)
	movwf	(157)^080h	;volatile
	line	150
	
l1485:	
;main.c: 150: EECON2 = 0xAA;
	movlw	(0AAh)
	movwf	(157)^080h	;volatile
	line	151
	
l1487:	
;main.c: 151: EECON1bits.WR = 1;
	bsf	(156)^080h,1	;volatile
	line	152
	
l1489:	
;main.c: 152: INTCONbits.GIE = 1;
	bsf	(11),7	;volatile
	line	154
	
l1491:	
;main.c: 154: dataready=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_dataready)
	goto	l1459
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	160
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_t0intr
psect	text77,local,class=CODE,delta=2
global __ptext77
__ptext77:

;; *************** function _t0intr *****************
;; Defined at:
;;		line 70 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
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
psect	text77
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
	line	70
	global	__size_of_t0intr
	__size_of_t0intr	equ	__end_of_t0intr-_t0intr
	
_t0intr:	
	opt	stack 6
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
psect	text77
	line	71
	
i1l1325:	
;main.c: 71: if(INTCONbits.T0IF)
	btfss	(11),2	;volatile
	goto	u20_21
	goto	u20_20
u20_21:
	goto	i1l365
u20_20:
	line	73
	
i1l1327:	
;main.c: 72: {
;main.c: 73: timerInterruptIsr();
	fcall	_timerInterruptIsr
	line	74
	
i1l1329:	
;main.c: 74: INTCONbits.T0IF =0;
	bcf	(11),2	;volatile
	line	75
;main.c: 75: }
	goto	i1l368
	line	76
	
i1l365:	
;main.c: 76: else if (INTCONbits.GPIF)
	btfss	(11),0	;volatile
	goto	u21_21
	goto	u21_20
u21_21:
	goto	i1l368
u21_20:
	line	78
	
i1l1331:	
;main.c: 77: {
;main.c: 78: GPIObits.GPIO5=1;
	bsf	(5),5	;volatile
	line	79
	
i1l1333:	
;main.c: 79: interruptOnChangeIsr();
	fcall	_interruptOnChangeIsr
	line	80
	
i1l1335:	
;main.c: 80: INTCONbits.GPIF =0;
	bcf	(11),0	;volatile
	line	81
	
i1l1337:	
;main.c: 81: GPIObits.GPIO5=0;
	bcf	(5),5	;volatile
	line	84
	
i1l368:	
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
psect	text78,local,class=CODE,delta=2
global __ptext78
__ptext78:

;; *************** function _interruptOnChangeIsr *****************
;; Defined at:
;;		line 163 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
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
psect	text78
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
	line	163
	global	__size_of_interruptOnChangeIsr
	__size_of_interruptOnChangeIsr	equ	__end_of_interruptOnChangeIsr-_interruptOnChangeIsr
	
_interruptOnChangeIsr:	
	opt	stack 6
; Regs used in _interruptOnChangeIsr: [wreg+status,2+status,0]
	line	170
	
i1l1343:	
;main.c: 165: unsigned short long tdiff;
;main.c: 166: unsigned char pin;
;main.c: 167: static unsigned long rxbuffer;
;main.c: 170: tdiff = ((timer<<8)+TMR0) ;
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
	line	172
	
i1l1345:	
;main.c: 172: pin = GPIObits.GPIO3;
	movlw	0
	btfsc	(5),3	;volatile
	movlw	1
	movwf	(interruptOnChangeIsr@pin)
	line	173
;main.c: 173: TMR0 = 0;
	clrf	(1)	;volatile
	line	174
	
i1l1347:	
;main.c: 174: timer = 0;
	clrf	(_timer)
	clrf	(_timer+1)
	clrf	(_timer+2)
	line	204
	
i1l1349:	
;main.c: 204: if ((tdiff>PREPULSE) && (tdiff<TIMEOUT) )
	movf	(_PREPULSE),w
	movwf	((??_interruptOnChangeIsr+0)+0)
	movf	(_PREPULSE+1),w
	movwf	((??_interruptOnChangeIsr+0)+0+1)
	clrf	((??_interruptOnChangeIsr+0)+0+2)
	movf	(interruptOnChangeIsr@tdiff+2),w
	subwf	2+(??_interruptOnChangeIsr+0)+0,w
	skipz
	goto	u23_25
	movf	(interruptOnChangeIsr@tdiff+1),w
	subwf	1+(??_interruptOnChangeIsr+0)+0,w
	skipz
	goto	u23_25
	movf	(interruptOnChangeIsr@tdiff),w
	subwf	0+(??_interruptOnChangeIsr+0)+0,w
u23_25:
	skipnc
	goto	u23_21
	goto	u23_20
u23_21:
	goto	i1l1415
u23_20:
	
i1l1351:	
	movf	(_TIMEOUT),w
	movwf	((??_interruptOnChangeIsr+0)+0)
	movf	(_TIMEOUT+1),w
	movwf	((??_interruptOnChangeIsr+0)+0+1)
	clrf	((??_interruptOnChangeIsr+0)+0+2)
	movf	2+(??_interruptOnChangeIsr+0)+0,w
	subwf	(interruptOnChangeIsr@tdiff+2),w
	skipz
	goto	u24_25
	movf	1+(??_interruptOnChangeIsr+0)+0,w
	subwf	(interruptOnChangeIsr@tdiff+1),w
	skipz
	goto	u24_25
	movf	0+(??_interruptOnChangeIsr+0)+0,w
	subwf	(interruptOnChangeIsr@tdiff),w
u24_25:
	skipnc
	goto	u24_21
	goto	u24_20
u24_21:
	goto	i1l1415
u24_20:
	line	210
	
i1l1353:	
;main.c: 205: {
;main.c: 210: if(necpoj==1 || necpoj==2)
	decf	(_necpoj),w
	skipnz
	goto	u25_21
	goto	u25_20
u25_21:
	goto	i1l1357
u25_20:
	
i1l1355:	
	movf	(_necpoj),w
	xorlw	02h
	skipz
	goto	u26_21
	goto	u26_20
u26_21:
	goto	i1l1383
u26_20:
	line	213
	
i1l1357:	
;main.c: 211: {
;main.c: 213: if((pin==1) && (necpoj==1))
	decf	(interruptOnChangeIsr@pin),w
	skipz
	goto	u27_21
	goto	u27_20
u27_21:
	goto	i1l1367
u27_20:
	
i1l1359:	
	decf	(_necpoj),w
	skipz
	goto	u28_21
	goto	u28_20
u28_21:
	goto	i1l1367
u28_20:
	line	215
	
i1l1361:	
;main.c: 214: {
;main.c: 215: necpoj++;
	incf	(_necpoj),f
	line	216
	
i1l1363:	
;main.c: 216: TIMEOUT = 5522;
	movlw	low(01592h)
	movwf	(_TIMEOUT)
	movlw	high(01592h)
	movwf	((_TIMEOUT))+1
	line	217
	
i1l1365:	
;main.c: 217: PREPULSE = 3012;
	movlw	low(0BC4h)
	movwf	(_PREPULSE)
	movlw	high(0BC4h)
	movwf	((_PREPULSE))+1
	line	218
;main.c: 218: }
	goto	i1l408
	line	219
	
i1l1367:	
;main.c: 219: else if((pin==0)&& (necpoj ==2))
	movf	(interruptOnChangeIsr@pin),f
	skipz
	goto	u29_21
	goto	u29_20
u29_21:
	goto	i1l1377
u29_20:
	
i1l1369:	
	movf	(_necpoj),w
	xorlw	02h
	skipz
	goto	u30_21
	goto	u30_20
u30_21:
	goto	i1l1377
u30_20:
	line	221
	
i1l1371:	
;main.c: 220: {
;main.c: 221: necpoj++;
	incf	(_necpoj),f
	line	223
	
i1l1373:	
;main.c: 223: TIMEOUT = 2309;
	movlw	low(0905h)
	movwf	(_TIMEOUT)
	movlw	high(0905h)
	movwf	((_TIMEOUT))+1
	line	224
	
i1l1375:	
;main.c: 224: PREPULSE = 200;
	movlw	0C8h
	movwf	(_PREPULSE)
	clrf	(_PREPULSE+1)
	line	226
;main.c: 226: }
	goto	i1l408
	line	229
	
i1l1377:	
;main.c: 227: else
;main.c: 228: {
;main.c: 229: necpoj = 0;
	clrf	(_necpoj)
	line	230
	
i1l1379:	
;main.c: 230: TIMEOUT = 11044;
	movlw	low(02B24h)
	movwf	(_TIMEOUT)
	movlw	high(02B24h)
	movwf	((_TIMEOUT))+1
	line	231
	
i1l1381:	
;main.c: 231: PREPULSE = 8032;
	movlw	low(01F60h)
	movwf	(_PREPULSE)
	movlw	high(01F60h)
	movwf	((_PREPULSE))+1
	goto	i1l408
	line	234
	
i1l1383:	
;main.c: 234: else if(necpoj>2)
	movlw	(03h)
	subwf	(_necpoj),w
	skipc
	goto	u31_21
	goto	u31_20
u31_21:
	goto	i1l1413
u31_20:
	line	237
	
i1l1385:	
;main.c: 235: {
;main.c: 237: necpoj++;
	incf	(_necpoj),f
	line	239
	
i1l1387:	
;main.c: 239: if(necpoj&0x01)
	btfss	(_necpoj),(0)&7
	goto	u32_21
	goto	u32_20
u32_21:
	goto	i1l1395
u32_20:
	line	242
	
i1l1389:	
;main.c: 241: {
;main.c: 242: rxbuffer=rxbuffer<<1;
	clrc
	rlf	(interruptOnChangeIsr@rxbuffer),f
	rlf	(interruptOnChangeIsr@rxbuffer+1),f
	rlf	(interruptOnChangeIsr@rxbuffer+2),f
	rlf	(interruptOnChangeIsr@rxbuffer+3),f
	line	243
	
i1l1391:	
;main.c: 243: if(tdiff>1250)
	movlw	0
	subwf	(interruptOnChangeIsr@tdiff+2),w
	skipz
	goto	u33_25
	movlw	04h
	subwf	(interruptOnChangeIsr@tdiff+1),w
	skipz
	goto	u33_25
	movlw	0E3h
	subwf	(interruptOnChangeIsr@tdiff),w
u33_25:
	skipc
	goto	u33_21
	goto	u33_20
u33_21:
	goto	i1l1395
u33_20:
	line	246
	
i1l1393:	
;main.c: 245: {
;main.c: 246: rxbuffer = rxbuffer | 0x1;
	bsf	(interruptOnChangeIsr@rxbuffer)+(0/8),(0)&7
	line	257
;main.c: 248: }
	
i1l1395:	
;main.c: 253: }
;main.c: 255: }
;main.c: 257: if(necpoj >66)
	movlw	(043h)
	subwf	(_necpoj),w
	skipc
	goto	u34_21
	goto	u34_20
u34_21:
	goto	i1l396
u34_20:
	line	260
	
i1l1397:	
;main.c: 258: {
;main.c: 260: address = (rxbuffer>>24)& 0xFF;
	movf	0+(((interruptOnChangeIsr@rxbuffer))+3),w
	movwf	(_address)
	line	261
;main.c: 261: notaddress = (rxbuffer>>16)& 0xFF;
	movf	0+(((interruptOnChangeIsr@rxbuffer))+2),w
	movwf	(_notaddress)
	line	262
;main.c: 262: command = (rxbuffer>>8) & 0xFF;
	movf	0+(((interruptOnChangeIsr@rxbuffer))+1),w
	movwf	(_command)
	line	263
;main.c: 263: notcommand = (rxbuffer) & 0xFF;
	movf	(interruptOnChangeIsr@rxbuffer),w
	movwf	(_notcommand)
	line	264
	
i1l1399:	
;main.c: 264: rxbuffer=0;
	clrf	(interruptOnChangeIsr@rxbuffer)
	clrf	(interruptOnChangeIsr@rxbuffer+1)
	clrf	(interruptOnChangeIsr@rxbuffer+2)
	clrf	(interruptOnChangeIsr@rxbuffer+3)
	line	266
	
i1l1401:	
;main.c: 266: if((!(address & notaddress)) && (!(command & notcommand)))
	movf	(_address),w
	andwf	(_notaddress),w
	btfss	status,2
	goto	u35_21
	goto	u35_20
u35_21:
	goto	i1l1407
u35_20:
	
i1l1403:	
	movf	(_command),w
	andwf	(_notcommand),w
	btfss	status,2
	goto	u36_21
	goto	u36_20
u36_21:
	goto	i1l1407
u36_20:
	line	268
	
i1l1405:	
;main.c: 267: {
;main.c: 268: dataready =1;
	clrf	(_dataready)
	incf	(_dataready),f
	line	269
;main.c: 269: }
	goto	i1l1409
	line	272
	
i1l1407:	
;main.c: 270: else
;main.c: 271: {
;main.c: 272: dataready=0;
	clrf	(_dataready)
	line	274
	
i1l1409:	
;main.c: 273: }
;main.c: 274: TIMEOUT = 11044;
	movlw	low(02B24h)
	movwf	(_TIMEOUT)
	movlw	high(02B24h)
	movwf	((_TIMEOUT))+1
	line	275
	
i1l1411:	
;main.c: 275: PREPULSE = 8032;
	movlw	low(01F60h)
	movwf	(_PREPULSE)
	movlw	high(01F60h)
	movwf	((_PREPULSE))+1
	line	276
;main.c: 276: necpoj=0;
	clrf	(_necpoj)
	goto	i1l408
	line	283
	
i1l1413:	
;main.c: 280: else
;main.c: 281: {
;main.c: 283: TIMEOUT = 11044;
	movlw	low(02B24h)
	movwf	(_TIMEOUT)
	movlw	high(02B24h)
	movwf	((_TIMEOUT))+1
	line	284
;main.c: 284: PREPULSE = 8032;
	movlw	low(01F60h)
	movwf	(_PREPULSE)
	movlw	high(01F60h)
	movwf	((_PREPULSE))+1
	goto	i1l408
	line	285
	
i1l396:	
	line	290
;main.c: 285: }
;main.c: 290: }
	goto	i1l408
	line	294
	
i1l1415:	
;main.c: 291: else
;main.c: 292: {
;main.c: 294: if(pin==0)
	movf	(interruptOnChangeIsr@pin),f
	skipz
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l1419
u37_20:
	line	296
	
i1l1417:	
;main.c: 295: {
;main.c: 296: necpoj = 1;
	clrf	(_necpoj)
	incf	(_necpoj),f
	line	297
;main.c: 297: }
	goto	i1l1421
	line	300
	
i1l1419:	
;main.c: 298: else
;main.c: 299: {
;main.c: 300: necpoj = 0;
	clrf	(_necpoj)
	line	303
	
i1l1421:	
;main.c: 301: }
;main.c: 303: address = 0xFF;
	movlw	(0FFh)
	movwf	(_address)
	line	304
	
i1l1423:	
;main.c: 304: notaddress = 0xFF;
	movlw	(0FFh)
	movwf	(_notaddress)
	line	305
	
i1l1425:	
;main.c: 305: command = 0xFF;
	movlw	(0FFh)
	movwf	(_command)
	line	306
	
i1l1427:	
;main.c: 306: notcommand = 0xFF;
	movlw	(0FFh)
	movwf	(_notcommand)
	line	307
;main.c: 307: dataready = 0x000;
	clrf	(_dataready)
	goto	i1l1379
	line	312
	
i1l408:	
	return
	opt stack 0
GLOBAL	__end_of_interruptOnChangeIsr
	__end_of_interruptOnChangeIsr:
;; =============== function _interruptOnChangeIsr ends ============

	signat	_interruptOnChangeIsr,88
	global	_timerInterruptIsr
psect	text79,local,class=CODE,delta=2
global __ptext79
__ptext79:

;; *************** function _timerInterruptIsr *****************
;; Defined at:
;;		line 315 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
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
psect	text79
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\NEC IR RECEVER SOURCE\main.c"
	line	315
	global	__size_of_timerInterruptIsr
	__size_of_timerInterruptIsr	equ	__end_of_timerInterruptIsr-_timerInterruptIsr
	
_timerInterruptIsr:	
	opt	stack 6
; Regs used in _timerInterruptIsr: [wreg+status,2+status,0]
	line	316
	
i1l1339:	
;main.c: 316: if(timer<0xFFFF)
	movlw	0
	subwf	(_timer+2),w
	skipz
	goto	u22_25
	movlw	0FFh
	subwf	(_timer+1),w
	skipz
	goto	u22_25
	movlw	0FFh
	subwf	(_timer),w
u22_25:
	skipnc
	goto	u22_21
	goto	u22_20
u22_21:
	goto	i1l412
u22_20:
	line	317
	
i1l1341:	
;main.c: 317: timer++;
	incf	(_timer),f
	skipnz
	incf	(_timer+1),f
	skipnz
	incf	(_timer+2),f
	line	318
	
i1l412:	
	return
	opt stack 0
GLOBAL	__end_of_timerInterruptIsr
	__end_of_timerInterruptIsr:
;; =============== function _timerInterruptIsr ends ============

	signat	_timerInterruptIsr,88
psect	text80,local,class=CODE,delta=2
global __ptext80
__ptext80:
	global	btemp
	btemp set 05Eh

	DABS	1,94,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
