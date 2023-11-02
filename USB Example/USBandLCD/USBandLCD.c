// PIC18F4550 USB HID Examlpe CCS C code

//LCD module connections
#define LCD_RS_PIN PIN_D0
#define LCD_RW_PIN PIN_D1
#define LCD_ENABLE_PIN PIN_D2
#define LCD_DATA4 PIN_D3
#define LCD_DATA5 PIN_D4
#define LCD_DATA6 PIN_D5
#define LCD_DATA7 PIN_D6
//End LCD module connections

#define USB_CONFIG_HID_TX_SIZE 16                // Transmit packet size (bytes)
#define USB_CONFIG_HID_RX_SIZE 16                // Receive packet size (bytes)
#define USB_CONFIG_PID 1                         //Chnage Product Id
#define USB_CONFIG_VID 1234                      //Chnage Vendor Id
#define USB_STRINGS_OVERWRITTEN


#fuses  HSPLL PLL2 CPUDIV1 USBDIV VREGEN NOMCLR
#use delay(clock = 48000000)
#include <lcd.c>
#define USB_STRING(x)  (sizeof(_unicode(x))+2), 3, _unicode(x)
rom char USB_STRING_DESC[]={
    //string 0 (must always provide this string)
    //4(length of string index),3(desciptor type is string),9&4(Microsoft Defined for US-English)
    4, 3, 9, 4,
    //string 1 - vendor (this is optional, but we specified it's use in the device descriptor)
    USB_STRING("CCS"),
    //string 2 - product (this is optional, but we specified it's use in the device descriptor)
    USB_STRING("USB HID Example"),
    //string 3 - serial number (this is optional, but we specified it's use in the device descriptor)
    USB_STRING("123456789")};
#include <usb_desc_hid.h>
#include<pic18_usb.h>
#include<usb.c>

char data[16];
void main(){
  lcd_init();                                    // Initialize LCD module
  lcd_putc('\f');                                // LCD clear
  lcd_gotoxy(1, 1);
  lcd_putc("USB HID Example");
  usb_init_cs();                                 // Initialize USB hardware
  delay_ms(1000);
  while(TRUE){
    usb_task();
    if(usb_enumerated()){                // If the device has been enumerated by the PC
      if(usb_kbhit(1)){                  // If endpoint1 has data in it's receive buffer
        lcd_gotoxy(1, 2);
        lcd_putc("                ");            // Clear 2nd line
        // Read up to 16 bytes from endpoint1 buffer and save it to variable data
        usb_get_packet(1, data, 16);
        lcd_gotoxy(1, 2);
        printf(lcd_putc, data);                  // Display the received bytes on LCD
        delay_ms(1000);                          // Wait 1 second
        // Return the received bytes back
        usb_put_packet(1, data, 16, USB_DTS_TOGGLE);
      }
    }
  }
}