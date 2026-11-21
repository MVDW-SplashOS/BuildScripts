# libbytesize - size arithmetic for libblockdev (mdraid plugin).
#
# Drop the hard-coded -Werror: with glibc >= 2.43 in C23 mode, strstr()
# on a const string returns const char *, and bs_size.c assigns that to a
# plain char * ("assignment discards 'const' qualifier"). Harmless, but
# -Werror turns it (and any future new warning) into a build failure.
sed -i 's/ -Werror / /' src/Makefile.in

./configure --prefix=/usr \
    --without-python3 \
    --without-gtk-doc \
    --without-tools

make
make install
