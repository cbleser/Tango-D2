ifdef SystemRoot
    OS              = "Windows"
    STATIC_LIB_EXT  = .lib
    SHARED_LIB_EXT = .dll
    PATH_SEP        =\
    message         = @(echo $1)
    SHELL           = cmd.exe
    Filter          = tango/sys/linux/%.d tango/sys/darwin/%.d tango/sys/freebsd/%.d tango/sys/solaris/%.d
    getSource       =$(shell dir tango /s /b)
else
    SHELL           = sh
    PATH_SEP        =/
    getSource       =$(shell find tango -name "*.d")
    ifeq ($(shell uname), Linux)
        OS              = "Linux"
        STATIC_LIB_EXT  = .a
        SHARED_LIB_EXT = .so
        message         = @(echo \033[31m $1 \033[0;0m1)
        Filter          = tango/sys/win32/%.d tango/sys/darwin/%.d tango/sys/freebsd/%.d tango/sys/solaris/%.d
    else ifeq ($(shell uname), Solaris)
        STATIC_LIB_EXT  = .a
        SHARED_LIB_EXT = .so
        OS              = "Solaris"
        message         = @(echo \033[31m $1 \033[0;0m1)
        Filter          = tango/sys/win32/%.d tango/sys/linux/%.d tango/sys/darwin/%.d tango/sys/freebsd/%.d
    else ifeq ($(shell uname),FreeBSD)
        STATIC_LIB_EXT  = .a
        SHARED_LIB_EXT = .so
        OS              = "FreeBSD"
        FixPath         = $1
        message         = @(echo \033[31m $1 \033[0;0m1)
        Filter          = tango/sys/win32/%.d tango/sys/linux/%.d tango/sys/darwin/%.d tango/sys/solaris/%.d
    else ifeq ($(shell uname),Darwin)
        STATIC_LIB_EXT  = .a
        SHARED_LIB_EXT = .so
        OS              = "Darwin"
        message         = @(echo \033[31m $1 \033[0;0m1)
        Filter          = tango/sys/win32/%.d tango/sys/linux/%.d tango/sys/freebsd/%.d tango/sys/solaris/%.d
    endif
endif

# Define command for copy, remove and create file/dir
ifeq ($(OS),"Windows")
    RM    = del /Q
    RMDIR = del /Q
    CP    = copy /Y
    MKDIR = mkdir
    MV    = move
    LN    = mklink
else ifeq ($(OS),"Linux")
    RM    = rm -f
    RMDIR = rm -rf
    CP    = cp -fr
    MKDIR = mkdir -p
    MV    = mv
    LN    = ln -s
else ifeq ($(OS),"FreeBSD")
    RM    = rm -f
    RMDIR = rm -rf
    MKDIR = mkdir -p
    MV    = mv
    LN    = ln -s
else ifeq ($(OS),"Solaris")
    RM    = rm -f
    RMDIR = rm -rf
    MKDIR = mkdir -p
    MV    = mv
    LN    = ln -s
else ifeq ($(OS),"Darwin")
    RM    = rm -f
    RMDIR = rm -rf
    MKDIR = mkdir -p
    MV    = mv
    LN    = ln -s
endif

# If compiler is not define try to find it
ifndef DC
    ifneq ($(strip $(shell which dmd 2>/dev/null)),)
        DC=dmd
    else ifneq ($(strip $(shell which ldc 2>/dev/null)),)
        DC=ldc
    else ifneq ($(strip $(shell which ldc2 2>/dev/null)),)
        DC=ldc2
    else
        DC=gdc
    endif
endif

#define a suufix lib who inform is build with which compiler
ifeq ($(DC),gdc)
    COMPILER=gdc
else ifeq ($(DC),gdmd)
    COMPILER=gdc
else ifeq ($(DC),ldc)
    COMPILER=ldc
else ifeq ($(DC),ldc2)
    COMPILER=ldc
else ifeq ($(DC),ldmd)
    COMPILER=ldc
else ifeq ($(DC),dmd)
    COMPILER=dmd
else ifeq ($(DC),dmd2)
    COMPILER=dmd
endif

# Define flag for gdc other
ifeq ($(COMPILER),gdc)
    DCFLAGS    = -O2
    LINKERFLAG= -Xlinker
    OUTPUT    = -o
    HF        = -fintfc-file=
    DF        = -fdoc-file=
    NO_OBJ    = -fsyntax-only
    DDOC_MACRO= -fdoc-inc=
else
    DCFLAGS    = -O
    LINKERFLAG= -L
    OUTPUT    = -of
    HF        = -Hf
    DF        = -Df
    NO_OBJ    = -o-
    DDOC_MACRO=
endif


# Version statement / soname flag
ifeq ($(COMPILER),ldc)
    DVERSION    = -d-version
    SONAME_FLAG = -soname
else ifeq ($(COMPILER),gdc)
    DVERSION    = -fversion
    SONAME_FLAG = $(LINKERFLAG)-soname
else
    DVERSION    = -version
    SONAME_FLAG = $(LINKERFLAG)-soname
endif

# Define relocation model for ldc or other
ifeq ($(COMPILER),ldc)
    FPIC = -relocation-model=pic
else
    FPIC = -fPIC
endif

# Add -ldl flag for linux
ifeq ($(OS),"Linux")
    LDCFLAGS += $(LINKERFLAG)-ldl
endif

# If model are not given take the same as current system
ifndef ARCH
    ifeq ($(OS),"Windows")
        ifeq ($(PROCESSOR_ARCHITECTURE), x86)
            ARCH = x86
        else
            ARCH = x86_64
        endif
    else
        ARCH = $(shell (type arch &>/dev/null && arch) || uname -m)
    endif
endif
ifndef MODEL
    ifeq ($(ARCH), x86_64)
        MODEL = 64
    else
        MODEL = 32
    endif
endif

ifeq ($(MODEL), 64)
    DCFLAGS  += -m64
    LDCFLAGS += -m64
else
    DCFLAGS  += -m32
    LDCFLAGS += -m32
endif

ifndef DESTDIR
    DESTDIR =
endif

# Define var PREFIX, BIN_DIR, LIB_DIR, INCLUDE_DIR, DATA_DIR
ifndef PREFIX
    ifeq ($(OS),"Windows")
        PREFIX = $(PROGRAMFILES)
    else ifeq ($(OS), "Linux")
        PREFIX = /usr/local
    else ifeq ($(OS), "Darwin")
        PREFIX = /usr/local
    endif
endif

ifndef BIN_DIR
    ifeq ($(OS), "Windows")
        BIN_DIR = $(PROGRAMFILES)\$(PROJECT_NAME)\bin
    else ifeq ($(OS), "Linux")
        BIN_DIR = $(PREFIX)/bin
    else ifeq ($(OS), "Darwin")
        BIN_DIR = $(PREFIX)/bin
    endif
endif
ifndef LIB_DIR
    ifeq ($(OS), "Windows")
        LIB_DIR = $(PREFIX)\$(PROJECT_NAME)\lib
    else ifeq ($(OS), "Linux")
        LIB_DIR = $(PREFIX)/lib
    else ifeq ($(OS), "Darwin")
        LIB_DIR = $(PREFIX)/lib
    endif
endif

ifndef INCLUDE_DIR
    ifeq ($(OS), "Windows")
        INCLUDE_DIR = $(PROGRAMFILES)\$(PROJECT_NAME)\import
    else
        INCLUDE_DIR = $(PREFIX)/include/d/
    endif
endif

ifndef DATA_DIR
    ifeq ($(OS), "Windows")
        DATA_DIR = $(PROGRAMFILES)\$(PROJECT_NAME)\data
    else
        DATA_DIR = $(PREFIX)/share
    endif
endif

ifndef PKGCONFIG_DIR
    ifeq ($(OS), "Windows")
        PKGCONFIG_DIR = $(PROGRAMFILES)\$(PROJECT_NAME)\data
    else
        PKGCONFIG_DIR = $(DATA_DIR)/pkgconfig
    endif
endif

ifndef CC
    CC = gcc
endif

IMPORT_PATH         = ./import
PLAIN_DOC_PATH      = ./plain_documentation
DOC_PATH            = ./documentation
BUILD_PATH          = ./objs

DCFLAGS_IMPORT      =
DCFLAGS_LINK        = $(LDCFLAGS)

ifndef LIBNAME
    LIBNAME         = lib$(PROJECT_NAME)-$(COMPILER)
endif

STATIC_LIBNAME      = $(LIBNAME)$(STATIC_LIB_EXT)
SHARED_LIBNAME      = $(LIBNAME)$(SHARED_LIB_EXT)

PKG_CONFIG_FILE     = $(PROJECT_NAME).pc

MAKE                = make
AR                  = ar
ARFLAGS             = rcs
RANLIB              = ranlib

export AR
export ARCH
export ARFLAGS
export BIN_DIR
export BUILD_PATH
export CC
export COMPILER
export CP
export DATA_DIR
export DC
export DF
export DCFLAGS
export DCFLAGS_IMPORT
export DCFLAGS_LINK
export DESTDIR
export PLAIN_DOC_PATH
export DOC_PATH
export SHARED_LIB_EXT
export FixPath
export HF
export INCLUDE_DIR
export IMPORT_PATH
export LDCFLAGS
export FPIC
export LIBNAME
export LIB_DIR
export LINKERFLAG
export message
export MAKE
export MKDIR
export MODEL
export MV
export OUTPUT
export OS
export PATH_SEP
export PKG_CONFIG_FILE
export PREFIX
export RANLIB
export RM
export STATIC_LIB_EXT
export STATIC_LIBNAME
export SHARED_LIBNAME
