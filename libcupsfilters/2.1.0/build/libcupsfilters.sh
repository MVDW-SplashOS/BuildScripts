# libcupsfilters (OpenPrinting 2.x) - the filter functions behind
# cups-filters: PDF/raster/image conversion, driverless (IPP Everywhere)
# support. Uses qpdf, poppler-cpp, lcms2, fontconfig and Ghostscript.
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --disable-mutool \
    --disable-exif \
    --with-cups-rundir=/run/cups \
    --with-test-font-path=/usr/share/fonts/dejavu/DejaVuSans.ttf

make
make install
