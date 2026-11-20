# xdg-desktop-portal - the sandbox <-> desktop bridge every Flatpak app
# talks to (file chooser, document portal via fuse3, screenshots, ...).
# Image/sound validation runs sandboxed with bubblewrap (desktop-base).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dtests=disabled \
    -Ddocumentation=disabled \
    -Dman-pages=disabled \
    -Dgeoclue=enabled \
    -Dsystemd=enabled \
    -Dflatpak-interfaces=enabled \
    -Dsandboxed-image-validation=enabled \
    -Dsandboxed-sound-validation=enabled

ninja -C build
ninja -C build install
