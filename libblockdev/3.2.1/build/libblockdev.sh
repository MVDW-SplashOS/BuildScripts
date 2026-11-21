# libblockdev - block device library behind udisks2. Exactly the plugins
# udisks 2.10 requires (crypto, fs, loop, mdraid, nvme, part, swap) +
# smart; no LVM/btrfs/multipath/NVDIMM/escrow/python.
#
# Drop the hard-coded -Werror from every Makefile.in: glibc >= 2.43 in
# C23 mode adds const-correctness warnings (strstr/strchr on const
# strings) that -Werror turns into build failures; the sibling project
# libbytesize failed exactly that way. Specific -Werror=<x> flags stay.
find . -name Makefile.in -exec sed -i 's/ -Werror\( \|$\)/\1/g' {} +

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
