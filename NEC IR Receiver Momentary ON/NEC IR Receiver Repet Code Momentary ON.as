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
# 27 "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 27 "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
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
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
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
	global	_momantary
	global	_address
	global	_command
	global	_dataready
	global	_necpoj
	global	_notaddress
	global	_notcommand
	global	timerInterruptIsr@flag
	global	timerInterruptIsr@ms_counter
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
	file	"NEC IR Receiver Repet Code Momentary ON.as"
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

_momantary:
       ds      2

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

timerInterruptIsr@flag:
       ds      1

timerInterruptIsr@ms_counter:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
	line	56
_PREPULSE:
       ds      2

psect	dataBANK0
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
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
	movlw	low((__pbssBANK0)+011h)
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
	global	??_main
??_main:	; 0 bytes @ 0x0
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
	global	interruptOnChangeIsr@pin
interruptOnChangeIsr@pin:	; 1 bytes @ 0x3
	ds	1
	global	interruptOnChangeIsr@tdiff
interruptOnChangeIsr@tdiff:	; 3 bytes @ 0x4
	ds	3
	global	??_t0intr
??_t0intr:	; 0 bytes @ 0x7
	ds	2
;;Data sizes: Strings 0, constant 0, data 4, bss 17, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON           0      0       0
;; BANK0           62      9      30

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
;; (1) _t0intr                                               2     2      0     223
;;                                              7 BANK0      2     2      0
;;                  _timerInterruptIsr
;;               _interruptOnChangeIsr
;; ---------------------------------------------------------------------------------
;; (2) _interruptOnChangeIsr                                 7     7      0     223
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
;;DATA                 0      0      22       6        0.0%
;;ABS                  0      0      1E       5        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               3E      9      1E       4       48.4%
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
;;		line 98 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
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
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
	line	98
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0]
	line	99
	
l1529:	
;main.c: 99: CMCON=0x7;
	movlw	(07h)
	movwf	(25)	;volatile
	line	100
	
l1531:	
;main.c: 100: ANSEL=0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	101
	
l1533:	
;main.c: 101: TRISIO=0x8;
	movlw	(08h)
	movwf	(133)^080h	;volatile
	line	102
;main.c: 102: TMR0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(1)	;volatile
	line	103
	
