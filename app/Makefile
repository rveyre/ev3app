ifndef RSK_ROOT
$(error RSK_ROOT is not defined - aborting)
endif

MOD_NAME=app
DEP=driver

include $(RSK_ROOT)/build/common.mk

# Build application
OBJ_LIST_APP=$(addsuffix /*.o, $(addprefix $(OBJDIR)/, $(DEP) $(MOD_NAME)))
APP_NAME=$(addsuffix .exe,$(MOD_NAME))


application:
	@echo "linking $(APP_NAME)... "
	@$(LD) -o $(OBJDIR)/$(APP_NAME) $(OBJ_LIST_APP) $(SYS_LIB) $(LDFLAGS)

