# gnutls - TLS for glib-networking (libsoup3: geoclue, gweather, EDS),
# gcr and vte. Trust comes from p11-kit (pkcs11: = the make-ca anchors).
./configure --prefix=/usr \
    --disable-static \
    --disable-doc \
    --disable-tests \
    --disable-tools \
    --with-default-trust-store-pkcs11="pkcs11:" \
    --with-included-unistring \
    --without-idn \
    --without-tpm2 \
    --without-tpm

make
make install
