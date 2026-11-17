# libliftoff - meson build (KMS plane offloader used by wlroots)
meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build
ninja -C build install
