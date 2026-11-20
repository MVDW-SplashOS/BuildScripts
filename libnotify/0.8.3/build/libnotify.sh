# libnotify - desktop notifications client (gnome-settings-daemon).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dman=false \
    -Dgtk_doc=false \
    -Ddocbook_docs=disabled \
    -Dintrospection=enabled

ninja -C build
ninja -C build install
