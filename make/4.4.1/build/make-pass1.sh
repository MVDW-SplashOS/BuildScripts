./configure --prefix=/usr   \
            --without-guile \
            --host=$SPLASHOS_TGT \
            --build=$(build-aux/config.guess)
make
make DESTDIR=$splash_partition_root install