MYSQL_ROOT= /usr/local/mysql
INC_MYSQL = -I$(MYSQL_ROOT)/include/mysql
LIB_MYSQL = -L$(MYSQL_ROOT)/lib/mysql -lmysqlclient -lz

INC_TSF4G_BASE   = -I$(TSF4G_ROOT)/tbase/include/
INC_TSF4G_ORM    = -I$(TSF4G_ROOT)/torm/include/apps/
INC_TSF4G_TCOND  = -I$(TSF4G_ROOT)/tcond/include/
INC_TSF4G_TDIRTY = -I$(TSF4G_ROOT)/tdirty/include/
INC_TSS_SDK      = -I$(TSF4G_ROOT)/tss/include/
INC_OIDB         = -I$(TSF4G_ROOT)/oidb/include/
INC_OIDB_COMM    = -I$(TSF4G_ROOT)/oidb/include/oidbcomm/
INC_VAS          = -I$(TSF4G_ROOT)/vas/include

LIB_TSF4G  = $(TSF4G_ROOT)/tcond/lib/libtconnapi.a  \
			 -L$(TSF4G_ROOT)/torm/lib -ltormapi \
			 -L$(TSF4G_ROOT)/tdirty/lib -ltdirty \
			 -L$(TSF4G_ROOT)/tbase/lib -ltapp -ltbus -ltdr -ltsf4g \
			 -L$(TSF4G_ROOT)/tss/lib $(TSF4G_ROOT)/tss/lib/libtss_sdk_import.a \
			 -L$(TSF4G_ROOT)/vss/lib $(TSF4G_ROOT)/vas/lib/vas_key_lib.a \
			 -L$(TSF4G_ROOT)/oidb/lib -loidbapicomm -loidbproto \
			 -ltaa -ltloghelp -ltdr_xml -lscew -lexpat -ltlog -ltmng -lcomm -lpal -ldl -lz

#####################################################
#DEP_INCS =  $(INC_TSF4G_BASE) $(INC_TSF4G_ORM) $(INC_TSF4G_TCOND) $(INC_TSF4G_TDIRTY)  $(INC_TSS_SDK) $(INC_OIDB) $(INC_OIDB_COMM) $(INC_VAS)
#DEP_LIBS =  $(LIB_TSF4G) 
DEP_LIBS =  -L. -ludp_client
WC_BIN = ./client 
