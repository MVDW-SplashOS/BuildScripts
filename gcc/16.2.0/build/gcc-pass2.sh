
tar -xf "../mpfr-4.2.2.tar.xz"
mv -vn "mpfr-4.2.2" mpfr
tar -xf "../gmp-6.3.0.tar.xz"
mv -vn "gmp-6.3.0" gmp
tar -xf "../mpc-1.4.1.tar.xz"
mv -vn "mpc-1.4.1" mpc


sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64

mkdir -pv build
cd       build


../configure                                       \
    --build=$(../config.guess)                     \
    --host=$SPLASHOS_TGT                                \
    --target=$SPLASHOS_TGT                              \
    CXX_FOR_TARGET="$SPLASHOS_TGT-gcc -nostdinc++" \
    LDFLAGS_FOR_TARGET=-L$PWD/$SPLASHOS_TGT/libgcc      \
    target_configargs=gcc_cv_target_thread_file=posix \
    --prefix=/usr                                  \
    --with-build-sysroot=$splash_partition_root                      \
    --enable-default-pie                           \
    --enable-default-ssp                           \
    --disable-fixincludes                          \
    --disable-nls                                  \
    --disable-multilib                             \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libsanitizer                         \
    --disable-libssp                               \
    --disable-libvtv                               \
    --enable-languages=c,c++
    
make
make DESTDIR=$splash_partition_root install

ln -sfv gcc $splash_partition_root/usr/bin/cc