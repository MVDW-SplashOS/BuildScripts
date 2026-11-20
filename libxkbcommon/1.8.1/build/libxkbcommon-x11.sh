# libxkbcommon, buildmode 2 (desktop-gnome): WITH xkbcommon-x11, which
# Mutter requires. Mode 1 is the X-less bootloader build.
meson setup build-x11 \
    --prefix=/usr \
    --buildtype=release \
    -Denable-x11=true \
    -Denable-docs=false

ninja -C build-x11
ninja -C build-x11 install
