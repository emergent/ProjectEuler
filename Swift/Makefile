CPP=swiftc
DEFINE=
INCLUDE=
LDFLAGS=
CPPFLAGS=-Ounchecked
BUILDDIR=build
TARGET=$(patsubst %.swift,$(BUILDDIR)/%, $(wildcard *.swift))

.PHONY: all
all: $(TARGET)

$(BUILDDIR)/%: %.swift
	-mkdir -p $(BUILDDIR)
	$(CPP) $< $(CPPFLAGS) -o $@ $(LDFLAGS)

clean:
	rm -rf *.class *~ $(BUILDDIR)/*
