# tiff - autotools build. gtk4's meson.build requires libtiff unconditionally
# (dependency('libtiff-4', 'tiff')) for its built-in TIFF image loader.
# 4.4.0 is the last release with an autotools build (4.5+ is cmake-only and
# the chroot has no cmake); it installs libtiff-4.pc, the exact name gtk4
# looks up. Builds after jpeg so the JPEG-in-TIFF support is picked up.
./configure --prefix=/usr \
    --disable-static

make
make install
