# D-Bus uses meson since 1.16; there is no autoconf configure anymore (LFS 8.78)
mkdir build
cd    build

meson setup --prefix=/usr --buildtype=release --wrap-mode=nofallback ..

ninja
ninja install

ln -sfv /etc/machine-id /var/lib/dbus