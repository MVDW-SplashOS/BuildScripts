# glib - meson build. pcre2/libffi/zlib come from the molecule base.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dinstalled_tests=false \
    -Dman-pages=disabled \
    -Dselinux=disabled \
    -Dsysprof=disabled \
    -Dintrospection=disabled \
    -Ddocumentation=false \
    -Ddtrace=false \
    -Dsystemtap=false

ninja -C build
ninja -C build install
