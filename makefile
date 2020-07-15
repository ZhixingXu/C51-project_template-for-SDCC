# CC 编译工具声明
# stc 烧录工具位置
# 功能是编译并完成下载
CC=sdcc
# stc =sudo python /home/jikexianfeng/51-demo/.stcflash/stcflash.py
stc=sudo python stcflash.py
include=./include/

all : main.bin 

download: main.bin
	$(stc) main.bin

#main.bin : main.hex
#    ~/51-demo/.Hex2bin-2.5/hex2bin main.hex

main.bin : main.hex
	objcopy -I ihex -O binary main.hex main.bin
    
main.hex : main.ihx
	packihx main.ihx > main.hex
# ********************以下4个需要修改******************************
main.ihx : main.rel timer.rel led.rel
	$(CC) main.rel led.rel timer.rel

main.rel : main.c $(include)timer.c #$(include)macro.h
	$(CC) -c main.c
    
led.rel : $(include)led.c $(include)timer.c #$(include)macro.h
	$(CC) -c $(include)led.c
    
timer.rel : $(include)timer.c #$(include)macro.h
	$(CC) -c $(include)timer.c
# ***************************************************************
cleanall:
	rm -rf *.lk *.bin *.asm *.lst *.mem *.rst *.lnk *.rel *.sym *.ihx *.hex *.map
clean:
	rm -rf *.asm *.lst *.mem *.rst *.lnk *.rel *.sym *.ihx *.hex *.map *.lk