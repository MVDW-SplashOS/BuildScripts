# gjs - GNOME JavaScript bindings (GNOME Shell, gnome-extensions).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dprofiler=disabled \
    -Dinstalled_tests=false \
    -Dskip_dbus_tests=true \
    -Dskip_gtk_tests=true

ninja -C build
ninja -C build install
