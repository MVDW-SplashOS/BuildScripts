# Xwayland - X11 compatibility for Mutter (X11 apps). glamor on GBM/EGL;
# the keymap cache lives on the persistent /var.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dxvfb=false \
    -Dxkb_output_dir=/var/lib/xkb \
    -Ddocs=false \
    -Ddevel-docs=false \
    -Ddocs-pdf=false \
    -Dlibdecor=false \
    -Dsecure-rpc=false \
    -Dxselinux=false \
    -Dglamor=true

ninja -C build
ninja -C build install
