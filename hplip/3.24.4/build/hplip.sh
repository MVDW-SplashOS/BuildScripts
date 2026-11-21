# HPLIP (hpcups only) - HP's printer driver: the hpcups filter and its
# CUPS .drv file. The Python tools (hp-setup, hp-toolbox), the `hp`
# backend, scanning and fax are not built; CUPS's own usb/ipp/socket
# backends drive the printers. No Python/Qt/SANE/net-snmp needed.
# configure saves SAVE_CPPFLAGS but restores CFLAGS="$save_CFLAGS", which
# is never set, so whatever CFLAGS we pass is wiped. Save it properly.
sed -i 's/^SAVE_CPPFLAGS="\$CPPFLAGS"$/&; save_CFLAGS="$CFLAGS"/' configure
grep -q '; save_CFLAGS="\$CFLAGS"$' configure

# gnu17: GCC 16 defaults to C23 (K&R-style () declarations, bool).
# -fpermissive: prnt/hpps/pserror.c has `static column = 0;` (implicit
# int), an error since GCC 14 in every C mode.
CFLAGS="${CFLAGS:--O2 -g} -std=gnu17 -fpermissive" \
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static \
    --enable-hpcups-only-build \
    --enable-hpcups-install \
    --enable-cups-drv-install \
    --disable-cups-ppd-install \
    --disable-hpijs-install \
    --disable-network-build \
    --disable-scan-build \
    --disable-gui-build \
    --disable-fax-build \
    --disable-dbus-build \
    --disable-pp-build \
    --disable-doc-build \
    --disable-qt5 \
    --disable-qt4 \
    --disable-policykit \
    --disable-foomatic-drv-install \
    --disable-foomatic-rip-hplip-install \
    --disable-apparmor_build

make
make install
