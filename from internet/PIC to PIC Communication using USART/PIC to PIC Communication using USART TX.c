
void main()
{
  TRISB = 0xFF;
  PORTB = 0;
  UART1_Init(9600); // Initialize UART module at 9600bps
  Delay_ms(100); // Wait for UART module to stabilize
  while (1)
  { // Endless loop
       UART1_Write(PORTB); // and send data via UART
       Delay_ms(500);
  }
}