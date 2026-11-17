# graphene - meson build (glib types)
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dintrospection=disabled

ninja -C build
ninja -C build install
