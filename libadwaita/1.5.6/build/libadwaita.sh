# libadwaita - meson build (gtk4 built before). Release tarball ships the
# precompiled theme css; no sassc needed. No introspection/tests/docs.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dexamples=false \
    -Dintrospection=disabled \
    -Dvapi=false \
    -Dgtk_doc=false \
    -Dman=true

ninja -C build
ninja -C build install
