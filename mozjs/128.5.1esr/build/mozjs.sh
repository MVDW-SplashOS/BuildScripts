# SpiderMonkey 128 (mozjs-128) - the JavaScript engine of gjs, which runs
# GNOME Shell. Built from the Firefox ESR source tarball (js/src only),
# as in BLFS. Uses the system ICU and zlib; needs rust (pinned in this
# layer) and python3.
#
# NOTE: Firefox 128 ESR predates the pinned rustc by a long way; if the
# Rust part fails on new lints/errors, pin an older rust for this layer.
mkdir obj
cd obj

CC=gcc CXX=g++ \
sh ../js/src/configure --prefix=/usr \
    --disable-debug-symbols \
    --disable-jemalloc \
    --enable-readline \
    --with-intl-api \
    --with-system-icu \
    --with-system-zlib

make
make install

rm -fv /usr/lib/libjs_static.ajs
sed -i '/@NSPR_CFLAGS@/d' /usr/bin/js128-config
