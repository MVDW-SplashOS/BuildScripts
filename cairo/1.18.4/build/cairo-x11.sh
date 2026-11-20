# cairo, buildmode 2 (desktop-gnome): WITH the Xlib/XCB surfaces. GTK3's
# and GTK4's X11 backends (Xwayland apps, Mutter's X11 frames) need
# cairo-xlib. Mode 1 is the X-less bootloader build.
meson setup build-x11 \
    --prefix=/usr \
    --buildtype=release \
    -Dpng=enabled \
    -Dfontconfig=enabled \
    -Dfreetype=enabled \
    -Dxcb=enabled \
    -Dxlib=enabled \
    -Dxlib-xcb=enabled \
    -Dglib=enabled \
    -Dtests=disabled \
    -Dgtk_doc=false

ninja -C build-x11
ninja -C build-x11 install
