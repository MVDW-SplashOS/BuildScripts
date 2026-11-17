# xkeyboard-config - keymap data for libxkbcommon (meson, no C deps)
meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build
ninja -C build install
