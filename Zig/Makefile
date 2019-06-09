COMPILER=zig build-exe
DEFINE=
INCLUDE=
LDFLAGS=
CPPFLAGS=
TARGET=$(patsubst %.zig,%, $(wildcard *.zig))

.PHONY: all
all: $(TARGET)

%: %.zig
	$(COMPILER) $<

clean:
	rm -rf $(TARGET) *.o *~ zig-cache
