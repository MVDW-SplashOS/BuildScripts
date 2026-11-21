# Gutenprint - drivers for several hundred printers (Epson, Canon,
# Lexmark, HP inkjets, dye-sublimation photo printers, ...). CUPS gets
# them through the gutenprint.5.3 driver program, which generates PPDs
# on demand. No GIMP plugin, docs, samples or test programs.
# gnu17: GCC 16 defaults to C23; built as gnu17 up front like the other
# older C code (K&R-style () declarations, bool), rather than per failure.
CFLAGS="${CFLAGS:--O2 -g} -std=gnu17" \
./configure --prefix=/usr \
    --disable-static \
    --without-gimp2 \
    --without-doc \
    --disable-libgutenprintui2 \
    --disable-samples \
    --disable-test \
    --disable-testpattern \
    --with-cups

make
make install
