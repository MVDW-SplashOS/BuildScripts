
sed -i s/mawk// configure

mkdir build
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
ln -sv libncursesw.so $splash_partition_root/usr/lib/libncurses.so

sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i $splash_partition_root/usr/include/curses.h