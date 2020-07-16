# CC 编译工具声明
# stc 烧录工具位置
# 功能是编译并完成下载
CC      = sdcc
stc     = python stcflash.py
include = ./include
# srcfiles := $(wildcard $(include)/*.c)
srcfiles  = $(shell find . -name "*.c")
# Num_Cfile = $(find *.py -type f -print | wc -l)
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
# ********************以下4个需要修改********************************************
main.ihx : main.rel #timer.rel led.rel #*.rel
	$(CC) $(relfiles) -o main.ihx 
	# main.rel led.rel timer.rel 

%.rel : $(srcfiles)
	@for i in $(srcfiles); do \
		$(CC) -c $$i; \
	done
# *****************************************************************************
clean:
	rm -rf *.lk *.bin *.asm *.lst *.mem *.rst *.lnk *.rel *.sym *.ihx *.map
# clean:
# 	rm -rf *.asm *.lst *.mem *.rst *.lnk *.rel *.sym *.ihx *.hex *.map *.lk