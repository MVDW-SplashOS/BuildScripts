# libepoxy - meson build. Hard requirement of gtk4 (dependency('epoxy')),
# provides the GL/EGL dispatch library the GTK GL renderer loads through.
# The egl/glx options are old-style combos (auto/yes/no), not features.
# Wayland-only boot manager: EGL yes, GLX and X11 no.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Degl=yes \
    -Dglx=no \
    -Dx11=false \
    -Dtests=false \
    -Ddocs=false

ninja -C build
ninja -C build install
