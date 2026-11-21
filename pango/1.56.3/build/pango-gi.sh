# pango
# buildmode 2 (desktop-gnome): WITH introspection. Mode 1 is the
# bootloader edition's GI-less build and stays unchanged.
#
# -Dxft=disabled: libXft is not packaged, and nothing needs pangoxft:
# GTK3/GTK4 (X11 and Wayland), mutter and gnome-shell render text through
# pangoft2/pangocairo.
meson setup build-gi \
    --prefix=/usr \
    --buildtype=release \
    -Dbuild-testsuite=false \
    -Dbuild-examples=false \
    -Dintrospection=enabled \
    -Dxft=disabled

ninja -C build-gi
ninja -C build-gi install
