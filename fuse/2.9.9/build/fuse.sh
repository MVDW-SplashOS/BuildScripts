# fuse 2.9.9 - libfuse2, required by the AppImage runtime (type-2
# AppImages mount their SquashFS payload through FUSE). Build the shared
# library and the fusermount helper only; examples are not shipped.
#
# --disable-mtab: keep fusermount from maintaining /etc/mtab. The OS root
# is read-only (see the desktop edition), and libfuse falls back to
# /proc/self/mounts, which is what modern systems use anyway.

# glibc >= 2.34 declares closefrom() in unistd.h; ulockmgr_server defines
# its own static closefrom() with another signature and fails to compile
# ("conflicting types for 'closefrom'"). Rename the local helper.
sed -i 's/\bclosefrom\b/fuse_closefrom/g' util/ulockmgr_server.c

./configure --prefix=/usr \
    --disable-static \
    --disable-example \
    --disable-mtab \
    --enable-lib \
    --enable-util

make
make install

# The SysV init script is useless on systemd (the fuse module autoloads
# when /dev/fuse is opened, and fuse3 already mounts fusectl).
rm -f /etc/init.d/fuse
rmdir --ignore-fail-on-non-empty /etc/init.d 2>/dev/null || true
