# at-spi2-core - accessibility bus + ATK + atk-bridge (merged since 2.46).
# GNOME Shell requires atk-bridge-2.0; GTK3 requires ATK.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dintrospection=enabled \
    -Dx11=enabled \
    -Dgtk2_atk_adaptor=false \
    -Ddocs=false \
    -Duse_systemd=true

ninja -C build
ninja -C build install
