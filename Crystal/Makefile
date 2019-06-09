COMPILER=crystal build
DEFINE=
INCLUDE=
LDFLAGS=
CPPFLAGS=
TARGET=$(patsubst %.cr,%, $(wildcard *.cr))

.PHONY: all
all: $(TARGET)

%: %.cr
	$(COMPILER) $< && rm $@.dwarf

clean:
	rm -rf $(TARGET) *.dwarf *~
