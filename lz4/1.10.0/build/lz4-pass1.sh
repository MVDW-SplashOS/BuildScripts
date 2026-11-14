make BUILD_STATIC=no PREFIX=/usr

make -j1 check

make BUILD_STATIC=no PREFIX=/usr install

rm -fv /usr/lib/liblz4.a
