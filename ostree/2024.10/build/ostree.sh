# ostree (libostree) - the content-addressed object store flatpak keeps
# installed apps and runtimes in (/var/lib/flatpak/repo). SplashOS does
# not use ostree for the OS itself (the image root is plain read-only
# ext4), only as flatpak's storage backend.
#
# libcurl (from desktop-base) as the HTTP backend instead of libsoup,
# OpenSSL for checksums, gpgme for signature verification.
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --disable-gtk-doc \
    --disable-man \
    --enable-introspection=no \
    --with-curl \
    --without-soup \
    --with-openssl \
    --with-libarchive \
    --without-selinux \
    --without-avahi

make
make install
