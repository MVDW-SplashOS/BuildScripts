# desktop-file-utils - desktop-file-validate/install and
# update-desktop-database. splash-appimage calls the latter after it drops
# an AppImage's .desktop file into ~/.local/share/applications.
#
# 0.28 is a meson project and needs glib/gio (built earlier in the base).
meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build
ninja -C build install
