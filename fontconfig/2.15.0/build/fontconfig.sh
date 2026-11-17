# fontconfig - meson build. expat from the molecule base.
# No XML docs (no docbook toolchain) and no tests.
meson setup build \
    --prefix=/usr \
    --sysconfdir=/etc \
    --buildtype=release \
    -Ddoc=disabled \
    -Dtests=disabled \
    -Dcache-dir=/var/cache/fontconfig

ninja -C build
ninja -C build install
