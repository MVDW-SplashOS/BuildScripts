# libevdev - meson build
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=disabled \
    -Ddocumentation=disabled

ninja -C build
ninja -C build install
