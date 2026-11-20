# keyutils - kernel key retention API; libblockdev's crypto plugin needs
# keyutils.h, libnvme uses it for NVMe/TLS keys.
make
make NO_ARLIB=1 LIBDIR=/usr/lib BINDIR=/usr/bin SBINDIR=/usr/sbin install
