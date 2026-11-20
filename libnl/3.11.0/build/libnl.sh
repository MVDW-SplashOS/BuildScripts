# libnl - netlink library (wpa_supplicant nl80211 driver).
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static

make
make install
