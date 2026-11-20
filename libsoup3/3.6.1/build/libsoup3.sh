# libsoup 3 - HTTP for geoclue, libgweather, EDS, gnome-software, shell.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dintrospection=enabled \
    -Dvapi=disabled \
    -Dgssapi=disabled \
    -Dntlm=disabled \
    -Dbrotli=disabled \
    -Dsysprof=disabled \
    -Ddocs=disabled \
    -Dtests=false \
    -Dautobahn=disabled \
    -Dpkcs11_tests=disabled \
    -Dtls_check=false

ninja -C build
ninja -C build install
