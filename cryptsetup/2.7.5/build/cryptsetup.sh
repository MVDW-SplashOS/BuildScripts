# cryptsetup - LUKS disk encryption; required by libblockdev's crypto
# plugin, which udisks2 requires (unlocking encrypted drives in Files/
# Disks). OpenSSL crypto backend (also provides Argon2 on OpenSSL >= 3.2;
# the bundled Argon2 is the fallback).
./configure --prefix=/usr \
    --disable-static \
    --disable-asciidoc \
    --disable-ssh-token \
    --with-crypto_backend=openssl

make
make install
