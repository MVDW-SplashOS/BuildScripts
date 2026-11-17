# libpng - meson build (zlib from the molecule base)
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false

ninja -C build
ninja -C build install
