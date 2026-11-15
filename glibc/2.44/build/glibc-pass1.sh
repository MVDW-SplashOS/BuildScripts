
ln -sfv ../lib/ld-linux-x86-64.so.2 $splash_partition_root/lib64
ln -sfv ../lib/ld-linux-x86-64.so.2 $splash_partition_root/lib64/ld-lsb-x86-64.so.3

# Fix tanh(3) crashing on some old x86_64 CPUs and fix installing
# with multiple make jobs (LFS r13.1, glibc-2.44-upstream_fixes-4)
patch -Np1 -i ../patch/glibc-2.44-upstream_fixes-4.patch

mkdir -pv build
cd       build

echo "rootsbindir=/usr/sbin" > configparms

../configure                             \
      --prefix=/usr                      \
      --host=$SPLASHOS_TGT                    \
      --build=$(../scripts/config.guess) \
      --disable-nscd                     \
      --enable-kernel=5.10               \
      --with-headers=$splash_partition_root/usr/include    \
      libc_cv_slibdir=/usr/lib

make

make DESTDIR=$splash_partition_root install

sed '/RTLDLIST=/s@/usr@@g' -i $splash_partition_root/usr/bin/ldd

echo 'int main(){}' | $SPLASHOS_TGT-gcc -xc -
readelf -l a.out | grep ld-linux