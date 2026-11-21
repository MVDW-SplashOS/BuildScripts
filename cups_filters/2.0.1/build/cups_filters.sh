# cups-filters 2.x - the CUPS filters themselves (pdftopdf, gstoraster,
# imagetoraster, foomatic-rip, ...), the `driverless` PPD generator and
# the universal filter. Built on libcupsfilters + libppd.
# gnu17: GCC 16 defaults to C23, where an empty () parameter list means
# (void); foomatic-rip's process.h declares start_process(..., int
# (*proc_func)(), ...) and passes it three-argument functions.
CFLAGS="${CFLAGS:--O2 -g} -std=gnu17" \
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --disable-mutool

make
make install
