#include "led.h"
#include "timer.h"
char able[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0x88,0x83,0xc6,0xa1,0x86,0x8e};
void Digital_Cube_Show()
{ 
    static unsigned int i=0;
    P1=able[i];
    i++;
    if(i>0x0f)i=0;
}