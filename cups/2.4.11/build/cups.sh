# CUPS - the print system (Settings' Printers panel hard-requires it).
# GnuTLS for IPPS, Avahi for printer discovery, PAM for admin auth,
# socket-activated through systemd. Print filters/drivers (cups-filters,
# Ghostscript) are a separate follow-up; driverless IPP printers work with
# what CUPS itself ships.
getent group lp >/dev/null || groupadd -g 7 lp
getent passwd lp >/dev/null || \
    useradd -c "Print Service User" -d /var/spool/cups -g lp -s /bin/false -u 9 lp
getent group lpadmin >/dev/null || groupadd -g 19 lpadmin

./configure --libdir=/usr/lib \
    --with-rundir=/run/cups \
    --with-system-groups=lpadmin \
    --with-tls=gnutls \
    --with-dnssd=avahi \
    --with-ondemand=systemd \
    --enable-pam \
    --enable-libusb \
    --with-docdir=/usr/share/cups/doc-2.4.11

make
make install

echo "ServerName /run/cups/cups.sock" > /etc/cups/client.conf

cat > /etc/pam.d/cups << "PAMEOF"
# Begin /etc/pam.d/cups

auth    include system-auth
account include system-account
session include system-session

# End /etc/pam.d/cups
PAMEOF

# The desktop user may manage printers.
gtk-update-icon-cache -qtf /usr/share/icons/hicolor || true
systemctl enable cups.socket cups.path cups.service || true
