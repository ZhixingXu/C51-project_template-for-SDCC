#include "timer.h"

void Timer_Config()
{
    TMOD=0x01;
    TH0=0x3c;//50ms
    TL0=0xb0;
    EA=1;
    ET0=1;
    TR0=1;
}

void delay100ms(unsigned int t)
{
    t=2*t;
    while(TIMER_IPT_CNT<t);
    TIMER_IPT_CNT=0;
}