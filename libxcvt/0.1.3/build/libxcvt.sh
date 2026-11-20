# libxcvt - VESA CVT mode lines; Xwayland and Mutter need it.
meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build
ninja -C build install
