# libdaemon - required by avahi-daemon.
./configure --prefix=/usr \
    --disable-static \
    --disable-lynx \
    --disable-examples

make
make install
