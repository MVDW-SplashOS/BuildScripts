# GStreamer core - xdg-desktop-portal requires gstreamer-pbutils (sound/
# media validation); Nautilus uses it for media metadata.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dexamples=disabled \
    -Dtests=disabled \
    -Dbenchmarks=disabled \
    -Ddoc=disabled \
    -Dlibunwind=disabled \
    -Dlibdw=disabled \
    -Dintrospection=enabled \
    -Dbash-completion=disabled \
    -Dptp-helper=disabled \
    -Dpackage-origin=https://splashos.com

ninja -C build
ninja -C build install
