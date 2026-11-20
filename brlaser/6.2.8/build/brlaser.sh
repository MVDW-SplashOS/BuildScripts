# brlaser - CUPS driver for Brother monochrome laser printers (maintained
# Owl-Maintain fork). Installs into the paths cups-config reports.
mkdir build
cd build

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release \
      ..

make
make install
