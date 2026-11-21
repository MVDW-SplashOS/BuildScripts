# libtirpc - Sun RPC (glibc no longer ships it); Samba needs it.
# gnu17: GCC 16 defaults to C23, where an empty () parameter list means
# (void); auth_none.c declares xdr_opaque_auth() K&R-style and then calls
# it with arguments.
CFLAGS="${CFLAGS:--O2 -g} -std=gnu17" \
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --disable-gssapi

make
make install
