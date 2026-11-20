# util-macros - autoconf macros every X.org autotools package needs.
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var

make
make install
