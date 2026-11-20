# NetworkManager - network configuration for the GNOME desktop (Shell
# imports the NM typelib). gnutls crypto, internal DHCP, wpa_supplicant
# WiFi; no ModemManager/PPP/OVS/team/cloud-setup/nmtui.
meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dcrypto=gnutls \
    -Dlibaudit=no \
    -Dselinux=false \
    -Dppp=false \
    -Dmodem_manager=false \
    -Dovs=false \
    -Dteamdctl=false \
    -Dnmtui=false \
    -Dnm_cloud_setup=false \
    -Dqt=false \
    -Dsession_tracking_consolekit=false \
    -Dfirewalld_zone=false \
    -Diwd=false \
    -Dintrospection=true \
    -Dvapi=false \
    -Ddocs=false \
    -Dtests=no \
    -Dconfig_dhcp_default=internal

ninja -C build
ninja -C build install

install -vdm755 /etc/NetworkManager
cat > /etc/NetworkManager/NetworkManager.conf << "NMEOF"
[main]
plugins=keyfile
NMEOF
