# cairo - meson build. X11/xcb backends disabled (wayland-only boot
# manager); image + freetype/fontconfig/png is what GTK and libadwaita need.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dpng=enabled \
    -Dfontconfig=enabled \
    -Dfreetype=enabled \
    -Dgl-backend=disabled \
    -Dxcb=disabled \
    -Dxlib=disabled \
    -Dxlib-xcb=disabled \
    -Dxcb-shm=disabled

ninja -C build
ninja -C build install
