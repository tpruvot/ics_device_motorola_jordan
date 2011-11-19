# Copyright (C) 2011 The Android Open Source Project
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

JORDAN_DEVICE := device/ti/jordan

#key layouts, names must fit the ones in /proc/bus/input/devices, qwerty.kl is the fallback one.
PRODUCT_COPY_FILES += \
	${JORDAN_DEVICE}/prebuilt/usr/qwerty.kl:system/usr/keylayout/qwerty.kl \
	${JORDAN_DEVICE}/prebuilt/usr/qwerty.kl:system/usr/keylayout/qtouch-touchscreen.kl \
	${JORDAN_DEVICE}/prebuilt/usr/keypad.kl:system/usr/keylayout/sholes-keypad.kl \
	${JORDAN_DEVICE}/prebuilt/usr/keypad.kl:system/usr/keylayout/umts_jordan-keypad.kl \
	${JORDAN_DEVICE}/prebuilt/usr/cpcap.kl:system/usr/keylayout/cpcap-key.kl \
	${JORDAN_DEVICE}/prebuilt/bin/recovery:system/bootmenu/recovery/sbin/recovery_stable \
	${JORDAN_DEVICE}/prebuilt/bin/busybox:system/bootmenu/binary/busybox \

