# libgusb - GObject libusb wrapper (colord). USB ids come from hwdata.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dvapi=false \
    -Ddocs=false \
    -Dintrospection=true \
    -Dumockdev=disabled

ninja -C build
ninja -C build install
