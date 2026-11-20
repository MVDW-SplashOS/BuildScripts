# Adwaita icon theme (GNOME default).
meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build
ninja -C build install

gtk-update-icon-cache -qtf /usr/share/icons/Adwaita || true
