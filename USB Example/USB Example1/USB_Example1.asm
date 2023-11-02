
_interrupt:

;USB_Example1.c,6 :: 		void interrupt()
;USB_Example1.c,8 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;USB_Example1.c,9 :: 		}
L_end_interrupt:
L__interrupt10:
	RETFIE      1
; end of _interrupt

_main:

;USB_Example1.c,11 :: 		void main(void){
;USB_Example1.c,13 :: 		HID_Enable(&readbuff,&writebuff);       // Enable HID communication
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;USB_Example1.c,15 :: 		while(1)
L_main0:
;USB_Example1.c,17 :: 		while(!HID_Read());
L_main2:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;USB_Example1.c,18 :: 		for(count=0;count<64;count++)
	CLRF        _count+0 
L_main4:
	MOVLW       64
	SUBWF       _count+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main5
;USB_Example1.c,20 :: 		writebuff[count]=readbuff[count];
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
;USB_Example1.c,21 :: 		while(!HID_Write(&writebuff,64));
L_main7:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
	GOTO        L_main7
L_main8:
;USB_Example1.c,18 :: 		for(count=0;count<64;count++)
	INCF        _count+0, 1 
;USB_Example1.c,22 :: 		}
	GOTO        L_main4
L_main5:
;USB_Example1.c,23 :: 		}
	GOTO        L_main0
;USB_Example1.c,25 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
