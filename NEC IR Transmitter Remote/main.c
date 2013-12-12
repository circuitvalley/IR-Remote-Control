/* 
 * File:   main.c
 * Author: Gaurav
 * copy right : www.circuitvalley.com 
 * Created on September 4, 2013, 11:37 PM
 */

#include <htc.h>

__CONFIG(FOSC_INTOSCIO & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & IOSCFS_8MHZ & BOREN_NSLEEP);

#define _XTAL_FREQ 8000000			// required for delay Routines. 
/*
 * 
 */

#define IR_LED 	GPIObits.GPIO2		//IR LED is conntected to this port
	
#define KEY_1	GPIObits.GPIO0		//Switces pin definition 
#define KEY_2	GPIObits.GPIO1
#define KEY_3	GPIObits.GPIO3
#define KEY_4	GPIObits.GPIO4
#define KEY_5	GPIObits.GPIO5

#define ADDRESS 0x01				//NEC protocol address for the Data Frame (MSB first)
									//if you are planning to use this with http://www.circuitvalley.com/2012/09/infrared-ir-nec-microcontroller-pic-avr.html IR realy borad then this field can be any thing because the Receiver does't look for this. 
									//if you are planning to use the remote with some other target then please put the address here is MSB first order
									//you can have different address for different keys. please modify the GPIO interrrupt on change routine. 

#define DATA_KEY_1	0xF8			//Data For KEY_1 (MSB first)
#define DATA_KEY_2	0x50			//Data For KEY_2 (MSB first)
#define DATA_KEY_3	0xD8			//Data For KEY_3 (MSB first)
#define DATA_KEY_4	0xB0			//Data For KEY_4 (MSB first)
#define DATA_KEY_5	0x30			//Data For KEY_5 (MSB first)

void sendFrame(unsigned char , unsigned char );		//sendFrame(address,data) sends the whole IR frame
void sendByte(unsigned char );						//sendByte(byte) this function is used by the sendFrame to send 4 indivisual btyes
													//SHOULD NOT BE CALL FROM ANY WERE ELSE except the sendFrame Function.
void sendRepeate();									//Sends the Repeate Code after Message Frame.				

void interrupt swInt(void)		
{	
   
	 if (INTCONbits.GPIF)					// check the interrupt on change flag
	{	
		__delay_ms(2);						//check for key debounce			
	
		if(!KEY_1)							//check if the Key_1 is pressed (gpio is low)
		{
			sendFrame(ADDRESS,DATA_KEY_1);	//send the frame
	 		while(!KEY_1)					//if the key is still pressed 
			{
			sendRepeate();					//send Repeate codes. 
			}	
		}else if(!KEY_2)					//check if the Key_2 is pressed
		{
			sendFrame(ADDRESS,DATA_KEY_2);	//send the frame
			while(!KEY_2)					//if the key is still pressed 
			{
			sendRepeate();					//send Repeate codes.
			}
		}else if(!KEY_3)					//check if the Key_3 is pressed
		{
			sendFrame(ADDRESS,DATA_KEY_3);	//send the frame
			while(!KEY_3)					//if the key is still pressed 	
			{
			sendRepeate();					//send Repeate codes.
			}
		}else if(!KEY_4)					//check if the Key_4 is pressed
		{
			sendFrame(ADDRESS,DATA_KEY_4);	//send the frame
			while(!KEY_4)					//if the key is still pressed 	
			{
			sendRepeate();					//send Repeate codes.	
			}
		}else if(!KEY_5)					//check if the Key_5 is pressed
		{
			sendFrame(ADDRESS,DATA_KEY_5);	//send the frame
			while(!KEY_5)					//if the key is still pressed 
			{
			sendRepeate();					//send Repeate codes.
			}
		}
		KEY_1;								//this is requited to end the mismatch condition 
		INTCONbits.GPIF =0;					// clear the interrupt on chage flag
	}
}


