# libxmlb - streaming XML indexer, hard dependency of appstream.
# lzma/zstd compression support is feature-auto and resolves against the
# base system's liblzma/libzstd; stemmer needs libstemmer (absent, and
# nothing in the stack uses stemmed search).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dgtkdoc=false \
    -Dintrospection=false \
    -Dstemmer=false

ninja -C build
ninja -C build install
