
_main:

;PIC to PIC Communication using USART TX.c,2 :: 		void main()
;PIC to PIC Communication using USART TX.c,4 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;PIC to PIC Communication using USART TX.c,5 :: 		PORTB = 0;
	CLRF       PORTB+0
;PIC to PIC Communication using USART TX.c,6 :: 		UART1_Init(9600); // Initialize UART module at 9600bps
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;PIC to PIC Communication using USART TX.c,7 :: 		Delay_ms(100); // Wait for UART module to stabilize
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;PIC to PIC Communication using USART TX.c,8 :: 		while (1)
L_main1:
;PIC to PIC Communication using USART TX.c,10 :: 		UART1_Write(PORTB); // and send data via UART
	MOVF       PORTB+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PIC to PIC Communication using USART TX.c,11 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;PIC to PIC Communication using USART TX.c,12 :: 		}
	GOTO       L_main1
;PIC to PIC Communication using USART TX.c,13 :: 		}
	GOTO       $+0
; end of _main
