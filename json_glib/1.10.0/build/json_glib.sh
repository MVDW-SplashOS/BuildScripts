# json-glib - JSON for GLib (with introspection: GNOME Shell imports it). Required by flatpak (and later by the GNOME
# session: xdg-desktop-portal, gnome-shell, ...), so it lives in the
# desktop-base layer.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dintrospection=enabled \
    -Ddocumentation=disabled \
    -Dman=false \
    -Dtests=false \
    -Dinstalled_tests=false

ninja -C build
ninja -C build install
