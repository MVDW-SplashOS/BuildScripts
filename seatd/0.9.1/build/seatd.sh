# seatd - meson build. Session/seat management for the kiosk compositor
# (no systemd/logind on the bootmanager, so seatd it is).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=false \
    -Dexamples=false \
    -Dman-pages=disabled

ninja -C build
ninja -C build install
