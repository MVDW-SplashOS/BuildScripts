./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --with-cxx-shared       \
            --enable-pc-files       \
            --enable-widec          \
            --with-pkg-config-libdir=/usr/lib/pkgconfig

make
make DESTDIR=$PWD/dest install

# The INPUT linker scripts below are only safe with curses.h edited to
# always use the wide-character ABI (LFS 8.33)
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i dest/usr/include/curses.h

install -vm755 dest/usr/lib/libncursesw.so.6.6 /usr/lib

rm -v  dest/usr/lib/libncursesw.so.6.6
# --remove-destination: cp stats the destination before copying, and a stale
# self-referential terminfo symlink (e.g. left by an interrupted/older pass1)
# makes that stat fail with ELOOP ("Too many levels of symbolic links"),
# aborting the install under set -e. Removing the destination first is immune.
cp -av --remove-destination dest/* /

for lib in ncurses form panel menu ; do
    rm -vf                    /usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
done

rm -vf                     /usr/lib/libcursesw.so
echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so
ln -sfv libncurses.so      /usr/lib/libcurses.so

mkdir -pv      /usr/share/doc/ncurses-6.6
cp -v -R doc/* /usr/share/doc/ncurses-6.6

make distclean
./configure --prefix=/usr    \
            --with-shared    \
            --without-normal \
            --without-debug  \
            --without-cxx-binding \
            --with-abi-version=5
make sources libs
cp -av lib/lib*.so.5* /usr/lib
