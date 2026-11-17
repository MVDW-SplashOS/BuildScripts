# libdisplay-info - EDID/DisplayID parsing library; wlroots' DRM backend
# requires it (the git-wrap fallback can't work in the chroot). Pure
# meson build with no options; it generates its PNP id table from
# hwdata's pnp.ids (installed earlier in this edition).
meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build
ninja -C build install
