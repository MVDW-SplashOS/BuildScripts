# fuse3 - libfuse 3. The AppImage runtime uses fuse 2 (see fuse/2.9.9),
# but the Flatpak side needs fuse 3: xdg-desktop-portal's document portal
# and ostree's rofiles-fuse link libfuse3, and flatpak uses fusermount3.
# Both versions co-exist (different sonames and helper names).
#
# Comment out the udev/init-script install block (as BLFS does): the
# rules belong to systemd/udev and the SysV init script is not used.
sed -i '/^udev/,$ s/^/#/' util/meson.build

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dexamples=false

ninja -C build
ninja -C build install

# fusermount3 must be setuid root so unprivileged users can mount.
chmod u+s /usr/bin/fusermount3
