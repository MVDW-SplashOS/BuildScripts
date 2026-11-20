# fuse 2.9.9 - libfuse2, required by the AppImage runtime (type-2
# AppImages mount their SquashFS payload through FUSE). Build the shared
# library and the fusermount helper only; examples are not shipped.
#
# --disable-mtab: keep fusermount from maintaining /etc/mtab. The OS root
# is read-only (see the desktop edition), and libfuse falls back to
# /proc/self/mounts, which is what modern systems use anyway.
./configure --prefix=/usr \
    --disable-static \
    --disable-example \
    --disable-mtab \
    --enable-lib \
    --enable-util

make
make install
