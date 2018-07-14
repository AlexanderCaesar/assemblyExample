LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

SOURCE_PATH = $(LOCAL_PATH)/../../../source


## Arch-common settings
LOCAL_MODULE := assemblyExample

LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_CFLAGS +=  -D_LIB -DMULTICORE -fPIE -pie
LOCAL_LDFLAGS += -pie -fPIE


LOCAL_CFLAGS += -O2 -DANDROID

LOCAL_C_INCLUDES := $(SOURCE_PATH)/



assemblyExample_srcs_c   +=  $(SOURCE_PATH)/main.c
assemblyExample_srcs_c   +=  $(SOURCE_PATH)/primitives.c
assemblyExample_srcs_c   +=  $(SOURCE_PATH)/common/sum.c


LOCAL_SRC_FILES := $(assemblyExample_srcs_c)


# Load the arch-specific settings


include $(LOCAL_PATH)/assemblyExample.arm.mk
LOCAL_SRC_FILES += $(LOCAL_SRC_FILES_arm)
LOCAL_CFLAGS += $(LOCAL_CFLAGS_arm)
LOCAL_C_INCLUDES += $(LOCAL_C_INCLUDES_arm)

include $(BUILD_EXECUTABLE)


