# cage - meson build (kiosk Wayland compositor wrapping splash-boot-manager)
# Requires wlroots-0.18 (the edition ships wlroots 0.18.2). scdoc is
# absent in the chroot; man-pages is a feature-auto option so the man
# pages are skipped. werror is a project default - disable it.
#
# xdg-shell-initial-configure-1.patch: cage 0.2.0 schedules the kiosk's
# initial maximize configure while the client's xdg_surface is still
# uninitialized, so it never reaches the client - GTK 4.16 maps at 0x0,
# renders its first frame and aborts ('Unable to create Cairo image
# surface: invalid value (typically too big)'). Schedule the initial
# configure explicitly (ported from upstream commits 0f0c637a06 /
# 5f83b27d62 / 350e2ef8b9; fixed properly in cage 0.3.x, which requires
# wlroots 0.20).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dwerror=false

ninja -C build
ninja -C build install
