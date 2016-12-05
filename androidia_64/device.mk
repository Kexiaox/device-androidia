# ----------------- BEGIN MIX-IN DEFINITIONS -----------------
# Mix-In definitions are auto-generated by mixin-update
##############################################################
# Source: device/intel/mixins/groups/android_ia/default/product.mk
##############################################################
#Product Characteristics
PRODUCT_DIR := $(dir $(lastword $(filter-out device/common/%,$(filter device/%,$(ALL_PRODUCTS)))))

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.dalvik.vm.native.bridge=libhoudini.so

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_AAPT_CONFIG := normal large xlarge mdpi hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

DEVICE_PACKAGE_OVERLAYS += device/intel/android_ia/common/overlay

# Kernel
TARGET_KERNEL_ARCH := x86_64

KERNEL_MODULES_ROOT_PATH ?= /system/lib/modules
KERNEL_MODULES_ROOT ?= $(KERNEL_MODULES_ROOT_PATH)

TARGET_HAS_THIRD_PARTY_APPS := true

PRODUCT_PACKAGES += $(THIRD_PARTY_APPS)

FIRMWARES_DIR ?= device/intel/android_ia/firmware

# Include common settings.
FIRMWARE_FILTERS ?= .git/% %.mk

# Firmware
$(call inherit-product,device/intel/android_ia/common/firmware.mk)

# Get a list of languages.
$(call inherit-product,$(SRC_TARGET_DIR)/product/locales_full.mk)

# Get everything else from the parent package
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)

# Get some sounds
$(call inherit-product-if-exists,frameworks/base/data/sounds/AudioPackage6.mk)

# Get Platform specific settings
$(call inherit-product-if-exists,vendor/vendor.mk)

#Product Characteristics
PRODUCT_COPY_FILES += \
    $(if $(wildcard $(PRODUCT_DIR)fstab.$(TARGET_PRODUCT)),$(PRODUCT_DIR)fstab.$(TARGET_PRODUCT),$(LOCAL_PATH)/fstab):root/fstab.$(TARGET_PRODUCT) \
    $(if $(wildcard $(PRODUCT_DIR)init.$(TARGET_PRODUCT).rc),$(PRODUCT_DIR)init.$(TARGET_PRODUCT).rc,$(LOCAL_PATH)/init.rc):root/init.$(TARGET_PRODUCT).rc \
    $(if $(wildcard $(PRODUCT_DIR)ueventd.$(TARGET_PRODUCT).rc),$(PRODUCT_DIR)ueventd.$(TARGET_PRODUCT).rc,$(LOCAL_PATH)/ueventd.rc):root/ueventd.$(TARGET_PRODUCT).rc \

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Camera: Device-specific configuration files.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \

# Voip
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \

$(foreach sensor,accelerometer barometer compass gyroscope light stepcounter stepdetector proximity, \
$(eval PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.$(sensor).xml:system/etc/permissions/android.hardware.sensor.$(sensor).xml))

# Usb
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# NFC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# Gps
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \

# Touch
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \

# Midi
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

# APN list
PRODUCT_COPY_FILES += \
    device/sample/etc/old-apns-conf.xml:system/etc/old-apns-conf.xml \
    device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml

#Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \

# USB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \

#Firmware
SYMLINKS := $(subst $(FIRMWARES_DIR),$(TARGET_OUT)/lib/firmware,$(filter-out $(FIRMWARES_DIR)/$(FIRMWARE_FILTERS),$(shell find $(FIRMWARES_DIR) -type l)))

$(SYMLINKS): FW_PATH := $(FIRMWARES_DIR)
$(SYMLINKS):
	@link_to=`readlink $(subst $(TARGET_OUT)/lib/firmware,$(FW_PATH),$@)`; \
	echo "Symlink: $@ -> $$link_to"; \
	mkdir -p $(@D); ln -sf $$link_to $@

ALL_DEFAULT_INSTALLED_MODULES += $(SYMLINKS)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dateformat=MM-dd-yyyy \

# please modify to appropriate value based on tuning
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=24.0f \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=512

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    keyguard.no_require_sim=true \
    ro.com.android.dataroaming=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.arch=x86 \
    persist.rtc_local_time=1 \

# Enable MultiWindow
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.debug.multi_window=true

# ADBoverWIFI
PRODUCT_PROPERTY_OVERRIDES += \
    service.adb.tcp.port=5555

# DRM service
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Property to choose between virtual/external wfd display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.wfd.virtual=0

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=0 \
    persist.camera.HAL3.enabled=0 \
    persist.camera.ois.disable=0

# Camera: Format set up for graphics
PRODUCT_PROPERTY_OVERRIDES += ro.camera.pixel_format = 0x10F
PRODUCT_PROPERTY_OVERRIDES += ro.camera.rec.pixel_format = 0x100
PRODUCT_PROPERTY_OVERRIDES += ro.ycbcr.pixel_format = 0x10F

# Input resampling configuration
PRODUCT_PROPERTY_OVERRIDES += \
    ro.input.noresample=1

# set default USB configuration
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.handset.mic.type=digital \
    persist.audio.dualmic.config=endfire \
    persist.audio.fluence.voicecall=false \
    persist.audio.fluence.voicecomm=true \
    persist.audio.fluence.voicerec=true \
    persist.audio.fluence.speaker=true

