#line 1 "E:/mikroprojects/InterruptEgUART/InterruptEgUART.c"
char receiveIncomingData;
void main() {
 TRISB=0x00;
 UART1_Init(9600);
 delay_ms(100);

 UART1_Write_Text("welcome to this course");
 delay_ms(300);
 UART1_Write_Text(" Press 1 to Turn on LED on RB7");

 GIE_bit=1;
 PEIE_bit=1;
 RC1IE_bit=1;
 RC1IF_bit=1;
 while(1)
 {
 LATB.F7=0;
 }
}
void interrupt()
{
 if( RC1IF_bit==1)
 {
 receiveIncomingData =UART1_Read();
 if(receiveIncomingData== '1')
 {
 LATB.F7=1;
 delay_ms(1000);
 }
 else
 {
 LATB.F7=0;

 }

 }
}
