
void main() 
{
  TRISB = 0;
  PORTB = 0;
  UART1_Init(9600); // Initialize UART module at 9600bps
  Delay_ms(100); // Wait for UART module to stabilize
  while (1) 
  { // Endless loop
    if (UART1_Data_Ready()) 
    { // If data is received,
      PORTB = UART1_Read(); // read the received data,

    }
  }
}