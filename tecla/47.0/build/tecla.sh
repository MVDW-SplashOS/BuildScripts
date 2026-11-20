# Tecla - keyboard layout viewer. Settings uses it via `dependency('tecla')`
# and otherwise falls back to a git subproject (network at build time),
# so it is packaged.
meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build
ninja -C build install
