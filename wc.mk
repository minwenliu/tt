#####################################################
CC=g++

#debug
#CFLAGS = -g -pg -DDEBUG -Wall -pipe

#debug with generate call graph profile data
#CFLAGS = -g -DDEBUG -Wall -Wextra

#release 
CFLAGS += -g -Wall -Wextra -O3 -pipe 

#####################################################

