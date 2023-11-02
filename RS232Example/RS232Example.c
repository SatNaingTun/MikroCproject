 char value ;
 char output[20] = "";
void main() {


TRISD=0X00;
PORTD=0;
TRISB=0x00;
PORTB=0;
//TRISC=0x40; //RX bit as input


//INTCON.GIE=1;                                       //Enable Global Interrupt
  // INTCON.PEIE=1;                                     //Enable Prphial Interrupt
  // PIE1.RCIE=1;                                        //Enable Serial Interrupt
UART1_Init(9600); // Initialize USART module
  delay_ms(100);
 UART1_Write_Text("Start RS232Test \r\n");
  delay_ms(500);
// (8 bit, 19200 baud rate, no parity bit...)

while (1) {


if (UART1_Data_Ready()) { // If data has been received
   UART1_Read_Text(output, "\n", 10); // reads text until 'OK' is found
   // UART1_Read_Text(output, "$", 10); // reads text until 'OK' is found
   delay_ms(100);
    UART1_Write_Text(output);             // sends back text
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

/*
 if (UART1_Data_Ready()) { // If data has been received

value = UART1_Read(); // read it


if(value=='1')



PORTB=1;




else



PortD=1;

}
  /*
else  {
     UART1_Write_Text("Not Data Ready");
       delay_ms(10000);
       }
       */
}//end while
}//end main