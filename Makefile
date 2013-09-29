# Root makefile

ifndef RSK_ROOT       
$(error RSK_ROOT is not defined - aborting)
endif
ifndef ARM_LEGO
$(error ARM_LEGO is not set (ARM toolchains) - aborting)
endif

# _________________________________________________
# 
#
#					Main definitions
#
# _________________________________________________

# ___________________ Format path _________________

#export RSK_ROOT=$(strip $(RSK_ROOT))

# ___________________ Tools _______________________

export CC=arm-none-linux-gnueabi-gcc
export CPP=arm-none-linux-gnueabi-g++
export LD=arm-none-linux-gnueabi-g++
export NM=arm-none-linux-gnueabi-nm
export OBJCOPY=arm-none-linux-gnueabi-objcopy
export OBJDUMP=arm-none-linux-gnueabi-objdump
export AR=arm-none-linux-gnueabi-ar
export AS=arm-none-linux-gnueabi-as
export MKDIR=mkdir

# ___________________ Flags ________________________

export CCFLAGS=-O3
export CPPFLAGS=-O3
export LDFLAGS= 

# ___________ Directories & Files __________________

export SYS_LIB=
export OBJDIR=$(RSK_ROOT)/obj
export GLOBAL_INCLUDE=$(RSK_ROOT)/base/exp

# ___________ Application list _____________________

APP_LIST=app

# ___________ Recursive build ______________________

SUBDIRS=driver app
BUILD_APP=1
include $(RSK_ROOT)/build/common.mk

# _________________________________________________
# 
#
#					Target definitions
#
# _________________________________________________

.PHONY: clean realclean

clean:
		@rm -rf $(OBJDIR)/**/*.o

realclean: clean
		@rm -rf $(OBJDIR)/**

