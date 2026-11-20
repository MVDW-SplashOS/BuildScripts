# ICU - Unicode/i18n; mozjs (SpiderMonkey, gjs), vte and
# evolution-data-server require it.
cd source

./configure --prefix=/usr \
    --disable-static \
    --disable-tests \
    --disable-samples

make
make install
