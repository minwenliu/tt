#        Version:  1.0
#        Created:  03/02/2011 09:53:20 PM CST
#       Revision:  none
#       Compiler:  g++
#         Editor:  vim (ts=4,sw=4,et)
#         Author:  Jaco Wu (), jacowu@tencent
#        Company:  Tencent
# 
#        History:
#               1. Date:
#                  Author:
#                  Modification:

#include ../BUILD_ROOT
include ./wc.mk
include ./makefile.mk
#TSF4G_ROOT=${BUILD_ROOT_PATH}/extlib

OK = \\e[1m\\e[32m OK \\e[m
FAILURE = \\e[1m\\e[31m FAILURE \\e[m
.PHONY: all clean
all: $(WC_BIN)

######################################################################

EXCLUDE_DIRS := tools .svn 
DIRS := $(shell find . -maxdepth 1 -type d)
DIRS := $(basename $(patsubst ./%,%,$(DIRS)))
DIRS := $(filter-out $(EXCLUDE_DIRS),$(DIRS))

SRCS := $(foreach it,$(DIRS),$(wildcard $(it)/*.cpp)) 
OBJS =$(patsubst %.cpp,%.o,$(SRCS))

INCS = $(DEP_INCS) 
INCS += $(foreach it, $(DIRS), -I$(it))
	
LIBS = $(DEP_LIBS) -lpthread

clean:
	rm  -f $(WC_BIN) $(OBJS) 

cleandep:
	rm -f $(SRCS:.cpp=.d)

sinclude $(SRCS:.cpp=.d)

%.d:%.cpp
	@set -e; rm -f $@; \
	echo -ne make dep $<  ... ; \
	${CC} -MM -MT $*.o ${INCS} $< > $@.$$$$ && echo  -e $(OK) || echo -e $(FAILURE); \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$;

$(WC_BIN): $(OBJS) 
	@echo -ne Linking $(WC_BIN) ... 
	@$(CC) -o $(WC_BIN) $(CFLAGS) $^ $(INCS) $(LIBS) && echo  -e $(OK) || echo -e $(FAILURE)

%.o: %.cpp
	@echo -ne Compiling $<  ... 
	@$(CC) $(CFLAGS) $(DEBUG) -o $@ -c $< $(INCS) && echo  -e $(OK) ||  exit "$$?" 
