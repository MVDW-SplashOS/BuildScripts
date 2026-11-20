# xorgproto - X11 protocol headers.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dlegacy=false

ninja -C build
ninja -C build install
