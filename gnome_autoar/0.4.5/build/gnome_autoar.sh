# gnome-autoar - archive (de)compression for Nautilus (libarchive).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgtk=true \
    -Dvapi=false \
    -Dtests=false \
    -Dgtk_doc=false \
    -Dintrospection=enabled

ninja -C build
ninja -C build install
