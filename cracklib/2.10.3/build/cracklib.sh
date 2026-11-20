# cracklib - password dictionary checks (libpwquality). Uses the small
# word list shipped in the source tarball.
sed -i '/skipping/d' util/packer.c

./configure --prefix=/usr \
    --disable-static \
    --with-default-dict=/usr/lib/cracklib/pw_dict \
    --without-python

make
make install

install -v -m644 -D dicts/cracklib-small /usr/share/dict/cracklib-small
install -v -m755 -d /usr/lib/cracklib
create-cracklib-dict /usr/share/dict/cracklib-small
