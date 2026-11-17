# cage - meson build (kiosk Wayland compositor wrapping splash-boot-manager)
# Requires wlroots-0.18 (the edition ships wlroots 0.18.2). scdoc is
# absent in the chroot; man-pages is a feature-auto option so the man
# pages are skipped. werror is a project default - disable it.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dwerror=false

ninja -C build
ninja -C build install
