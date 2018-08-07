XX = gcc
CFLAGS = -g -DARCH_X86
#CLIBS = -lpthread

SOURCE_DIR = ../../source

$(warning $(SOURCE_DIR))
 
INCLUDE  = $(wildcard $(SOURCE_DIR)/*.h) # INCLUDE = a.h b.h ... can't be defined like "INCLUDE = ./*.h"
SOURCES  = $(wildcard $(SOURCE_DIR)/*.c)
SOURCES += $(wildcard $(SOURCE_DIR)/common/*.c)
SOURCES += $(wildcard $(SOURCE_DIR)/common/intrinsics/*.c)
$(warning $(SOURCES))


 
TARGET = test
OBJECTS = $(patsubst %.c,%.o,$(SOURCES))
 
$(TARGET) : $(OBJECTS)
	$(XX) $(CFLAGS) $^ -o $@ $(CLIBS)
$(OBJECTS) : %.o : %.c
	$(XX) -c $(CFLAGS) $< -o $@
 
.PHONY : clean
clean:
	rm -rf *.o $(TARGET)  

