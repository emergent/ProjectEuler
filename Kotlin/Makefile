CPP=kotlinc
DEFINE=
INCLUDE=
LDFLAGS=
CPPFLAGS=-include-runtime
CPPTARGET=$(patsubst %.kt,%.jar, $(wildcard *.kt)) 

.PHONY: all
all: $(CPPTARGET)

%.jar: %.kt
	$(CPP) $< $(CPPFLAGS) -d $@ $(LDFLAGS)

clean:
	rm -rf *.class *~ $(CPPTARGET)