l1535:	
;main.c: 103: OPTION_REG = 0x88;
	movlw	(088h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	106
	
l1537:	
;main.c: 106: IOC = 0x8;
	movlw	(08h)
	movwf	(150)^080h	;volatile
	line	107
	
l1539:	
;main.c: 107: INTCONbits.T0IE = 1;
	bsf	(11),5	;volatile
	line	108
	
l1541:	
;main.c: 108: INTCONbits.T0IF = 0;
	bcf	(11),2	;volatile
	line	109
	
l1543:	
;main.c: 109: INTCONbits.GPIE = 1;
	bsf	(11),3	;volatile
	line	110
	
l1545:	
;main.c: 110: INTCONbits.GPIF = 0;
	bcf	(11),0	;volatile
	line	111
	
l1547:	
;main.c: 111: INTCONbits.PEIE = 1;
	bsf	(11),6	;volatile
	line	112
	
l1549:	
;main.c: 112: INTCONbits.GIE = 1;
	bsf	(11),7	;volatile
	line	116
;main.c: 116: EEADR = 0x00;
	clrf	(155)^080h	;volatile
	line	117
	
l1551:	
;main.c: 117: EECON1bits.RD = 1;
	bsf	(156)^080h,0	;volatile
	line	118
	
l1553:	
;main.c: 118: GPIO = EEDATA;
	movf	(154)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	124
	
l1555:	
;main.c: 121: {
;main.c: 124: if(dataready )
	movf	(_dataready),w
	skipz
	goto	u560
	goto	l1555
u560:
	goto	l1561
	line	137
;main.c: 136: {
;main.c: 137: case 0x50: GPIObits.GPIO0 = 1;
	
l376:	
	bsf	(5),0	;volatile
	line	138
;main.c: 138: break;
	goto	l1563
	line	139
;main.c: 139: case 0xD8: GPIObits.GPIO1 = 1;
	
l378:	
	bsf	(5),1	;volatile
	line	140
;main.c: 140: break;
	goto	l1563
	line	141
;main.c: 141: case 0xF8: GPIObits.GPIO2 = 1;
	
l379:	
	bsf	(5),2	;volatile
	line	142
;main.c: 142: break;
	goto	l1563
	line	143
;main.c: 143: case 0x30: GPIObits.GPIO4 = 1;
	
l380:	
	bsf	(5),4	;volatile
	line	144
;main.c: 144: break;
	goto	l1563
	line	145
;main.c: 145: case 0xB0: GPIObits.GPIO0 = 0;
	
l381:	
	bcf	(5),0	;volatile
	line	146
;main.c: 146: GPIObits.GPIO1 = 0;
	bcf	(5),1	;volatile
	line	147
;main.c: 147: GPIObits.GPIO2 = 0;
	bcf	(5),2	;volatile
	line	148
;main.c: 148: GPIObits.GPIO4 = 0;
	bcf	(5),4	;volatile
	line	149
;main.c: 149: break;
	goto	l1563
	line	135
	
l1561:	
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
	goto	l380
	xorlw	80^48	; case 80
	skipnz
	goto	l376
	xorlw	176^80	; case 176
	skipnz
	goto	l381
	xorlw	216^176	; case 216
	skipnz
	goto	l378
	xorlw	248^216	; case 248
	skipnz
	goto	l379
	goto	l1563
	opt asmopt_on

	line	154
	
l1563:	
;main.c: 154: EEADR = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(155)^080h	;volatile
	line	155
	
l1565:	
;main.c: 155: EEDATA = GPIO;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	movwf	(154)^080h	;volatile
	line	156
	
l1567:	
;main.c: 156: EECON1bits.WREN = 1;
	bsf	(156)^080h,2	;volatile
	line	157
	
l1569:	
;main.c: 157: INTCONbits.GIE = 0;
	bcf	(11),7	;volatile
	line	158
	
l1571:	
;main.c: 158: EECON2 = 0x55;
	movlw	(055h)
	movwf	(157)^080h	;volatile
	line	159
	
l1573:	
;main.c: 159: EECON2 = 0xAA;
	movlw	(0AAh)
	movwf	(157)^080h	;volatile
	line	160
	
l1575:	
;main.c: 160: EECON1bits.WR = 1;
	bsf	(156)^080h,1	;volatile
	line	161
	
l1577:	
;main.c: 161: INTCONbits.GIE = 1;
	bsf	(11),7	;volatile
	line	163
	
l1579:	
;main.c: 163: dataready=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_dataready)
	goto	l1555
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	169
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
;;		line 78 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
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
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
	line	78
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
	line	79
	
i1l1373:	
;main.c: 79: if(INTCONbits.T0IF)
	btfss	(11),2	;volatile
	goto	u29_21
	goto	u29_20
u29_21:
	goto	i1l367
u29_20:
	line	81
	
i1l1375:	
;main.c: 80: {
;main.c: 81: timerInterruptIsr();
	fcall	_timerInterruptIsr
	line	82
	
i1l1377:	
;main.c: 82: INTCONbits.T0IF =0;
	bcf	(11),2	;volatile
	line	83
;main.c: 83: }
	goto	i1l370
	line	84
	
i1l367:	
;main.c: 84: else if (INTCONbits.GPIF)
	btfss	(11),0	;volatile
	goto	u30_21
	goto	u30_20
u30_21:
	goto	i1l370
u30_20:
	line	86
	
i1l1379:	
;main.c: 85: {
;main.c: 86: GPIObits.GPIO5=1;
	bsf	(5),5	;volatile
	line	87
	
i1l1381:	
;main.c: 87: interruptOnChangeIsr();
	fcall	_interruptOnChangeIsr
	line	88
	
i1l1383:	
;main.c: 88: INTCONbits.GPIF =0;
	bcf	(11),0	;volatile
	line	89
	
i1l1385:	
;main.c: 89: GPIObits.GPIO5=0;
	bcf	(5),5	;volatile
	line	92
	
i1l370:	
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
;;		line 172 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tdiff           3    4[BANK0 ] unsigned um
;;  pin             1    3[BANK0 ] unsigned char 
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
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
	line	172
	global	__size_of_interruptOnChangeIsr
	__size_of_interruptOnChangeIsr	equ	__end_of_interruptOnChangeIsr-_interruptOnChangeIsr
	
_interruptOnChangeIsr:	
	opt	stack 6
; Regs used in _interruptOnChangeIsr: [wreg+status,2+status,0]
	line	179
	
i1l1409:	
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
	
i1l1411:	
;main.c: 181: pin = GPIObits.GPIO3;
	movlw	0
	btfsc	(5),3	;volatile
	movlw	1
	movwf	(interruptOnChangeIsr@pin)
	line	182
;main.c: 182: TMR0 = 0;
	clrf	(1)	;volatile
	line	183
	
i1l1413:	
;main.c: 183: timer = 0;
	clrf	(_timer)
	clrf	(_timer+1)
	clrf	(_timer+2)
	line	215
	
i1l1415:	
;main.c: 215: if ((tdiff>PREPULSE) && (tdiff<TIMEOUT) )
	movf	(_PREPULSE),w
	movwf	((??_interruptOnChangeIsr+0)+0)
	movf	(_PREPULSE+1),w
	movwf	((??_interruptOnChangeIsr+0)+0+1)
	clrf	((??_interruptOnChangeIsr+0)+0+2)
	movf	(interruptOnChangeIsr@tdiff+2),w
	subwf	2+(??_interruptOnChangeIsr+0)+0,w
	skipz
	goto	u35_25
	movf	(interruptOnChangeIsr@tdiff+1),w
	subwf	1+(??_interruptOnChangeIsr+0)+0,w
	skipz
	goto	u35_25
	movf	(interruptOnChangeIsr@tdiff),w
	subwf	0+(??_interruptOnChangeIsr+0)+0,w
u35_25:
	skipnc
	goto	u35_21
	goto	u35_20
u35_21:
	goto	i1l1511
u35_20:
	
i1l1417:	
	movf	(_TIMEOUT),w
	movwf	((??_interruptOnChangeIsr+0)+0)
	movf	(_TIMEOUT+1),w
	movwf	((??_interruptOnChangeIsr+0)+0+1)
	clrf	((??_interruptOnChangeIsr+0)+0+2)
	movf	2+(??_interruptOnChangeIsr+0)+0,w
	subwf	(interruptOnChangeIsr@tdiff+2),w
	skipz
	goto	u36_25
	movf	1+(??_interruptOnChangeIsr+0)+0,w
	subwf	(interruptOnChangeIsr@tdiff+1),w
	skipz
	goto	u36_25
	movf	0+(??_interruptOnChangeIsr+0)+0,w
	subwf	(interruptOnChangeIsr@tdiff),w
u36_25:
	skipnc
	goto	u36_21
	goto	u36_20
u36_21:
	goto	i1l1511
u36_20:
	line	218
	
i1l1419:	
;main.c: 216: {
;main.c: 218: if(necpoj==1 || necpoj==2)
	decf	(_necpoj),w
	skipnz
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l1423
u37_20:
	
i1l1421:	
	movf	(_necpoj),w
	xorlw	02h
	skipz
	goto	u38_21
	goto	u38_20
u38_21:
	goto	i1l1465
u38_20:
	line	221
	
i1l1423:	
;main.c: 219: {
;main.c: 221: if((pin==1) && (necpoj==1))
	decf	(interruptOnChangeIsr@pin),w
	skipz
	goto	u39_21
	goto	u39_20
u39_21:
	goto	i1l1433
u39_20:
	
i1l1425:	
	decf	(_necpoj),w
	skipz
	goto	u40_21
	goto	u40_20
u40_21:
	goto	i1l1433
u40_20:
	line	223
	
i1l1427:	
;main.c: 222: {
;main.c: 223: necpoj++;
	incf	(_necpoj),f
	line	224
	
i1l1429:	
;main.c: 224: TIMEOUT = 5522;
	movlw	low(01592h)
	movwf	(_TIMEOUT)
	movlw	high(01592h)
	movwf	((_TIMEOUT))+1
	line	225
	
i1l1431:	
;main.c: 225: PREPULSE = 2008;
	movlw	low(07D8h)
	movwf	(_PREPULSE)
	movlw	high(07D8h)
	movwf	((_PREPULSE))+1
	line	227
;main.c: 227: }
	goto	i1l416
	line	228
	
i1l1433:	
;main.c: 228: else if((pin==0)&& (necpoj ==2))
	movf	(interruptOnChangeIsr@pin),f
	skipz
	goto	u41_21
	goto	u41_20
u41_21:
	goto	i1l1453
u41_20:
	
i1l1435:	
	movf	(_necpoj),w
	xorlw	02h
	skipz
	goto	u42_21
	goto	u42_20
u42_21:
	goto	i1l1453
u42_20:
	line	230
	
i1l1437:	
;main.c: 229: {
;main.c: 230: if((tdiff>1807)&&(tdiff<3012) )
	movlw	0
	subwf	(interruptOnChangeIsr@tdiff+2),w
	skipz
	goto	u43_25
	movlw	07h
	subwf	(interruptOnChangeIsr@tdiff+1),w
	skipz
	goto	u43_25
	movlw	010h
	subwf	(interruptOnChangeIsr@tdiff),w
u43_25:
	skipc
	goto	u43_21
	goto	u43_20
u43_21:
	goto	i1l1443
u43_20:
	
i1l1439:	
	movlw	0
	subwf	(interruptOnChangeIsr@tdiff+2),w
	skipz
	goto	u44_25
	movlw	0Bh
	subwf	(interruptOnChangeIsr@tdiff+1),w
	skipz
	goto	u44_25
	movlw	0C4h
	subwf	(interruptOnChangeIsr@tdiff),w
u44_25:
	skipnc
	goto	u44_21
	goto	u44_20
u44_21:
	goto	i1l1443
u44_20:
	line	232
	
i1l1441:	
;main.c: 231: {
;main.c: 232: necpoj=70;
	movlw	(046h)
	movwf	(_necpoj)
	line	233
;main.c: 233: TIMEOUT = 852;
	movlw	low(0354h)
	movwf	(_TIMEOUT)
	movlw	high(0354h)
	movwf	((_TIMEOUT))+1
	line	234
;main.c: 234: PREPULSE = 200;
	movlw	0C8h
	movwf	(_PREPULSE)
	clrf	(_PREPULSE+1)
	line	235
;main.c: 235: }else if((tdiff>3012)&&(tdiff<5522) )
	goto	i1l416
	
i1l1443:	
	movlw	0
	subwf	(interruptOnChangeIsr@tdiff+2),w
	skipz
	goto	u45_25
	movlw	0Bh
	subwf	(interruptOnChangeIsr@tdiff+1),w
	skipz
	goto	u45_25
	movlw	0C5h
	subwf	(interruptOnChangeIsr@tdiff),w
u45_25:
	skipc
	goto	u45_21
	goto	u45_20
u45_21:
	goto	i1l1453
u45_20:
	
i1l1445:	
	movlw	0
	subwf	(interruptOnChangeIsr@tdiff+2),w
	skipz
	goto	u46_25
	movlw	015h
	subwf	(interruptOnChangeIsr@tdiff+1),w
	skipz
	goto	u46_25
	movlw	092h
	subwf	(interruptOnChangeIsr@tdiff),w
u46_25:
	skipnc
	goto	u46_21
	goto	u46_20
u46_21:
	goto	i1l1453
u46_20:
	line	237
	
i1l1447:	
;main.c: 236: {
;main.c: 237: necpoj++;
	incf	(_necpoj),f
	line	239
	
i1l1449:	
;main.c: 239: TIMEOUT = 2309;
	movlw	low(0905h)
	movwf	(_TIMEOUT)
	movlw	high(0905h)
	movwf	((_TIMEOUT))+1
	line	240
	
i1l1451:	
;main.c: 240: PREPULSE = 200;
	movlw	0C8h
	movwf	(_PREPULSE)
	clrf	(_PREPULSE+1)
	line	241
;main.c: 241: }else{
	goto	i1l416
	line	242
	
i1l1453:	
;main.c: 242: necpoj = 0;
	clrf	(_necpoj)
	line	243
	
i1l1455:	
;main.c: 243: TIMEOUT = 11044;
	movlw	low(02B24h)
	movwf	(_TIMEOUT)
	movlw	high(02B24h)
	movwf	((_TIMEOUT))+1
	line	244
	
i1l1457:	
;main.c: 244: PREPULSE = 8032;
	movlw	low(01F60h)
	movwf	(_PREPULSE)
	movlw	high(01F60h)
	movwf	((_PREPULSE))+1
	goto	i1l416
	line	255
	
i1l1465:	
;main.c: 255: else if(necpoj>2 && necpoj<70)
	movlw	(03h)
	subwf	(_necpoj),w
	skipc
	goto	u47_21
	goto	u47_20
u47_21:
	goto	i1l1499
u47_20:
	
i1l1467:	
	movlw	(046h)
	subwf	(_necpoj),w
	skipnc
	goto	u48_21
	goto	u48_20
u48_21:
	goto	i1l1499
u48_20:
	line	258
	
i1l1469:	
;main.c: 256: {
;main.c: 258: necpoj++;
	incf	(_necpoj),f
	line	260
	
i1l1471:	
;main.c: 260: if(necpoj&0x01)
	btfss	(_necpoj),(0)&7
	goto	u49_21
	goto	u49_20
u49_21:
	goto	i1l1479
u49_20:
	line	263
	
i1l1473:	
;main.c: 262: {
;main.c: 263: rxbuffer=rxbuffer<<1;
	clrc
	rlf	(interruptOnChangeIsr@rxbuffer),f
	rlf	(interruptOnChangeIsr@rxbuffer+1),f
	rlf	(interruptOnChangeIsr@rxbuffer+2),f
	rlf	(interruptOnChangeIsr@rxbuffer+3),f
	line	264
	
i1l1475:	
;main.c: 264: if(tdiff>1250)
	movlw	0
	subwf	(interruptOnChangeIsr@tdiff+2),w
	skipz
	goto	u50_25
	movlw	04h
	subwf	(interruptOnChangeIsr@tdiff+1),w
	skipz
	goto	u50_25
	movlw	0E3h
	subwf	(interruptOnChangeIsr@tdiff),w
u50_25:
	skipc
	goto	u50_21
	goto	u50_20
u50_21:
	goto	i1l1479
u50_20:
	line	267
	
i1l1477:	
;main.c: 266: {
;main.c: 267: rxbuffer = rxbuffer | 0x1;
	bsf	(interruptOnChangeIsr@rxbuffer)+(0/8),(0)&7
	line	276
;main.c: 268: }
	
i1l1479:	
;main.c: 272: }
;main.c: 274: }
;main.c: 276: if(necpoj >66)
	movlw	(043h)
	subwf	(_necpoj),w
	skipc
	goto	u51_21
	goto	u51_20
u51_21:
	goto	i1l402
u51_20:
	line	279
	
i1l1481:	
;main.c: 277: {
;main.c: 279: address = (rxbuffer>>24)& 0xFF;
	movf	0+(((interruptOnChangeIsr@rxbuffer))+3),w
	movwf	(_address)
	line	280
;main.c: 280: notaddress = (rxbuffer>>16)& 0xFF;
	movf	0+(((interruptOnChangeIsr@rxbuffer))+2),w
	movwf	(_notaddress)
	line	281
;main.c: 281: command = (rxbuffer>>8) & 0xFF;
	movf	0+(((interruptOnChangeIsr@rxbuffer))+1),w
	movwf	(_command)
	line	282
;main.c: 282: notcommand = (rxbuffer) & 0xFF;
	movf	(interruptOnChangeIsr@rxbuffer),w
	movwf	(_notcommand)
	line	283
	
i1l1483:	
;main.c: 283: rxbuffer=0;
	clrf	(interruptOnChangeIsr@rxbuffer)
	clrf	(interruptOnChangeIsr@rxbuffer+1)
	clrf	(interruptOnChangeIsr@rxbuffer+2)
	clrf	(interruptOnChangeIsr@rxbuffer+3)
	line	285
	
i1l1485:	
;main.c: 285: if((!(address & notaddress)) && (!(command & notcommand)))
	movf	(_address),w
	andwf	(_notaddress),w
	btfss	status,2
	goto	u52_21
	goto	u52_20
u52_21:
	goto	i1l1493
u52_20:
	
i1l1487:	
	movf	(_command),w
	andwf	(_notcommand),w
	btfss	status,2
	goto	u53_21
	goto	u53_20
u53_21:
	goto	i1l1493
u53_20:
	line	287
	
i1l1489:	
;main.c: 286: {
;main.c: 287: dataready =1;
	clrf	(_dataready)
	incf	(_dataready),f
	line	288
	
i1l1491:	
;main.c: 288: momantary= 450;
	movlw	low(01C2h)
	movwf	(_momantary)
	movlw	high(01C2h)
	movwf	((_momantary))+1
	line	289
;main.c: 289: }
	goto	i1l1495
	line	292
	
i1l1493:	
;main.c: 290: else
;main.c: 291: {
;main.c: 292: dataready=0;
	clrf	(_dataready)
	line	293
;main.c: 293: momantary= 0;
	clrf	(_momantary)
	clrf	(_momantary+1)
	line	295
	
i1l1495:	
;main.c: 294: }
;main.c: 295: TIMEOUT = 11044;
	movlw	low(02B24h)
	movwf	(_TIMEOUT)
	movlw	high(02B24h)
	movwf	((_TIMEOUT))+1
	line	296
	
i1l1497:	
;main.c: 296: PREPULSE = 8032;
	movlw	low(01F60h)
	movwf	(_PREPULSE)
	movlw	high(01F60h)
	movwf	((_PREPULSE))+1
	line	297
;main.c: 297: necpoj=0;
	clrf	(_necpoj)
	goto	i1l416
	line	300
	
i1l1499:	
	movf	(_necpoj),w
	xorlw	046h
	skipz
	goto	u54_21
	goto	u54_20
u54_21:
	goto	i1l1509
u54_20:
	line	302
	
i1l1501:	
;main.c: 301: {
;main.c: 302: momantary= 440;
	movlw	low(01B8h)
	movwf	(_momantary)
	movlw	high(01B8h)
	movwf	((_momantary))+1
	goto	i1l1453
	line	314
	
i1l1509:	
;main.c: 311: else
;main.c: 312: {
;main.c: 314: TIMEOUT = 11044;
	movlw	low(02B24h)
	movwf	(_TIMEOUT)
	movlw	high(02B24h)
	movwf	((_TIMEOUT))+1
	line	315
;main.c: 315: PREPULSE = 8032;
	movlw	low(01F60h)
	movwf	(_PREPULSE)
	movlw	high(01F60h)
	movwf	((_PREPULSE))+1
	goto	i1l416
	line	316
	
i1l402:	
	line	321
;main.c: 316: }
;main.c: 321: }
	goto	i1l416
	line	325
	
i1l1511:	
;main.c: 322: else
;main.c: 323: {
;main.c: 325: if(pin==0)
	movf	(interruptOnChangeIsr@pin),f
	skipz
	goto	u55_21
	goto	u55_20
u55_21:
	goto	i1l1515
u55_20:
	line	327
	
i1l1513:	
;main.c: 326: {
;main.c: 327: necpoj = 1;
	clrf	(_necpoj)
	incf	(_necpoj),f
	line	328
;main.c: 328: }
	goto	i1l1517
	line	331
	
i1l1515:	
;main.c: 329: else
;main.c: 330: {
;main.c: 331: necpoj = 0;
	clrf	(_necpoj)
	line	334
	
i1l1517:	
;main.c: 332: }
;main.c: 334: address = 0xFF;
	movlw	(0FFh)
	movwf	(_address)
	line	335
	
i1l1519:	
;main.c: 335: notaddress = 0xFF;
	movlw	(0FFh)
	movwf	(_notaddress)
	line	336
	
i1l1521:	
;main.c: 336: command = 0xFF;
	movlw	(0FFh)
	movwf	(_command)
	line	337
	
i1l1523:	
;main.c: 337: notcommand = 0xFF;
	movlw	(0FFh)
	movwf	(_notcommand)
	line	338
;main.c: 338: dataready = 0x000;
	clrf	(_dataready)
	goto	i1l1455
	line	343
	
i1l416:	
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
;;		line 346 in file "C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
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
	file	"C:\Users\Gaurav\Documents\GitHub\IR-Remote-Control\New folder\main.c"
	line	346
	global	__size_of_timerInterruptIsr
	__size_of_timerInterruptIsr	equ	__end_of_timerInterruptIsr-_timerInterruptIsr
	
_timerInterruptIsr:	
	opt	stack 6
; Regs used in _timerInterruptIsr: [wreg+status,2+status,0]
	line	348
	
i1l1387:	
;main.c: 347: static char ms_counter,flag;
;main.c: 348: if(timer<0xFFFF)
	movlw	0
	subwf	(_timer+2),w
	skipz
	goto	u31_25
	movlw	0FFh
	subwf	(_timer+1),w
	skipz
	goto	u31_25
	movlw	0FFh
	subwf	(_timer),w
u31_25:
	skipnc
	goto	u31_21
	goto	u31_20
u31_21:
	goto	i1l423
u31_20:
	line	349
	
i1l1389:	
;main.c: 349: timer++;
	incf	(_timer),f
	skipnz
	incf	(_timer+1),f
	skipnz
	incf	(_timer+2),f
	
i1l423:	
	line	351
;main.c: 351: ms_counter++;
	incf	(timerInterruptIsr@ms_counter),f
	line	352
	
i1l1391:	
;main.c: 352: if(ms_counter==4)
	movf	(timerInterruptIsr@ms_counter),w
	xorlw	04h
	skipz
	goto	u32_21
	goto	u32_20
u32_21:
	goto	i1l428
u32_20:
	line	354
	
i1l1393:	
;main.c: 353: {
;main.c: 354: ms_counter=0;
	clrf	(timerInterruptIsr@ms_counter)
	line	355
	
i1l1395:	
;main.c: 355: if(momantary){
	movf	(_momantary+1),w
	iorwf	(_momantary),w
	skipnz
	goto	u33_21
	goto	u33_20
u33_21:
	goto	i1l1401
u33_20:
	line	356
	
i1l1397:	
;main.c: 356: momantary--;
	movlw	low(01h)
	subwf	(_momantary),f
	movlw	high(01h)
	skipc
	decf	(_momantary+1),f
	subwf	(_momantary+1),f
	line	357
	
i1l1399:	
;main.c: 357: flag =1;
	clrf	(timerInterruptIsr@flag)
	incf	(timerInterruptIsr@flag),f
	line	358
;main.c: 358: }else if(flag)
	goto	i1l428
	
i1l1401:	
	movf	(timerInterruptIsr@flag),w
	skipz
	goto	u34_20
	goto	i1l428
u34_20:
	line	360
	
i1l1403:	
;main.c: 359: {
;main.c: 360: dataready=1;
	clrf	(_dataready)
	incf	(_dataready),f
	line	361
	
i1l1405:	
;main.c: 361: flag=0;
	clrf	(timerInterruptIsr@flag)
	line	362
	
i1l1407:	
;main.c: 362: command = 0xB0;
	movlw	(0B0h)
	movwf	(_command)
	line	365
	
i1l428:	
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
