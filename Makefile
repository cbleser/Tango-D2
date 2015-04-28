
DC?=dmd
UNITTESTBIN?=unittest-$(DC)
#-include config.make

all: build-all

clean: build-clean

unittester: build-unittester

build-%:
	$(MAKE) -f build/Makefile $*

run: build-unittester
	./$(UNITTESTBIN)
