# graphene
# buildmode 2 (desktop-gnome): WITH introspection (Clutter/Mutter GIRs
# reference Graphene-1.0). Mode 1 is the
# bootloader edition's GI-less build and stays unchanged.
meson setup build-gi \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dinstalled_tests=false \
    -Dintrospection=enabled

ninja -C build-gi
ninja -C build-gi install
