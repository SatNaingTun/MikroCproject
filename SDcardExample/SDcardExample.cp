#line 1 "E:/mikroprojects/SDcardExample/SDcardExample.c"
char filename[]="Test.TXT";
unsigned char txt[]="Test Writing to SD card";
sbit Mmc_Chip_Select at RC0_bit;
sbit Mmc_Chip_Select_Direction at TRISC0_bit;
void main()
{
 SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV16, _SPI_DATA_SAMPLE_MIDDLE,_SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
 if(Mmc_Fat_Init()==0)
 {
 SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE,_SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH);
 Mmc_Fat_Assign(&filename,0x80);
 Mmc_Fat_Rewrite();
 Mmc_Fat_Write(txt,21);
 }

}
