# libxkbcommon - meson build. X11 support off (wayland boot manager);
# xkeyboard-config supplies the keymap data at runtime (XKB_CONFIG_ROOT).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Denable-x11=false \
    -Denable-docs=false \
    -Denable-tests=false

ninja -C build
ninja -C build install
