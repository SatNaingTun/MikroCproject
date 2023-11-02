#line 1 "E:/mikroprojects/from internet/PIC to PIC Communication using USART/PIC to PIC Communication using USART RX.c"

void main()
{
 TRISB = 0;
 PORTB = 0;
 UART1_Init(9600);
 Delay_ms(100);
 while (1)
 {
 if (UART1_Data_Ready())
 {
 PORTB = UART1_Read();

 }
 }
}
