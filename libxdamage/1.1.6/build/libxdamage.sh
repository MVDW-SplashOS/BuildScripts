# X11 client library for Xwayland/Mutter/GTK3 (BLFS Xorg libraries).
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static

make
make install
