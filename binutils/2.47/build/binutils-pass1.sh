mkdir -pv build
cd       build

../configure --prefix=$splash_partition_root/tools \
             --with-sysroot=$splash_partition_root \
             --target=$SPLASHOS_TGT \
             --disable-nls \
             --enable-gprofng=no \
             --disable-werror \
             --enable-default-hash-style=gnu
             
             
make
make install