void main()
{
	CMCON0bits.CMON	=0;		// disable the comparator 
    ANSEL		= 0x00;		// all pin are Digital
    TRISIO		= 0x3B; 	// Only GP2 is set to output rest are input
	OPTION_REG 	= 0x5F;		//pullups are enabled	
							//timer0 clock source is internal
							//timer0 perscaller is 1:1 (disabled "assigned to WDT")

	WPU 	= 0x3B;			//week pullups are enabled for all switches.
	GPIO 	= 0x3B;			//put hight to the latch value of each gpio
	T2CON 	= 0x04;			// prescaler 1:1 (Timer2 is required BY the ECCP module to generate 38Khz Frequency) 
							// Timer2 is on	
							// postscaller 1:1
			
	CCPR1L			= 0x1A;	//CCP module comprison resistor to set 50% duty for 38KHz signal
	PR2 			= 51;	//CCP module period register to generate 38Khz signal
	CCP1CON 		= 0x20;	//set Two LSB of PWM Duty 8MSB are in CCPR1L the module will turned on later 
	IOC 			= 0x3B; //interrupt on change is assigne to all the port pin.
	INTCONbits.GPIE = 1;	// external interrupt on GPIO3 pin(4) is enabled
	INTCONbits.GPIF = 0;	// clear the external interrrupt flag	
	INTCONbits.PEIE = 1;    // peripheral intrrupt enable
    INTCONbits.GIE 	= 1;    // GLOBL interrupt enable
	while(1)
	{
		SLEEP();			//put the MCU into Sleep mode forever , will wake-up when ever any key press is detected. 
							// the measured current consumption in this mode is ~ 29na ( much lower then the datasheet claim 50na)
	}
}

void sendFrame(unsigned char address, unsigned char command) // this routine send the whole frame including 9ms leading pulse 4.5ms space address ~address command ~command end of message bit.
{	
	TMR2 = 0x00;					//clear the TMR2 register before we start generating 38Khz Signal on the GPIO
	CCP1CONbits.CCP1M = 0xC;		//put The CCP module into PWM mode , the Duty is 50% and freqeucny is 38Khz as allredy set, 
	__delay_us(8999);				//wait for ~9ms this rountine will delay for 8.999 ms + (3*500ns) = ~9ms (500ns is the instruction execution time at 8Mhz) and next instruciton will take 3 ins cycle to execute.
	CCP1CONbits.CCP1M = 0x0;		//turn off the CCP module stop generating 38Khz singal
	__delay_us(4490);				//wait for ~4.5ms  the value 4490 is compensated with the next instrucitons execution timing , it helps to keep precise timing. as described avobe
	
	sendByte(address);				//send address byte. (sendByte functions should not be called independently, only sendFrame should call it)
	sendByte(~address);				//send address logical invert 
	sendByte(command);				//send command
	sendByte(~command);				//send command logical invert
	
									//addres and command is sent now send the end of message bit
	TMR2 = 0x00;					//clear the TMR2 register before we start generating 38Khz Signal on the GPIO
	CCP1CONbits.CCP1M = 0xC;		//Start generating 38Khz singal
	__delay_us(561);				//wait for ~562.5us again value 561 is compensated with the next instrucitons timing
	CCP1CONbits.CCP1M = 0x0;		//stop generating 38Khz singal.
	__delay_ms(40);					// wait for the Data Frame time. 
}

void sendByte(unsigned char byte)	// this function is called only by the sendFrame , to send each byte of data total 4bytes.
{
	unsigned char i;				//variable to hold the counter vlaue
	for(i=8 ;i>0;i--)				//loop to send 8 individual bits.
	{	
		TMR2 = 0x00;				//clear the TMR2 register before we start generating 38Khz Signal on the GPIO
		CCP1CONbits.CCP1M=0xC;		//Start generating 38Khz singal
		__delay_us(561);			//wait for ~562.5us again value 561 is compensated with the next instrucitons timing
		CCP1CONbits.CCP1M=0x0;		//stop generating 38Khz singal
			
		if(byte & 0x80)				// as you have already noticed , this is example we send MSB first order. 
		{							// check for MSB bit if it is 1 then delay for 1.6875ms if it is zero then delay for 562.5us
		__delay_us(1686);			//delay for ~1.6875 ms again value 1686 is compensated with the next instrucitons timing
		}
		else
		{
		__delay_us(558);			//wait for ~562.5us again value 558 is compensated with the next instrucitons timing
		}
		byte = byte <<1;			//get the next lsb into msb (shift left the byte)
	}	
}

void sendRepeate()
{
	TMR2 = 0x00;					//clear the TMR2 register before we start generating 38Khz Signal on the GPIO
	CCP1CONbits.CCP1M = 0xC;		//Start generating 38Khz singal
	__delay_us(8999);				//wait for ~9ms 	
	CCP1CONbits.CCP1M = 0x0;		//stop generating 38Khz singal
	__delay_us(2245);				//wait for 2.25ms

	TMR2 = 0x00;					//clear the TMR2 register before we start generating 38Khz Signal on the GPIO
	CCP1CONbits.CCP1M = 0xC;		//Start generating 38Khz singal
	__delay_us(556);				//wait for ~562.5us
	CCP1CONbits.CCP1M = 0x0;		//stop generating 38Khz singal	
	__delay_us(96187);				//delay for 96.187 ms before sending the next repeate code
	
}