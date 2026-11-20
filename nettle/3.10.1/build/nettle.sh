# nettle - crypto backend of gnutls.
./configure --prefix=/usr \
    --disable-static

make
make install

chmod -v 755 /usr/lib/lib{hogweed,nettle}.so
