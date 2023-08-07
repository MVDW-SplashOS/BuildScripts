sed '6009s/$add_dir//' -i ltmain.sh

mkdir -pv build
cd       build

../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$SPLASHOS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --enable-gprofng=no        \
    --disable-werror           \
    --enable-64-bit-bfd
    
    
make
make DESTDIR=$splash_partition_root install

rm -v $splash_partition_root/usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.{a,la}