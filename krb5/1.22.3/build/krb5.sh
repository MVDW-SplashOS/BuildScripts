# MIT Kerberos - client libraries (krb5, gssapi); gnome-control-center's
# system/users panels require krb5 for enterprise login (realmd). Client
# use only: the KDC/kadmind are built but not enabled, no LDAP backend.
#
# Crypto is the builtin implementation, and TLS (the MS-KKDCP proxy),
# PKINIT and OpenSSL SPAKE are off: they are the only parts that use
# OpenSSL, none is needed here, and none is tested against OpenSSL 4.
# com_err/ss come from e2fsprogs, as in BLFS.
cd src

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var/lib \
    --runstatedir=/run \
    --with-system-et \
    --with-system-ss \
    --with-system-verto=no \
    --with-crypto-impl=builtin \
    --with-tls-impl=no \
    --disable-pkinit \
    --without-spake-openssl \
    --without-ldap \
    --enable-dns-for-realm \
    --disable-rpath

make
make install
