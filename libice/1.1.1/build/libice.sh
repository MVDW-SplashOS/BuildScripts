# X11 client library for Xwayland/Mutter/GTK3 (BLFS Xorg libraries).
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --disable-specs \
    --disable-devel-docs \
    ICE_LIBS=-lpthread

make
make install
