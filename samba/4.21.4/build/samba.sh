# Samba (client side) - libsmbclient for Settings' Printers panel (SMB
# printer browsing) and smbspool, the CUPS backend for Windows-shared
# printers. No AD DC, no LDAP/ADS, no winbind, no Python bindings, no
# JSON; Kerberos is the bundled Heimdal. The smbd/nmbd servers are built
# but not enabled.
#
# --without-ldb-lmdb: the bundled ldb only needs LMDB for the AD DC's
# sam.ldb backend, and there is no AD DC here; tdb covers the rest.
# -std=gnu17: GCC 16 defaults to C23; built as gnu17 up front like the
# other older C code, rather than finding out halfway through a long build.
# glibc 2.43 provides C23 memset_explicit(s, c, n); libreplace's
# rep_memset_s only ever reached its HAVE_MEMSET_EXPLICIT branch on paper
# and calls it memset_s-style with four arguments. Use the C23 signature.
sed -i 's/memset_explicit(dest, destsz, ch, count);/memset_explicit(dest, ch, count);/' lib/replace/replace.c
grep -q 'memset_explicit(dest, ch, count);' lib/replace/replace.c

PYTHON=python3 \
CFLAGS="-std=gnu17 -I/usr/include/tirpc" \
LDFLAGS="-ltirpc" \
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-piddir=/run/samba \
    --with-pammodulesdir=/usr/lib/security \
    --enable-fhs \
    --without-ad-dc \
    --without-ldb-lmdb \
    --without-ldap \
    --without-ads \
    --without-json \
    --without-winbind \
    --without-pam \
    --disable-python \
    --disable-cephfs \
    --disable-glusterfs \
    --without-libarchive \
    --enable-cups

make

# waf install creates the lock dir /var/lock/samba, and /var/lock links to
# /run/lock - which does not exist on the chroot's empty /run tmpfs (on the
# booted system systemd-tmpfiles creates it, and Samba recreates its own
# lock dir at runtime).
mkdir -p /run/lock
make install

install -v -m644 examples/smb.conf.default /etc/samba/smb.conf.default 2>/dev/null || true

# CUPS backend for SMB printers.
install -dvm755 /usr/lib/cups/backend
ln -sfv /usr/bin/smbspool /usr/lib/cups/backend/smb
