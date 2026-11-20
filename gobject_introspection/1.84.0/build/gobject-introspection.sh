# gobject-introspection - g-ir-scanner/g-ir-compiler + the GIRs of the
# GLib family. Needed for the typelibs GNOME Shell (gjs) runs on.
#
# buildmode 1 (desktop-base): cairo is not built yet, so no cairo GIR.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dcairo=disabled \
    -Ddoctool=disabled \
    -Dgtk_doc=false

ninja -C build
ninja -C build install
