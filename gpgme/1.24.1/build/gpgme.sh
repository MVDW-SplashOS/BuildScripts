# gpgme - GnuPG Made Easy. Hard dependency of flatpak and of ostree's
# GPG verification. Only the C library: no C++/Qt/Python bindings
# (cl = Common Lisp files only, nothing is compiled for it).
./configure --prefix=/usr \
    --disable-static \
    --disable-gpg-test \
    --disable-gpgsm-test \
    --disable-gpgconf-test \
    --disable-g13-test \
    --enable-languages=cl

make
make install
