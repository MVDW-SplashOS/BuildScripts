# libgudev - GObject udev bindings (libwacom, Mutter, gsd, upower, colord).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dintrospection=enabled \
    -Dvapi=disabled \
    -Dtests=disabled \
    -Dgtk_doc=false

ninja -C build
ninja -C build install
