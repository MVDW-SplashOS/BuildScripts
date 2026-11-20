# gnupg - gpg is the engine gpgme drives when ostree/flatpak verify the
# GPG signatures of a remote (e.g. Flathub's summary and commits).
# Only signature verification is needed: no LDAP keyserver support, no
# GnuTLS-backed dirmngr, no documentation.
mkdir -p build
cd build

../configure --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --disable-ldap \
    --disable-gnutls \
    --disable-doc

make
make install
