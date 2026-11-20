# libtasn1 - ASN.1 library; required by p11-kit (trust module) and gnutls.
./configure --prefix=/usr \
    --disable-static \
    --disable-doc

make
make install
