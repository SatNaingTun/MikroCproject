#line 1 "E:/mikroprojects/USB Example/USB Example2/USB Example1/USB_Example1.c"
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
 for(count=0;count<64;count++)
 {
 writebuff[count]=readbuff[count];
 while(!HID_Write(&writebuff,64));
 }
 }

}
