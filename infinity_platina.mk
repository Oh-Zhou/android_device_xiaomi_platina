#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Infinity-X stuff
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)
INFINITY_BUILD_TYPE := UNOFFICIAL
WITH_GAPPS := true
INFINITY_MAINTAINER := SABAR

TARGET_BOOT_ANIMATION_RES := 1080
TARGET_HAS_UDFPS := false
TARGET_SCREEN_WIDTH := 1080
TARGET_BUILD_DEVICE_AS_WEBCAM := true
TARGET_SUPPORTS_BLUR := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_QUICK_TAP := false
TARGET_DISABLE_EPPE := false

# Inherit from device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := platina
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := infinity_platina
PRODUCT_MODEL := MI 8 Lite

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="platina-user 10 QKQ1.190910.002 V12.0.3.0.QDTMIXM release-keys" \
    BuildFingerprint=Xiaomi/platina/platina:10/QKQ1.190910.002/V12.0.3.0.QDTMIXM:user/release-keys \
    DeviceProduct=platina
