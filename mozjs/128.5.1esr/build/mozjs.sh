# SpiderMonkey 128 (mozjs-128) - the JavaScript engine of gjs, which runs
# GNOME Shell. Built from the Firefox ESR source tarball (js/src only),
# as in BLFS. Uses the system ICU and zlib; needs rust (pinned in this
# layer) and python3.
#
# NOTE: Firefox 128 ESR predates the pinned rustc by a long way; if the
# Rust part fails on new lints/errors, pin an older rust for this layer.
# Rust >= 1.9x lists x86_64-oe-linux-gnu next to x86_64-unknown-linux-gnu.
# Firefox 128's rust.configure cannot pick between the two for the
# x86_64-pc-linux-gnu host ("Don't know how to translate ... for rustc"):
# its last tie-breaker compares vendors, and "pc" matches neither. Prefer
# the generic "unknown" vendor as a final tie-breaker.
sed -i '/^        return None$/i\
        # Last resort: prefer the "unknown" vendor (the generic upstream\
        # target) over vendor-specific ones such as x86_64-oe-linux-gnu.\
        narrowed = [c for c in candidates if c.target.vendor == "unknown"]\
        if len(narrowed) == 1:\
            return narrowed[0].rust_target\
' build/moz.configure/rust.configure

# Python 3.14 removed ast.Str (deprecated since 3.8). mozbuild's
# frontend/reader.py still builds ast.Str nodes when it rewrites template
# functions ("module 'ast' has no attribute 'Str'" while reading
# build/templates.mozbuild), and checks for them when reading Files()
# metadata. Use ast.Constant, available since Python 3.8.
sed -i \
    -e 's/slice=c(ast\.Index(value=c(ast\.Str(s=node\.id)))),/slice=c(ast.Constant(value=node.id)),/' \
    -e 's/^\(\s*\)assert isinstance(v, ast\.Str)$/\1assert isinstance(v, ast.Constant) and isinstance(v.value, str)/' \
    -e 's/^\(\s*\)yield v\.s$/\1yield v.value/' \
    -e 's/^\(\s*\)assert isinstance(value, ast\.Str)$/\1assert isinstance(value, ast.Constant) and isinstance(value.value, str)/' \
    -e 's/^\(\s*\)yield value\.s$/\1yield value.value/' \
    python/mozbuild/mozbuild/frontend/reader.py

mkdir obj
cd obj

# cbindgen: mozjs needs it for one header, intl/bidi's
# unicode_bidi_ffi_generated.h (crate unicode-bidi-ffi). cbindgen is not
# packaged: building it offline is not possible from what Firefox 128
# vendors (cbindgen 0.26 needs syn 1/indexmap 1, newer ones syn >= 2.0.64
# and toml 0.8). The header only depends on the Rust source inside this
# tarball, so it was generated once with cbindgen 0.26.0 from this exact
# source (verified identical to what a real cbindgen produces in this
# build) and ships in build/cbindgen/<crate>.h. The stub below serves
# those headers and fails loudly for any crate it has no header for.
# Regenerate them when bumping mozjs.
CBINDGEN_HEADERS="$(cd ../../build/cbindgen && pwd)"
cat > "$PWD/cbindgen-stub" << CBEOF
#!/bin/sh
if [ "\$1" = "--version" ]; then
    echo "cbindgen 0.26.0"
    exit 0
fi
crate=""; prev=""
for a in "\$@"; do [ "\$prev" = "--crate" ] && crate="\$a"; prev="\$a"; done
if [ -n "\$crate" ] && [ -f "$CBINDGEN_HEADERS/\$crate.h" ]; then
    exec cat "$CBINDGEN_HEADERS/\$crate.h"
fi
echo "cbindgen-stub: no pre-generated header for crate '\$crate' (args: \$*)" >&2
exit 1
CBEOF
chmod +x "$PWD/cbindgen-stub"

# LLVM_OBJDUMP: configure insists on finding llvm-objdump in every
# compile-environment build, but only uses it for the Windows/macOS
# dependentlibs.list of libxul (toolkit/library/build/dependentlibs.py),
# which a js-only Linux build never generates. LLVM is not packaged; GNU
# objdump satisfies the check. No other LLVM tool is required here
# (readelf is GNU's, and bindgen/libclang is only for the browser).
CBINDGEN="$PWD/cbindgen-stub" \
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
