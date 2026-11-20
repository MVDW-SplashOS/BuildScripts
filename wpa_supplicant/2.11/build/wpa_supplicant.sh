# wpa_supplicant - WiFi authentication backend of NetworkManager (D-Bus
# control interface, nl80211 driver). Configuration as in BLFS.
cat > wpa_supplicant/.config << "WPAEOF"
CONFIG_BACKEND=file
CONFIG_CTRL_IFACE=y
CONFIG_DEBUG_FILE=y
CONFIG_DEBUG_SYSLOG=y
CONFIG_DEBUG_SYSLOG_FACILITY=LOG_DAEMON
CONFIG_DRIVER_NL80211=y
CONFIG_DRIVER_WEXT=y
CONFIG_DRIVER_WIRED=y
CONFIG_EAP_GTC=y
CONFIG_EAP_LEAP=y
CONFIG_EAP_MD5=y
CONFIG_EAP_MSCHAPV2=y
CONFIG_EAP_OTP=y
CONFIG_EAP_PEAP=y
CONFIG_EAP_TLS=y
CONFIG_EAP_TTLS=y
CONFIG_IEEE8021X_EAPOL=y
CONFIG_IPV6=y
CONFIG_LIBNL32=y
CONFIG_PKCS12=y
CONFIG_READLINE=y
CONFIG_WPS=y
CFLAGS += -I/usr/include/libnl3
CONFIG_CTRL_IFACE_DBUS=y
CONFIG_CTRL_IFACE_DBUS_NEW=y
CONFIG_CTRL_IFACE_DBUS_INTRO=y
WPAEOF

cd wpa_supplicant
make BINDIR=/usr/sbin LIBDIR=/usr/lib

install -v -m755 wpa_cli wpa_passphrase wpa_supplicant /usr/sbin/
install -v -m644 doc/docbook/wpa_supplicant.conf.5 /usr/share/man/man5/ 2>/dev/null || true
install -v -m644 systemd/*.service /usr/lib/systemd/system/
install -v -m644 dbus/fi.w1.wpa_supplicant1.service /usr/share/dbus-1/system-services/
install -v -d -m755 /etc/dbus-1/system.d
install -v -m644 dbus/dbus-wpa_supplicant.conf /etc/dbus-1/system.d/wpa_supplicant.conf
