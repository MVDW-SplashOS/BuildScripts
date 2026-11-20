# TinySPARQL (formerly tracker) - Nautilus hard-requires tracker-sparql-3.0.
# The localsearch indexer is not installed yet (Nautilus search falls
# back to its own crawler).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Ddocs=false \
    -Dman=false \
    -Dtests=false \
    -Dvapi=disabled \
    -Dintrospection=enabled \
    -Dsystemd_user_services=true \
    -Dbash_completion=false \
    -Davahi=disabled \
    -Dstemmer=disabled \
    -Dunicode_support=icu

ninja -C build
ninja -C build install
