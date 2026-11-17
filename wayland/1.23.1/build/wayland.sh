# wayland - meson build. libxml2 is required for wayland-scanner.
# Documentation needs doxygen: off.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Ddocumentation=false \
    -Dtests=false \
    -Ddtd_validation=false

ninja -C build
ninja -C build install
