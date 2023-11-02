#line 1 "E:/mikroprojects/KeypadWith7Seg/KeypadWith7Seg.c"
unsigned short kp=0;
char keypadPort at PORTB;

void main(){
TRISA=0X00;
PORTA=0X00;
Keypad_Init();
while(1)
{

kp=Keypad_Key_Press();
if(kp<=3)
{
 PortA=kp;
}
if(kp>3 && kp<=7)
{
PortA=kp-1;
}
if(kp>8 && kp<=11)
{
PortA=kp-2;
}
}
}
