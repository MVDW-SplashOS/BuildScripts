
tar -xf "../mpfr-4.2.0.tar.xz"
mv -vn "mpfr-4.2.0" mpfr
tar -xf "../gmp-6.2.1.tar.xz"
mv -vn "gmp-6.2.1" gmp
tar -xf "../mpc-1.3.1.tar.gz"
mv -vn "mpc-1.3.1" mpc


sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
        

mkdir -pv build
cd       build
    
    
../configure                  \
    --target=$SPLASHOS_TGT         \
    --prefix=$splash_partition_root/tools       \
    --with-glibc-version=2.37 \
    --with-sysroot=$splash_partition_root       \
    --with-newlib             \
    --without-headers         \
    --enable-default-pie      \
    --enable-default-ssp      \
    --disable-nls             \
    --disable-shared          \
    --disable-multilib        \
    --disable-threads         \
    --disable-libatomic       \
    --disable-libgomp         \
    --disable-libquadmath     \
    --disable-libssp          \
    --disable-libvtv          \
    --disable-libstdcxx       \
    --enable-languages=c,c++
    
make
make install

cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($SPLASHOS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h