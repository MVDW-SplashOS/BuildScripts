# gdk-pixbuf, buildmode 2 - desktop build: PNG + JPEG/TIFF stay off (no
# libjpeg/libtiff in desktop-base), but WITH introspection: GdkPixbuf-2.0
# typelib is imported by GNOME Shell. Mode 1 is the bootloader build.
meson setup build-gi \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dinstalled_tests=false \
    -Ddocs=false \
    -Dintrospection=enabled \
    -Dgio_sniffing=false \
    -Dpng=enabled \
    -Djpeg=disabled \
    -Dtiff=disabled \
    -Dman=false

ninja -C build-gi
ninja -C build-gi install

gdk-pixbuf-query-loaders --update-cache || true
