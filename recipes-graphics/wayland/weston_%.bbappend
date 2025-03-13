LICENSE_FLAGS = ""
LICENSE = "MIT"

FILESEXTRAPATHS:prepend := "${THISDIR}/weston-launch:"
FILESPATH =+ "${WORKSPACE}:"

SRC_URI:append:qcom = "   file://weston.png \
              file://weston.desktop \
              file://xwayland.weston-start \
              file://systemd-notify.weston-start"

DEPENDS:append:qcom-custom-bsp = " property-vault virtual/libgbm"
RDEPENDS:${PN}:append:qcom-custom-bsp = " property-vault libgbm"

EXTRA_OEMESON += "-Dbackend-default=auto -Dbackend-rdp=false"

RRECOMMENDS:${PN} = "weston-launch liberation-fonts"

REQUIRED_DISTRO_FEATURES:remove:qcom = "opengl"

# select compositor, enable simple and demo clients and enable EGL
PACKAGECONFIG:qcom = " \
                 egl \
                 clients \
                 shell-desktop \
                 screenshare \
                 shell-fullscreen \
                 shell-ivi \
                 image-jpeg \
                 "

PACKAGECONFIG:append:qcm6490 = "kms"
PACKAGECONFIG:append:qcs9100 = "kms"
PACKAGECONFIG:append:qcs8300 = "kms"
PACKAGECONFIG:append:qcs615  = "kms"

FILES:${PN} += "${bindir}/*"
FILES:${PN} += " ${libdir}/*.so"
FILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini"
