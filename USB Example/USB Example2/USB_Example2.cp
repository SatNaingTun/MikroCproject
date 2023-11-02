#line 1 "E:/mikroprojects/USB Example/USB Example2/USB_Example2.c"
unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;

char count;

void interrupt()
{
USB_Interrupt_Proc();
}

void main(void){

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



} }
