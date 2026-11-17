# libpng - autotools build. The 1.6.4x release tarballs no longer ship a
# meson.build (only CMake + autotools), so configure is the build system.
# zlib comes from the molecule base.
./configure --prefix=/usr

make
make install
