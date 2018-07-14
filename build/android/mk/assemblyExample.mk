LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

SOURCE_PATH = $(LOCAL_PATH)/../../../source


## Arch-common settings
LOCAL_MODULE := assemblyExample

LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_CFLAGS +=  -D_LIB -DMULTICORE -fPIE -pie
LOCAL_LDFLAGS += -pie -fPIE


LOCAL_CFLAGS += -O2 

LOCAL_C_INCLUDES := $(SOURCE_PATH)/source 



libhevcd_srcs_c   +=  $(SOURCE_PATH)/main.c
libhevcd_srcs_c   +=  $(SOURCE_PATH)/primitives.c
libhevcd_srcs_c   +=  $(SOURCE_PATH)/common/sum.c
libhevcd_srcs_c   +=  $(SOURCE_PATH)/common/x86/asm-primitives.c

LOCAL_SRC_FILES := $(libhevcd_srcs_c) $(libhevcd_srcs_asm)


# Load the arch-specific settings


#include $(LOCAL_PATH)/decoder.x86.mk
#LOCAL_SRC_FILES += $(LOCAL_SRC_FILES_x86) 
#LOCAL_CFLAGS += $(LOCAL_CFLAGS_x86) 
#LOCAL_C_INCLUDES += $(LOCAL_C_INCLUDES_x86)

include $(BUILD_EXECUTABLE)


