# glib, buildmode 2 - rebuilt WITH introspection once gobject-introspection
# exists (the BLFS glib -> gobject-introspection -> glib cycle). GNOME
# Shell/gjs load GLib/GObject/Gio typelibs at runtime. Mode 1 (no GI)
# stays the bootloader edition's build.
meson setup build-gi \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dinstalled_tests=false \
    -Dman-pages=disabled \
    -Dselinux=disabled \
    -Dsysprof=disabled \
    -Ddocumentation=false \
    -Ddtrace=disabled \
    -Dsystemtap=disabled \
    -Dintrospection=enabled

ninja -C build-gi
ninja -C build-gi install
