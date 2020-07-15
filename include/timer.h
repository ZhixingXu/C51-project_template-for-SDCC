#ifndef TIMER_H
#define TIMER_H
#include <8051.h>
extern unsigned int TIMER_IPT_CNT;
void Timer_Config();
void delay100ms(unsigned int t);
#endif