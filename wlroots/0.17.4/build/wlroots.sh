# wlroots - meson build. Session backend: seatd (libseat). Renderer:
# GLES2 only (mesa provides libGLESv2). DRM backend only - the headless
# backend is compiled in unconditionally in 0.17 (not a meson choice),
# and x11/xwayland are excluded (wayland-only boot manager).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Drenderers=gles2 \
    -Dbackends=drm \
    -Dxwayland=disabled \
    -Dexamples=false

ninja -C build
ninja -C build install
