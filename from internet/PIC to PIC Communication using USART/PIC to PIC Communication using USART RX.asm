
_main:

;PIC to PIC Communication using USART RX.c,2 :: 		void main()
;PIC to PIC Communication using USART RX.c,4 :: 		TRISB = 0;
	CLRF       TRISB+0
;PIC to PIC Communication using USART RX.c,5 :: 		PORTB = 0;
	CLRF       PORTB+0
;PIC to PIC Communication using USART RX.c,6 :: 		UART1_Init(9600); // Initialize UART module at 9600bps
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;PIC to PIC Communication using USART RX.c,7 :: 		Delay_ms(100); // Wait for UART module to stabilize
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
;PIC to PIC Communication using USART RX.c,8 :: 		while (1)
L_main1:
;PIC to PIC Communication using USART RX.c,10 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;PIC to PIC Communication using USART RX.c,12 :: 		PORTB = UART1_Read(); // read the received data,
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;PIC to PIC Communication using USART RX.c,14 :: 		}
L_main3:
;PIC to PIC Communication using USART RX.c,15 :: 		}
	GOTO       L_main1
;PIC to PIC Communication using USART RX.c,16 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
