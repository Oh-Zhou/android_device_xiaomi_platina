#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Evolution-X stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SCREEN_WIDTH := 1080
TARGET_BUILD_DEVICE_AS_WEBCAM := true
TARGET_ENABLE_BLUR := false
TARGET_USES_PICO_GAPPS := true

# Inherit from device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := platina
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_NAME := lineage_platina
PRODUCT_MODEL := MI 8 Lite

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="platina-user 10 QKQ1.190910.002 V12.0.3.0.QDTMIXM release-keys" \
    BuildFingerprint=Xiaomi/platina/platina:10/QKQ1.190910.002/V12.0.3.0.QDTMIXM:user/release-keys \
    DeviceProduct=platina
