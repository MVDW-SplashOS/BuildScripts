# libgtop - system statistics (GNOME Console process tracking).
./configure --prefix=/usr \
    --disable-static \
    --disable-gtk-doc \
    --enable-introspection \
    --without-examples

make
make install
