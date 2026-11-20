# udisks2 - storage daemon: Files (mounting), GNOME Settings (Privacy/
# About disk info), GNOME Shell (removable media). Removable media is
# mounted under /run/media/$USER (FHS). No LVM/iSCSI/btrfs/LSM modules.
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --enable-fhs-media \
    --disable-lvm2 \
    --disable-iscsi \
    --disable-btrfs \
    --disable-lsm

make
make install

systemctl enable udisks2.service || true
