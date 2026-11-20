# libpsl - Public Suffix List (libsoup3 hard dependency). Built-in list
# from the tarball; no runtime IDN library.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Druntime=no \
    -Dtests=false \
    -Ddocs=false

ninja -C build
ninja -C build install
