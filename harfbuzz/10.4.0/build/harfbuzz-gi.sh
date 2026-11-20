# harfbuzz
# buildmode 2 (desktop-gnome): WITH introspection (HarfBuzz-0.0 GIR is a
# dependency of the Pango GIR). Mode 1 is the
# bootloader edition's GI-less build and stays unchanged.
meson setup build-gi \
    --prefix=/usr \
    --buildtype=release \
    -Dfreetype=enabled \
    -Dglib=enabled \
    -Dgobject=enabled \
    -Dintrospection=enabled \
    -Dcairo=enabled \
    -Dtests=disabled \
    -Ddocs=disabled \
    -Dbenchmark=disabled \
    -Dutilities=disabled

ninja -C build-gi
ninja -C build-gi install
