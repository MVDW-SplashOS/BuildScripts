./configure --prefix=/usr                     \
            --host=$SPLASHOS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.4.6

make
make DESTDIR=$splash_partition_root install

rm -v $splash_partition_root/usr/lib/liblzma.la