# libusb - required by libgusb (colord).
./configure --prefix=/usr \
    --disable-static

make
make install
