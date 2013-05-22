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
	${OBJECTDIR}/error_socket.o


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
	"${MAKE}"  -f Makefile ${CND_DISTDIR}/servidor ${CND_DISTDIR}/cliente

${CND_DISTDIR}/servidor: ${OBJECTFILES} ${OBJECTDIR}/servidor.o
	${MKDIR} -p ${CND_DISTDIR}
	${LINK.c} -o ${CND_DISTDIR}/servidor ${OBJECTDIR}/servidor.o ${OBJECTFILES} ${LDLIBSOPTIONS} 

${CND_DISTDIR}/cliente: ${OBJECTFILES} ${OBJECTDIR}/cliente.o
	${MKDIR} -p ${CND_DISTDIR}
	${LINK.c} -o ${CND_DISTDIR}/cliente ${OBJECTDIR}/cliente.o ${OBJECTFILES} ${LDLIBSOPTIONS} 


${OBJECTDIR}/servidor.o: servidor.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(CC) $(CFLAGS) -c -MMD -MP -MF $@.d -o ${OBJECTDIR}/servidor.o servidor.c

${OBJECTDIR}/cliente.o: cliente.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(CC) $(CFLAGS) -c -MMD -MP -MF $@.d -o ${OBJECTDIR}/cliente.o cliente.c	

${OBJECTDIR}/error_socket.o: error_socket.c 
	${MKDIR} -p ${OBJECTDIR}
	${RM} $@.d
	$(CC) $(CFLAGS) -c -MMD -MP -MF $@.d -o ${OBJECTDIR}/error_socket.o error_socket.c


# Clean Targets
clean: ${CLEAN_SUBPROJECTS}
	${RM} -fr ${CND_BUILDDIR}
	${RM} -fr ${CND_DISTDIR}
	${RM} -fr core cliente servidor

# Subprojects
.clean-subprojects:


