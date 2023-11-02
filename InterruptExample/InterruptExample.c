void main() 
{
TRISB=0x01;
INT0IF_bit=0;
INT0IE_bit=1;
GIE_bit=1;
INTEDG0_bit=1;

while(1)
{
LATB.F7=0;
}
}
void interrupt()
{
if(INT0IF_bit==1)
{
LATB.F7=1;
delay_ms(200);
INT0IF_bit=0;
}
}