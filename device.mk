#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/oculus/pacific

PRODUCT_PLATFORM := msm8996

# A/B OTA support
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    libsparse_static

PRODUCT_PACKAGES += \
    bootctrl.msm8996 \
    libgptutils

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Enable update engine sideloading by including the static version of the
# boot_control HAL and its dependencies.
PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.msm8996 \
    libgptutils \
    libz \
    libcutils
