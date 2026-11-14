./configure --prefix=/usr                                \
            --enable-unicode                             \
            --disable-static                             \
            --docdir=/usr/share/doc/pcre2-10.47

make
make install
