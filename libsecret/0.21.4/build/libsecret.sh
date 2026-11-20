# libsecret - Secret Service client (EDS, GNOME Shell, gcr).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgtk_doc=false \
    -Dmanpage=false \
    -Dvapi=false \
    -Dintrospection=true \
    -Dbash_completion=disabled \
    -Dcrypto=libgcrypt

ninja -C build
ninja -C build install