# Audio logging property for audio driver
ifeq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_PROPERTY_OVERRIDES += persist.audio.log=2
else ifeq ($(TARGET_BUILD_VARIANT),userdebug)
PRODUCT_PROPERTY_OVERRIDES += persist.audio.log=1
else
PRODUCT_PROPERTY_OVERRIDES += persist.audio.log=0
endif

#Enable low latency stream
PRODUCT_PROPERTY_OVERRIDES += persist.audio.low_latency=1

# AOSP Packages
PRODUCT_PACKAGES += \
    Launcher3 \
    Terminal

PRODUCT_PACKAGES += \
    libion \
    libxml2

PRODUCT_PACKAGES += \
    libemoji

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    NotePad \
    Provision \
    camera.android_ia \
    drmserver \
    gps.default \
    lights.default \
    power.android_ia \
    scp \
    sensors.hsb \
    sftp \
    ssh \
    sshd

# Sensors
PRODUCT_PACKAGES += \
    sensorhubd      \
    libsensorhub    \
    AndroidCalibrationTool \

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Audio
PRODUCT_PACKAGES += \
    audio.r_submix.default \
    libauddriver \
    tinyplay \
    tinymix \
    tinycap \
    audio.primary.android_ia \
    audio.hdmi.android_ia \
    audio.a2dp.default \
    audio.usb.default \
    audio_policy.default \
    audio.r_submix.default \
    libasound
##############################################################
# Source: device/intel/mixins/groups/graphics/android_ia/product.mk
##############################################################
# Mesa
PRODUCT_PACKAGES += \
    libGLES_mesa \
    libGLES_android

PRODUCT_PACKAGES += \
    libdrm \
    libdrm_intel \
    libsync

PRODUCT_COPY_FILES += \
    device/intel/android_ia/common/graphics/drirc:system/etc/drirc


# HWComposer
PRODUCT_PACKAGES += \
    hwcomposer.drm

PRODUCT_PROPERTY_OVERRIDES += \
   hwc.drm.use_overlay_planes=1 \
   ro.hardware.hwcomposer=drm

#Gralloc
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.gralloc=drm

PRODUCT_PACKAGES += \
    gralloc.drm


# Mesa
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml

# GLES version
PRODUCT_PROPERTY_OVERRIDES += \
   ro.opengles.version=196609



##############################################################
# Source: device/intel/mixins/groups/media/android_ia/product.mk
##############################################################
# Audio/video codec support.
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    device/intel/android_ia/common/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/intel/android_ia/common/media/media_codecs.xml:system/etc/media_codecs.xml

#Enable deep buffer for video playback
PRODUCT_PROPERTY_OVERRIDES += media.stagefright.audio.deep=true

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true
##############################################################
# Source: device/intel/mixins/groups/device-type/tablet/product.mk
##############################################################
PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product,frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

PRODUCT_AAPT_CONFIG := normal large xlarge mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PROPERTY_OVERRIDES += \
   ro.sf.lcd_density=160


##############################################################
# Source: device/intel/mixins/groups/ethernet/dhcp/product.mk
##############################################################
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

# Ethernet
PRODUCT_PROPERTY_OVERRIDES += \
   net.eth0.startonboot=1

##############################################################
# Source: device/intel/mixins/groups/houdini/true/product.mk
##############################################################
PRODUCT_PACKAGES += libhoudini houdini
PRODUCT_PROPERTY_OVERRIDES += ro.dalvik.vm.isa.arm=x86 ro.enable.native.bridge.exec=1

ENABLE_NATIVEBRIDGE_64BIT := false
ifeq ($(BOARD_USE_64BIT_USERSPACE),true)
  ENABLE_NATIVEBRIDGE_64BIT = true
else
  ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
    ENABLE_NATIVEBRIDGE_64BIT = true
  endif
endif
ifeq ($(ENABLE_NATIVEBRIDGE_64BIT),true)
  PRODUCT_PACKAGES += houdini64
  PRODUCT_PROPERTY_OVERRIDES += ro.dalvik.vm.isa.arm64=x86_64 ro.enable.native.bridge.exec64=1
endif
##############################################################
# Source: device/intel/mixins/groups/adb_net/true/product.mk
##############################################################
# Enable Secure Debugging
ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
endif
##############################################################
# Source: device/intel/mixins/groups/kernel/android_ia/product.mk
##############################################################
TARGET_KERNEL_ARCH := x86_64
BOARD_USE_64BIT_KERNEL := true


KERNEL_MODULES_ROOT_PATH ?= /system/lib/modules
KERNEL_MODULES_ROOT ?= $(KERNEL_MODULES_ROOT_PATH)
##############################################################
# Source: device/intel/mixins/groups/bluetooth/btusb/product.mk
##############################################################
PRODUCT_PACKAGES += \
    audio.a2dp.default \
		ath3k-1.fw \

PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
		frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

ADDITIONAL_BUILD_PROPERTIES += bluetooth.hwcfg=stop \
                bluetooth.rfkill=1
# ------------------ END MIX-IN DEFINITIONS ------------------
