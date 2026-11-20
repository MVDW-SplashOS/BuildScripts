# cups-browsed - discovers network printers (via Avahi) and remote CUPS
# queues and creates local print queues for them automatically.
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --with-cups-rundir=/run/cups \
    --with-rcdir=no

make
make install

install -v -m644 daemon/cups-browsed.service /usr/lib/systemd/system/cups-browsed.service
systemctl enable cups-browsed.service || true
