# gnome-session - session manager (systemd user units for GNOME).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Ddocbook=false \
    -Dman=false

ninja -C build
ninja -C build install
