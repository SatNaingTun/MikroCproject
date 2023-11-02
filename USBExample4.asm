
_interrupt:

;USBExample4.c,7 :: 		void interrupt()
;USBExample4.c,9 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;USBExample4.c,10 :: 		}
L_end_interrupt:
L__interrupt11:
	RETFIE      1
; end of _interrupt

_main:

;USBExample4.c,13 :: 		void main(void){
;USBExample4.c,14 :: 		trisd=0x00;
	CLRF        TRISD+0 
;USBExample4.c,15 :: 		trisb=0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;USBExample4.c,16 :: 		HID_Enable(&readbuff,&writebuff);       // Enable HID communication
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;USBExample4.c,18 :: 		while(1)
L_main0:
;USBExample4.c,22 :: 		while(!HID_Read());
L_main2:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;USBExample4.c,25 :: 		writebuff[count]=readbuff[count];
	MOVLW       _writebuff+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FSR1H 
	MOVF        _count+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _readbuff+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FSR0H 
	MOVF        _count+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;USBExample4.c,26 :: 		while(!HID_Write(&writebuff,64));
L_main4:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
	GOTO        L_main4
L_main5:
;USBExample4.c,28 :: 		if(strncmp(readbuff,"A",1) == 0)
	MOVLW       _readbuff+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       ?lstr1_USBExample4+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(?lstr1_USBExample4+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       1
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main13
	MOVLW       0
	XORWF       R0, 0 
L__main13:
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;USBExample4.c,30 :: 		HID_Write("Sucess",64);
	MOVLW       ?lstr2_USBExample4+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(?lstr2_USBExample4+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
;USBExample4.c,32 :: 		}else
	GOTO        L_main7
L_main6:
;USBExample4.c,34 :: 		HID_Write("Fail",64);
	MOVLW       ?lstr3_USBExample4+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(?lstr3_USBExample4+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
;USBExample4.c,37 :: 		}
L_main7:
;USBExample4.c,39 :: 		if(portb.f4 == 0){HID_Write("First Button Pressed",64);}
	BTFSC       PORTB+0, 4 
	GOTO        L_main8
	MOVLW       ?lstr4_USBExample4+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(?lstr4_USBExample4+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
L_main8:
;USBExample4.c,40 :: 		if(portb.f5 == 0){HID_Write("Second Button Pressed",64);}
	BTFSC       PORTB+0, 5 
	GOTO        L_main9
	MOVLW       ?lstr5_USBExample4+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(?lstr5_USBExample4+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
L_main9:
;USBExample4.c,43 :: 		}    }
	GOTO        L_main0
L_end_main:
	GOTO        $+0
; end of _main
