# libyaml - YAML parser library, hard dependency of appstream (the YAML
# metadata format). The tag archive ships no generated configure, so
# bootstrap it first (autoconf/automake/libtool are in the chroot).
autoreconf -fi

./configure --prefix=/usr \
    --disable-static

make
make install
