# Avahi - mDNS/DNS-SD. CUPS discovers network (IPP Everywhere/AirPrint)
# printers through it. GLib/GObject API only; no Qt/GTK/Python/Mono.
getent group avahi >/dev/null || groupadd -fg 84 avahi
getent passwd avahi >/dev/null || \
    useradd -c "Avahi Daemon Owner" -d /run/avahi-daemon -u 84 -g avahi -s /bin/false avahi
getent group netdev >/dev/null || groupadd -fg 86 netdev

./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --disable-libevent \
    --disable-mono \
    --disable-monodoc \
    --disable-python \
    --disable-qt3 \
    --disable-qt4 \
    --disable-qt5 \
    --disable-gtk \
    --disable-gtk3 \
    --disable-doxygen-doc \
    --disable-manpages \
    --disable-xmltoman \
    --disable-tests \
    --enable-introspection \
    --with-distro=none \
    --with-dbus-system-address='unix:path=/run/dbus/system_bus_socket'

make
make install

systemctl enable avahi-daemon.service || true
