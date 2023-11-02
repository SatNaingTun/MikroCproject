#line 1 "E:/mikroprojects/RS232Example/RS232Example.c"
 char value ;
 char output[20] = "";
void main() {


TRISD=0X00;
PORTD=0;
TRISB=0x00;
PORTB=0;






UART1_Init(9600);
 delay_ms(100);
 UART1_Write_Text("Start RS232Test \r\n");
 delay_ms(500);


while (1) {


if (UART1_Data_Ready()) {
 UART1_Read_Text(output, "\n", 10);

 delay_ms(100);
 UART1_Write_Text(output);
 if(strncmp(output,"OK",6) == 0)
 {
 portb=1;
 portd=0;
 delay_ms(10000);
 }
 else
 {
 portb=0;
 portd=1;
 delay_ms(10000);
 }
}
#line 72 "E:/mikroprojects/RS232Example/RS232Example.c"
}
}
