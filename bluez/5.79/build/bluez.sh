# BlueZ - Bluetooth daemon (gnome-settings-daemon rfkill/bluetooth, GNOME
# Shell quick settings). No OBEX (needs libical), no mesh (needs ell/
# json-c), no man pages (needs rst2man).
./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-manpages \
    --disable-obex \
    --disable-mesh \
    --enable-library

make
make install

ln -sfv ../libexec/bluetooth/bluetoothd /usr/sbin
install -v -dm755 /etc/bluetooth
install -v -m644 src/main.conf /etc/bluetooth/main.conf
