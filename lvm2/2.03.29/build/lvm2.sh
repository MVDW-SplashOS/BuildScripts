# LVM2 - only the device-mapper library and dmsetup are built: cryptsetup
# needs libdevmapper. The LVM tools themselves (and libaio, which only
# they need) are not part of the desktop yet.
./configure --prefix=/usr \
    --enable-pkgconfig \
    --enable-udev_sync \
    --enable-udev_rules \
    --with-thin=none \
    --with-cache=none

make device-mapper
make install_device-mapper
