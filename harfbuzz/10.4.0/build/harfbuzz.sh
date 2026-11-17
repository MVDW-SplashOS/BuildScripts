# harfbuzz - meson build (C++). freetype integration enabled (installed
# before); glib/gobject extras off - pango only needs the core shaping API.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dfreetype=enabled \
    -Dglib=disabled \
    -Dgobject=disabled \
    -Dtests=disabled \
    -Ddocs=disabled \
    -Dbenchmark=disabled

ninja -C build
ninja -C build install
