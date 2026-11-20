# gnome-settings-daemon. No CUPS/smartcard/WWAN/USBGuard plugins yet.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dcups=false \
    -Dsmartcard=false \
    -Dwwan=false \
    -Dusb-protection=false \
    -Dcolord=true \
    -Dnetwork_manager=true \
    -Drfkill=true \
    -Dsystemd=true \
    -Dgcr3=false

ninja -C build
ninja -C build install
