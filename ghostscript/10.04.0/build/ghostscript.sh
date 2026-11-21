# Ghostscript - PostScript/PDF interpreter; the core of the print filter
# chain (gstoraster, gstopxl, ps2pdf, ...) and of most printer drivers.
# Uses the system freetype/lcms2/libjpeg/libpng/openjpeg/zlib/libtiff
# instead of the bundled copies (as BLFS does); the CUPS raster device is
# built against the system libcups. Fonts: the URW base35 set in the
# tarball's Resource/ directory, read from disk (--disable-compile-inits).
rm -rf freetype lcms2mt jpeg libpng openjpeg zlib

# gnu17: GCC 16 defaults to C23, where bool is a keyword, and
# base/stdpre.h does `typedef int bool;`. CFLAGSAUX covers the host tools
# (genarch, echogs, genconf, ...) that are built first with their own flags.
CFLAGS="${CFLAGS:--O2 -g} -std=gnu17" \
CFLAGSAUX="${CFLAGS:--O2 -g} -std=gnu17" \
./configure --prefix=/usr \
    --disable-compile-inits \
    --with-system-libtiff \
    --without-x \
    --without-tesseract

make
make so

make install
make soinstall
install -v -m644 base/*.h /usr/include/ghostscript
ln -sfvn ghostscript /usr/include/ps
