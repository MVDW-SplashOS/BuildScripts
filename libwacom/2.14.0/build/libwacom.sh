# libwacom - tablet database (Mutter, gnome-settings-daemon).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=disabled \
    -Ddocumentation=disabled

ninja -C build
ninja -C build install
