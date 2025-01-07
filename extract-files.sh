#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib/libMiCameraHal.so)
            [ "$2" = "" ] && return 0
            grep -q libpiex_shim.so "${2}" || "${PATCHELF}" --add-needed "libpiex_shim.so" "${2}"
            ;;
        vendor/lib/libmmcamera_faceproc.so)
            ${PATCHELF_0_18} --clear-symbol-version "__aeabi_memcpy" "${2}"
            ${PATCHELF_0_18} --clear-symbol-version "__aeabi_memset" "${2}"
            ${PATCHELF_0_18} --clear-symbol-version "__gnu_Unwind_Find_exidx" "${2}"
            [ "$2" = "" ] && return 0
            ;;
        vendor/lib/libVDSuperPhotoAPI.so)
            [ "$2" = "" ] && return 0
            "${PATCHELF_0_18}" --clear-symbol-version "remote_handle_close" "${2}"
            "${PATCHELF_0_18}" --clear-symbol-version "remote_handle_invoke" "${2}"
            "${PATCHELF_0_18}" --clear-symbol-version "remote_handle_open" "${2}"
            ;;
        vendor/lib64/hw/fingerprint.fpc.default.so)
            [ "$2" = "" ] && return 0
            patchelf --set-soname "fingerprint.fpc.default.so" "${2}"
            ;;
        vendor/lib64/hw/fingerprint.goodix.default.so)
            [ "$2" = "" ] && return 0
            patchelf --set-soname "fingerprint.goodix.default.so" "${2}"
            ;;
        *)
            return 1
            ;;
    esac
    return 0
}

function blob_fixup_dry() {
    blob_fixup "$1" ""
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=platina
export DEVICE_COMMON=sdm660-common
export VENDOR=xiaomi

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
