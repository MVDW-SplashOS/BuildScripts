# gnome-bluetooth 3 - Bluetooth library + UI. GNOME Shell's quick
# settings import the GnomeBluetooth typelib; Settings' Bluetooth panel
# needs gnome-bluetooth-ui-3.0. No send-to (needs BlueZ OBEX).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dsendto=false \
    -Dgtk_doc=false \
    -Dintrospection=true

ninja -C build
ninja -C build install
