
_interrupt:

;USB_Example4.c,7 :: 		void interrupt()
;USB_Example4.c,9 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;USB_Example4.c,10 :: 		}
L_end_interrupt:
L__interrupt15:
	RETFIE      1
; end of _interrupt

_main:

;USB_Example4.c,13 :: 		void main(void){
;USB_Example4.c,14 :: 		trisd=0x00;
	CLRF        TRISD+0 
;USB_Example4.c,15 :: 		trisb=0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;USB_Example4.c,16 :: 		HID_Enable(&readbuff,&writebuff);       // Enable HID communication
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;USB_Example4.c,18 :: 		while(1)
L_main0:
;USB_Example4.c,22 :: 		while(!HID_Read());
L_main2:
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	GOTO        L_main2
L_main3:
;USB_Example4.c,27 :: 		if(strncmp(readbuff,"PortD=?",6) == 0)
	MOVLW       _readbuff+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       ?lstr1_USB_Example4+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(?lstr1_USB_Example4+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       6
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main17
	MOVLW       0
	XORWF       R0, 0 
L__main17:
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;USB_Example4.c,29 :: 		bytetostr(PortD,writebuff);
	MOVF        PORTD+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _writebuff+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;USB_Example4.c,33 :: 		HID_Write(&writebuff,64);
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
;USB_Example4.c,34 :: 		}
L_main4:
;USB_Example4.c,35 :: 		if(readbuff[1]==0x82)
	MOVF        1281, 0 
	XORLW       130
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;USB_Example4.c,37 :: 		writebuff[1]=1;
	MOVLW       1
	MOVWF       1345 
;USB_Example4.c,38 :: 		HID_Write(&writebuff,64);
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
;USB_Example4.c,39 :: 		}
L_main5:
;USB_Example4.c,41 :: 		if(strncmp(readbuff,"A=1",3) == 0)
	MOVLW       _readbuff+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       ?lstr2_USB_Example4+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(?lstr2_USB_Example4+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       3
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main18
	MOVLW       0
	XORWF       R0, 0 
L__main18:
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;USB_Example4.c,44 :: 		PortD.f0=1;
	BSF         PORTD+0, 0 
;USB_Example4.c,47 :: 		}
L_main6:
;USB_Example4.c,48 :: 		if(strncmp(readbuff,"A=0",3) == 0)
	MOVLW       _readbuff+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       ?lstr3_USB_Example4+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(?lstr3_USB_Example4+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       3
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       0
	XORWF       R0, 0 
L__main19:
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;USB_Example4.c,51 :: 		PortD.f0=0;
	BCF         PORTD+0, 0 
;USB_Example4.c,54 :: 		}
L_main7:
;USB_Example4.c,55 :: 		if(strncmp(readbuff,"B=1",3) == 0)
	MOVLW       _readbuff+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       ?lstr4_USB_Example4+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(?lstr4_USB_Example4+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       3
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
	MOVLW       0
	XORWF       R0, 0 
L__main20:
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;USB_Example4.c,58 :: 		PortD.f1=1;
	BSF         PORTD+0, 1 
;USB_Example4.c,61 :: 		}
L_main8:
;USB_Example4.c,62 :: 		if(strncmp(readbuff,"B=0",3) == 0)
	MOVLW       _readbuff+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       ?lstr5_USB_Example4+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(?lstr5_USB_Example4+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       3
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVLW       0
	XORWF       R0, 0 
L__main21:
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;USB_Example4.c,65 :: 		PortD.f1=0;
	BCF         PORTD+0, 1 
;USB_Example4.c,68 :: 		}
L_main9:
;USB_Example4.c,69 :: 		if(strncmp(readbuff,"C=1",3) == 0)
	MOVLW       _readbuff+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       ?lstr6_USB_Example4+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(?lstr6_USB_Example4+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       3
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main22
	MOVLW       0
	XORWF       R0, 0 
L__main22:
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;USB_Example4.c,72 :: 		PortD.f3=1;
	BSF         PORTD+0, 3 
;USB_Example4.c,75 :: 		}
L_main10:
;USB_Example4.c,76 :: 		if(strncmp(readbuff,"C=0",3) == 0)
	MOVLW       _readbuff+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       ?lstr7_USB_Example4+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(?lstr7_USB_Example4+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       3
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main23
	MOVLW       0
	XORWF       R0, 0 
L__main23:
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;USB_Example4.c,79 :: 		PortD.f3=0;
	BCF         PORTD+0, 3 
;USB_Example4.c,82 :: 		}
L_main11:
;USB_Example4.c,83 :: 		if(strncmp(readbuff,"D=1",3) == 0)
	MOVLW       _readbuff+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       ?lstr8_USB_Example4+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(?lstr8_USB_Example4+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       3
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
	MOVLW       0
	XORWF       R0, 0 
L__main24:
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;USB_Example4.c,86 :: 		PortD.f3=1;
	BSF         PORTD+0, 3 
;USB_Example4.c,89 :: 		}
L_main12:
;USB_Example4.c,90 :: 		if(strncmp(readbuff,"D=0",3) == 0)
	MOVLW       _readbuff+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       ?lstr9_USB_Example4+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(?lstr9_USB_Example4+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       3
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main25
	MOVLW       0
	XORWF       R0, 0 
L__main25:
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;USB_Example4.c,93 :: 		PortD.f3=0;
	BCF         PORTD+0, 3 
;USB_Example4.c,96 :: 		}
L_main13:
;USB_Example4.c,102 :: 		}    }
	GOTO        L_main0
L_end_main:
	GOTO        $+0
; end of _main
