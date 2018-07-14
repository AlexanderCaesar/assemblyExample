ARCH_ARM_HAVE_NEON := true

assemblyExample_inc_dir_arm   +=  $(SOURCE_PATH)/common/arm

assemblyExample_srcs_c_arm    +=  $(SOURCE_PATH)/common/arm/asm-primitives.c
assemblyExample_cflags_arm    += -DDISABLE_NEONINTR  -DARM -DARMGCC -fno-tree-vectorize

LOCAL_ARM_MODE         := arm

ifeq ($(ARCH_ARM_HAVE_NEON),true)
LOCAL_ARM_NEON := true   
assemblyExample_srcs_asm_arm   +=  $(SOURCE_PATH)/common/arm/sum-a.s

assemblyExample_cflags_arm += -DDEFAULT_ARCH=D_ARCH_ARM_A9Q
else
assemblyExample_cflags_arm += -DDISABLE_NEON -DDEFAULT_ARCH=D_ARCH_ARM_NONEON
endif

LOCAL_SRC_FILES_arm += $(assemblyExample_srcs_c_arm) $(assemblyExample_srcs_asm_arm)
LOCAL_C_INCLUDES_arm += $(assemblyExample_inc_dir_arm)
LOCAL_CFLAGS_arm += $(assemblyExample_cflags_arm)
