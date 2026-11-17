# libxml2 - meson build; python bindings off (wayland-scanner only needs C).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dpython=false \
    -Dtests=false

ninja -C build
ninja -C build install
