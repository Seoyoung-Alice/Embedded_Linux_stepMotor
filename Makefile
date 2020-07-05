obj-m := test_motor.o
KDIR := /root/work/achroimx6q/kernel
PWD := $(shell pwd)
APP := test_motor_app

all : test_motor test_motor_app

test_motor : test_motor.c
	$(MAKE)	-C $(KDIR)	SUBDIRS=$(PWD)	modules ARCH=arm
test_motor_app : test_motor_app.c
	arm-none-linux-gnueabi-gcc -static -o $(APP) $(APP).c

install:
	cp -a test_motor.ko /nfsroot
	cp -a $(APP) /nfsroot

clean :
	rm rf *.ko
	rm -rf *.mod.*
	rm -rf .*.cmd
	rm -rf *.o
	rm -rf $(APP)
	rm -rf Module.symvers
	rm -rf modules.order
	rm -rf .tmp*
	rm -rf .fpga*
