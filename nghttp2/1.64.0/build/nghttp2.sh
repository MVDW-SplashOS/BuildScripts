# nghttp2 - HTTP/2 library (libsoup3 hard dependency). Library only.
./configure --prefix=/usr \
    --disable-static \
    --enable-lib-only

make
make install
