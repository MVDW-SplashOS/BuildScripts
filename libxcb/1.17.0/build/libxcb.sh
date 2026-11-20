# libxcb - X protocol C binding (all extensions: randr, res, dri3, ... are
# needed by Mutter, Mesa GLX and Xwayland).
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --without-doxygen \
    --disable-devel-docs

make
make install
