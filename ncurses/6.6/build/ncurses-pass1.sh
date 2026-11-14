
sed -i s/mawk// configure

mkdir -p build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd

./configure --prefix=/usr                \
            --host=$SPLASHOS_TGT         \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-normal             \
            --with-cxx-shared            \
            --without-debug              \
            --without-ada                \
            --disable-stripping          \
            --enable-widec
            

make
make DESTDIR=$splash_partition_root TIC_PATH=$(pwd)/build/progs/tic install

# libncurses.so targets the wide-character library, so curses.h must always
# use the wide-character ABI (LFS 6.3)
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i $splash_partition_root/usr/include/curses.h

echo "INPUT(-lncursesw)" > $splash_partition_root/usr/lib/libncurses.so

