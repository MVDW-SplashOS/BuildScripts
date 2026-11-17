# freetype - meson build. zlib/bzip2/libpng from the molecule base.
# harfbuzz integration disabled here; harfbuzz is built afterwards and
# links against freetype (shaping direction).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dharfbuzz=disabled

ninja -C build
ninja -C build install
