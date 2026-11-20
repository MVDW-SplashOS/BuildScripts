# GNOME Settings (gnome-control-center). All panels, including Printers
# (CUPS + Samba), Online Accounts, WWAN, Bluetooth, Wacom. No Snap,
# no malcontent parental controls.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dsnap=false \
    -Dmalcontent=false \
    -Dibus=true \
    -Dtests=false \
    -Ddocumentation=false \
    -Dlocation-services=enabled \
    -Dprivileged_group=wheel

ninja -C build
ninja -C build install

glib-compile-schemas /usr/share/glib-2.0/schemas
