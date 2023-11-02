#line 1 "E:/mikroprojects/USB Example/USBandLCD/USBandLCD.c"
#line 24 "E:/mikroprojects/USB Example/USBandLCD/USBandLCD.c"
rom char USB_STRING_DESC[]={


 4, 3, 9, 4,

  (sizeof(_unicode("CCS"))+2), 3, _unicode("CCS") ,

  (sizeof(_unicode("USB HID Example"))+2), 3, _unicode("USB HID Example") ,

  (sizeof(_unicode("123456789"))+2), 3, _unicode("123456789") };




char data[16];
void main(){
 lcd_init();
 lcd_putc('\f');
 lcd_gotoxy(1, 1);
 lcd_putc("USB HID Example");
 usb_init_cs();
 delay_ms(1000);
 while(TRUE){
 usb_task();
 if(usb_enumerated()){
 if(usb_kbhit(1)){
 lcd_gotoxy(1, 2);
 lcd_putc("                ");

 usb_get_packet(1, data, 16);
 lcd_gotoxy(1, 2);
 printf(lcd_putc, data);
 delay_ms(1000);

 usb_put_packet(1, data, 16, USB_DTS_TOGGLE);
 }
 }
 }
}
