# xdg-dbus-proxy - filtering D-Bus proxy flatpak puts between sandboxed
# apps and the session/system bus.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dman=disabled \
    -Dtests=false

ninja -C build
ninja -C build install
