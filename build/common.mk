# Common rules and def


CPP_SRC=$(wildcard *.cpp)    
OBJ_LIST=$(CPP_SRC:.cpp=.o)
MOD_DEP=$(addprefix -I$(RSK_ROOT),$(addsuffix /exp,$(DEP)))


.PHONY: all buildcpp

all:
# Recursive subdirs exploration
	@$(MKDIR) -p $(OBJDIR)
	@for i in $(SUBDIRS); do \
		$(MAKE) -C $$i all buildcpp;\
	done
# Application
ifeq ($(BUILD_APP), 1)
	@for a in $(APP_LIST); do\
		echo "Building applications $$a...";\
		$(MAKE) -C $(addprefix $(RSK_ROOT), /$$a) application;\
	done
endif
		


# Files compilation
buildcpp:
ifneq ($(strip $(OBJ_LIST)),)
ifndef MOD_NAME
$(error $(PWD): Module has no name - aborting)
else
	$(MKDIR) -p $(OBJDIR)/$(MOD_NAME)	
endif
endif
	@for o in $(OBJ_LIST);do \
		 $(MAKE) $$o;	\
	done

%.o:%.cpp
	@echo "Compiling  $<"
	@$(CPP) -I$(GLOBAL_INCLUDE) $(MODE_DEP)  -c -o $(OBJDIR)/$(MOD_NAME)/$@ $< $(CPPFLAGS)
	


