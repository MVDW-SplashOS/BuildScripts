# libxslt - xsltproc; mobile-broadband-provider-info generates its APN
# database with it.
./configure --prefix=/usr \
    --disable-static \
    --without-python

make
make install
