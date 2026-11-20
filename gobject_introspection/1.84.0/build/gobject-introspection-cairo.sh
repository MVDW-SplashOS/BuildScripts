# gobject-introspection - g-ir-scanner/g-ir-compiler + the GIRs of the
# GLib family. Needed for the typelibs GNOME Shell (gjs) runs on.
#
# buildmode 2 (desktop-gnome): rebuilt after cairo so cairo-1.0.gir/
# typelib exist (gjs and GNOME Shell import cairo).
meson setup build-cairo \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dcairo=enabled \
    -Ddoctool=disabled \
    -Dgtk_doc=false

ninja -C build-cairo
ninja -C build-cairo install
