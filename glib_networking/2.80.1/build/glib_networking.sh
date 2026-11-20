# glib-networking - GIO TLS module (gnutls); libsoup3 HTTPS needs it.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgnutls=enabled \
    -Dopenssl=disabled \
    -Dlibproxy=disabled \
    -Dgnome_proxy=enabled

ninja -C build
ninja -C build install
