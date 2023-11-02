
_main:

;InterruptExample.c,1 :: 		void main()
;InterruptExample.c,3 :: 		TRISB=0x01;
	MOVLW       1
	MOVWF       TRISB+0 
;InterruptExample.c,4 :: 		INT0IF_bit=0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;InterruptExample.c,5 :: 		INT0IE_bit=1;
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;InterruptExample.c,6 :: 		GIE_bit=1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;InterruptExample.c,7 :: 		INTEDG0_bit=1;
	BSF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;InterruptExample.c,9 :: 		while(1)
L_main0:
;InterruptExample.c,11 :: 		LATB.F7=0;
	BCF         LATB+0, 7 
;InterruptExample.c,12 :: 		}
	GOTO        L_main0
;InterruptExample.c,13 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;InterruptExample.c,14 :: 		void interrupt()
;InterruptExample.c,16 :: 		if(INT0IF_bit==1)
	BTFSS       INT0IF_bit+0, BitPos(INT0IF_bit+0) 
	GOTO        L_interrupt2
;InterruptExample.c,18 :: 		LATB.F7=1;
	BSF         LATB+0, 7 
;InterruptExample.c,19 :: 		delay_ms(200);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_interrupt3:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt3
	DECFSZ      R12, 1, 1
	BRA         L_interrupt3
	DECFSZ      R11, 1, 1
	BRA         L_interrupt3
	NOP
	NOP
;InterruptExample.c,20 :: 		INT0IF_bit=0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;InterruptExample.c,21 :: 		}
L_interrupt2:
;InterruptExample.c,22 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt
