# UPower - power/battery service (GNOME Shell imports the UPowerGlib
# typelib; gnome-settings-daemon power plugin).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dgtk-doc=false \
    -Dman=false \
    -Didevice=disabled \
    -Dintrospection=enabled \
    -Dpolkit=enabled

ninja -C build
ninja -C build install
