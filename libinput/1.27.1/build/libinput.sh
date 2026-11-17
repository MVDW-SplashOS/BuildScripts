# libinput - meson build. libudev from eudev, libevdev + mtdev built before.
# No libwacom (extra deps), no graphical debug tools, no tests/docs.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dlibwacom=false \
    -Ddebug-gui=false \
    -Dtests=false \
    -Ddocumentation=false

ninja -C build
ninja -C build install
