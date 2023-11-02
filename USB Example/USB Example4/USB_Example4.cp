#line 1 "E:/mikroprojects/USB Example/USB Example4/USB_Example4.c"
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




 if(strncmp(readbuff,"PortD=?",6) == 0)
 {
 bytetostr(PortD,writebuff);



 HID_Write(&writebuff,64);
 }
 if(readbuff[1]==0x82)
 {
 writebuff[1]=1;
 HID_Write(&writebuff,64);
 }

 if(strncmp(readbuff,"A=1",3) == 0)
 {

 PortD.f0=1;


 }
 if(strncmp(readbuff,"A=0",3) == 0)
 {

 PortD.f0=0;


 }
 if(strncmp(readbuff,"B=1",3) == 0)
 {

 PortD.f1=1;


 }
 if(strncmp(readbuff,"B=0",3) == 0)
 {

 PortD.f1=0;


 }
 if(strncmp(readbuff,"C=1",3) == 0)
 {

 PortD.f3=1;


 }
 if(strncmp(readbuff,"C=0",3) == 0)
 {

 PortD.f3=0;


 }
 if(strncmp(readbuff,"D=1",3) == 0)
 {

 PortD.f3=1;


 }
 if(strncmp(readbuff,"D=0",3) == 0)
 {

 PortD.f3=0;


 }





} }
