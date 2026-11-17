# cage - meson build (kiosk Wayland compositor wrapping splash-boot-manager)
meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build
ninja -C build install
