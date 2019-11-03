CPP=g++
DEFINE=
INCLUDE=
LDFLAGS=
BUILDDIR=build
CPPFLAGS=-std=c++17 -O2 -Wall -Wnon-virtual-dtor -Woverloaded-virtual -Werror -pedantic-errors
CPPTARGET=$(patsubst %.cpp, ${BUILDDIR}/%, $(wildcard *.cpp))

.PHONY: all
all: $(CPPTARGET)

$(BUILDDIR)/%: %.cpp
	$(CPP) $(CPPFLAGS) -o $@ $< $(LDFLAGS)

clean:
	rm -rf *.o *~ $(CPPTARGET) a.out
