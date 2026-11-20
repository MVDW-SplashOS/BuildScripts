# curl, buildmode 2 - desktop build. Same minimal feature set as mode 1,
# but pointed at the system trust store make-ca generates. Without an
# explicit CA path libcurl verifies nothing successfully, and flatpak/
# ostree (libcurl backend) could not talk to Flathub over HTTPS.
./configure --prefix=/usr \
    --with-openssl \
    --with-ca-bundle=/etc/pki/tls/certs/ca-bundle.crt \
    --with-ca-path=/etc/ssl/certs \
    --without-libpsl \
    --without-brotli \
    --without-zstd \
    --without-libidn2 \
    --without-nghttp2 \
    --without-librtmp \
    --without-libssh2 \
    --without-libgsasl \
    --disable-ldaps \
    --disable-manual

make
make install
