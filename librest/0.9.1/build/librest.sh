# librest (rest-1.0) - RESTful web API client library on libsoup3;
# GNOME Online Accounts uses it for its OAuth/OAuth2 providers. No
# examples, tests or gtk-doc; introspection on (GOA's typelibs need it).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dexamples=false \
    -Dtests=false \
    -Dgtk_doc=false \
    -Dvapi=false \
    -Dintrospection=true

ninja -C build
ninja -C build install
