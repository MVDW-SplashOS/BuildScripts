# libndp - IPv6 neighbour discovery; NetworkManager hard dependency.
# GitHub archive without a generated configure.
./autogen.sh

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static

make
make install
