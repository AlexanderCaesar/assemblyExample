XX = emcc
CFLAGS = -DARCH_X86 -s WASM=1 -s ALLOW_MEMORY_GROWTH=1 -O3
#CLIBS = -lpthread

SOURCE_DIR = ../../source

INCLUDE  = $(wildcard $(SOURCE_DIR)/*.h) # INCLUDE = a.h b.h ... can't be defined like "INCLUDE = ./*.h"
SOURCES  = $(wildcard $(SOURCE_DIR)/*.c)
SOURCES += $(wildcard $(SOURCE_DIR)/common/*.c)
$(warning $(SOURCES))


 
TARGET = test.js
OBJECTS = $(patsubst %.c,%.bc,$(SOURCES))
 
$(TARGET) : $(OBJECTS)
	$(XX) $(CFLAGS) $^ -o $@ $(CLIBS)
$(OBJECTS) : %.bc : %.c
	$(XX) $(CFLAGS) $< -o $@
 
.PHONY : clean
clean:
	rm -rf *.o $(TARGET)  

