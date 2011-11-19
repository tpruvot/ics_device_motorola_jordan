#
# Copyright (C) 2011 The Android Open-Source Project
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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/ti/jordan/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel \
	device/ti/jordan/init.mapphone_umts.rc:root/init.mapphone_umts.rc \
	device/ti/jordan/init.usb.rc:root/init.usb.rc \
	device/ti/jordan/ueventd.rc:root/ueventd.rc \
	device/ti/jordan/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_PACKAGES := \
	com.android.future.usb.accessory

PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=tiwlan0 \
	hwui.render_dirty_regions=false

DEVICE_PACKAGE_OVERLAYS := \
	device/ti/jordan/overlay

#HWC Hal
PRODUCT_PACKAGES += \
	hwcomposer.default

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \

PRODUCT_PACKAGES += \
	audio.primary.jordan \
	audio.a2dp.default \
	libaudioutils

PRODUCT_PACKAGES += \
	dhcpcd.conf \
	TQS_D_1.7.ini \
	calibrator

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	make_ext3fs \

# External projects
PRODUCT_PACKAGES += \
	static_busybox \
	bootmenu \

# Our blobs...
$(call inherit-product-if-exists, device/ti/jordan/prebuilt.mk)

$(call inherit-product-if-exists, vendor/ti/jordan/device-vendor.mk)
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/ti/proprietary/omap3/ti-omap3-vendor.mk)
$(call inherit-product-if-exists, vendor/ti/proprietary/wl12xx/ti-wl12xx-vendor.mk)
