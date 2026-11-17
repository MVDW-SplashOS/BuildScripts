# gdk-pixbuf - meson build. PNG loader only (the boot UI has no photos);
# no third-party image loaders, no introspection, no docs.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dinstalled_tests=false \
    -Ddocs=false \
    -Dintrospection=disabled \
    -Dpng=enabled \
    -Djpeg=disabled \
    -Dtiff=disabled \
    -Dman=false

ninja -C build
ninja -C build install
# Register the PNG loader cache so GTK finds it on the read-only root
gdk-pixbuf-query-loaders --update-cache || true
