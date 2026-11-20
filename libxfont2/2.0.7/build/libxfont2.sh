# libXfont2 - font library linked by Xwayland.
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --disable-devel-docs

make
make install
