
tar -xf "../mpfr-4.2.0.tar.xz"
mv -vn "mpfr-4.2.0" mpfr
tar -xf "../gmp-6.2.1.tar.xz"
mv -vn "gmp-6.2.1" gmp
tar -xf "../mpc-1.3.1.tar.xz"
mv -vn "mpc-1.3.1" mpc


sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
sed '/thread_header =/s/@.*@/gthr-posix.h/' \
    -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in       

mkdir -pv build
cd       build
    
    
../configure                                       \
    --build=$(../config.guess)                     \
    --host=$SPLASHOS_TGT                                \
    --target=$SPLASHOS_TGT                              \
    LDFLAGS_FOR_TARGET=-L$PWD/$SPLASHOS_TGT/libgcc      \
    --prefix=/usr                                  \
    --with-build-sysroot=$splash_partition_root                      \
    --enable-default-pie                           \
    --enable-default-ssp                           \
    --disable-nls                                  \
    --disable-multilib                             \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --enable-languages=c,c++
    
make
make DESTDIR=$splash_partition_root install

ln -sv gcc $splash_partition_root/usr/bin/cc