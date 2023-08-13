./configure --prefix=/usr                   \
            --localstatedir=/var/lib/locate \
            --host=$SPLASHOS_TGT                 \
            --build=$(build-aux/config.guess)
            
make
make DESTDIR=$splash_partition_root install
