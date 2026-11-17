# wlroots - meson build. Session backend: seatd (libseat). Renderer:
# GLES2 only (mesa provides libGLESv2). DRM + libinput backends - the
# headless backend is compiled in unconditionally in 0.18 (not a meson
# choice), and x11/wayland are excluded (wayland-only boot manager).
# libinput must be in the backends LIST (it is an array choice, not a
# boolean): 'backends=drm' compiles the libinput backend OUT and cage
# dies with 'Cannot create libinput backend: disabled at compile-time'.
#
# cage 0.2.0 targets the wlroots-0.18 API, so the edition uses 0.18.2.
#
# werror is a project default here and turns every warning into a hard
# error - too fragile across compiler versions, so disable it.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dwerror=false \
    -Drenderers=gles2 \
    -Dbackends=drm,libinput \
    -Dxwayland=disabled \
    -Dexamples=false

ninja -C build
ninja -C build install
