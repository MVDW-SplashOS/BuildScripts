./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static
            
make
make check
make install

ln -sfv flex /usr/bin/lex
