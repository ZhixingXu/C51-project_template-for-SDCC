#include "8051.h"
#include "include/timer.h"
#include "include/led.h"
unsigned int TIMER_IPT_CNT=0;
void Timer0_Ipt() __interrupt 1;

void main()
{
    Timer_Config();
    while (1)
    {
      Digital_Cube_Show();
      delay100ms(10);
    }
    
}

void Timer0_Ipt() __interrupt 1
{
    TR0=0;
    TIMER_IPT_CNT++;
    TR0=1;
}
