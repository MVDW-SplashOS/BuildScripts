# wlroots - meson build. Session backend: seatd (libseat). Renderers:
# GLES2 only (mesa softpipe provides libGLESv2). DRM + headless backends;
# x11 and xwayland excluded (wayland-only boot manager).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Drenderers=gles2 \
    -Dbackends=drm,headless \
    -Dxwayland=disabled \
    -Dexamples=false

ninja -C build
ninja -C build install
