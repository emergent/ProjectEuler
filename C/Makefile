CPP=gcc
DEFINE=
INCLUDE=
LDFLAGS=
CPPFLAGS=-std=c17 -Wall -Wnon-virtual-dtor -Woverloaded-virtual -Werror -pedantic-errors #-g
TARGET=$(patsubst %.c,%, $(wildcard *.c)) 

.PHONY: all
all: $(TARGET)

%: %.c
	$(CPP) $(CPPFLAGS) -o $@ $< $(LDFLAGS)

clean:
	rm -rf *.o *~ $(TARGET) a.out
