# WirePlumber - PipeWire session/policy manager.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dsystem-lua=true \
    -Dintrospection=disabled \
    -Ddoc=disabled \
    -Dtests=false \
    -Ddbus-tests=false \
    -Dsystemd-user-service=true \
    -Delogind=disabled

ninja -C build
ninja -C build install
