# bubblewrap (bwrap) - the unprivileged sandbox flatpak runs every app
# in. Built as a separate package and used via flatpak's
# -Dsystem_bubblewrap, so it is not setuid: it relies on unprivileged
# user namespaces (CONFIG_USER_NS, enabled in the kernel fragment).
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dman=disabled \
    -Dselinux=disabled \
    -Dbash_completion=disabled \
    -Dzsh_completion=disabled \
    -Dtests=false

ninja -C build
ninja -C build install
