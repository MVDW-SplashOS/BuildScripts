# harfbuzz
# buildmode 2 (desktop-gnome): WITH introspection (HarfBuzz-0.0 GIR is a
# dependency of the Pango GIR). Mode 1 is the
# bootloader edition's GI-less build and stays unchanged.
#
# -Dcairo=disabled: cairo is built after harfbuzz (cairo's own font
# stack needs freetype/fontconfig first), and harfbuzz only uses it for
# the hb-view utility (not built) and the harfbuzz-cairo library, which
# nothing in the system links against.
meson setup build-gi \
    --prefix=/usr \
    --buildtype=release \
    -Dfreetype=enabled \
    -Dglib=enabled \
    -Dgobject=enabled \
    -Dintrospection=enabled \
    -Dcairo=disabled \
    -Dtests=disabled \
    -Ddocs=disabled \
    -Dbenchmark=disabled \
    -Dutilities=disabled

ninja -C build-gi
ninja -C build-gi install
