# make-ca - builds the system CA stores (OpenSSL hashed dir, PEM bundle,
# p11-kit anchors, NSS db) from Mozilla's certdata.txt. Only the tool is
# installed here; desktop.yml (host side) downloads certdata.txt and runs
# it, because the chroot build has no guaranteed network access.
make install
install -vdm755 /etc/ssl/local
