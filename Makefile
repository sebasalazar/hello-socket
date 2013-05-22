# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_DISTDIR=dist
CND_BUILDDIR=build


# Object Directory
OBJECTDIR=${CND_BUILDDIR}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/main.o


# C Compiler Flags
#DEBUG
CFLAGS=-Wall -DDEBUG -g3
#Sin Debug
#CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=-lm

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f Makefile ${CND_DISTDIR}/hello-socket

${CND_DISTDIR}/curlapp: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}
	${LINK.c} -o ${CND_DISTDIR}/hello-socket ${OBJECTFILES} ${LDLIBSOPTIONS} 
	${RM} -fr ${CND_BUILDDIR}
	${RM} -fr core


${OBJECTDIR}/main.o: main.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(CC) $(CFLAGS) -c -MMD -MP -MF $@.d -o ${OBJECTDIR}/main.o main.c

# Clean Targets
clean: ${CLEAN_SUBPROJECTS}
	${RM} -fr ${CND_BUILDDIR}
	${RM} -fr ${CND_DISTDIR}
	${RM} -fr core

# Subprojects
.clean-subprojects:


