# harfbuzz - meson build (C++). freetype integration enabled (installed
# before). glib integration must be enabled: gtk4's gtkmain.c includes
# <hb-glib.h> unconditionally and calls hb_glib_script_to_script().
# gobject stays off (nothing in the stack uses hb-gobject).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dfreetype=enabled \
    -Dglib=enabled \
    -Dgobject=disabled \
    -Dtests=disabled \
    -Ddocs=disabled \
    -Dbenchmark=disabled

ninja -C build
ninja -C build install
