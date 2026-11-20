# hicolor-icon-theme - the fallback icon theme directory layout. AppImage
# integration copies icons into ~/.local/share/icons/hicolor, which only
# resolves if the base theme exists.
#
# Data-only meson project (installs index.theme and the empty size/context
# directories plus a pkgconfig file).
meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build
ninja -C build install
