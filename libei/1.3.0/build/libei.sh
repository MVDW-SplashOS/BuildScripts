# libei - emulated input (Mutter: remote desktop / portal input capture).
# Needs Python attrs + jinja2 at build time (protocol scanner).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=disabled \
    -Ddocumentation=[] \
    -Dsd-bus-provider=libsystemd

ninja -C build
ninja -C build install
