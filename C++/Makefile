CPP=g++
DEFINE=
INCLUDE=
LDFLAGS=
CPPFLAGS=-std=c++17 -Wall -Wnon-virtual-dtor -Woverloaded-virtual -Wimplicit -Werror -pedantic-errors #-g
CPPTARGET=$(patsubst %.cpp,%, $(wildcard *.cpp)) 

.PHONY: all
all: $(CPPTARGET)

%: %.cpp
	$(CPP) $(CPPFLAGS) -o $@ $< $(LDFLAGS)

clean:
	rm -rf *.o *~ $(CPPTARGET) a.out
