CPP=kotlinc
DEFINE=
INCLUDE=
LDFLAGS=-cp build
CPPFLAGS=-include-runtime
BUILDDIR=build
TARGET=$(patsubst %.kt,$(BUILDDIR)/%.jar, $(wildcard *.kt))

.PHONY: all
all: $(TARGET)

$(BUILDDIR)/%.jar: %.kt
	-mkdir -p $(BUILDDIR)
	$(CPP) $< $(CPPFLAGS) -d $@ $(LDFLAGS)

clean:
	rm -rf *.class *~ $(BUILDDIR)/*
