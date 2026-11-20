# libblockdev - block device library behind udisks2. Exactly the plugins
# udisks 2.10 requires (crypto, fs, loop, mdraid, nvme, part, swap) +
# smart; no LVM/btrfs/multipath/NVDIMM/escrow/python.
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-crypto \
    --with-fs \
    --with-loop \
    --with-mdraid \
    --with-nvme \
    --with-part \
    --with-swap \
    --with-smart \
    --without-btrfs \
    --without-dm \
    --without-lvm \
    --without-lvm_dbus \
    --without-mpath \
    --without-nvdimm \
    --without-escrow \
    --without-tools \
    --without-smartmontools \
    --without-s390 \
    --without-python3 \
    --without-gtk-doc \
    --disable-tests

make
make install
