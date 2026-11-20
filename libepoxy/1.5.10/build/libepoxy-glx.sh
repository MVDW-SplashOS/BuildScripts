# libepoxy, buildmode 2 (desktop-gnome): EGL + GLX/X11 dispatch (GTK3,
# Xwayland glamor). Mode 1 is the EGL-only bootloader build.
meson setup build-glx \
    --prefix=/usr \
    --buildtype=release \
    -Degl=yes \
    -Dglx=yes \
    -Dx11=true \
    -Dtests=false \
    -Ddocs=false

ninja -C build-glx
ninja -C build-glx install
