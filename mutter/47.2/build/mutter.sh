# Mutter - Wayland compositor / window manager library of GNOME Shell.
# Native (KMS) backend, Xwayland, remote desktop (PipeWire + libei).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=disabled \
    -Dcogl_tests=false \
    -Dclutter_tests=false \
    -Dmutter_tests=false \
    -Dinstalled_tests=false \
    -Dprofiler=false \
    -Ddocs=false \
    -Degl_device=false \
    -Dwayland_eglstream=false \
    -Dlibdisplay_info=enabled \
    -Dintrospection=true

ninja -C build
ninja -C build install
