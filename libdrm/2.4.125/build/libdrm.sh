# libdrm - meson build. Only the generic + core APIs are needed (virtio-gpu
# is exposed through the drm core); the hardware-specific backends and the
# man page xslt are disabled.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Damdgpu=disabled \
    -Dintel=disabled \
    -Dradeon=disabled \
    -Dnouveau=disabled \
    -Dvmwgfx=disabled \
    -Dtests=false

ninja -C build
ninja -C build install
