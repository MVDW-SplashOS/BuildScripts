# libtirpc - Sun RPC (glibc no longer ships it); Samba needs it.
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --disable-gssapi

make
make install
