# Cantarell - GNOME's UI font. Use the prebuilt OTFs shipped in the
# tarball: building them needs fontmake/psautohint (Python font toolchain).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Duseprebuilt=true \
    -Dbuildappstream=false

ninja -C build
ninja -C build install

fc-cache -f || true
