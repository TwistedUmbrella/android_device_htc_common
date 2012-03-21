ifeq ($(BOARD_USES_HTC_CAMERA),true)

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := htccamera.cpp

LOCAL_C_INCLUDES := frameworks/base/services \
                    frameworks/base/include \
                    hardware/libhardware/include \
                    hardware/qcom/display/libgralloc

LOCAL_SHARED_LIBRARIES := liblog libutils libcutils libbinder
LOCAL_SHARED_LIBRARIES += libui libhardware libcamera_client
LOCAL_SHARED_LIBRARIES += libcamera
LOCAL_PRELINK_MODULE := false

ifeq ($(TARGET_BOARD_PLATFORM),msm7x30)
    LOCAL_CFLAGS += -DTARGET7x30
endif
ifeq ($(TARGET_BOARD_PLATFORM),qsd8k)
    LOCAL_CFLAGS += -DTARGET8x50
endif
ifeq ($(TARGET_BOARD_PLATFORM),msm8660)
    LOCAL_CFLAGS += -DTARGET8x60
endif
ifeq ($(BOARD_HAVE_HTC_FFC), true)
    LOCAL_CFLAGS += -DHTC_FFC
endif
ifeq ($(BOARD_FFC_HAS_OFFSET), true)
    LOCAL_CFLAGS += -DOFFSET_FFC
endif
ifeq ($(BOARD_USE_REVERSE_FFC), true)
    LOCAL_CFLAGS += -DREVERSE_FFC
endif
ifeq ($(TARGET_USE_CAF_PARAMS), true)
    LOCAL_CFLAGS += -DCAF_PARAMS
endif
ifeq ($(CAMERA_CONVERT_COLORS),true)
    LOCAL_CFLAGS += -DCPU_COLOR_CONVERT
endif

include $(BUILD_SHARED_LIBRARY)

endif