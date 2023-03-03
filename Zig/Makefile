COMPILER=zig build-exe
DEFINE=-O ReleaseFast
INCLUDE=
LDFLAGS=
CPPFLAGS=
TARGET=$(patsubst %.zig,%, $(wildcard problem*.zig))

.PHONY: all
all: $(TARGET)

%: %.zig
	$(COMPILER) $< $(DEFINE)

clean:
	rm -rf $(TARGET) *.o *~ zig-cache
