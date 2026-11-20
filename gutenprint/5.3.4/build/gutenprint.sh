# Gutenprint - drivers for several hundred printers (Epson, Canon,
# Lexmark, HP inkjets, dye-sublimation photo printers, ...). CUPS gets
# them through the gutenprint.5.3 driver program, which generates PPDs
# on demand. No GIMP plugin, docs, samples or test programs.
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
