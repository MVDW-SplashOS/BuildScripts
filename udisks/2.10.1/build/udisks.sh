# udisks2 - storage daemon: Files (mounting), GNOME Settings (Privacy/
# About disk info), GNOME Shell (removable media). Removable media is
# mounted under /run/media/$USER (FHS). No LVM/iSCSI/btrfs/LSM modules.
#
# --disable-man: man pages are auto-enabled once xsltproc exists, but the
# DocBook XSL stylesheets they need are not packaged (xsltproc then tries
# to fetch them from docbook.sourceforge.net and fails with -nonet).
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --enable-fhs-media \
    --disable-lvm2 \
    --disable-iscsi \
    --disable-btrfs \
    --disable-lsm \
    --disable-man

make
make install

systemctl enable udisks2.service || true
