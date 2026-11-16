# GCC 15 (C23) rejects cpio 2.15's K&R-style xstat function-pointer
# declarations; add proper prototypes (BLFS workaround).
sed -e "/^extern int (\*xstat)/s/()/(const char * restrict,  struct stat * restrict)/" \
    -i src/extern.h
sed -e "/^int (\*xstat)/s/()/(const char * restrict,  struct stat * restrict)/" \
    -i src/global.c

./configure --prefix=/usr \
            --enable-mt \
            --with-rmt=/usr/libexec/rmt

make
make install
