# cups-filters 2.x - the CUPS filters themselves (pdftopdf, gstoraster,
# imagetoraster, foomatic-rip, ...), the `driverless` PPD generator and
# the universal filter. Built on libcupsfilters + libppd.
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --disable-mutool

make
make install
