
_main:

;RS232Example.c,3 :: 		void main() {
;RS232Example.c,6 :: 		TRISD=0X00;
	CLRF       TRISD+0
;RS232Example.c,7 :: 		PORTD=0;
	CLRF       PORTD+0
;RS232Example.c,8 :: 		TRISB=0x00;
	CLRF       TRISB+0
;RS232Example.c,9 :: 		PORTB=0;
	CLRF       PORTB+0
;RS232Example.c,16 :: 		UART1_Init(9600); // Initialize USART module
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;RS232Example.c,17 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;RS232Example.c,18 :: 		UART1_Write_Text("Start RS232Test \r\n");
	MOVLW      ?lstr1_RS232Example+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;RS232Example.c,19 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
;RS232Example.c,22 :: 		while (1) {
L_main2:
;RS232Example.c,25 :: 		if (UART1_Data_Ready()) { // If data has been received
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;RS232Example.c,26 :: 		UART1_Read_Text(output, "\n", 10); // reads text until 'OK' is found
	MOVLW      _output+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr2_RS232Example+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      10
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;RS232Example.c,28 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;RS232Example.c,29 :: 		UART1_Write_Text(output);             // sends back text
	MOVLW      _output+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;RS232Example.c,30 :: 		if(strncmp(output,"OK",6) == 0)
	MOVLW      _output+0
	MOVWF      FARG_strncmp_s1+0
	MOVLW      ?lstr3_RS232Example+0
	MOVWF      FARG_strncmp_s2+0
	MOVLW      6
	MOVWF      FARG_strncmp_len+0
	CALL       _strncmp+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      0
	XORWF      R0+0, 0
L__main11:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;RS232Example.c,32 :: 		portb=1;
	MOVLW      1
	MOVWF      PORTB+0
;RS232Example.c,33 :: 		portd=0;
	CLRF       PORTD+0
;RS232Example.c,34 :: 		delay_ms(10000);
	MOVLW      254
	MOVWF      R11+0
	MOVLW      167
	MOVWF      R12+0
	MOVLW      101
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;RS232Example.c,35 :: 		}
	GOTO       L_main8
L_main6:
;RS232Example.c,38 :: 		portb=0;
	CLRF       PORTB+0
;RS232Example.c,39 :: 		portd=1;
	MOVLW      1
	MOVWF      PORTD+0
;RS232Example.c,40 :: 		delay_ms(10000);
	MOVLW      254
	MOVWF      R11+0
	MOVLW      167
	MOVWF      R12+0
	MOVLW      101
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;RS232Example.c,41 :: 		}
L_main8:
;RS232Example.c,42 :: 		}
L_main4:
;RS232Example.c,72 :: 		}//end while
	GOTO       L_main2
;RS232Example.c,73 :: 		}//end main
L_end_main:
	GOTO       $+0
; end of _main
