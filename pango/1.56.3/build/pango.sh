# pango - meson build. glib/harfbuzz/fribidi/cairo/fontconfig built before.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dintrospection=disabled

ninja -C build
ninja -C build install
