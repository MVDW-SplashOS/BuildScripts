# SpiderMonkey 128 (mozjs-128) - the JavaScript engine of gjs, which runs
# GNOME Shell. Built from the Firefox ESR source tarball (js/src only),
# as in BLFS. Uses the system ICU and zlib; needs rust (pinned in this
# layer) and python3.
#
# NOTE: Firefox 128 ESR predates the pinned rustc by a long way; if the
# Rust part fails on new lints/errors, pin an older rust for this layer.
mkdir obj
cd obj

# LLVM_OBJDUMP: configure insists on finding llvm-objdump in every
# compile-environment build, but only uses it for the Windows/macOS
# dependentlibs.list of libxul (toolkit/library/build/dependentlibs.py),
# which a js-only Linux build never generates. LLVM is not packaged; GNU
# objdump satisfies the check. No other LLVM tool is required here
# (readelf is GNU's, and bindgen/libclang is only for the browser).
LLVM_OBJDUMP=/usr/bin/objdump \
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
