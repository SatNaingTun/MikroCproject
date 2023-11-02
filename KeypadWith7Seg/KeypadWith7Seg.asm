
_main:

;KeypadWith7Seg.c,4 :: 		void main(){
;KeypadWith7Seg.c,5 :: 		TRISA=0X00;
	CLRF       TRISA+0
;KeypadWith7Seg.c,6 :: 		PORTA=0X00;
	CLRF       PORTA+0
;KeypadWith7Seg.c,7 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;KeypadWith7Seg.c,8 :: 		while(1)
L_main0:
;KeypadWith7Seg.c,11 :: 		kp=Keypad_Key_Press();
	CALL       _Keypad_Key_Press+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;KeypadWith7Seg.c,12 :: 		if(kp<=3)
	MOVF       R0+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main2
;KeypadWith7Seg.c,14 :: 		PortA=kp;
	MOVF       _kp+0, 0
	MOVWF      PORTA+0
;KeypadWith7Seg.c,15 :: 		}
L_main2:
;KeypadWith7Seg.c,16 :: 		if(kp>3 && kp<=7)
	MOVF       _kp+0, 0
	SUBLW      3
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	MOVF       _kp+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_main5
L__main10:
;KeypadWith7Seg.c,18 :: 		PortA=kp-1;
	DECF       _kp+0, 0
	MOVWF      PORTA+0
;KeypadWith7Seg.c,19 :: 		}
L_main5:
;KeypadWith7Seg.c,20 :: 		if(kp>8 && kp<=11)
	MOVF       _kp+0, 0
	SUBLW      8
	BTFSC      STATUS+0, 0
	GOTO       L_main8
	MOVF       _kp+0, 0
	SUBLW      11
	BTFSS      STATUS+0, 0
	GOTO       L_main8
L__main9:
;KeypadWith7Seg.c,22 :: 		PortA=kp-2;
	MOVLW      2
	SUBWF      _kp+0, 0
	MOVWF      PORTA+0
;KeypadWith7Seg.c,23 :: 		}
L_main8:
;KeypadWith7Seg.c,24 :: 		}
	GOTO       L_main0
;KeypadWith7Seg.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
