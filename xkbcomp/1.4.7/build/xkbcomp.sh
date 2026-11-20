# xkbcomp - Xwayland compiles the keymap with it at runtime.
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static

make
make install
