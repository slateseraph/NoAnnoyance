THEOS_DEVICE_IP = 192.168.1.247

TARGET = iphone:clang::7.0

include theos/makefiles/common.mk

# this is baaad
THEOS_INCLUDE_PATH = include -I /opt/theos/include

export ARCHS = armv7 armv7s arm64

TWEAK_NAME = NoAnnoyance
NoAnnoyance_FILES = Tweak.xm
NoAnnoyance_FRAMEWORKS = CoreFoundation UIKit
NoAnnoyance_LDFLAGS = -lMobileGestalt

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += noannoyanceprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
