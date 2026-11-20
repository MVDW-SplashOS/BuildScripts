# xdg-desktop-portal-gnome - GNOME implementation of the portals.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dsystemd=enabled

ninja -C build
ninja -C build install
