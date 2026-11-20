# pango
# buildmode 2 (desktop-gnome): WITH introspection, Xft support (GTK3 X11). Mode 1 is the
# bootloader edition's GI-less build and stays unchanged.
meson setup build-gi \
    --prefix=/usr \
    --buildtype=release \
    -Dbuild-testsuite=false \
    -Dbuild-examples=false \
    -Dintrospection=enabled \
    -Dxft=enabled

ninja -C build-gi
ninja -C build-gi install
