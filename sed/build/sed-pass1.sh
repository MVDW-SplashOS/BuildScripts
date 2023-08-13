
./configure --prefix=/usr   \
            --host=$SPLASHOS_TGT
            
make
make DESTDIR=$splash_partition_root install