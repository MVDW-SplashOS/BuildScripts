# GSound - GObject wrapper around libcanberra (Settings Sound panel,
# gnome-bluetooth).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Denable_vala=false \
    -Dintrospection=true \
    -Dgtk_doc=false

ninja -C build
ninja -C build install
