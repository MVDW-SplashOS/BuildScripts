# GNOME Console (kgx) - GTK4/libadwaita terminal (gnome-terminal 3.54 is
# GTK3 and no longer on download.gnome.org).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false

ninja -C build
ninja -C build install
