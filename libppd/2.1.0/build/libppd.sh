# libppd - PPD file support for classic (PPD-based) printer drivers and
# the ppdc compiler utilities.
./configure --prefix=/usr \
    --disable-static \
    --disable-mutool \
    --disable-acroread \
    --enable-ppdc-utils \
    --with-cups-rundir=/run/cups

make
make install
