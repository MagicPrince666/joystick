TOP_DIR := $(shell pwd)
APP = JoyStick

CROSS	 = 
CC	     = $(CROSS)gcc
CPP	     = $(CROSS)g++
STRIP	 = $(CROSS)strip
CFLAGS = -g -Wall

DEP_LIBS = 
LDFLAGS += -lpthread
INC = -I.

all: $(APP)

OBJS = my_joystick.o listop.o com.o uart.o
SRC = my_joystick.cpp listop.cpp com.cpp uart.cpp

$(APP):$(OBJS)
	$(CPP) $(CFLAGS) -o $@ $(OBJS) $(LDFLAGS) 
	$(STRIP) $@
%.o:%.c
	$(CPP) $(INC) $(CFLAGS) -c $< -o $@ 

clean:
	rm -f *.o $(APP) 