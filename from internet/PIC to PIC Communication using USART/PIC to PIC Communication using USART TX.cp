#line 1 "F:/Electronics/Embeded/PIC to PIC Communication using USART/PIC to PIC Communication using USART TX.c"

void main()
{
 TRISB = 0xFF;
 PORTB = 0;
 UART1_Init(9600);
 Delay_ms(100);
 while (1)
 {
 UART1_Write(PORTB);
 Delay_ms(500);
 }
}
