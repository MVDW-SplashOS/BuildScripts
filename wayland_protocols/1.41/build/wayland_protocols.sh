# wayland-protocols - meson build (needs wayland-scanner from wayland)
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false

ninja -C build
ninja -C build install
