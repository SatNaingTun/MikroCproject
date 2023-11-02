#line 1 "E:/mikroprojects/USBExample4.c"
unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;


char count;

void interrupt()
{
USB_Interrupt_Proc();
}


void main(void){
 trisd=0x00;
 trisb=0xFF;
 HID_Enable(&readbuff,&writebuff);

 while(1)
 {


 while(!HID_Read());


 writebuff[count]=readbuff[count];
 while(!HID_Write(&writebuff,64));

 if(strncmp(readbuff,"A",1) == 0)
 {
 HID_Write("Sucess",64);

 }else
 {
 HID_Write("Fail",64);


 }

 if(portb.f4 == 0){HID_Write("First Button Pressed",64);}
 if(portb.f5 == 0){HID_Write("Second Button Pressed",64);}


} }
