CC=g++
CCFLAGS=-Iri/include -Iri/include/EGL -Iri/include/VG -m32

LDFLAGS=-lm -lstdc++
SRCFILES=$(wildcard ri/src/*.cpp)
OBJFILES=$(patsubst ri/src/%.cpp,build/%.o,$(SRCFILES)) build/riEGLOS.o

all: bin/null/libVG.dylib

build:
	mkdir build

bin/null/libVG.dylib: build $(OBJFILES)
	mkdir -p bin/null
	$(LD) -dylib -o $@ $(LDFLAGS) $(OBJFILES)

build/%.o: ri/src/%.cpp
	$(CC) -c -o $@ $(CCFLAGS) $<

build/riEGLOS.o: ri/src/null/riEGLOS.cpp
	$(CC) -c -o $@ $(CCFLAGS) -Iri/src $<
