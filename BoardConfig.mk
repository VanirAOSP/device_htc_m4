# Copyright (C) 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common msm8960
-include device/htc/msm8960-common/BoardConfigCommon.mk

# Include Path
TARGET_SPECIFIC_HEADER_PATH := device/htc/m4/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := m4
TARGET_BOARD_PLATFORM := msm8960

# Kernel
BOARD_KERNEL_BASE := 0x80600000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=m4 user_debug=31
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01600000
TARGET_KERNEL_CONFIG := m4_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/msm8960

# Audio
BOARD_USES_FLUENCE_INCALL := true # use DMIC in call only
BOARD_USES_SEPERATED_AUDIO_INPUT := true # use distinct voice recog/camcorder use cases
BOARD_USES_SEPERATED_VOICE_SPEAKER := true # use distinct voice speaker user case
BOARD_USES_SEPERATED_VOIP := true # use distinct VOIP use cases
BOARD_HAVE_HTC_CSDCLIENT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/m4/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/htc/m4/bluetooth/libbt_vndcfg.txt
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA_HARDWARE

# Graphics
TARGET_DISPLAY_INSECURE_MM_HEAP := true

# GPS
BOARD_HAVE_NEW_QC_GPS := true

# RIL
BOARD_PROVIDES_LIBRIL := true
COMMON_GLOBAL_CFLAGS += -DNEW_LIBRIL_HTC

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcm4334.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcm4334_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/firmware/fw_bcm4334_p2p.bin"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/firmware/fw_bcm4334.bin nvram_path=/system/etc/calibration.gpio4"
WIFI_DRIVER_MODULE_AP_ARG        := "firmware_path=/system/etc/firmware/fw_bcm4334_apsta.bin nvram_path=/system/etc/calibration.gpio4"
WIFI_BAND                        := 802_11_ABG

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p21: 000ffa00 00000200 "misc"
#mmcblk0p32: 00fffe00 00000200 "recovery"
#mmcblk0p31: 01000000 00000200 "boot"
#mmcblk0p33: 85fffc00 00000200 "system"
#mmcblk0p28: 00140200 00000200 "local"
#mmcblk0p34: 29fffe00 00000200 "cache"
#mmcblk0p35: 2d8000000 00000200 "userdata"
#mmcblk0p24: 01400000 00000200 "devlog"
#mmcblk0p26: 00040000 00000200 "pdata"
#mmcblk0p29: 00010000 00000200 "extra"
#mmcblk0p16: 02d00000 00000200 "radio"
#mmcblk0p17: 00a00000 00000200 "adsp"
#mmcblk0p15: 00100000 00000200 "dsps"
#mmcblk0p18: 00500000 00000200 "wcnss"
#mmcblk0p19: 007ffa00 00000200 "radio_config"
#mmcblk0p22: 00400000 00000200 "modem_st1"
#mmcblk0p23: 00400000 00000200 "modem_st2"
#mmcblk0p30: 01fffc00 00000200 "reserve"

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610611712
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13220446208
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VOLD_MAX_PARTITIONS := 36

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Recovery
TARGET_RECOVERY_FSTAB := device/htc/m4/rootdir/etc/fstab.m4
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_USERIMAGES_USE_EXT4 := true

# TWRP
DEVICE_RESOLUTION := 720x1280
TW_INCLUDE_DUMLOCK := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
TW_NO_USB_STORAGE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# inherit from the proprietary version
-include vendor/htc/m4/BoardConfigVendor.mk
