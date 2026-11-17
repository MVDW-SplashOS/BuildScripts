# curl - URL transfer library; appstream requires libcurl >= 7.62
# unconditionally (remote metadata/icon downloads). Minimal build:
# OpenSSL TLS from the base toolchain, every optional backend disabled.
./configure --prefix=/usr \
    --with-openssl \
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
