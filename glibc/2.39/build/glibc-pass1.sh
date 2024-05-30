
ln -sfv ../lib/ld-linux-x86-64.so.2 $splash_partition_root/lib64
ln -sfv ../lib/ld-linux-x86-64.so.2 $splash_partition_root/lib64/ld-lsb-x86-64.so.3



mkdir -pv build
cd       build

echo "rootsbindir=/usr/sbin" > configparms

../configure                             \
      --prefix=/usr                      \
      --host=$SPLASHOS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=4.19                \
      --with-headers=$splash_partition_root/usr/include    \
      libc_cv_slibdir=/usr/lib

make

make DESTDIR=$splash_partition_root install

sed '/RTLDLIST=/s@/usr@@g' -i $splash_partition_root/usr/bin/ldd

echo 'int main(){}' | $SPLASHOS_TGT-gcc -xc -
readelf -l a.out | grep ld-linux