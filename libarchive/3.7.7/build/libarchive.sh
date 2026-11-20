# libarchive - required by flatpak (bundles, extra-data) and used by
# ostree to import tarballs.
./configure --prefix=/usr --disable-static

make
make install
