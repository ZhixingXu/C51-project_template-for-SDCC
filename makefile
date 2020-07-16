# CC 编译工具声明
# stc 烧录工具位置
# 功能是编译并完成下载
CC      = sdcc
stc     = python ./stcflash.py
include = ./include
srcfiles  = $(shell find . -name "*.c")
relfiles = $(shell find . -name "*.rel")

# test :
# 	echo $(srcfiles)
# 	@for i in $(srcfiles); do \
# 		echo $$i; \
# 	done

all : main.hex

download : main.hex
	$(stc) main.hex

# main.bin : main.hex
# 	objcopy -I ihex -O binary main.hex #main.bin
    
main.hex : main.ihx
	packihx main.ihx > main.hex

main.ihx : main.rel #timer.rel led.rel #*.rel
	$(CC) $(relfiles) -o main.ihx 

%.rel : $(srcfiles)
	@for i in $(srcfiles); do \
		$(CC) -c $$i; \
	done

clean:
	rm -rf *.lk *.bin *.asm *.lst *.mem *.rst *.lnk *.rel *.sym *.ihx *.map