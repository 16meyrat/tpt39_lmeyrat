EXE=videofilter
CVINCFLAGS=`pkg-config --libs --cflags opencv`
CVLIBFLAGS=`pkg-config --libs opencv`
SRCS=./videofilter.cpp ./openclfilter.cpp ./common/*
GCC=g++ 
CL=aoc
KERNEL=vector_add
LIB_PATH=/comelec/softs/opt/altera/altera17.0/hld/board/s5_ref/linux64/lib:/comelec/softs/opt/altera/altera17.0/hld/host/linux64/lib:./${KERNEL}
COMMON_FILES = ./common
AOCL_COMPILE_CONFIG=$(shell aocl compile-config) 
AOCL_LINK_CONFIG=$(shell aocl link-config)  -lacl_emulator_kernel_rt
FLAGS=-Wno-deprecated-declarations -Wall  -Wextra -O2 
#LDFLAGS=../../build/utils/Utils.o -L../../build/ -L..  -larm_compute -larm_compute_core -lOpenCL
LDFLAGS=-L${CVLIBFLAGS} -L${CVINCFLAGS}


all: ${EXE}

${EXE}:
	${GCC} ${FLAGS} -o ${EXE} ${SRCS} ${LDFLAGS} ${AOCL_COMPILE_CONFIG} ${AOCL_LINK_CONFIG}

debug:${EXE}
	LD_PRELOAD=${MGD}/libinterceptor.so ./${EXE}
	
build:
		${CL}  -cl-opt-disable ${KERNEL}.cl
	
cl_compile:
		${CL} -march=emulator -cl-opt-disable  --profile ${KERNEL}.cl

sim:
		LD_LIBRARY_PATH=${LIB_PATH} CL_CONTEXT_EMULATOR_DEVICE_ALTERA=1 ./${EXE}

clean:
	rm -rf ${EXE} *.o	
