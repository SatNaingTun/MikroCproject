
_interrupt:

;USBExample3.c,6 :: 		void interrupt()
;USBExample3.c,8 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;USBExample3.c,9 :: 		}
L_end_interrupt:
L__interrupt9:
	RETFIE      1
; end of _interrupt

_main:

;USBExample3.c,11 :: 		void main(void){
;USBExample3.c,13 :: 		HID_Enable(&readbuff,&writebuff);       // Enable HID communication
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;USBExample3.c,15 :: 		while(1)
L_main0:
;USBExample3.c,19 :: 		while(!HID_Read());
L_main2:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;USBExample3.c,22 :: 		writebuff[count]=readbuff[count];
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
;USBExample3.c,23 :: 		while(!HID_Write(&writebuff,64));
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
;USBExample3.c,25 :: 		if(strncmp(readbuff,"A",1) == 0)
	MOVLW       _readbuff+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       ?lstr1_USBExample3+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(?lstr1_USBExample3+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       1
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main11
	MOVLW       0
	XORWF       R0, 0 
L__main11:
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;USBExample3.c,27 :: 		HID_Write("Sucess",64);
	MOVLW       ?lstr2_USBExample3+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(?lstr2_USBExample3+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
;USBExample3.c,28 :: 		}else
	GOTO        L_main7
L_main6:
;USBExample3.c,30 :: 		HID_Write("Fail",64);
	MOVLW       ?lstr3_USBExample3+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(?lstr3_USBExample3+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
;USBExample3.c,31 :: 		}
L_main7:
;USBExample3.c,35 :: 		}    }
	GOTO        L_main0
L_end_main:
	GOTO        $+0
; end of _main
