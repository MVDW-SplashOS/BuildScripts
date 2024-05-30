./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.4.1
            
make
make check
make install
